module Css.Preprocess.Resolve (compile) where

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


toDeclarations : SnippetDeclaration -> DeclarationsAndWarnings
toDeclarations snippetDeclaration =
  case snippetDeclaration of
    Preprocess.StyleBlockDeclaration styleBlock ->
      expandStyleBlock styleBlock

    Preprocess.MediaRule mediaQueries styleBlocks ->
      resolveMediaRule mediaQueries styleBlocks

    Preprocess.SupportsRule str snippets ->
      let
        { declarations, warnings } =
          extract (List.concatMap unwrapSnippet snippets)
      in
        { declarations = [ Structure.SupportsRule str declarations ]
        , warnings = warnings
        }

    -- TODO give these more descriptive names
    Preprocess.DocumentRule str1 str2 str3 str4 styleBlock ->
      let
        { declarations, warnings } =
          expandStyleBlock styleBlock
      in
        { declarations =
            List.map (toDocumentRule str1 str2 str3 str4) declarations
        , warnings = warnings
        }

    Preprocess.PageRule str pageRuleProperties ->
      let
        ( warnings, properties ) =
          extractWarnings pageRuleProperties
      in
        { declarations = [ Structure.PageRule str properties ]
        , warnings = warnings
        }

    Preprocess.FontFace fontFaceProperties ->
      let
        ( warnings, properties ) =
          extractWarnings fontFaceProperties
      in
        { declarations = [ Structure.FontFace properties ]
        , warnings = warnings
        }

    Preprocess.Keyframes str properties ->
      { declarations = [ Structure.Keyframes str properties ]
      , warnings = []
      }

    Preprocess.Viewport viewportProperties ->
      let
        ( warnings, properties ) =
          extractWarnings viewportProperties
      in
        { declarations = [ Structure.Viewport properties ]
        , warnings = warnings
        }

    Preprocess.CounterStyle counterStyleProperties ->
      let
        ( warnings, properties ) =
          extractWarnings counterStyleProperties
      in
        { declarations = [ Structure.Viewport properties ]
        , warnings = warnings
        }

    Preprocess.FontFeatureValues tuples ->
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
            |> Structure.concatMapLastStyleBlock (Structure.appendToLastSelector selector)
            |> List.map (\declaration -> { declarations = [ declaration ], warnings = [] })
            |> mapLast handleInitial
            |> concatDeclarationsAndWarnings

        nextResult =
          applyMixins rest initialResult.declarations
      in
        { warnings = initialResult.warnings ++ nextResult.warnings
        , declarations = nextResult.declarations
        }

    (NestSnippet selectorCombinator snippets) :: rest ->
      let
        chain : Structure.Selector -> Structure.Selector -> Structure.Selector
        chain (Structure.Selector originalSequence originalTuples originalPseudoElement) (Structure.Selector newSequence newTuples newPseudoElement) =
          Structure.Selector
            originalSequence
            (originalTuples ++ (( selectorCombinator, newSequence ) :: newTuples))
            (Maybe.oneOf [ newPseudoElement, originalPseudoElement ])

        applySelectors : List Structure.Selector -> Structure.Declaration -> List Structure.Declaration
        applySelectors newSelectors originalDeclaration =
          case originalDeclaration of
            Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors properties) ->
              let
                newSelectors =
                  (firstSelector :: otherSelectors)
                    |> List.concatMap
                        (\originalSelector -> List.map (chain originalSelector) newSelectors)
              in
                case newSelectors of
                  [] ->
                    []

                  firstNewSelector :: otherNewSelectors ->
                    [ Structure.StyleBlockDeclaration
                        (Structure.StyleBlock
                          firstNewSelector
                          otherNewSelectors
                          properties
                        )
                    ]

            Structure.MediaRule _ _ ->
              [ originalDeclaration ]

            Structure.SupportsRule _ _ ->
              [ originalDeclaration ]

            Structure.DocumentRule _ _ _ _ _ ->
              [ originalDeclaration ]

            Structure.PageRule _ _ ->
              [ originalDeclaration ]

            Structure.FontFace _ ->
              [ originalDeclaration ]

            Structure.Keyframes _ _ ->
              [ originalDeclaration ]

            Structure.Viewport _ ->
              [ originalDeclaration ]

            Structure.CounterStyle _ ->
              [ originalDeclaration ]

            Structure.FontFeatureValues _ ->
              [ originalDeclaration ]

        expandDeclaration : SnippetDeclaration -> DeclarationsAndWarnings
        expandDeclaration declaration =
          case declaration of
            Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock firstSelector otherSelectors nestedMixins) ->
              declarations
                |> List.concatMap (applySelectors (firstSelector :: otherSelectors))
                |> applyMixins nestedMixins

            Preprocess.MediaRule mediaQueries styleBlocks ->
              resolveMediaRule mediaQueries styleBlocks

            Preprocess.SupportsRule str snippets ->
              let
                { declarations, warnings } =
                  extract (List.concatMap unwrapSnippet snippets)
              in
                { declarations = [ Structure.SupportsRule str declarations ]
                , warnings = warnings
                }

            -- TODO give these more descriptive names
            Preprocess.DocumentRule str1 str2 str3 str4 styleBlock ->
              let
                { declarations, warnings } =
                  expandStyleBlock styleBlock
              in
                { declarations =
                    List.map (toDocumentRule str1 str2 str3 str4) declarations
                , warnings = warnings
                }

            Preprocess.PageRule str pageRuleProperties ->
              let
                ( warnings, properties ) =
                  extractWarnings pageRuleProperties
              in
                { declarations = [ Structure.PageRule str properties ]
                , warnings = warnings
                }

            Preprocess.FontFace fontFaceProperties ->
              let
                ( warnings, properties ) =
                  extractWarnings fontFaceProperties
              in
                { declarations = [ Structure.FontFace properties ]
                , warnings = warnings
                }

            Preprocess.Keyframes str properties ->
              { declarations = [ Structure.Keyframes str properties ]
              , warnings = []
              }

            Preprocess.Viewport viewportProperties ->
              let
                ( warnings, properties ) =
                  extractWarnings viewportProperties
              in
                { declarations = [ Structure.Viewport properties ]
                , warnings = warnings
                }

            Preprocess.CounterStyle counterStyleProperties ->
              let
                ( warnings, properties ) =
                  extractWarnings counterStyleProperties
              in
                { declarations = [ Structure.Viewport properties ]
                , warnings = warnings
                }

            Preprocess.FontFeatureValues tuples ->
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
      in
        snippets
          |> List.concatMap unwrapSnippet
          |> List.map expandDeclaration
          |> concatDeclarationsAndWarnings

    (Preprocess.WithPseudoElement pseudoElement nestedMixins) :: rest ->
      -- TODO
      declarations
        |> applyMixins rest

    (Preprocess.WithMedia mediaQuery snippets) :: rest ->
      -- TODO
      declarations
        |> applyMixins rest

    (Preprocess.ApplyMixins otherMixins) :: rest ->
      declarations
        |> applyMixins (otherMixins ++ rest)


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
