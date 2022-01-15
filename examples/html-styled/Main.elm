module Main exposing (main)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, css, href, src)
import Html.Styled.Events exposing (onClick)
import Svg.Styled as StyledSvg
import Svg.Styled.Attributes as SvgAttribs


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
            , borderRadius (px 5)
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
        [ img [ src "assets/backdrop.jpg", css [ width (pct 100) ], class "some-whatever-class" ] []
        , btn [ onClick DoSomething ] [ text "Click me!" ]
        , StyledSvg.svg
            [ SvgAttribs.class "some-whatever-NS-class"
            , SvgAttribs.css [ color (rgb 256 0 0)
            , SvgAttribs.width "100"
            , SvgAttribs.height "100"
            ]
            [ StyledSvg.circle [ SvgAttribs.cx "50", SvgAttribs.cy "50", SvgAttribs.r "40" ] [] ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { view = view >> toUnstyled
        , update = update
        , init = initialModel
        }


update : Msg -> Model -> Model
update msg model =
    model


type Msg
    = DoSomething


type alias Model =
    ()


initialModel : Model
initialModel =
    ()
