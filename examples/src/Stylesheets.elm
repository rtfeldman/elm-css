module Stylesheets (..) where

import Css.File exposing (..)
import HomepageCss as Homepage


port files : CssFileStructure
port files =
    toFileStructure
        [ ( "homepage.css", compile Homepage.css ) ]
