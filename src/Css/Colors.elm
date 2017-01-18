module Css.Colors exposing (navy, blue, aqua, teal, olive, green, lime, yellow, orange, red, maroon, fuchsia, purple, black, gray, silver)

{-| A nicer default set of colors than the ones CSS ships with. Color codes taken from [clrs.cc](http://clrs.cc).

    import Css.Colors exposing (..)

    stylesheet
      [ button
          [ backgroundColor blue ]
      ]

...compiles to:

    button {
        backgroundColor: #0074D9;
    }

# Colors
@docs navy, blue, aqua, teal, olive, green, lime, yellow, orange, red, maroon, fuchsia, purple, black, gray, silver
-}

import Css exposing (Color, hex)


{-| [Colors](http://clrs.cc) hex code #001F3F
-}
navy : Color
navy =
    hex "001F3F"


{-| [Colors](http://clrs.cc) hex code #0074D9
-}
blue : Color
blue =
    hex "0074D9"


{-| [Colors](http://clrs.cc) hex code #7FDBFF
-}
aqua : Color
aqua =
    hex "7FDBFF"


{-| [Colors](http://clrs.cc) hex code #39CCCC
-}
teal : Color
teal =
    hex "39CCCC"


{-| [Colors](http://clrs.cc) hex code #3D9970
-}
olive : Color
olive =
    hex "3D9970"


{-| [Colors](http://clrs.cc) hex code #2ECC40
-}
green : Color
green =
    hex "2ECC40"


{-| [Colors](http://clrs.cc) hex code #01FF70
-}
lime : Color
lime =
    hex "01FF70"


{-| [Colors](http://clrs.cc) hex code #FFDC00
-}
yellow : Color
yellow =
    hex "FFDC00"


{-| [Colors](http://clrs.cc) hex code #FF851B
-}
orange : Color
orange =
    hex "FF851B"


{-| [Colors](http://clrs.cc) hex code #FF4136
-}
red : Color
red =
    hex "FF4136"


{-| [Colors](http://clrs.cc) hex code #85144b
-}
maroon : Color
maroon =
    hex "85144b"


{-| [Colors](http://clrs.cc) hex code #F012BE
-}
fuchsia : Color
fuchsia =
    hex "F012BE"


{-| [Colors](http://clrs.cc) hex code #B10DC9
-}
purple : Color
purple =
    hex "B10DC9"


{-| [Colors](http://clrs.cc) hex code #111111
-}
black : Color
black =
    hex "111111"


{-| [Colors](http://clrs.cc) hex code #AAAAAA
-}
gray : Color
gray =
    hex "AAAAAA"


{-| [Colors](http://clrs.cc) hex code #dddddd
-}
silver : Color
silver =
    hex "dddddd"
