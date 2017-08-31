module Dreamwriter.Sidebar exposing (chapter, menu)

import Css exposing (..)
import Css.Class as Gen exposing (Class)
import Css.Elements exposing (..)


menu : Snippet
menu =
    button [ color (hex "aabbcc"), textDecoration none ]


chapter : Class
chapter =
    Gen.class [ color (hex "eeeeee"), backgroundColor (hex "aabbcc") ]
