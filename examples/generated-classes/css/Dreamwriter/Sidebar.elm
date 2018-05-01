module Dreamwriter.Sidebar exposing (chapter, menu)

import Css exposing (..)
import Css.Global exposing (..)
import DEPRECATED.Css.File exposing (UniqueClass, uniqueClass)


menu : Snippet
menu =
    button [ color (hex "aabbcc"), textDecoration none ]


chapter : UniqueClass
chapter =
    uniqueClass [ color (hex "eeeeee"), backgroundColor (hex "aabbcc") ]
