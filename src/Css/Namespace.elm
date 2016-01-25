module Css.Namespace (..) where

import Css.Helpers exposing (toCssIdentifier, identifierToString)
import Css.Preprocess exposing (Snippet(Snippet), StyleBlock(..), SnippetDeclaration(..), Property, unwrapSnippet, Mixin(..))
import Css.Structure exposing (Selector(..), RepeatableSimpleSelector(..), SimpleSelectorSequence(..))


namespace : a -> List Snippet -> List Snippet
namespace rawIdentifier snippets =
  List.map (applyNamespaceToSnippet (toCssIdentifier rawIdentifier)) snippets


applyNamespaceToRepeatable : String -> RepeatableSimpleSelector -> RepeatableSimpleSelector
applyNamespaceToRepeatable name selector =
  case selector of
    ClassSelector str ->
      ClassSelector (name ++ str)

    IdSelector str ->
      IdSelector (name ++ str)

    PseudoClassSelector str ->
      PseudoClassSelector str


applyNamespaceToSequence : String -> SimpleSelectorSequence -> SimpleSelectorSequence
applyNamespaceToSequence name sequence =
  case sequence of
    TypeSelectorSequence selector repeatables ->
      TypeSelectorSequence selector (List.map (applyNamespaceToRepeatable name) repeatables)

    UniversalSelectorSequence repeatables ->
      UniversalSelectorSequence
        (List.map (applyNamespaceToRepeatable name) repeatables)

    CustomSelector str repeatables ->
      CustomSelector str (List.map (applyNamespaceToRepeatable name) repeatables)


applyNamespaceToSelector : String -> Selector -> Selector
applyNamespaceToSelector name (Selector sequence chain pseudoElement) =
  let
    apply =
      applyNamespaceToSequence name
  in
    Selector
      (apply sequence)
      (List.map (\( combinator, next ) -> ( combinator, apply next )) chain)
      pseudoElement


applyNamespaceToMixin : String -> Mixin -> Mixin
applyNamespaceToMixin name mixin =
  case mixin of
    AppendProperty property ->
      applyNamespaceToProperty name property
        |> AppendProperty

    ExtendSelector selector mixins ->
      List.map (applyNamespaceToMixin name) mixins
        |> ExtendSelector (applyNamespaceToRepeatable name selector)

    NestSnippet combinator snippets ->
      List.map (applyNamespaceToSnippet name) snippets
        |> NestSnippet combinator

    WithPseudoElement pseudoElement mixins ->
      List.map (applyNamespaceToMixin name) mixins
        |> WithPseudoElement pseudoElement

    WithMedia mediaQueries mixins ->
      List.map (applyNamespaceToMixin name) mixins
        |> WithMedia mediaQueries

    ApplyMixins mixins ->
      List.map (applyNamespaceToMixin name) mixins
        |> ApplyMixins


applyNamespaceToProperty : String -> Property -> Property
applyNamespaceToProperty name property =
  case property.key of
    "animation-name" ->
      { property | value = name ++ property.value }

    _ ->
      property


applyNamespaceToStyleBlock : String -> StyleBlock -> StyleBlock
applyNamespaceToStyleBlock name (StyleBlock firstSelector otherSelectors mixins) =
  StyleBlock
    (applyNamespaceToSelector name firstSelector)
    (List.map (applyNamespaceToSelector name) otherSelectors)
    (List.map (applyNamespaceToMixin name) mixins)


applyNamespaceToSnippet : String -> Snippet -> Snippet
applyNamespaceToSnippet name (Snippet declarations) =
  List.map (applyNamespaceToDeclaration name) declarations
    |> Snippet


applyNamespaceToDeclaration : String -> SnippetDeclaration -> SnippetDeclaration
applyNamespaceToDeclaration name declaration =
  case declaration of
    StyleBlockDeclaration styleBlock ->
      applyNamespaceToStyleBlock name styleBlock
        |> StyleBlockDeclaration

    MediaRule mediaQueries styleBlocks ->
      styleBlocks
        |> List.map (applyNamespaceToStyleBlock name)
        |> MediaRule mediaQueries

    SupportsRule str snippets ->
      snippets
        |> List.concatMap unwrapSnippet
        |> List.map (applyNamespaceToDeclaration name)
        |> (\declarations -> [ Snippet declarations ])
        |> SupportsRule str

    -- TODO give these more descritpive names
    DocumentRule str1 str2 str3 str4 styleBlock ->
      applyNamespaceToStyleBlock name styleBlock
        |> DocumentRule str1 str2 str3 str4

    PageRule _ _ ->
      declaration

    FontFace _ ->
      declaration

    Keyframes str properties ->
      Keyframes (name ++ str) properties

    Viewport _ ->
      declaration

    CounterStyle _ ->
      declaration

    FontFeatureValues _ ->
      declaration
