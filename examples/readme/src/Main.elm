module Main exposing (main)

import Css exposing (..)
import Html exposing (Program)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, withCss)


main =
    Html.beginnerProgram { view = view, update = update, model = model }


view : Model -> Html msg
view model =
    div []
        [ pageHeader []
            [ logo [ src "assets/reactive-conf.svg" ] []
            , navigation [] navElems
            , span
                [ css [ color reactiveConfColor ] ]
                [ text "Oct 25–27, 2017" ]
            , a
                [ href "/tickets"
                , css
                    [ display inlineBlock
                    , color (rgb 250 250 250)
                    , marginLeft (px 50)
                    , border3 (px 5) solid reactiveConfColor
                    , padding2 (px 12) (px 16)
                    , textDecoration none
                    , headerFont
                    , hover [ backgroundColor reactiveConfColor ]
                    ]
                ]
                [ text "BUY TICKETS" ]
            ]
        , div []
            [ img [ src "assets/backdrop.jpg", css [ width (pct 100) ] ] [] ]
        ]


type alias Model =
    ()
