module Css.Preprocess exposing (..)

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


type Mixin
    = AppendProperty Property
    | ExtendSelector Structure.RepeatableSimpleSelector (List Mixin)
    | NestSnippet Structure.SelectorCombinator (List Snippet)
    | WithPseudoElement Structure.PseudoElement (List Mixin)
    | WithMedia (List Structure.MediaQuery) (List Mixin)
    | ApplyMixins (List Mixin)


type Snippet
    = Snippet (List SnippetDeclaration)


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


unwrapSnippet : Snippet -> List SnippetDeclaration
unwrapSnippet (Snippet declarations) =
    declarations


toPropertyPairs : List Mixin -> List ( String, String )
toPropertyPairs mixins =
    case mixins of
        [] ->
            []

        (AppendProperty property) :: rest ->
            (propertyToPair property) :: (toPropertyPairs rest)

        (ApplyMixins mixins) :: rest ->
            (toPropertyPairs mixins) ++ (toPropertyPairs rest)

        _ :: rest ->
            toPropertyPairs rest


propertyToPair : Property -> ( String, String )
propertyToPair property =
    let
        value =
            if property.important then
                property.value ++ " !important"
            else
                property.value
    in
        ( property.key, value )
