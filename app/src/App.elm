module App where

import Html exposing (..)
import Html.Attributes exposing (..)
import DreamwriterStyle
import Stylesheets


main : Html
main =
    let
        prettyPrinted =
            DreamwriterStyle.exports
                |> Stylesheets.prettyPrint 4
    in
        textarea
            [ style [ ("height", "800px"), ("width", "800px") ] ]
            [ text prettyPrinted ]
