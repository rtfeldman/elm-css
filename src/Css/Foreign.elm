module Css.Foreign
    exposing
        ( Snippet
        , adjacentSiblings
        , children
        , class
        , descendants
        , each
        , everything
        , generalSiblings
        , global
        , id
        , selector
        , withClass
        )

{-| Style foreign DOM structures (e.g. generated from markdown) where you cannot
add attributes.

This works by using CSS selectors which are [globally scoped and
bad for maintainability](https://medium.com/seek-blog/the-end-of-global-css-90d2a4a06284),
so definitely avoid using this module on DOM structures you control!


# Statements

@docs class, id, selector, everything


# Combinators

@docs children, descendants, adjacentSiblings, generalSiblings

-}

import Css
import Css.Preprocess.Resolve as Resolve
import Css.Structure as Structure
import Html.Styled
import Html.Styled.Internal exposing (makeSnippet)
import VirtualDom


{-| Add global styles to the page. This compiles directly to a `<style>` element.
-}
global : List Snippet -> Html.Styled.Html msg
global snippets =
    snippets
        |> Css.stylesheet
        |> List.singleton
        |> Resolve.compile
        |> .css
        |> VirtualDom.text
        |> List.singleton
        |> VirtualDom.node "style" []
        |> Html.Styled.Internal.Unstyled


{-| -}
type alias Snippet =
    Preprocess.Snippet


{-| An [id selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors).

    stylesheet
        [ id NavBar
            [ width 960 px
            , backgroundColor (rgb 123 42 208)
            ]
        ]

-}
id : id -> List Style -> Snippet
id identifier styles =
    [ Structure.IdSelector (identifierToString "" identifier) ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles


{-| A [class selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors).

    stylesheet
        [ class LoginFormButton
            [ fontWeight normal
            , color (rgb 128 64 32)
            ]
        ]

-}
class : class -> List Style -> Snippet
class class styles =
    [ Structure.ClassSelector (identifierToString "" class) ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles


{-| A custom selector. Use this for things like
[attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
and [universal selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    stylesheet "homepage"
        [ selector "* [lang^=en]"
            [ textDecoration underline
            , color (rgb 7 7 7)
            ]
        ]

-}
selector : String -> List Style -> Snippet
selector selectorStr styles =
    Structure.CustomSelector selectorStr []
        |> makeSnippet styles


{-| A [`*` selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    class Foo
      [ children
          [ everything
              [ color (rgb 14 15 16)
              , borderRadius (px 5)
              ]
          ]
      ]

...compiles to:

    .Foo > * {
      color: rgb(14, 15, 16);
      border-radius: 5px;
    }

-}
everything : List Style -> Snippet
everything styles =
    Structure.UniversalSelectorSequence []
        |> makeSnippet styles


{-| -}
children : List Snippet -> Style
children =
    Preprocess.NestSnippet Structure.Child


{-| -}
withClass : class -> List Style -> Style
withClass class =
    Preprocess.ExtendSelector (Structure.ClassSelector (identifierToString "" class))


{-| -}
descendants : List Snippet -> Style
descendants =
    Preprocess.NestSnippet Structure.Descendant


{-| -}
adjacentSiblings : List Snippet -> Style
adjacentSiblings =
    Preprocess.NestSnippet Structure.AdjacentSibling


{-| -}
generalSiblings : List Snippet -> Style
generalSiblings =
    Preprocess.NestSnippet Structure.GeneralSibling


{-| -}
each : List (List Style -> Snippet) -> List Style -> Snippet
each snippetCreators styles =
    let
        selectorsToSnippet selectors =
            case selectors of
                [] ->
                    Preprocess.Snippet []

                first :: rest ->
                    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock first rest styles) ]
                        |> Preprocess.Snippet
    in
    List.map ((|>) []) snippetCreators
        |> List.concatMap unwrapSnippet
        |> collectSelectors
        |> selectorsToSnippet
