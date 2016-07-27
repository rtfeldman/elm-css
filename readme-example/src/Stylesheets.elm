port module Stylesheets exposing (..)

import Css.File exposing (..)
import MyCss


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
    toFileStructure [ ( "styles.css", compile MyCss.css ) ]


main : Program Never
main =
    Css.File.program files <| cssFiles
