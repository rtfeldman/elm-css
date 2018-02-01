# elm-css

`elm-css` lets you define CSS in Elm. (For an Elm styling system that is a
complete departure from CSS, check out [style-elements](http://package.elm-lang.org/packages/mdgriffith/style-elements/latest).)

Here's an example of how to define some `elm-css` styles:

```elm
module MyCss exposing (main)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)


{-| A logo image, with inline styles that change on hover.
-}
logo : Html msg
logo =
    img
        [ src "logo.png"
        , css
            [ display inlineBlock
            , padding (px 20)
            , border3 (px 5) solid (rgb 120 120 120)
            , hover
                [ borderColor theme.primary
                , borderRadius (px 10)
                ]
            ]
        ]
        []


{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }


{-| A reusable button which has some styles pre-applied to it.
-}
btn : List (Attribute msg) -> List (Html msg) -> Html msg
btn =
    styled button
        [ margin (px 12)
        , color (rgb 250 250 250)
        , hover
            [ backgroundColor theme.primary
            , textDecoration underline
            ]
        ]


{-| A reusable style. Css.batch combines multiple styles into one, much
like mixins in CSS preprocessors.
-}
paragraphFont : Style
paragraphFont =
    Css.batch
        [ fontFamilies [ "Palatino Linotype", "Georgia", "serif" ]
        , fontSize (px 16)
        , fontWeight normal
        ]


{-| Css.property lets you define custom properties, using strings as their values.
-}
legacyBorderRadius : String -> Style
legacyBorderRadius amount =
    Css.batch
        [ property "-moz-border-radius" amount
        , property "-webkit-border-top-left-radius" amount
        , property "-webkit-border-top-right-radius" amount
        , property "-webkit-border-bottom-right-radius" amount
        , property "-webkit-border-bottom-left-radius" amount
        , property "border-radius" amount
        ]


view : Model -> Html Msg
view model =
    nav []
        [ img [ src "assets/backdrop.jpg", css [ width (pct 100) ] ] []
        , btn [ onClick DoSomething ] [ text "Click me!" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view >> toUnstyled
        , update = update
        , model = initialModel
        }
```

See [the `Css` module documentation](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css) for an explanation of how this code works.

`elm-css` draws inspiration from the excellent [Sass](http://sass-lang.com/), [Stylus](http://stylus-lang.com/), [CSS Modules](http://glenmaddern.com/articles/css-modules), and [styled-components](https://www.styled-components.com) libraries. It includes features like:

- [locally scoped CSS](https://medium.com/seek-blog/the-end-of-global-css-90d2a4a06284)
- [mixins](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#batch)
- [nested media queries](https://davidwalsh.name/write-media-queries-sass) (as well as pseudo-classes like `:hover` and pseudo-elements like `::after`)

### Examples

- A [reusable datepicker](https://github.com/abadi199/datetimepicker) built by Abadi Kurniawan
- The [website](https://noredink.github.io/json-to-elm) for [json-to-elm](https://github.com/eeue56/json-to-elm)
- This project's [examples](https://github.com/rtfeldman/elm-css/tree/master/examples) folder

## Related Projects

- [Elm CSS Normalize](https://github.com/scottcorgan/elm-css-normalize)
