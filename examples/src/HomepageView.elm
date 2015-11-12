module HomepageView where

import Html exposing (..)
import Html.Helpers exposing (..)
import Html.Attributes exposing (src)
import HomepageStylesheet exposing (..)
import Stylesheets
import Json.Encode as Encode
import SharedStyles exposing (..)


main : Html
main =
    div
        []
        [
            div [ Html.Attributes.property "innerHTML" (Encode.string ("<style>" ++ (Stylesheets.prettyPrint 4 HomepageStylesheet.exports) ++ "</style>")) ] [],

            header
                []
                [
                    img [ id ReactiveLogo, src "assets/logo.png" ] [],

                    nav
                        []
                        navElems,

                    span
                        [ id BuyTickets ]
                        [ text "BUY TICKETS" ]
                ],

            div
                [ ]
                [ img [ src "assets/banner.png" ] [] ]
        ]


navElems =
    [ "SPEAKERS", "SCHEDULE", "WORKSHOPS", "VENUE", "BLOG", "CONTACT" ]
        |> List.map (\name -> span [ class NavLink ] [ text name ])
