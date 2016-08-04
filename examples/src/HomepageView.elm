module HomepageView exposing (..)

import Html exposing (..)
import Html.CssHelpers exposing (..)
import Html.Attributes exposing (..)
import HomepageCss exposing (..)
import Json.Encode as Encode
import SharedStyles exposing (..)


{ id, class, classList } =
    homepageNamespace
main : Html a
main =
    div []
        [ header []
            [ img [ id ReactiveLogo, src "assets/logo.png" ] []
            , nav []
                navElems
            , span [ id BuyTickets ]
                [ text "BUY TICKETS" ]
            ]
        , div []
            [ img [ src "assets/banner.png" ] [] ]
        ]


navElems =
    [ "SPEAKERS", "SCHEDULE", "WORKSHOPS", "VENUE", "BLOG", "CONTACT" ]
        |> List.map (\name -> span [ class [ NavLink ] ] [ text name ])
