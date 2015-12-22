module Stylesheets (..) where

import Css exposing (..)
import HomepageCss as Homepage


port files : CssFileStructure
port files =
    toFileStructure
        [ ( "homepage.css", prettyPrint Homepage.css ) ]
