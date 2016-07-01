module Css.Preprocess.Resolve exposing (compile)

{-| Functions responsible for resolving Preprocess data structures into
Structure data structures and gathering warnings along the way.
-}

import Css.Preprocess as Preprocess exposing (SnippetDeclaration, Snippet(Snippet), Mixin(AppendProperty, ExtendSelector, NestSnippet), unwrapSnippet)
import Css.Structure as Structure exposing (mapLast)
import Css.Structure.Output as Output


compile : Preprocess.Stylesheet -> { warnings : List String, css : String }
compile sheet =
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


applyMixins : List Mixin -> List Structure.Declaration -> DeclarationsAndWarnings
applyMixins mixins declarations =
    case mixins of
        [] ->
            { declarations = declarations, warnings = [] }

        (AppendProperty propertyToAppend) :: rest ->
            let
                ( warnings, property ) =
                    extractWarning propertyToAppend

                result =
                    declarations
                        |> Structure.appendProperty property
                        |> applyMixins rest
            in
                { declarations = result.declarations
                , warnings = warnings ++ result.warnings
                }

        (ExtendSelector selector nestedMixins) :: rest ->
            applyNestedMixinsToLast
                nestedMixins
                rest
                (Structure.appendToLastSelector selector)
                declarations

        (NestSnippet selectorCombinator snippets) :: rest ->
            let
                chain : Structure.Selector -> Structure.Selector -> Structure.Selector
                chain (Structure.Selector originalSequence originalTuples originalPseudoElement) (Structure.Selector newSequence newTuples newPseudoElement) =
                    Structure.Selector originalSequence
                        (originalTuples ++ (( selectorCombinator, newSequence ) :: newTuples))
                        (Maybe.oneOf [ newPseudoElement, originalPseudoElement ])

                expandDeclaration : SnippetDeclaration -> DeclarationsAndWarnings
                expandDeclaration declaration =
                    case declaration of
                        Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock firstSelector otherSelectors nestedMixins) ->
                            let
                                newSelectors =
                                    (collectSelectors declarations)
                                        |> List.concatMap (\originalSelector -> List.map (chain originalSelector) (firstSelector :: otherSelectors))

                                newDeclarations =
                                    case newSelectors of
                                        [] ->
                                            []

                                        first :: rest ->
                                            [ Structure.StyleBlockDeclaration (Structure.StyleBlock first rest [])
                                            ]
                            in
                                [ applyMixins nestedMixins newDeclarations ]
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
                    |> (++) [ applyMixins rest declarations ]
                    |> concatDeclarationsAndWarnings

        (Preprocess.WithPseudoElement pseudoElement nestedMixins) :: rest ->
            applyNestedMixinsToLast
                nestedMixins
                rest
                (Structure.appendPseudoElementToLastSelector pseudoElement)
                declarations

        (Preprocess.WithMedia mediaQueries nestedMixins) :: rest ->
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
                [ applyMixins rest declarations
                , applyMixins nestedMixins newDeclarations
                ]
                    |> concatDeclarationsAndWarnings

        (Preprocess.ApplyMixins otherMixins) :: rest ->
            declarations
                |> applyMixins (otherMixins ++ rest)


applyNestedMixinsToLast : List Mixin -> List Mixin -> (Structure.StyleBlock -> List Structure.StyleBlock) -> List Structure.Declaration -> DeclarationsAndWarnings
applyNestedMixinsToLast nestedMixins rest f declarations =
    let
        handleInitial declarationsAndWarnings =
            let
                result =
                    applyMixins nestedMixins declarationsAndWarnings.declarations
            in
                { warnings = declarationsAndWarnings.warnings ++ result.warnings
                , declarations = result.declarations
                }

        initialResult =
            declarations
                |> Structure.concatMapLastStyleBlock f
                |> List.map (\declaration -> { declarations = [ declaration ], warnings = [] })
                |> mapLast handleInitial
                |> concatDeclarationsAndWarnings

        nextResult =
            applyMixins rest initialResult.declarations
    in
        { warnings = initialResult.warnings ++ nextResult.warnings
        , declarations = nextResult.declarations
        }


expandStyleBlock : Preprocess.StyleBlock -> DeclarationsAndWarnings
expandStyleBlock (Preprocess.StyleBlock firstSelector otherSelectors mixins) =
    [ Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors []) ]
        |> applyMixins mixins


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
    , List.map (\prop -> snd (extractWarning prop)) properties
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
            (firstSelector :: otherSelectors) ++ (collectSelectors rest)

        _ :: rest ->
            collectSelectors rest
