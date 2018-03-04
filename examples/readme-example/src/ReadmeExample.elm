module ReadmeExample exposing (main, view)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)


pageHeader : List (Html msg) -> Html msg
pageHeader =
    header
        [ css
            [ backgroundColor (rgb 90 90 90)
            , boxSizing borderBox
            , padding (px -80)
            , boxShadow5 inset (px 2) (px 3) (px 4) (hex "333")
            ]
        ]


navigation : List (Html msg) -> Html msg
navigation =
    nav
        [ css
            [ display inlineBlock
            , paddingBottom (px 12)
            ]
        ]


navLink : List (Html msg) -> Html msg
navLink =
    a
        [ css
            [ margin (px 12)
            , color (rgb 255 255 255)
            ]
        ]


logo : List (Html msg) -> Html msg
logo =
    img
        [ css
            [ display inlineBlock
            , marginLeft (px 150)
            , marginRight (px 80)
            , verticalAlign middle
            ]
        , src "assets/logo.png"
        ]


buyTickets : List (Html msg) -> Html msg
buyTickets =
    button
        [ css
            [ padding (px 16)
            , paddingLeft (px 24)
            , paddingRight (px 24)
            , marginLeft (px 50)
            , marginRight auto
            , color (rgb 255 255 255)
            , backgroundColor (rgb 27 217 130)
            , verticalAlign middle
            ]
        ]


viewBuyTickets caption =
    buyTickets [ text caption ]


main =
    view "BUY TICKETS"
        |> toUnstyled


view ticketsCaption =
    div [ css [ backgroundColor (hex "222222") ] ]
        [ header [ css [ backgroundColor (hex "333333"), padding (px 20) ] ]
            [ logo []
            , navigation navElems
            , viewBuyTickets ticketsCaption
            ]
        , div []
            [ img [ src "assets/banner.png" ] [] ]
        ]


navElems : List (Html msg)
navElems =
    [ "SPEAKERS", "SCHEDULE", "WORKSHOPS", "VENUE", "BLOG", "CONTACT" ]
        |> List.map (\name -> navLink [ text name ])


text =
    Html.Styled.text
