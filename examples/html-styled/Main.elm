module Main exposing (main)

import Css exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Lazy exposing (lazy)


pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader =
    header
        [ backgroundColor (rgb 90 90 90)
        , boxSizing borderBox
        , padding (px -80)
        , boxShadow5 inset (px 2) (px 3) (px 4) (hex "333")
        ]


navigation : List (Attribute msg) -> List (Html msg) -> Html msg
navigation =
    nav
        [ display inlineBlock
        , paddingBottom (px 12)
        ]


navLink : List (Attribute msg) -> List (Html msg) -> Html msg
navLink =
    a
        [ margin (px 12)
        , color (rgb 255 255 255)
        ]


logo : List (Attribute msg) -> List (Html msg) -> Html msg
logo =
    img
        [ display inlineBlock
        , marginLeft (px 150)
        , marginRight (px 80)
        , verticalAlign middle
        ]


buyTickets : List (Attribute msg) -> List (Html msg) -> Html msg
buyTickets =
    button
        [ padding (px 16)
        , paddingLeft (px 24)
        , paddingRight (px 24)
        , marginLeft (px 50)
        , marginRight auto
        , color (rgb 255 255 255)
        , backgroundColor (rgb 27 217 130)
        , verticalAlign middle
        ]


viewBuyTickets caption =
    buyTickets [] [ text caption ]


main =
    view "BUY TICKETS"
        |> toUnstyled


view ticketsCaption =
    div [ backgroundColor (hex "222222") ]
        []
        [ header [ backgroundColor (hex "333333"), padding (px 20) ]
            []
            [ logo [ src "assets/logo.png" ] []
            , navigation [] navElems
            , lazy viewBuyTickets ticketsCaption
            ]
        , div []
            []
            [ img [] [ src "assets/banner.png" ] [] ]
        ]


navElems : List (Html msg)
navElems =
    [ "SPEAKERS", "SCHEDULE", "WORKSHOPS", "VENUE", "BLOG", "CONTACT" ]
        |> List.map (\name -> navLink [] [ text name ])


src =
    Attr.src


text =
    Html.Styled.text
