port module Stylesheets exposing (..)

import Css.File exposing (..)
import HomepageCss as Homepage


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
    toFileStructure [ ( "homepage.css", compile [ Homepage.css ] ) ]


main : Program Never
main =
    program files <| cssFiles
