module Css.Preprocess (..) where

{-| A representation of the preprocessing to be done. The elm-css DSL generates
the data structures found in this module.
-}

import Css.Structure as Structure exposing (mapLast, concatMapLast)


stylesheet : List Snippet -> Stylesheet
stylesheet snippets =
  { charset = Nothing
  , imports = []
  , namespaces = []
  , snippets = snippets
  }


toStructure : Stylesheet -> Structure.Stylesheet
toStructure stylesheet =
  { charset = stylesheet.charset
  , imports = stylesheet.imports
  , namespaces = stylesheet.namespaces
  , declarations = List.concatMap snippetToDeclarations stylesheet.snippets
  }


snippetToDeclarations : Snippet -> List Structure.Declaration
snippetToDeclarations (Snippet snippetDeclarations) =
  List.concatMap toDeclarations snippetDeclarations


toMediaRule : List Structure.MediaQuery -> Structure.Declaration -> Structure.Declaration
toMediaRule mediaQueries declaration =
  case declaration of
    Structure.StyleBlockDeclaration structureStyleBlock ->
      Structure.MediaRule mediaQueries structureStyleBlock

    Structure.MediaRule newMediaQueries structureStyleBlock ->
      Structure.MediaRule (mediaQueries ++ newMediaQueries) structureStyleBlock

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


toDeclarations : SnippetDeclaration -> List Structure.Declaration
toDeclarations snippetDeclaration =
  case snippetDeclaration of
    StyleBlockDeclaration styleBlock ->
      expandStyleBlock styleBlock

    MediaRule mediaQueries styleBlocks ->
      List.concatMap
        (\styleBlock -> List.map (toMediaRule mediaQueries) (expandStyleBlock styleBlock))
        styleBlocks

    SupportsRule str declarations ->
      [ Structure.SupportsRule str (List.concatMap snippetToDeclarations declarations) ]

    -- TODO give these more descriptive names
    DocumentRule str1 str2 str3 str4 styleBlock ->
      List.map (toDocumentRule str1 str2 str3 str4) (expandStyleBlock styleBlock)

    PageRule str properties ->
      [ Structure.PageRule str (List.map toStructureProperty properties) ]

    FontFace properties ->
      [ Structure.FontFace (List.map toStructureProperty properties) ]

    Keyframes str keyframeProperties ->
      [ Structure.Keyframes str keyframeProperties ]

    Viewport properties ->
      [ Structure.Viewport (List.map toStructureProperty properties) ]

    CounterStyle properties ->
      [ Structure.Viewport (List.map toStructureProperty properties) ]

    FontFeatureValues tuples ->
      [ Structure.FontFeatureValues (List.map (\( str, properties ) -> ( str, (List.map toStructureProperty properties) )) tuples) ]


toStructureProperty : Property -> Structure.Property
toStructureProperty property =
  { key = property.key
  , value = property.value
  , important = property.important
  , warnings = property.warnings
  }


expandStyleBlock : StyleBlock -> List Structure.Declaration
expandStyleBlock (StyleBlock firstSelector otherSelectors mixins) =
  [ Structure.StyleBlockDeclaration (Structure.StyleBlock firstSelector otherSelectors []) ]
    |> applyMixins mixins


applyMixins : List Mixin -> List Structure.Declaration -> List Structure.Declaration
applyMixins mixins declarations =
  case mixins of
    [] ->
      declarations

    (AppendProperty property) :: rest ->
      declarations
        |> Structure.appendProperty property
        |> applyMixins rest

    (ExtendSelector selector nestedMixins) :: rest ->
      declarations
        |> Structure.mapLastStyleBlock (Structure.appendToLastSelector selector)
        |> concatMapLast (\declaration -> applyMixins nestedMixins [ declaration ])
        |> applyMixins rest

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
        |> applyMixins otherMixins
        |> applyMixins rest


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


mapLastProperty : (Structure.Property -> Structure.Property) -> Mixin -> Mixin
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


mapAllLastProperty : (Structure.Property -> Structure.Property) -> List Mixin -> List Mixin
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
