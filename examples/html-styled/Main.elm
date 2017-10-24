module Main exposing (main)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src, withCss)
import Html.Styled.Lazy exposing (lazy)


headerFont : Style
headerFont =
    batch
        [ fontFamilies [ "Between1-Regular", "sans-serif" ]
        , fontSize (px 16)
        ]


pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader =
    withCss header
        [ headerFont
        , boxSizing borderBox
        , boxShadow5 inset (px 2) (px 3) (px 4) (hex "333")
        ]


navigation : List (Attribute msg) -> List (Html msg) -> Html msg
navigation =
    withCss nav
        [ display inlineBlock
        , height (px 100)
        , paddingTop (px 40)
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
        , marginLeft (px 40)
        , marginRight (px 40)
        , height (px 40)
        , verticalAlign middle
        ]


buyTickets : List (Attribute msg) -> List (Html msg) -> Html msg
buyTickets =
    withCss button
        [ headerFont
        , backgroundColor transparent
        , width (px 170)
        , height (px 40)
        , marginLeft (px 50)
        , color (rgb 255 255 255)
        , border3 (px 5) solid reactiveGreen
        , verticalAlign middle
        ]


viewBuyTickets caption =
    buyTickets [] [ text caption ]


main =
    view "BUY TICKETS"
        |> toUnstyled


backdrop =
    linearGradient (stop (hex "1b0c39")) (stop (hex "175169")) [ stop (hex "56b36d") ]


headerGradient =
    linearGradient (stop2 (hex "060b24") (px 0)) (stop2 (hex "060b24") (px 200)) [ stop2 (rgba 0 0 0 0) (px 600) ]


reactiveGreen =
    -- hex "55af6a"
    rgb 121 207 232


view ticketsCaption =
    div [ css [ backgroundImage headerGradient ] ]
        [ pageHeader []
            [ logo [ src "assets/reactive-conf.svg" ] []
            , navigation [] navElems
            , span [ css [ color reactiveGreen ] ] [ text "Oct 25–27, 2017" ]
            , lazy viewBuyTickets ticketsCaption
            ]
        , div []
            [ img [ src "assets/banner.png" ] [] ]
        ]


navElems : List (Html msg)
navElems =
    [ "SPEAKERS", "WORKSHOPS", "SCHEDULE", "VENUE", "CONTACT", "ABOUT US" ]
        |> List.map (\name -> navLink [] [ text name ])
