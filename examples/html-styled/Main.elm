module Main exposing (main)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Lazy exposing (lazy)


pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader =
    withCss header
        [ backgroundColor (rgb 90 90 90)
        , boxSizing borderBox
        , padding (px -80)
        , boxShadow5 inset (px 2) (px 3) (px 4) (hex "333")
        ]


navigation : List (Attribute msg) -> List (Html msg) -> Html msg
navigation =
    withCss nav
        [ display inlineBlock
        , paddingBottom (px 12)
        ]


navLink : List (Attribute msg) -> List (Html msg) -> Html msg
navLink =
    withCss a
        [ margin (px 12)
        , color (rgb 255 255 255)
        ]


logo : List (Attribute msg) -> List (Html msg) -> Html msg
logo =
    withCss img
        [ display inlineBlock
        , marginLeft (px 150)
        , marginRight (px 80)
        , verticalAlign middle
        ]


viewBuyTickets : String -> Html msg
viewBuyTickets caption =
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
            , hover
                [ backgroundColor (rgb 255 255 255)
                , color (rgb 27 217 130)
                ]
            ]
        ]
        [ text caption ]


main =
    view "BUY TICKETS"
        |> Html.Styled.toUnstyled


view ticketsCaption =
    span [ css [ backgroundColor (hex "222222") ] ]
        [ header [ css [ backgroundColor (hex "333333"), padding (px 20) ] ]
            [ logo [ src "assets/logo.png" ] []
            , navigation [] navElems
            , lazy viewBuyTickets ticketsCaption
            ]
        , div []
            [ img [ src "assets/banner.png" ] [] ]
        ]


navElems : List (Html msg)
navElems =
    [ "SPEAKERS", "SCHEDULE", "WORKSHOPS", "VENUE", "BLOG", "CONTACT" ]
        |> List.map (\name -> navLink [] [ text name ])
