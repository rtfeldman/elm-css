module StyledPhantom exposing (all)

-- import ReadmeExample

import Css exposing (..)
import Html.Styled as Html exposing (Html, a, button, div, header, img, nav, toUnstyled)
import Html.Styled.Attributes exposing (css, src)
import Test exposing (Test, describe)
import Test.Html.Query as Query
import Test.Html.Selector as Selector



-- readme example


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


viewBuyTickets : String -> Html msg
viewBuyTickets caption =
    buyTickets [ Html.text caption ]


view : String -> Html msg
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
        |> List.map (\name -> navLink [ Html.text name ])



-- test


all : Test
all =
    describe "style tag output"
        [ Test.test
            "See generated css in HTML"
            (\_ ->
                Query.fromHtml (toUnstyled <| view "BUY TICKETS")
                    |> Query.has
                        [ Selector.text """._950e85ab {
    background-color:#333333;
    padding:20px;
}"""
                        , Selector.text """._9052bb8e {
    margin:12px;
    color:rgb(255, 255, 255);
}"""
                        , Selector.text """._7bfd0c7b {
    display:inline-block;
    padding-bottom:12px;
}"""
                        , Selector.text """._33aa99cc {
    display:inline-block;
    margin-left:150px;
    margin-right:80px;
    vertical-align:middle;
}"""
                        , Selector.text """._1b2cec01 {
    background-color:#222222;
}"""
                        , Selector.text """._4503f439 {
    padding:16px;
    padding-left:24px;
    padding-right:24px;
    margin-left:50px;
    margin-right:auto;
    color:rgb(255, 255, 255);
    background-color:rgb(27, 217, 130);
    vertical-align:middle;
}"""
                        ]
            )
        ]
