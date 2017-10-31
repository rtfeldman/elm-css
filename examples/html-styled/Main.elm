module Main exposing (main)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, withCss)


headerFont =
    batch
        [ fontFamilies [ "Between1-Regular", "sans-serif" ]
        , fontSize (px 16)
        , lineHeight (num 1.2)
        ]


pageHeader =
    withCss header
        [ headerFont
        , boxSizing borderBox
        , boxShadow5 inset (px 2) (px 3) (px 4) (hex "333")
        ]


navigation =
    withCss nav
        [ display inlineBlock
        , height (px 40)
        , paddingTop (px 40)
        , paddingBottom (px 12)
        ]


navLink =
    withCss a
        [ margin (px 12)
        , color (rgb 250 250 250)
        ]


logo =
    withCss img
        [ display inlineBlock
        , marginLeft (px 40)
        , marginRight (px 40)
        , height (px 40)
        , verticalAlign middle
        ]


reactiveConfColor =
    hex "55af6a"


navElems =
    [ "SPEAKERS", "WORKSHOPS", "SCHEDULE", "VENUE", "CONTACT", "ABOUT US" ]
        |> List.map (\name -> navLink [] [ text name ])


view =
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


main =
    view |> toUnstyled
