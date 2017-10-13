module Css exposing (ColorValue, Style, batch, cursor, hex, hsl, hsla, none, property, rgb, rgba, transparent)

{-| Functions for building stylesheets.


# Styles

@docs Style, batch, property


# Values

@docs none


# Properties

@docs cursor


## Color values

@docs ColorValue, transparent, rgb, rgba, hsl, hsla, hex

-}

import Color
import Css.Internal as Internal exposing (Value(..), valueToProperty)
import Css.Preprocess as Preprocess exposing (Style, unwrapSnippet)
import String


{-| -}
type alias Value a b =
    Internal.Value a b


{-| -}
type alias Style =
    Preprocess.Style


{-| Create a style from multiple other styles.

    underlineOnHover =
        batch
            [ textDecoration none

            , hover
                [ textDecoration underline ]
            ]

    stylesheet
      [ class FancyLink
          [ color (rgb 128 64 32)
          , underlineOnHover
          ]
      ]

...has the same result as:

    stylesheet
      [ class FancyLink
          [ color (rgb 128 64 32)
          , textDecoration none
          , hover
            [ textDecoration underline ]
          ]
      ]

-}
batch : List Style -> Style
batch =
    Preprocess.ApplyStyles


{-| -}
none : Value Cursor b
none =
    Value "none"



-- CURSOR PROPERTIES --


{-| <https://developer.mozilla.org/en-US/docs/Web/CSS/cursor#Values>
-}
type Cursor
    = Cursor


type alias CursorValue =
    Internal.Value Cursor ()


{-| A [`cursor`](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor#Values)
specifies the mouse cursor displayed when mouse pointer is over an element.
-}
cursor : Value Cursor b -> Style
cursor =
    prop "cursor"



{- CURSOR VALUES -}


{-| -}
default : CursorValue
default =
    Value "default"


{-| -}
crosshair : CursorValue
crosshair =
    Value "crosshair"


{-| -}
contextMenu : CursorValue
contextMenu =
    Value "context-menu"


{-| -}
help : CursorValue
help =
    Value "help"


{-| -}
pointer : CursorValue
pointer =
    Value "pointer"


{-| -}
progress : CursorValue
progress =
    Value "progress"


{-| -}
wait : CursorValue
wait =
    Value "wait"


{-| -}
cell : CursorValue
cell =
    Value "cell"


{-| -}
text : CursorValue
text =
    Value "text"


{-| -}
verticalText : CursorValue
verticalText =
    Value "vertical-text"


{-| -}
cursorAlias : CursorValue
cursorAlias =
    Value "alias"


{-| -}
copy : CursorValue
copy =
    Value "copy"


{-| -}
move : CursorValue
move =
    Value "move"


{-| -}
noDrop : CursorValue
noDrop =
    Value "no-drop"


{-| -}
notAllowed : CursorValue
notAllowed =
    Value "not-allowed"


{-| -}
eResize : CursorValue
eResize =
    Value "e-resize"


{-| -}
nResize : CursorValue
nResize =
    Value "n-resize"


{-| -}
neResize : CursorValue
neResize =
    Value "ne-resize"


{-| -}
nwResize : CursorValue
nwResize =
    Value "nw-resize"


{-| -}
sResize : CursorValue
sResize =
    Value "s-resize"


{-| -}
seResize : CursorValue
seResize =
    Value "se-resize"


{-| -}
swResize : CursorValue
swResize =
    Value "sw-resize"


{-| -}
wResize : CursorValue
wResize =
    Value "w-resize"


{-| -}
ewResize : CursorValue
ewResize =
    Value "ew-resize"


{-| -}
nsResize : CursorValue
nsResize =
    Value "ns-resize"


{-| -}
neswResize : CursorValue
neswResize =
    Value "nesw-resize"


{-| -}
nwseResize : CursorValue
nwseResize =
    Value "nwse-resize"


{-| -}
colResize : CursorValue
colResize =
    Value "col-resize"


{-| -}
rowResize : CursorValue
rowResize =
    Value "row-resize"


{-| -}
allScroll : CursorValue
allScroll =
    Value "all-scroll"


{-| -}
zoomIn : CursorValue
zoomIn =
    Value "zoom-in"


{-| -}
zoomOut : CursorValue
zoomOut =
    Value "zoom-out"


{-| -}
grab : CursorValue
grab =
    Value "grab"


{-| -}
grabbing : CursorValue
grabbing =
    Value "grabbing"



-- COLOR VALUES --


{-| <https://developer.mozilla.org/en-US/docs/Web/CSS/cursor#Values>
-}
type Color
    = Color


{-| -}
type alias ColorValue =
    Internal.Value () Color


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in functional notation.
-}
rgb : Int -> Int -> Int -> ColorValue
rgb red green blue =
    cssFunction "rgb" (List.map numberToString [ red, green, blue ])
        |> Value


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : Int -> Int -> Int -> Float -> ColorValue
rgba red green blue alpha =
    cssFunction "rgba" (List.map numberToString [ red, green, blue ] ++ [ numberToString alpha ])
        |> Value


{-| [HSL color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsl())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsl : Float -> Float -> Float -> ColorValue
hsl hue saturation lightness =
    let
        valuesList =
            [ numberToString hue
            , numericalPercentageToString saturation
            , numericalPercentageToString lightness
            ]

        value =
            cssFunction "hsl" valuesList

        warnings =
            if
                (hue > 360)
                    || (hue < 0)
                    || (saturation > 1)
                    || (saturation < 0)
                    || (lightness > 1)
                    || (lightness < 0)
            then
                [ "HSL color values must have an H value between 0 and 360 (as in degrees) and S and L values between 0 and 1. " ++ value ++ " is not valid." ]
            else
                []
    in
    hslaToRgba value warnings hue saturation lightness 1


{-| [HSLA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsla())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsla : Float -> Float -> Float -> Float -> ColorValue
hsla hue saturation lightness alpha =
    let
        valuesList =
            [ numberToString hue
            , numericalPercentageToString saturation
            , numericalPercentageToString lightness
            , numberToString alpha
            ]

        value =
            cssFunction "hsla" valuesList

        warnings =
            if
                (hue > 360)
                    || (hue < 0)
                    || (saturation > 1)
                    || (saturation < 0)
                    || (lightness > 1)
                    || (lightness < 0)
                    || (alpha > 1)
                    || (alpha < 0)
            then
                [ "HSLA color values must have an H value between 0 and 360 (as in degrees) and S, L, and A values between 0 and 1. " ++ value ++ " is not valid." ]
            else
                []
    in
    hslaToRgba value warnings hue saturation lightness alpha


hslaToRgba : String -> List String -> Float -> Float -> Float -> Float -> ColorValue
hslaToRgba value warnings hue saturation lightness hslAlpha =
    let
        { red, green, blue, alpha } =
            Color.hsla hue saturation lightness hslAlpha
                |> Color.toRgb
    in
    rgba red green blue alpha


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in hexadecimal notation. You can optionally include `#` as the first character,
for benefits like syntax highlighting in editors, ease of copy/pasting from
tools which express these as e.g. `#abcdef0`, etc.
-}
hex : String -> ColorValue
hex str =
    if String.startsWith "#" str then
        Value str
    else
        Value ("#" ++ str)


{-| A [`transparent`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent_keyword) color.
-}
transparent : ColorValue
transparent =
    Value "transparent"


{-| The [`currentColor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword)
value.
-}
currentColor : ColorValue
currentColor =
    Value "currentColor"



-- COLOR PROPERTIES --


backgroundColor : ColorValue -> Style
backgroundColor =
    prop "background-color"



-- INTERNAL HELPERS --


prop : String -> Value a b -> Style
prop key val =
    Preprocess.AppendProperty (valueToProperty key val)


{-| Define a custom property.

    stylesheet
      [ body
          [ property "-webkit-font-smoothing" "none" ]
      ]

...outputs

    body {
        -webkit-font-smoothing: none;
    }

-}
property : String -> String -> Style
property key val =
    prop key (Value val)


cssFunction : String -> List String -> String
cssFunction funcName args =
    funcName
        ++ "("
        ++ String.join ", " args
        ++ ")"


numberToString : number -> String
numberToString num =
    toString num


numericalPercentageToString : number -> String
numericalPercentageToString value =
    numberToString (value * 100) ++ "%"
