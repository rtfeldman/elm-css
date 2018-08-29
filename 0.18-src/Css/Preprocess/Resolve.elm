module Css.Preprocess.Resolve exposing (compile)

{-| Functions responsible for resolving Preprocess data structures into
Structure data structures and gathering warnings along the way.
-}

import Css.Preprocess as Preprocess exposing (Snippet(Snippet), SnippetDeclaration, Style(AppendProperty, ExtendSelector, NestSnippet), unwrapSnippet)
import Css.Structure as Structure exposing (mapLast)
import Css.Structure.Output as Output
import String
import Tuple


compile : List Preprocess.Stylesheet -> { warnings : List String, css : String }
compile styles =
    let
        results =
            List.map compile1 styles
    in
    { warnings = List.concatMap .warnings results
    , css = String.join "\n\n" (List.map .css results)
    }


compile1 : Preprocess.Stylesheet -> { warnings : List String, css : String }
compile1 sheet =
    let
        ( structureStylesheet, warnings ) =
            toStructure sheet
    in
    { warnings = warnings
    , css = Output.prettyPrint (Structure.dropEmpty structureStylesheet)
    }


type alias DeclarationsAndWarnings =
    { declarations : List Structure.Declaration
    , warnings : List String
    }


resolveMediaRule : List Structure.MediaQuery -> List Preprocess.StyleBlock -> DeclarationsAndWarnings
resolveMediaRule mediaQueries styleBlocks =
    let
        handleStyleBlock : Preprocess.StyleBlock -> DeclarationsAndWarnings
        handleStyleBlock styleBlock =
            let
                { declarations, warnings } =
                    expandStyleBlock styleBlock
            in
            { declarations = List.map (toMediaRule mediaQueries) declarations
            , warnings = warnings
            }

        results =
            List.map handleStyleBlock styleBlocks
    in
    { warnings = List.concatMap .warnings results
    , declarations = List.concatMap .declarations results
    }


resolveSupportsRule : String -> List Snippet -> DeclarationsAndWarnings
resolveSupportsRule str snippets =
    let
        { declarations, warnings } =
            extract (List.concatMap unwrapSnippet snippets)
    in
    { declarations = [ Structure.SupportsRule str declarations ]
    , warnings = warnings
    }


resolveDocumentRule : String -> String -> String -> String -> Preprocess.StyleBlock -> DeclarationsAndWarnings
resolveDocumentRule str1 str2 str3 str4 styleBlock =
    -- TODO give these more descriptive names
    let
        { declarations, warnings } =
            expandStyleBlock styleBlock
    in
    { declarations =
        List.map (toDocumentRule str1 str2 str3 str4) declarations
    , warnings = warnings
    }


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

        Structure.Keyframes _ _ ->
            declaration

        Structure.Viewport _ ->
            declaration

        Structure.CounterStyle _ ->
            declaration

        Structure.FontFeatureValues _ ->
            declaration


resolvePageRule : String -> List Preprocess.Property -> DeclarationsAndWarnings
resolvePageRule str pageRuleProperties =
    let
        ( warnings, properties ) =
            extractWarnings pageRuleProperties
    in
    { declarations = [ Structure.PageRule str properties ]
    , warnings = warnings
    }


resolveFontFace : List Preprocess.Property -> DeclarationsAndWarnings
resolveFontFace fontFaceProperties =
    let
        ( warnings, properties ) =
            extractWarnings fontFaceProperties
    in
    { declarations = [ Structure.FontFace properties ]
    , warnings = warnings
    }


resolveKeyframes : String -> List Structure.KeyframeProperty -> DeclarationsAndWarnings
resolveKeyframes str properties =
    { declarations = [ Structure.Keyframes str properties ]
    , warnings = []
    }


resolveViewport : List Preprocess.Property -> DeclarationsAndWarnings
resolveViewport viewportProperties =
    let
        ( warnings, properties ) =
            extractWarnings viewportProperties
    in
    { declarations = [ Structure.Viewport properties ]
    , warnings = warnings
    }


resolveCounterStyle : List Preprocess.Property -> DeclarationsAndWarnings
resolveCounterStyle counterStyleProperties =
    let
        ( warnings, properties ) =
            extractWarnings counterStyleProperties
    in
    { declarations = [ Structure.Viewport properties ]
    , warnings = warnings
    }


resolveFontFeatureValues : List ( String, List Preprocess.Property ) -> DeclarationsAndWarnings
resolveFontFeatureValues tuples =
    let
        expandTuples tuplesToExpand =
            case tuplesToExpand of
                [] ->
                    ( [], [] )

                ( str, tupleProperties ) :: rest ->
                    let
                        ( warnings, properties ) =
                            extractWarnings tupleProperties

                        ( nextWarnings, nextTuples ) =
                            expandTuples rest
                    in
                    ( warnings ++ nextWarnings, ( str, properties ) :: nextTuples )

        ( warnings, newTuples ) =
            expandTuples tuples
    in
    { declarations = [ Structure.FontFeatureValues newTuples ]
    , warnings = warnings
    }


toDeclarations : SnippetDeclaration -> DeclarationsAndWarnings
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
            resolveDocumentRule str1 str2 str3 str4 styleBlock

        Preprocess.PageRule str pageRuleProperties ->
            resolvePageRule str pageRuleProperties

        Preprocess.FontFace fontFaceProperties ->
            resolveFontFace fontFaceProperties

        Preprocess.Keyframes str properties ->
            resolveKeyframes str properties

        Preprocess.Viewport viewportProperties ->
            resolveViewport viewportProperties

        Preprocess.CounterStyle counterStyleProperties ->
            resolveCounterStyle counterStyleProperties

        Preprocess.FontFeatureValues tuples ->
            resolveFontFeatureValues tuples


concatDeclarationsAndWarnings : List DeclarationsAndWarnings -> DeclarationsAndWarnings
concatDeclarationsAndWarnings declarationsAndWarnings =
    case declarationsAndWarnings of
        [] ->
            { declarations = []
            , warnings = []
            }

        { declarations, warnings } :: rest ->
            let
                result =
                    concatDeclarationsAndWarnings rest
            in
            { declarations = declarations ++ result.declarations
            , warnings = warnings ++ result.warnings
            }


extract : List SnippetDeclaration -> DeclarationsAndWarnings
extract snippetDeclarations =
    case snippetDeclarations of
        [] ->
            { declarations = [], warnings = [] }

        first :: rest ->
            let
                nextResult =
                    extract rest

                { declarations, warnings } =
                    toDeclarations first
            in
            { declarations = declarations ++ nextResult.declarations
            , warnings = warnings ++ nextResult.warnings
            }


applyStyles : List Style -> List Structure.Declaration -> DeclarationsAndWarnings
applyStyles styles declarations =
    case styles of
        [] ->
            { declarations = declarations, warnings = [] }

        (AppendProperty propertyToAppend) :: rest ->
            let
                ( warnings, property ) =
                    extractWarning propertyToAppend

                result =
                    declarations
                        |> Structure.appendProperty property
                        |> applyStyles rest
            in
            { declarations = result.declarations
            , warnings = warnings ++ result.warnings
            }

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

                expandDeclaration : SnippetDeclaration -> DeclarationsAndWarnings
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

                                        first :: rest ->
                                            [ Structure.StyleBlockDeclaration (Structure.StyleBlock first rest [])
                                            ]
                            in
                            [ applyStyles nestedStyles newDeclarations ]
                                |> concatDeclarationsAndWarnings

                        Preprocess.MediaRule mediaQueries styleBlocks ->
                            resolveMediaRule mediaQueries styleBlocks

                        Preprocess.SupportsRule str snippets ->
                            resolveSupportsRule str snippets

                        -- TODO give these more descriptive names
                        Preprocess.DocumentRule str1 str2 str3 str4 styleBlock ->
                            resolveDocumentRule str1 str2 str3 str4 styleBlock

                        Preprocess.PageRule str pageRuleProperties ->
                            resolvePageRule str pageRuleProperties

                        Preprocess.FontFace fontFaceProperties ->
                            resolveFontFace fontFaceProperties

                        Preprocess.Keyframes str properties ->
                            resolveKeyframes str properties

                        Preprocess.Viewport viewportProperties ->
                            resolveViewport viewportProperties

                        Preprocess.CounterStyle counterStyleProperties ->
                            resolveCounterStyle counterStyleProperties

                        Preprocess.FontFeatureValues tuples ->
                            resolveFontFeatureValues tuples
            in
            snippets
                |> List.concatMap unwrapSnippet
                |> List.map expandDeclaration
                |> (++) [ applyStyles rest declarations ]
                |> concatDeclarationsAndWarnings

        (Preprocess.WithPseudoElement pseudoElement nestedStyles) :: rest ->
            applyNestedStylesToLast
                nestedStyles
                rest
                (Structure.appendPseudoElementToLastSelector pseudoElement)
                declarations

        (Preprocess.WithMedia mediaQueries nestedStyles) :: rest ->
            let
                newDeclarations =
                    case collectSelectors declarations of
                        [] ->
                            []

                        firstSelector :: otherSelectors ->
                            [ [ Structure.StyleBlock firstSelector otherSelectors [] ]
                                |> Structure.MediaRule mediaQueries
                            ]
            in
            [ applyStyles rest declarations
            , applyStyles nestedStyles newDeclarations
            ]
                |> concatDeclarationsAndWarnings

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


applyNestedStylesToLast : List Style -> List Style -> (Structure.StyleBlock -> List Structure.StyleBlock) -> List Structure.Declaration -> DeclarationsAndWarnings
applyNestedStylesToLast nestedStyles rest f declarations =
    let
        handleInitial declarationsAndWarnings =
            let
                result =
                    applyStyles nestedStyles declarationsAndWarnings.declarations
            in
            { warnings = declarationsAndWarnings.warnings ++ result.warnings
            , declarations = result.declarations
            }

        initialResult =
            lastDeclaration declarations
                |> Maybe.map insertStylesToNestedDecl
                |> Maybe.withDefault { warnings = [], declarations = [] }

        insertStylesToNestedDecl lastDecl =
            Structure.concatMapLastStyleBlock f lastDecl
                |> List.map (\declaration -> { declarations = [ declaration ], warnings = [] })
                |> mapLast handleInitial
                |> concatDeclarationsAndWarnings

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
            case ( List.head nextResult.declarations, List.head <| List.reverse declarations ) of
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
    { warnings = initialResult.warnings ++ nextResult.warnings
    , declarations = newDeclarations ++ withoutParent initialResult.declarations ++ withoutParent nextResult.declarations
    }


lastDeclaration : List Structure.Declaration -> Maybe (List Structure.Declaration)
lastDeclaration declarations =
    case declarations of
        [] ->
            Nothing

        x :: [] ->
            Just [ x ]

        _ :: xs ->
            lastDeclaration xs


expandStyleBlock : Preprocess.StyleBlock -> DeclarationsAndWarnings
expandStyleBlock (Preprocess.StyleBlock firstSelector otherSelectors styles) =
    [ Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors []) ]
        |> applyStyles styles


toStructure : Preprocess.Stylesheet -> ( Structure.Stylesheet, List String )
toStructure { charset, imports, namespaces, snippets } =
    let
        { warnings, declarations } =
            snippets
                |> List.concatMap unwrapSnippet
                |> extract
    in
    ( { charset = charset
      , imports = imports
      , namespaces = namespaces
      , declarations = declarations
      }
    , warnings
    )


toDocumentRule : String -> String -> String -> String -> Structure.Declaration -> Structure.Declaration
toDocumentRule str1 str2 str3 str4 declaration =
    case declaration of
        Structure.StyleBlockDeclaration structureStyleBlock ->
            Structure.DocumentRule str1 str2 str3 str4 structureStyleBlock

        _ ->
            -- TODO do something more interesting here?
            declaration


extractWarnings : List Preprocess.Property -> ( List String, List Structure.Property )
extractWarnings properties =
    ( List.concatMap .warnings properties
    , List.map (\prop -> Tuple.second (extractWarning prop)) properties
    )


extractWarning : Preprocess.Property -> ( List String, Structure.Property )
extractWarning { warnings, key, value, important } =
    ( warnings, { key = key, value = value, important = important } )


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
