module Css.Foreign
    exposing
        ( Snippet
        , adjacentSiblings
        , children
        , descendants
        , everything
        , generalSiblings
        , id
        , important
        , selector
        )

{-| Avoid using this module!

These global CSS features [make code harder to maintain](https://medium.com/seek-blog/the-end-of-global-css-90d2a4a06284).
Much like global mutable state, they may appear convenient in the short term,
but can easily create a mess in the long term. It's best to avoid using them.

That said, sometimes you may be dealing with foreign DOM nodes - ones you do
not control. (You may be generating them from user-submitted markdown, for
example.) When you can't add attributes to the DOM nodes in question, global CSS
selectors may be your only path to styling them. In those situations,
this module is here to help!


# Selectors

@docs class, id, selector, everything


# Combinators

@docs important, children, descendants, adjacentSiblings, generalSiblings

-}

import Css.Helpers exposing (identifierToString, toCssIdentifier)
import Css.Preprocess as Preprocess exposing (Style, unwrapSnippet)
import Css.Structure as Structure exposing (..)


{-| -}
type alias Snippet =
    Preprocess.Snippet


{-| -}
descendants : List Snippet -> Style
descendants =
    Preprocess.NestSnippet Structure.Descendant


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
adjacentSiblings : List Snippet -> Style
adjacentSiblings =
    Preprocess.NestSnippet Structure.AdjacentSibling


{-| -}
generalSiblings : List Snippet -> Style
generalSiblings =
    Preprocess.NestSnippet Structure.GeneralSibling


{-| -}
children : List Snippet -> Style
children =
    Preprocess.NestSnippet Structure.Child


makeSnippet : List Style -> Structure.SimpleSelectorSequence -> Snippet
makeSnippet styles sequence =
    let
        selector =
            Structure.Selector sequence [] Nothing
    in
    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock selector [] styles) ]
        |> Preprocess.Snippet


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


{-| Transforms the given property by adding !important to the end of its
declaration.
-}
important : Style -> Style
important =
    Preprocess.mapLastProperty (\property -> { property | important = True })
