port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import HomepageCss as Homepage


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "homepage.css", Css.File.compile [ Homepage.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
