module Css.Preprocess.Resolve exposing (compile)

{-| Functions responsible for resolving Preprocess data structures into
Structure data structures.
-}

import Css.Preprocess as Preprocess exposing (Snippet(..), SnippetDeclaration, Style(..), unwrapSnippet)
import Css.Structure as Structure exposing (Property, mapLast, styleBlockToMediaRule)
import Css.Structure.Output as Output
import Hash
import String


compile : List Preprocess.Stylesheet -> String
compile styles =
    String.join "\n\n" (List.map compileHelp styles)


compileHelp : Preprocess.Stylesheet -> String
compileHelp sheet =
    Output.prettyPrint (Structure.compactStylesheet (toStructure sheet))


resolveMediaRule : List Structure.MediaQuery -> List Preprocess.StyleBlock -> List Structure.Declaration
resolveMediaRule mediaQueries styleBlocks =
    let
        handleStyleBlock : Preprocess.StyleBlock -> List Structure.Declaration
        handleStyleBlock styleBlock =
            List.map (toMediaRule mediaQueries) (expandStyleBlock styleBlock)
    in
    List.concatMap handleStyleBlock styleBlocks


resolveSupportsRule : String -> List Snippet -> List Structure.Declaration
resolveSupportsRule str snippets =
    let
        declarations =
            extract (List.concatMap unwrapSnippet snippets)
    in
    [ Structure.SupportsRule str declarations ]


toMediaRule : List Structure.MediaQuery -> Structure.Declaration -> Structure.Declaration
toMediaRule mediaQueries declaration =
    case declaration of
        Structure.StyleBlockDeclaration structureStyleBlock ->
            Structure.MediaRule mediaQueries [ structureStyleBlock ]

        Structure.MediaRule newMediaQueries structureStyleBlocks ->
            Structure.MediaRule (mediaQueries ++ newMediaQueries) structureStyleBlocks

        Structure.SupportsRule str declarations ->
            Structure.SupportsRule str (List.map (toMediaRule mediaQueries) declarations)

        -- TODO give these more descriptive names
        Structure.DocumentRule str1 str2 str3 str4 structureStyleBlock ->
            Structure.DocumentRule str1 str2 str3 str4 structureStyleBlock

        Structure.PageRule _ _ ->
            declaration

        Structure.FontFace _ ->
            declaration

        Structure.Keyframes _ ->
            declaration

        Structure.Viewport _ ->
            declaration

        Structure.CounterStyle _ ->
            declaration

        Structure.FontFeatureValues _ ->
            declaration


resolveFontFeatureValues : List ( String, List Property ) -> List Structure.Declaration
resolveFontFeatureValues tuples =
    let
        expandTuples tuplesToExpand =
            case tuplesToExpand of
                [] ->
                    []

                properties :: rest ->
                    properties :: expandTuples rest

        newTuples =
            expandTuples tuples
    in
    [ Structure.FontFeatureValues newTuples ]


toDeclarations : SnippetDeclaration -> List Structure.Declaration
toDeclarations snippetDeclaration =
    case snippetDeclaration of
        Preprocess.StyleBlockDeclaration styleBlock ->
            expandStyleBlock styleBlock

        Preprocess.MediaRule mediaQueries styleBlocks ->
            resolveMediaRule mediaQueries styleBlocks

        Preprocess.SupportsRule str snippets ->
            resolveSupportsRule str snippets

        -- TODO give these more descriptive names
        Preprocess.DocumentRule str1 str2 str3 str4 styleBlock ->
            List.map (toDocumentRule str1 str2 str3 str4) (expandStyleBlock styleBlock)

        Preprocess.PageRule str properties ->
            [ Structure.PageRule str properties ]

        Preprocess.FontFace properties ->
            [ Structure.FontFace properties ]

        Preprocess.Viewport properties ->
            [ Structure.Viewport properties ]

        Preprocess.CounterStyle properties ->
            [ Structure.CounterStyle properties ]

        Preprocess.FontFeatureValues tuples ->
            resolveFontFeatureValues tuples


extract : List SnippetDeclaration -> List Structure.Declaration
extract snippetDeclarations =
    case snippetDeclarations of
        [] ->
            []

        first :: rest ->
            toDeclarations first ++ extract rest


applyStyles : List Style -> List Structure.Declaration -> List Structure.Declaration
applyStyles styles declarations =
    case styles of
        [] ->
            declarations

        (AppendProperty property) :: rest ->
            declarations
                |> Structure.appendProperty property
                |> applyStyles rest

        (ExtendSelector selector nestedStyles) :: rest ->
            applyNestedStylesToLast
                nestedStyles
                rest
                (Structure.appendRepeatableToLastSelector selector)
                declarations

        (NestSnippet selectorCombinator snippets) :: rest ->
            let
                chain : Structure.Selector -> Structure.Selector -> Structure.Selector
                chain (Structure.Selector originalSequence originalTuples originalPseudoElement) (Structure.Selector newSequence newTuples newPseudoElement) =
                    Structure.Selector originalSequence
                        (originalTuples ++ (( selectorCombinator, newSequence ) :: newTuples))
                        (oneOf [ newPseudoElement, originalPseudoElement ])

                expandDeclaration : SnippetDeclaration -> List Structure.Declaration
                expandDeclaration declaration =
                    case declaration of
                        Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock firstSelector otherSelectors nestedStyles) ->
                            let
                                newSelectors =
                                    collectSelectors declarations
                                        |> List.concatMap (\originalSelector -> List.map (chain originalSelector) (firstSelector :: otherSelectors))

                                newDeclarations =
                                    case newSelectors of
                                        [] ->
                                            []

                                        first :: remainder ->
                                            [ Structure.StyleBlockDeclaration (Structure.StyleBlock first remainder [])
                                            ]
                            in
                            applyStyles nestedStyles newDeclarations

                        Preprocess.MediaRule mediaQueries styleBlocks ->
                            resolveMediaRule mediaQueries styleBlocks

                        Preprocess.SupportsRule str otherSnippets ->
                            resolveSupportsRule str otherSnippets

                        -- TODO give these more descriptive names
                        Preprocess.DocumentRule str1 str2 str3 str4 styleBlock ->
                            List.map (toDocumentRule str1 str2 str3 str4) (expandStyleBlock styleBlock)

                        Preprocess.PageRule str properties ->
                            [ Structure.PageRule str properties ]

                        Preprocess.FontFace properties ->
                            [ Structure.FontFace properties ]

                        Preprocess.Viewport properties ->
                            [ Structure.Viewport properties ]

                        Preprocess.CounterStyle properties ->
                            [ Structure.CounterStyle properties ]

                        Preprocess.FontFeatureValues tuples ->
                            resolveFontFeatureValues tuples
            in
            snippets
                |> List.concatMap unwrapSnippet
                |> List.map expandDeclaration
                |> (++) [ applyStyles rest declarations ]
                |> List.concat

        (Preprocess.WithPseudoElement pseudoElement nestedStyles) :: rest ->
            applyNestedStylesToLast
                nestedStyles
                rest
                (Structure.appendPseudoElementToLastSelector pseudoElement)
                declarations

        (Preprocess.WithKeyframes str) :: rest ->
            let
                name =
                    Hash.fromString str

                newProperty =
                    "animation-name:" ++ name

                newDeclarations =
                    declarations
                        |> Structure.appendProperty newProperty
                        |> applyStyles rest
            in
            List.append newDeclarations
                [ Structure.Keyframes { name = name, declaration = str } ]

        (Preprocess.WithMedia mediaQueries nestedStyles) :: rest ->
            let
                extraDeclarations =
                    case collectSelectors declarations of
                        [] ->
                            []

                        firstSelector :: otherSelectors ->
                            Structure.StyleBlock firstSelector otherSelectors []
                                -- Start with a style block
                                |> Structure.StyleBlockDeclaration
                                |> List.singleton
                                -- Then apply the nested styles.
                                |> applyStyles nestedStyles
                                -- Finally, convert the block into a media rule.
                                |> List.map (styleBlockToMediaRule mediaQueries)
            in
            applyStyles rest declarations ++ extraDeclarations

        (Preprocess.ApplyStyles otherStyles) :: rest ->
            declarations
                |> applyStyles (otherStyles ++ rest)



{- Use the following flow to apply nested Styles to a list of Declarations:

   * initialResult: we pop off the last declaration, and run function `f` that appends the nested selector to it using `mapLast handleInitial`.
   * nextResult: we pop off the last declaration, and resolve the rest of the remaining children

   At the end, we rebuild the declarations using

   * current `declarations`
   * declarations of the nested selector, __without__ the last declaration that we popped off (to avoid duplicates inside the variable `declarations`)
   * the declarations of the rest, __without__ the last declaration that we popped off.

   This is done in order to facilitate multiple `ExtendSelectors` inside a single `StyleBlock`.
-}


applyNestedStylesToLast : List Style -> List Style -> (Structure.StyleBlock -> List Structure.StyleBlock) -> List Structure.Declaration -> List Structure.Declaration
applyNestedStylesToLast nestedStyles rest f declarations =
    let
        initialResult =
            lastDeclaration declarations
                |> Maybe.map insertStylesToNestedDecl
                |> Maybe.withDefault []

        insertStylesToNestedDecl lastDecl =
            Structure.concatMapLastStyleBlock f lastDecl
                |> List.map List.singleton
                |> mapLast (applyStyles nestedStyles)
                |> List.concat

        nextResult =
            lastDeclaration declarations
                |> Maybe.withDefault []
                |> applyStyles rest

        withoutParent decls =
            List.tail decls
                |> Maybe.withDefault []

        {- We recreate the declarations if necessary. It is possible that
           there was an `AppendProperty` in between two `ExtendSelectors` or two `WithPseudoElements`
           or an `AppendProperty` after an `ExtendSelector` or `WithPseudoElement`.
        -}
        newDeclarations =
            case ( List.head nextResult, last declarations ) of
                ( Just nextResultParent, Just originalParent ) ->
                    List.take (List.length declarations - 1) declarations
                        ++ [ if originalParent /= nextResultParent then
                                nextResultParent

                             else
                                originalParent
                           ]

                _ ->
                    declarations
    in
    newDeclarations ++ withoutParent initialResult ++ withoutParent nextResult


lastDeclaration : List Structure.Declaration -> Maybe (List Structure.Declaration)
lastDeclaration declarations =
    case declarations of
        [] ->
            Nothing

        x :: [] ->
            Just [ x ]

        _ :: xs ->
            lastDeclaration xs


expandStyleBlock : Preprocess.StyleBlock -> List Structure.Declaration
expandStyleBlock (Preprocess.StyleBlock firstSelector otherSelectors styles) =
    [ Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors []) ]
        |> applyStyles styles


toStructure : Preprocess.Stylesheet -> Structure.Stylesheet
toStructure { charset, imports, namespaces, snippets } =
    let
        declarations =
            snippets
                |> List.concatMap unwrapSnippet
                |> extract
    in
    { charset = charset
    , imports = imports
    , namespaces = namespaces
    , declarations = declarations
    }


toDocumentRule : String -> String -> String -> String -> Structure.Declaration -> Structure.Declaration
toDocumentRule str1 str2 str3 str4 declaration =
    case declaration of
        Structure.StyleBlockDeclaration structureStyleBlock ->
            Structure.DocumentRule str1 str2 str3 str4 structureStyleBlock

        _ ->
            -- TODO do something more interesting here?
            declaration


collectSelectors : List Structure.Declaration -> List Structure.Selector
collectSelectors declarations =
    case declarations of
        [] ->
            []

        (Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors _)) :: rest ->
            (firstSelector :: otherSelectors) ++ collectSelectors rest

        _ :: rest ->
            collectSelectors rest


oneOf : List (Maybe a) -> Maybe a
oneOf maybes =
    case maybes of
        [] ->
            Nothing

        maybe :: rest ->
            case maybe of
                Nothing ->
                    oneOf rest

                Just _ ->
                    maybe


last : List a -> Maybe a
last list =
    case list of
        [] ->
            Nothing

        singleton :: [] ->
            Just singleton

        _ :: rest ->
            last rest
