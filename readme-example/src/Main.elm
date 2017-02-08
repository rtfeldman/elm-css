module Main exposing (main)

import Html exposing (Html)
import MyCss
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace "dreamwriter"


main : Html msg
main =
    Html.div []
        [ Html.div [ class [ MyCss.NavBar ] ] [ Html.text "this has the navbar class" ]
        , Html.div [ id MyCss.Page ] [ Html.text "this has the Page id" ]
        ]
