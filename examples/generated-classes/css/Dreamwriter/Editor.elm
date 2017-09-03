module Dreamwriter.Editor exposing (editor, headerBar)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.File exposing (UniqueClass, uniqueClass)


editor : Snippet
editor =
    div [ color (hex "ff0000") ]


headerBar : UniqueClass
headerBar =
    uniqueClass [ color (hex "ccbba9"), textDecoration none ]
