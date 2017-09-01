module Dreamwriter.Editor exposing (editor, headerBar)

import Css exposing (..)
import Css.Class as Gen exposing (Class)
import Css.Elements exposing (..)


editor : Snippet
editor =
    div [ color (hex "ff0000") ]


headerBar : Class
headerBar =
    Gen.class [ color (hex "ccbbaa"), textDecoration none ]
