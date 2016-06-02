module Css.Namespace exposing (namespace)

{-| Namespacing
@docs namespace
-}

import Css.Helpers exposing (toCssIdentifier, identifierToString)
import Css.Preprocess as Preprocess exposing (SnippetDeclaration, Snippet(Snippet), Mixin(AppendProperty, ExtendSelector, NestSnippet), unwrapSnippet)
import Css.Structure as Structure exposing (mapLast, SimpleSelectorSequence(UniversalSelectorSequence, TypeSelectorSequence, CustomSelector), RepeatableSimpleSelector(IdSelector, ClassSelector, PseudoClassSelector))


{-|
takes an identifier, namespaces the list of snippets given with that identifier
-}
namespace : a -> List Snippet -> List Snippet
namespace rawIdentifier snippets =
    List.map (applyNamespaceToSnippet (toCssIdentifier rawIdentifier)) snippets


applyNamespaceToRepeatable : String -> RepeatableSimpleSelector -> RepeatableSimpleSelector
applyNamespaceToRepeatable name selector =
    case selector of
        ClassSelector str ->
            ClassSelector (name ++ str)

        IdSelector str ->
            IdSelector str

        PseudoClassSelector str ->
            PseudoClassSelector str


applyNamespaceToSequence : String -> SimpleSelectorSequence -> SimpleSelectorSequence
applyNamespaceToSequence name sequence =
    case sequence of
        TypeSelectorSequence selector repeatables ->
            TypeSelectorSequence selector (List.map (applyNamespaceToRepeatable name) repeatables)

        UniversalSelectorSequence repeatables ->
            UniversalSelectorSequence (List.map (applyNamespaceToRepeatable name) repeatables)

        CustomSelector str repeatables ->
            CustomSelector str (List.map (applyNamespaceToRepeatable name) repeatables)


applyNamespaceToSelector : String -> Structure.Selector -> Structure.Selector
applyNamespaceToSelector name (Structure.Selector sequence chain pseudoElement) =
    let
        apply =
            applyNamespaceToSequence name
    in
        Structure.Selector (apply sequence)
            (List.map (\( combinator, next ) -> ( combinator, apply next )) chain)
            pseudoElement


applyNamespaceToMixin : String -> Mixin -> Mixin
applyNamespaceToMixin name mixin =
    case mixin of
        Preprocess.AppendProperty property ->
            applyNamespaceToProperty name property
                |> Preprocess.AppendProperty

        Preprocess.ExtendSelector selector mixins ->
            List.map (applyNamespaceToMixin name) mixins
                |> Preprocess.ExtendSelector (applyNamespaceToRepeatable name selector)

        Preprocess.NestSnippet combinator snippets ->
            List.map (applyNamespaceToSnippet name) snippets
                |> Preprocess.NestSnippet combinator

        Preprocess.WithPseudoElement pseudoElement mixins ->
            List.map (applyNamespaceToMixin name) mixins
                |> Preprocess.WithPseudoElement pseudoElement

        Preprocess.WithMedia mediaQueries mixins ->
            List.map (applyNamespaceToMixin name) mixins
                |> Preprocess.WithMedia mediaQueries

        Preprocess.ApplyMixins mixins ->
            List.map (applyNamespaceToMixin name) mixins
                |> Preprocess.ApplyMixins


applyNamespaceToProperty : String -> Preprocess.Property -> Preprocess.Property
applyNamespaceToProperty name property =
    case property.key of
        "animation-name" ->
            { property | value = name ++ property.value }

        _ ->
            property


applyNamespaceToStyleBlock : String -> Preprocess.StyleBlock -> Preprocess.StyleBlock
applyNamespaceToStyleBlock name (Preprocess.StyleBlock firstSelector otherSelectors mixins) =
    Preprocess.StyleBlock (applyNamespaceToSelector name firstSelector)
        (List.map (applyNamespaceToSelector name) otherSelectors)
        (List.map (applyNamespaceToMixin name) mixins)


applyNamespaceToSnippet : String -> Snippet -> Snippet
applyNamespaceToSnippet name (Snippet declarations) =
    List.map (applyNamespaceToDeclaration name) declarations
        |> Snippet


applyNamespaceToDeclaration : String -> SnippetDeclaration -> SnippetDeclaration
applyNamespaceToDeclaration name declaration =
    case declaration of
        Preprocess.StyleBlockDeclaration styleBlock ->
            applyNamespaceToStyleBlock name styleBlock
                |> Preprocess.StyleBlockDeclaration

        Preprocess.MediaRule mediaQueries styleBlocks ->
            styleBlocks
                |> List.map (applyNamespaceToStyleBlock name)
                |> Preprocess.MediaRule mediaQueries

        Preprocess.SupportsRule str snippets ->
            snippets
                |> List.concatMap unwrapSnippet
                |> List.map (applyNamespaceToDeclaration name)
                |> (\declarations -> [ Snippet declarations ])
                |> Preprocess.SupportsRule str

        -- TODO give these more descritpive names
        Preprocess.DocumentRule str1 str2 str3 str4 styleBlock ->
            applyNamespaceToStyleBlock name styleBlock
                |> Preprocess.DocumentRule str1 str2 str3 str4

        Preprocess.PageRule _ _ ->
            declaration

        Preprocess.FontFace _ ->
            declaration

        Preprocess.Keyframes str properties ->
            Preprocess.Keyframes (name ++ str) properties

        Preprocess.Viewport _ ->
            declaration

        Preprocess.CounterStyle _ ->
            declaration

        Preprocess.FontFeatureValues _ ->
            declaration
