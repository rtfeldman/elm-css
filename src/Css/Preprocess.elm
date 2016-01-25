module Css.Preprocess (..) where

{-| A representation of the preprocessing to be done. The elm-css DSL generates
the data structures found in this module.
-}

import Css.Structure as Structure exposing (mapLast, concatMapLast)


type alias DeclarationsAndWarnings =
  { declarations : List Structure.Declaration
  , warnings : List String
  }


stylesheet : List Snippet -> Stylesheet
stylesheet snippets =
  { charset = Nothing
  , imports = []
  , namespaces = []
  , snippets = snippets
  }


toStructure : Stylesheet -> ( Structure.Stylesheet, List String )
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


toDocumentRule : String -> String -> String -> String -> Structure.Declaration -> Structure.Declaration
toDocumentRule str1 str2 str3 str4 declaration =
  case declaration of
    Structure.StyleBlockDeclaration structureStyleBlock ->
      Structure.DocumentRule str1 str2 str3 str4 structureStyleBlock

    _ ->
      -- TODO do something more interesting here?
      declaration


toDeclarations : SnippetDeclaration -> DeclarationsAndWarnings
toDeclarations snippetDeclaration =
  case snippetDeclaration of
    StyleBlockDeclaration styleBlock ->
      expandStyleBlock styleBlock

    MediaRule mediaQueries styleBlocks ->
      let
        handleStyleBlock : StyleBlock -> DeclarationsAndWarnings
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

    SupportsRule str snippets ->
      let
        { declarations, warnings } =
          extract (List.concatMap unwrapSnippet snippets)
      in
        { declarations = [ Structure.SupportsRule str declarations ]
        , warnings = warnings
        }

    -- TODO give these more descriptive names
    DocumentRule str1 str2 str3 str4 styleBlock ->
      let
        { declarations, warnings } =
          expandStyleBlock styleBlock
      in
        { declarations =
            List.map (toDocumentRule str1 str2 str3 str4) declarations
        , warnings = warnings
        }

    PageRule str pageRuleProperties ->
      let
        ( warnings, properties ) =
          extractWarnings pageRuleProperties
      in
        { declarations = [ Structure.PageRule str properties ]
        , warnings = warnings
        }

    FontFace fontFaceProperties ->
      let
        ( warnings, properties ) =
          extractWarnings fontFaceProperties
      in
        { declarations = [ Structure.FontFace properties ]
        , warnings = warnings
        }

    Keyframes str properties ->
      { declarations = [ Structure.Keyframes str properties ]
      , warnings = []
      }

    Viewport viewportProperties ->
      let
        ( warnings, properties ) =
          extractWarnings viewportProperties
      in
        { declarations = [ Structure.Viewport properties ]
        , warnings = warnings
        }

    CounterStyle counterStyleProperties ->
      let
        ( warnings, properties ) =
          extractWarnings counterStyleProperties
      in
        { declarations = [ Structure.Viewport properties ]
        , warnings = warnings
        }

    FontFeatureValues tuples ->
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


extractWarnings : List Property -> ( List String, List Structure.Property )
extractWarnings properties =
  ( List.concatMap .warnings properties
  , List.map (\prop -> snd (extractWarning prop)) properties
  )


extractWarning : Property -> ( List String, Structure.Property )
extractWarning { warnings, key, value, important } =
  ( warnings, { key = key, value = value, important = important } )


expandStyleBlock : StyleBlock -> DeclarationsAndWarnings
expandStyleBlock (StyleBlock firstSelector otherSelectors mixins) =
  [ Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors []) ]
    |> applyMixins mixins


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
      -- TODO
      declarations
        |> applyMixins rest

    (WithPseudoElement pseudoElement nestedMixins) :: rest ->
      -- TODO
      declarations
        |> applyMixins rest

    (WithMedia mediaQuery snippets) :: rest ->
      -- TODO
      declarations
        |> applyMixins rest

    (ApplyMixins otherMixins) :: rest ->
      declarations
        |> applyMixins (otherMixins ++ rest)


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


type alias Property =
  { key : String
  , value : String
  , important : Bool
  , warnings : List String
  }


type alias Stylesheet =
  { charset : Maybe String
  , imports : List ( String, List Structure.MediaQuery )
  , namespaces : List ( String, String )
  , snippets : List Snippet
  }


mapLastProperty : (Property -> Property) -> Mixin -> Mixin
mapLastProperty update mixin =
  case mixin of
    AppendProperty property ->
      AppendProperty (update property)

    ExtendSelector selector mixins ->
      ExtendSelector selector (mapAllLastProperty update mixins)

    NestSnippet _ _ ->
      mixin

    WithPseudoElement _ _ ->
      mixin

    WithMedia _ _ ->
      mixin

    ApplyMixins otherMixins ->
      ApplyMixins (mapLast (mapLastProperty update) otherMixins)


mapAllLastProperty : (Property -> Property) -> List Mixin -> List Mixin
mapAllLastProperty update mixins =
  case mixins of
    [] ->
      mixins

    only :: [] ->
      [ mapLastProperty update only ]

    first :: rest ->
      first :: mapAllLastProperty update rest


type Mixin
  = AppendProperty Property
  | ExtendSelector Structure.RepeatableSimpleSelector (List Mixin)
  | NestSnippet Structure.SelectorCombinator (List Snippet)
  | WithPseudoElement Structure.PseudoElement (List Mixin)
  | WithMedia (List Structure.MediaQuery) (List Mixin)
  | ApplyMixins (List Mixin)


type Snippet
  = Snippet (List SnippetDeclaration)


unwrapSnippet : Snippet -> List SnippetDeclaration
unwrapSnippet (Snippet declarations) =
  declarations


type SnippetDeclaration
  = StyleBlockDeclaration StyleBlock
  | MediaRule (List Structure.MediaQuery) (List StyleBlock)
  | SupportsRule String (List Snippet)
  | DocumentRule String String String String StyleBlock
  | PageRule String (List Property)
  | FontFace (List Property)
  | Keyframes String (List Structure.KeyframeProperty)
  | Viewport (List Property)
  | CounterStyle (List Property)
  | FontFeatureValues (List ( String, List Property ))


type StyleBlock
  = StyleBlock Structure.Selector (List Structure.Selector) (List Mixin)
