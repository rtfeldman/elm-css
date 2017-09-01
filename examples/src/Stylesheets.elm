port module Stylesheets exposing (..)

import Css.File exposing (CssCompilerProgram, CssFileStructure)
import HomepageCss as Homepage


port files : CssFileStructure -> Cmd msg


fileStructure : () -> CssFileStructure
fileStructure _ =
    Css.File.toFileStructure
        [ ( "homepage.css", Css.File.compile [ Homepage.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
