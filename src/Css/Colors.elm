module Css.Colors exposing (aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, orange, purple, red, silver, teal, white, yellow)

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

@docs navy, blue, aqua, teal, olive, green, lime, yellow, orange, red, maroon, fuchsia, purple, black, gray, silver, white

-}

import Css exposing (Color, hex)


{-| <img src="https://dummyimage.com/1x1/001f3f/001f3f.png" width="504px" height="40px">
-}
navy : Color
navy =
    hex "001F3F"


{-| <img src="https://dummyimage.com/1x1/0074d9/0074d9.png" width="504px" height="40px">
-}
blue : Color
blue =
    hex "0074D9"


{-| <img src="https://dummyimage.com/1x1/7fdbff/7fdbff.png" width="504px" height="40px">
-}
aqua : Color
aqua =
    hex "7FDBFF"


{-| <img src="https://dummyimage.com/1x1/39cccc/39cccc.png" width="504px" height="40px">
-}
teal : Color
teal =
    hex "39CCCC"


{-| <img src="https://dummyimage.com/1x1/3d9970/3d9970.png" width="504px" height="40px">
-}
olive : Color
olive =
    hex "3D9970"


{-| <img src="https://dummyimage.com/1x1/2ecc40/2ecc40.png" width="504px" height="40px">
-}
green : Color
green =
    hex "2ECC40"


{-| <img src="https://dummyimage.com/1x1/01ff70/01ff70.png" width="504px" height="40px">
-}
lime : Color
lime =
    hex "01FF70"


{-| <img src="https://dummyimage.com/1x1/ffdc00/ffdc00.png" width="504px" height="40px">
-}
yellow : Color
yellow =
    hex "FFDC00"


{-| <img src="https://dummyimage.com/1x1/ff851b/ff851b.png" width="504px" height="40px">
-}
orange : Color
orange =
    hex "FF851B"


{-| <img src="https://dummyimage.com/1x1/ff4136/ff4136.png" width="504px" height="40px">
-}
red : Color
red =
    hex "FF4136"


{-| <img src="https://dummyimage.com/1x1/85144b/85144b.png" width="504px" height="40px">
-}
maroon : Color
maroon =
    hex "85144b"


{-| <img src="https://dummyimage.com/1x1/f012be/f012be.png" width="504px" height="40px">
-}
fuchsia : Color
fuchsia =
    hex "F012BE"


{-| <img src="https://dummyimage.com/1x1/b10dc9/b10dc9.png" width="504px" height="40px">
-}
purple : Color
purple =
    hex "B10DC9"


{-| <img src="https://dummyimage.com/1x1/111111/111111.png" width="504px" height="40px">
-}
black : Color
black =
    hex "111111"


{-| <img src="https://dummyimage.com/1x1/aaaaaa/aaaaaa.png" width="504px" height="40px">
-}
gray : Color
gray =
    hex "AAAAAA"


{-| <img src="https://dummyimage.com/1x1/dddddd/dddddd.png" width="504px" height="40px">
-}
silver : Color
silver =
    hex "dddddd"


{-| <img src="https://dummyimage.com/1x1/ffffff/ffffff.png" width="504px" height="40px">
-}
white : Color
white =
    hex "ffffff"
