port module Stylesheets exposing (..)

import Css.File exposing (CssCompilerProgram, CssFileStructure)
import MyCss


port files : CssFileStructure -> Cmd msg


fileStructure : () -> CssFileStructure
fileStructure _ =
    Css.File.toFileStructure
        [ ( "index.css", Css.File.compile [ MyCss.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
