module Css.Colors exposing (aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, orange, purple, red, silver, teal, white, yellow)

{-| A nicer default set of colors than the ones CSS ships with. Color codes taken from [clrs.cc](http://clrs.cc).

    css [ backgroundColor blue ]

...compiles to:

    backgroundColor: #0074D9;


# Colors

@docs navy, blue, aqua, teal, olive, green, lime, yellow, orange, red, maroon, fuchsia, purple, black, gray, silver, white

-}

import Css exposing (Color, Value, hex)


{-| <img src="https://dummyimage.com/1x1/001f3f/001f3f.png" width="504px" height="40px">
-}
navy : Value Color
navy =
    hex "001F3F"


{-| <img src="https://dummyimage.com/1x1/0074d9/0074d9.png" width="504px" height="40px">
-}
blue : Value Color
blue =
    hex "0074D9"


{-| <img src="https://dummyimage.com/1x1/7fdbff/7fdbff.png" width="504px" height="40px">
-}
aqua : Value Color
aqua =
    hex "7FDBFF"


{-| <img src="https://dummyimage.com/1x1/39cccc/39cccc.png" width="504px" height="40px">
-}
teal : Value Color
teal =
    hex "39CCCC"


{-| <img src="https://dummyimage.com/1x1/3d9970/3d9970.png" width="504px" height="40px">
-}
olive : Value Color
olive =
    hex "3D9970"


{-| <img src="https://dummyimage.com/1x1/2ecc40/2ecc40.png" width="504px" height="40px">
-}
green : Value Color
green =
    hex "2ECC40"


{-| <img src="https://dummyimage.com/1x1/01ff70/01ff70.png" width="504px" height="40px">
-}
lime : Value Color
lime =
    hex "01FF70"


{-| <img src="https://dummyimage.com/1x1/ffdc00/ffdc00.png" width="504px" height="40px">
-}
yellow : Value Color
yellow =
    hex "FFDC00"


{-| <img src="https://dummyimage.com/1x1/ff851b/ff851b.png" width="504px" height="40px">
-}
orange : Value Color
orange =
    hex "FF851B"


{-| <img src="https://dummyimage.com/1x1/ff4136/ff4136.png" width="504px" height="40px">
-}
red : Value Color
red =
    hex "FF4136"


{-| <img src="https://dummyimage.com/1x1/85144b/85144b.png" width="504px" height="40px">
-}
maroon : Value Color
maroon =
    hex "85144b"


{-| <img src="https://dummyimage.com/1x1/f012be/f012be.png" width="504px" height="40px">
-}
fuchsia : Value Color
fuchsia =
    hex "F012BE"


{-| <img src="https://dummyimage.com/1x1/b10dc9/b10dc9.png" width="504px" height="40px">
-}
purple : Value Color
purple =
    hex "B10DC9"


{-| <img src="https://dummyimage.com/1x1/111111/111111.png" width="504px" height="40px">
-}
black : Value Color
black =
    hex "111111"


{-| <img src="https://dummyimage.com/1x1/aaaaaa/aaaaaa.png" width="504px" height="40px">
-}
gray : Value Color
gray =
    hex "AAAAAA"


{-| <img src="https://dummyimage.com/1x1/dddddd/dddddd.png" width="504px" height="40px">
-}
silver : Value Color
silver =
    hex "dddddd"


{-| <img src="https://dummyimage.com/1x1/ffffff/ffffff.png" width="504px" height="40px">
-}
white : Value Color
white =
    hex "ffffff"
