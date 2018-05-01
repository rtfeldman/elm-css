module Dreamwriter.Editor exposing (editor, headerBar, purpleCircle)

import Css exposing (..)
import Css.Foreign exposing (..)
import DEPRECATED.Css.File exposing (UniqueClass, UniqueSvgClass, uniqueClass, uniqueSvgClass)


editor : Snippet
editor =
    div [ color (hex "ff0000") ]


headerBar : UniqueClass
headerBar =
    uniqueClass [ color (hex "ccbba9"), textDecoration none ]


purpleCircle : UniqueSvgClass
purpleCircle =
    uniqueSvgClass [ backgroundColor (hex "ccbba9") ]
