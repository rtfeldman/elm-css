module Css.Media
    exposing
        ( AbsoluteLength
        , Bits
        , BlockAxisOverflow
        , ColorGamut
        , Expression
        , HoverCapability
        , InlineAxisOverflow
        , MediaQuery
        , MediaType
        , Orientation
        , PointerDevice
        , Ratio
        , Resolution
        , ScanningProcess
        , ScriptingSupport
        , UpdateFrequency
        , all
        , anyHover
        , anyPointer
        , aspectRatio
        , bits
        , canHover
        , coarse
        , color
        , colorGamut
        , colorIndex
        , dpcm
        , dpi
        , dppx
        , enabled
        , fast
        , fine
        , grid
        , height
        , hover
        , initialOnly
        , interlace
        , landscape
        , maxAspectRatio
        , maxColor
        , maxColorIndex
        , maxHeight
        , maxMonochrome
        , maxResolution
        , maxWidth
        , minAspectRatio
        , minColor
        , minColorIndex
        , minHeight
        , minMonochrome
        , minResolution
        , minWidth
        , monochrome
        , not
        , only
        , optionalPaged
        , orientation
        , overflowBlock
        , overflowInline
        , p3
        , paged
        , pointer
        , portrait
        , print
        , progressive
        , ratio
        , rec2020
        , resolution
        , scan
        , screen
        , scripting
        , slow
        , speech
        , srgb
        , update
        , width
        , withMedia
        , withMediaQuery
        )

{-| Functions for building [`@media` queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries).


# Data Structures

@docs MediaQuery, MediaType, Expression


# `@media` rule constructors

@docs withMedia, withMediaQuery


# Query constructors

@docs all, only, not


# Media Types

@docs screen, print, speech


# Viewport, Page Dimensions Media Features

@docs AbsoluteLength, minWidth, width, maxWidth, minHeight, height, maxHeight
@docs Ratio, ratio, maxAspectRatio, minAspectRatio, aspectRatio
@docs Orientation, landscape, portrait, orientation


# Display Quality Media Features

@docs Resolution, dpi, dpcm, dppx, minResolution, resolution, maxResolution
@docs ScanningProcess, scan, progressive, interlace, scan, grid
@docs UpdateFrequency, slow, fast, update, paged, optionalPaged
@docs BlockAxisOverflow, InlineAxisOverflow, overflowBlock, overflowInline


# Color Media Features

@docs Bits, bits, minColor, color, maxColor, minMonochrome, monochrome
@docs maxColorIndex, maxMonochrome, minColorIndex, colorIndex
@docs ColorGamut, srgb, p3, rec2020, colorGamut


# Interaction Media Features

@docs PointerDevice, fine, coarse, pointer, anyPointer, canHover
@docs HoverCapability, hover, anyHover


# Scripting Media Features

@docs ScriptingSupport, initialOnly, enabled, scripting

-}

import Css exposing (Style)
import Css.Preprocess as Preprocess
import Css.Structure as Structure exposing (..)


{-| One query of a media rule. A media rule can have multiple queries.
The CSS below contains 1 rule, with 2 queries.

```css
@media print, screen and (monochrome) {
    body {
        color: black;
    }
}
```

The above rule roughly translates as:
_If the device is a printer or is a monochrome screen, the body color is black._

In elm-css, queries are joined into rules using a special `MediaQuery`
returned by the `or` function.

-}
type alias MediaQuery =
    Structure.MediaQuery


{-| A media type.

<https://developer.mozilla.org/en-US/docs/Web/CSS/@media#Media_types>

-}
type alias MediaType =
    Structure.MediaType


{-| A media expression.

An expression is a media feature with an optional value, which resolves to
either true or false.

In the media query `screen and (min-width: 768px)`,

  - `screen` is a media type,
  - `min-width` is a media feature, and
  - `(min-width: 768px)` is an expression.

<https://developer.mozilla.org/en-US/docs/Web/CSS/@media#Media_features>

-}
type alias Expression =
    Structure.MediaExpression



{--Rule constructors--}


{-| Combines media queries that are nested under selectors into a `@media` rule.

    css
        [ withMedia [ only screen [ Media.minWidth (px 300), Media.maxWidth (px 800) ] ]
            [ Css.maxWidth (px 300) ]

The above code translates into the following CSS.

```css
@media only screen and (min-width: 300px) and (max-width: 800px) {
    ._c9f0fd {
        max-width: 300px;
    }
}
```

-}
withMedia : List MediaQuery -> List Style -> Style
withMedia =
    Preprocess.WithMedia


{-| Manually specify a `@media` rule that is nested under an element or class
using a List of strings.

    body
      [ withMediaQuery [ "screen and (min-width: 320px)", "screen and (max-height: 400px)" ]
          [ fontSize (px 14px) ]
      ]

The above code translates into the following CSS.

```css
@media screen and (min-width: 320px), screen and (max-height: 400px) {
    body {
        font-size: 14px;
    }
}
```

-}
withMediaQuery : List String -> List Style -> Style
withMediaQuery queries =
    queries
        |> List.map Structure.CustomQuery
        |> Preprocess.WithMedia



{--Query Constructors--}


{-| Build a media query that will match all media types.

The supplied `expressions` are combined with `and`.

    media [ all [ color, landscape ] ]
        [ body [ Css.color (hex "ff0000") ] ]

The above code translates into the following CSS.

```css
@media (color) and (landscape) {
    body {
        color: #ff0000;
    }
}
```

-}
all : List Expression -> MediaQuery
all =
    AllQuery


{-| Build a media query matching a single media type.

    media [ only screen [ minWidth (px 320), portrait ] ]
        [ body [ Css.color (hex "ff0000") ] ]

The above code translates into the following CSS.

```css
@media only screen and (min-width: 320px) and (portrait) {
    body {
        color: #ff0000;
    }
}
```

-}
only : MediaType -> List Expression -> MediaQuery
only =
    OnlyQuery


{-| Build a negated media query.

    media [ not screen [] ]
        [ body [ Css.color (hex "ff0000") ] ]

The above code translates into the following CSS.

```css
@media not screen {
    body {
        color: #ff0000;
    }
}
```

-}
not : MediaType -> List Expression -> MediaQuery
not =
    NotQuery



{--Media Types --}


{-| Media type for printers

    media print [ a [ color (hex 000000), textDecoration none ] ]

-}
print : MediaType
print =
    Structure.Print


{-| Media type for any device not matched by print or speech.

    media (and screen (maxWidth (px 600)) [ Css.class mobileNav display none ]

-}
screen : MediaType
screen =
    Structure.Screen


{-| Media type for screenreaders and similar devices that read out a page

    media (not speech) [ Css.class screenReaderOnly [ display none ] ]

-}
speech : MediaType
speech =
    Structure.Speech



{--Viewport/Page Dimensions Media Features--}


{-| A length that is not in any way relative to the window size
(percent, vh, vw, and so on), such as px, pt, cm, em, rem, and so on.
-}
type alias AbsoluteLength compatible =
    Value { compatible | absoluteLength : Compatible }


{-| Media feature [`min-width`](https://drafts.csswg.org/mediaqueries/#width)
Queries the width of the output device.

    media (Media.minWidth (px 600)) [ Css.class Container [ Css.maxWidth (px 500) ] ]

-}
minWidth : AbsoluteLength compatible -> Expression
minWidth =
    feature "min-width"


{-| Media feature [`width`](https://drafts.csswg.org/mediaqueries/#width)

    media (Media.width (px 200)) [ ... ]

-}
width : AbsoluteLength compatible -> Expression
width =
    feature "width"


{-| Media feature [`max-width`](https://drafts.csswg.org/mediaqueries/#width)

    media (Media.maxWidth (px 800)) [ Css.class MobileNav [ display none] ]

-}
maxWidth : AbsoluteLength compatible -> Expression
maxWidth =
    feature "max-width"


{-| Media feature [`min-height`](https://drafts.csswg.org/mediaqueries/#height)

    media (Media.minHeight(px 400)) [ Css.class TopBanner [ display block] ]

-}
minHeight : AbsoluteLength compatible -> Expression
minHeight =
    feature "min-height"


{-| Media feature [`height`](https://drafts.csswg.org/mediaqueries/#height)
-}
height : AbsoluteLength compatible -> Expression
height =
    feature "height"


{-| Media feature [`max-height`](https://drafts.csswg.org/mediaqueries/#height)

    media (Media.maxHeight(px 399)) [ Css.class TopBanner [ display none] ]

-}
maxHeight : AbsoluteLength compatible -> Expression
maxHeight =
    feature "max-height"


{-| -}
type alias Ratio =
    Value { ratio : Compatible }


{-| Create a ratio.

    --a ratio of 4/3
    ratio 4 3

-}
ratio : Int -> Int -> Ratio
ratio numerator denominator =
    Value (toString numerator ++ "/" ++ toString denominator)


{-| Media feature [`min-aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media (minAspectRatio (ratio 1 1)) [ ... ]

-}
minAspectRatio : Ratio -> Expression
minAspectRatio =
    feature "min-aspect-ratio"


{-| Media feature [`aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media (aspectRatio (ratio 16 10)) [ ... ]

-}
aspectRatio : Ratio -> Expression
aspectRatio =
    feature "aspect-ratio"


{-| Media feature [`max-aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media (maxAspectRatio (ratio 16 9)) [ ... ]

-}
maxAspectRatio : Ratio -> Expression
maxAspectRatio =
    feature "max-aspect-ratio"


{-| -}
type alias Orientation compatible =
    Value { compatible | orientation : Compatible }


{-| CSS value [`landscape`](https://drafts.csswg.org/mediaqueries/#valdef-media-orientation-portrait)
-}
landscape : Orientation {}
landscape =
    Value "landscape"


{-| CSS value [`portrait`](https://drafts.csswg.org/mediaqueries/#valdef-media-orientation-portrait)
-}
portrait : Orientation {}
portrait =
    Value "portrait"


{-| Media feature [`orientation`](https://drafts.csswg.org/mediaqueries/#orientation).
Accepts `portrait` or `landscape`.
-}
orientation : Orientation compatible -> Expression
orientation =
    feature "orientation"



{--Display Quality Media Features --}


{-| Display Resolution. <https://www.w3.org/TR/css3-values/#resolution-value>
-}
type alias Resolution compatible =
    Value { compatible | resolution : Compatible }


{-| `dpi`: Dots per inch. <https://www.w3.org/TR/css3-values/#resolution-value>

    dpi 166

-}
dpi : Float -> Resolution {}
dpi value =
    Value (toString value ++ "dpi")


{-| `dpcm`: Dots per centimeter. <https://www.w3.org/TR/css3-values/#resolution-value>

    dpcm 65

-}
dpcm : Float -> Resolution {}
dpcm value =
    Value (toString value ++ "dpcm")


{-| `dppx`: Dots per pixel. <https://www.w3.org/TR/css3-values/#resolution-value>

    dppx 1.5

-}
dppx : Float -> Resolution {}
dppx value =
    Value (toString value ++ "dppx")


{-| Media feature [`min-resolution`](https://drafts.csswg.org/mediaqueries/#resolution).
Describes the resolution of the output device.

    media (minResolution (dpi 600)) [ Css.class HiResImg [ display block ] ]

-}
minResolution : Resolution compatible -> Expression
minResolution =
    feature "min-resolution"


{-| Media feature [`resolution`](https://drafts.csswg.org/mediaqueries/#resolution)
Describes the resolution of the output device.

    media (resolution (dppx 2)) [ img [ width (pct 50) ] ]

-}
resolution : Resolution compatible -> Expression
resolution =
    feature "resolution"


{-| Media feature [`max-resolution`](https://drafts.csswg.org/mediaqueries/#resolution)
Describes the resolution of the output device.

    media (maxResolution (dpcm 65)) [ Css.class HiResImg [ display none ] ]

-}
maxResolution : Resolution compatible -> Expression
maxResolution =
    feature "max-resolution"


{-| -}
type alias ScanningProcess compatible =
    Value { compatible | scanningProcess : Compatible }


{-| CSS value [`progressive`](https://drafts.csswg.org/mediaqueries/#valdef-media-scan-progressive)
-}
progressive : ScanningProcess {}
progressive =
    Value "progressive"


{-| CSS value [`interlace`](https://drafts.csswg.org/mediaqueries/#valdef-media-scan-interlace)
-}
interlace : ScanningProcess {}
interlace =
    Value "interlace"


{-| Media feature [`scan`](https://drafts.csswg.org/mediaqueries/#scan).
Queries scanning process of the device. Accepts `innterlace` (some TVs) or `progressive` (most things).
-}
scan : ScanningProcess compatible -> Expression
scan =
    feature "scan"


{-| Media feature [`grid`](https://drafts.csswg.org/mediaqueries/#grid).
Queries whether the output device is a grid or bitmap.
-}
grid : Expression
grid =
    unparameterizedFeature "grid"


{-| -}
type alias UpdateFrequency compatible =
    Value { compatible | updateFrequency : Compatible }


{-| CSS value [`slow`](https://drafts.csswg.org/mediaqueries/#valdef-media-update-slow)
-}
slow : UpdateFrequency {}
slow =
    Value "slow"


{-| CSS value [`fast`](https://drafts.csswg.org/mediaqueries/#valdef-media-update-fast)
-}
fast : UpdateFrequency {}
fast =
    Value "fast"


{-| Media feature [`update`](https://drafts.csswg.org/mediaqueries/#update)
The update frequency of the device. Accepts `none`, `slow`, or `fast`
-}
update : UpdateFrequency compatible -> Expression
update =
    feature "update"


{-| -}
type alias BlockAxisOverflow compatible =
    Value { compatible | blockAxisOverflow : Compatible }


{-| CSS value [`paged`](https://drafts.csswg.org/mediaqueries/#valdef-media-overflow-block-paged)
-}
paged : BlockAxisOverflow {}
paged =
    Value "paged"


{-| CSS value [`optional-paged`](https://drafts.csswg.org/mediaqueries/#valdef-media-overflow-block-optional-paged)
-}
optionalPaged : BlockAxisOverflow {}
optionalPaged =
    Value "optional-paged"


{-| Media feature [`overflow-block`](https://drafts.csswg.org/mediaqueries/#overflow-block)
Describes the behavior of the device when content overflows the initial containing block in the block axis.
-}
overflowBlock : BlockAxisOverflow compatible -> Expression
overflowBlock =
    feature "overflow-block"


{-| -}
type alias InlineAxisOverflow compatible =
    Value { compatible | inlineAxisOverflow : Compatible }


{-| Media feature [`overflow-inline`](https://drafts.csswg.org/mediaqueries/#overflow-inline).
Describes the behavior of the device when content overflows the initial containing block in the inline axis.
-}
overflowInline : InlineAxisOverflow compatible -> Expression
overflowInline =
    feature "overflow-inline"



{--Color Media Features--}


{-| -}
type alias Bits =
    Value { bits : Compatible }


{-| Get a bumber of bits

    bits 8

-}
bits : Int -> Bits
bits value =
    Value (toString value)


{-| Media Feature [`min-nncolor`](https://drafts.csswg.org/mediaqueries/#color)
Queries the user agent's bits per color channel

    media (screen (minColor (bits 256))) [ a [ Css.color (hex "D9534F") ] ]

-}
minColor : Bits -> Expression
minColor =
    feature "min-color"


{-| Media feature [`color`](https://drafts.csswg.org/mediaqueries/#color)

    media (not color) [ body [Css.color (hex "000000")] ]

-}
color : Expression
color =
    unparameterizedFeature "color"


{-| Media feature [`max-color`](https://drafts.csswg.org/mediaqueries/#color)
Queries the user agent's bits per color channel

    media (and screen (maxColor (bits 8))) [ a [ Css.color (hex "FF0000") ] ]

-}
maxColor : Bits -> Expression
maxColor =
    feature "max-color"


{-| Media feature [`monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)

    media [ monochrome ] [ body [Css.color (hex "000000")] ]

-}
monochrome : Expression
monochrome =
    unparameterizedFeature "monochrome"


{-| Media Feature [`min-monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)
-}
minMonochrome : Bits -> Expression
minMonochrome =
    feature "min-monochrome"


{-| Media feature [`max-monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)
-}
maxMonochrome : Bits -> Expression
maxMonochrome =
    feature "max-monochrome"


{-| Media feature [`color-index`](https://drafts.csswg.org/mediaqueries/#color-index)
Queries the number of colors in the user agent's color lookup table.

    media (and screen (colorIndex (int 16777216))) [ a [ Css.color (hex "D9534F") ] ]

-}
colorIndex : Number compatible -> Expression
colorIndex =
    feature "color-index"


{-| Media Feature [`min-color-index`](https://drafts.csswg.org/mediaqueries/nn#color-index)
Queries the number of colors in the user agent's color lookup table.

    media (and screen (minColorIndex (int 16777216))) [ a [ Css.color (hex "D9534F")] ]

-}
minColorIndex : Number compatible -> Expression
minColorIndex =
    feature "min-color-index"


{-| Media feature [`max-color-index`](https://drafts.csswg.org/mediaqueries/#color-index).
Queries the number of colors in the user agent's color lookup table.

    media (and screen (maxColorIndex (int 256))) [ a [ Css.color (hex "FF0000")] ]

-}
maxColorIndex : Number compatible -> Expression
maxColorIndex =
    feature "max-color-index"


{-| -}
type alias ColorGamut compatible =
    Value { compatible | colorGamut : Compatible }


{-| CSS value [`srgb`](https://drafts.csswg.org/mediaqueries/#valdef-media-color-gamut-srgb)
-}
srgb : ColorGamut {}
srgb =
    Value "srgb"


{-| CSS value [`p3`](https://drafts.csswg.org/mediaqueries/#valdef-media-color-gamut-p3)
-}
p3 : ColorGamut {}
p3 =
    Value "p3"


{-| CSS value [`rec2020`](https://drafts.csswg.org/mediaqueries/#valdef-media-color-gamut-rec2020)
-}
rec2020 : ColorGamut {}
rec2020 =
    Value "rec2020"


{-| Media feature [`color-gamut`](https://drafts.csswg.org/mediaqueries/#color-gamut).
Describes the approximate range of colors supported by the user agent and device.

    media (and screen (colorGamut rec2020)) [ Css.class HiColorImg [ display block ] ]

-}
colorGamut : ColorGamut compatible -> Expression
colorGamut =
    feature "color-gamut"



{--Interaction Media Features--}


{-| Describes the presence and accuracy of a pointing device such as a mouse
<https://drafts.csswg.org/mediaqueries/#pointer>
-}
type alias PointerDevice compatible =
    Value { compatible | pointerDevice : Compatible }


{-| CSS Value [`fine`](https://drafts.csswg.org/mediaqueries/#valdef-media-pointer-fine)
-}
fine : PointerDevice {}
fine =
    Value "fine"


{-| CSS Value [`coarse`](https://drafts.csswg.org/mediaqueries/#valdef-media-pointer-coarse)
-}
coarse : PointerDevice {}
coarse =
    Value "coarse"


{-| Media feature [`pointer`](https://drafts.csswg.org/mediaqueries/#pointer)
Queries the presence and accuracy of a pointing device, such as a mouse, touchscreen, or Wii remote.
Reflects the capabilities of the primary input mechanism.
Accepts `none`, `fine`, and `coarse`.

    media (Media.pointer coarse) [ a [ display block, Css.height (px 24) ] ]

-}
pointer : PointerDevice compatible -> Expression
pointer =
    feature "pointer"


{-| Media feature [`any-pointer`](https://drafts.csswg.org/mediaqueries/#any-input)
Queries the presence and accuracy of a pointing device, such as a mouse, touchscreen, or Wii remote.
Reflects the capabilities of the most capable input mechanism.
Accepts `none`, `fine`, and `coarse`.

    media (anyPointer coarse) [ a [ display block, Css.height (px 24) ] ]

-}
anyPointer : PointerDevice compatible -> Expression
anyPointer =
    feature "any-pointer"


{-| -}
type alias HoverCapability compatible =
    Value { compatible | hoverCapability : Compatible }


{-| The value [`hover`](https://drafts.csswg.org/mediaqueries/#valdef-media-hover-hover).
Named `canHover` to avoid conflict with the media feature of the same name
-}
canHover : HoverCapability {}
canHover =
    Value "hover"


{-| Media feature [`hover`](https://drafts.csswg.org/mediaqueries/#hover).
Queries the if the user agent's primary input mechanism has the ability to hover over elements.
Accepts `none` or `canHover`.

    media (Media.hover canHover) [ a [ Css.hover [ textDecoration underline] ] ]

-}
hover : HoverCapability compatible -> Expression
hover =
    feature "hover"


{-| Media feature [`any-hover`](https://drafts.csswg.org/mediaqueries/#any-input)
Queries the if any of user agent's input mechanisms have the ability to hover over elements
Accepts `none` or `canHover`.

    media (anyHover canHover) [ a [ Css.hover [ textDecoration underline] ] ]

-}
anyHover : HoverCapability compatible -> Expression
anyHover =
    feature "any-hover"



{--Scripting Media Features--}


{-| -}
type alias ScriptingSupport compatible =
    Value { compatible | scriptingSupport : Compatible }


{-| CSS value [`initial-only`](https://drafts.csswg.org/mediaqueries/#valdef-media-scripting-initial-only).
-}
initialOnly : ScriptingSupport {}
initialOnly =
    Value "initial-only"


{-| CSS value [`enabled`](https://drafts.csswg.org/mediaqueries/#valdef-media-scripting-enabled).
-}
enabled : ScriptingSupport {}
enabled =
    Value "enabled"


{-| The [`scripting`](https://drafts.csswg.org/mediaqueries/#scripting) media feature
for querying the user agents support for scripting languages like JavaScript.
Accepts `none`, `initialOnly`, and `enabled`.

    media (scripting none) [ Css.class NoScript [ display block ] ]

-}
scripting : ScriptingSupport compatible -> Expression
scripting =
    feature "scripting"



-- PRIVATE HELPERS --


feature : String -> Value a -> Expression
feature key (Value value) =
    { feature = key, value = Just value }


unparameterizedFeature : String -> Expression
unparameterizedFeature key =
    { feature = key, value = Nothing }
