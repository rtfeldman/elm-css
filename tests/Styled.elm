module Styled exposing (all)

-- import ReadmeExample

import Css exposing (..)
import Css.Media as Media
import Html.Styled exposing (Html, a, button, div, header, img, li, nav, text, toUnstyled)
import Html.Styled.Attributes exposing (class, css, src)
import Html.Styled.Keyed exposing (lazyNode)
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
    buyTickets [ text caption ]


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
        |> List.map (\name -> navLink [ text name ])



-- test


all : Test
all =
    describe "style tag output"
        [ Test.test
            "See generated css in HTML"
            (\_ ->
                Query.fromHtml (toUnstyled <| view "BUY TICKETS")
                    |> Query.has
                        [ Selector.text "._aa0d343{background-color:#333333;padding:20px;}"
                        , Selector.text "._a66df6e{margin:12px;color:rgb(255,255,255);}"
                        , Selector.text "._6976989a{display:inline-block;padding-bottom:12px;}"
                        , Selector.text "._96c89573{display:inline-block;margin-left:150px;margin-right:80px;vertical-align:middle;}"
                        , Selector.text "._e9cf1689{background-color:#222222;}"
                        , Selector.text "._20d887e{padding:16px;padding-left:24px;padding-right:24px;margin-left:50px;margin-right:auto;color:rgb(255,255,255);background-color:rgb(27,217,130);vertical-align:middle;}"
                        ]
            )
        , bug564
        , keyedLazyTests
        ]


bug564 : Test
bug564 =
    describe "Github Issue #564: https://github.com/rtfeldman/elm-css/issues/564"
        [ Test.test "generated class is included when there's no custom class" <|
            \_ ->
                div
                    [ css [ color (rgb 0 0 0) ]
                    ]
                    []
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.has [ Selector.class "_5dc67897" ]
        , Test.test "custom class is included when there's no generated class" <|
            \_ ->
                div [ class "some-custom-class" ]
                    []
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.has [ Selector.class "some-custom-class" ]
        , Test.test "custom class is included as well as generated class" <|
            \_ ->
                div
                    [ css [ color (rgb 0 0 0) ]
                    , class "some-custom-class"
                    ]
                    []
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.has [ Selector.classes [ "_5dc67897", "some-custom-class" ] ]
        ]


keyedLazyTests : Test
keyedLazyTests =
    describe "keyedLazy"
        [ Test.test "generates an appropriate selector for the root node" <|
            \_ ->
                lazyNode "ul"
                    []
                    (\_ ->
                        div [ css [ color (rgb 0 0 0) ] ] []
                    )
                    [ ( "item-1", 1 ) ]
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.has [ Selector.text "#item-1._5dc67897" ]
        , Test.test "generates an appropriate selector for a descendant node" <|
            \_ ->
                lazyNode
                    "ul"
                    []
                    (\_ ->
                        li [] [ div [ css [ color (rgb 0 0 0) ] ] [] ]
                    )
                    [ ( "item-1", 1 ) ]
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.has [ Selector.text "#item-1 ._5dc67897" ]
        , Test.test "generates an appropriate selector with media" <|
            \_ ->
                lazyNode
                    "ul"
                    []
                    (\_ ->
                        li [] [ div [ css [ Media.withMedia [ Media.only Media.screen [] ] [ color (rgb 0 0 0) ] ] ] [] ]
                    )
                    [ ( "item-1", 1 ) ]
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.has [ Selector.text "#item-1 ._22afe2eb" ]
        ]
