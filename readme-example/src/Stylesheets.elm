module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure)
import MyCss


port files : CssFileStructure
port files =
  Css.File.toFileStructure
    [ ( "styles.css", Css.File.compile MyCss.css ) ]
