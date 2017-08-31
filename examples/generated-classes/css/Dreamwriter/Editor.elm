module Dreamwriter.Editor exposing (editor)

import Css exposing (..)
import Css.Class as Gen exposing (Class)
import Css.Elements exposing (..)


editor : Snippet
editor =
    div [ color (hex "ff0000") ]


topBar : Class
topBar =
    Gen.class [ color (hex "ccbbaa"), textDecoration none ]
