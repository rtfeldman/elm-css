module Css.Media
    exposing
        ( Bits
        , CanHover
        , Coarse
        , Enabled
        , Expression
        , Fast
        , Fine
        , InitialOnly
        , Interlace
        , Landscape
        , MediaQuery
        , MediaType
        , OptionalPaged
        , P3
        , Paged
        , Portrait
        , Progressive
        , Ratio
        , Rec2020
        , Resolution
        , SRGB
        , Slow
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
        , media
        , mediaQuery
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

{-| Functions for building `@media` queries.

<https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries>


# Data Structures

@docs MediaQuery, MediaType, Expression


# `@media` rule constructors

@docs media, withMedia, mediaQuery, withMediaQuery


# Query constructors

@docs all, only, not


# Media Types

@docs screen, print, speech


# Viewport, Page Dimensions Media Features

@docs minWidth, width, maxWidth, minHeight, height, maxHeight, Ratio, ratio
@docs minAspectRatio, aspectRatio, maxAspectRatio, Landscape, Portrait
@docs landscape, portrait, orientation


# Display Quality Media Features

@docs Resolution, dpi, dpcm, dppx, minResolution, resolution, maxResolution
@docs scan, Progressive, Interlace, progressive, interlace, scan, grid, Slow
@docs Fast, slow, fast, update, Paged, OptionalPaged, paged, optionalPaged
@docs overflowBlock, overflowInline


# Color Media Features

@docs Bits, bits, minColor, color, maxColor, minMonochrome, monochrome
@docs maxMonochrome, minColorIndex, colorIndex, maxColorIndex, SRGB, P3
@docs Rec2020, srgb, p3, rec2020, colorGamut


# Interaction Media Features

@docs Fine, Coarse, fine, coarse, pointer, anyPointer, CanHover, canHover
@docs hover, anyHover


# Scripting Media Features

@docs InitialOnly, Enabled, initialOnly, enabled, scripting

-}

import Css
import Css.Preprocess as Preprocess exposing (Style, unwrapSnippet)
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


type alias Value compatible =
    { compatible | value : String }



{--Rule constructors--}


{-| Combines media queries into a `@media` rule.

    (stylesheet << namespace "homepage")
        [  media [ only screen [ Media.minWidth (px 300) ] ]
               [ footer [ Css.maxWidth (px 300) ] ]
        ]

The above code translates into the following CSS.

```css
@media screen and (min-width: 300px) {
    footer {
        max-width: 300px;
    }
}
```

-}
media :
    List MediaQuery
    -> List Css.Snippet
    -> Css.Snippet
media queries snippets =
    let
        snippetDeclarations : List Preprocess.SnippetDeclaration
        snippetDeclarations =
            List.concatMap unwrapSnippet snippets

        extractStyleBlocks : List Preprocess.SnippetDeclaration -> List Preprocess.StyleBlock
        extractStyleBlocks declarations =
            case declarations of
                [] ->
                    []

                (Preprocess.StyleBlockDeclaration styleBlock) :: rest ->
                    styleBlock :: extractStyleBlocks rest

                first :: rest ->
                    extractStyleBlocks rest

        mediaRuleFromStyleBlocks : Preprocess.SnippetDeclaration
        mediaRuleFromStyleBlocks =
            Preprocess.MediaRule queries
                (extractStyleBlocks snippetDeclarations)

        nestedMediaRules : List Preprocess.SnippetDeclaration -> List Preprocess.SnippetDeclaration
        nestedMediaRules declarations =
            case declarations of
                [] ->
                    []

                (Preprocess.StyleBlockDeclaration _) :: rest ->
                    -- These will already have been handled previously, with appropriate
                    -- bundling, so don't create duplicates here.
                    nestedMediaRules rest

                (Preprocess.MediaRule nestedMediaQueries styleBlocks) :: rest ->
                    -- nest the media queries
                    Preprocess.MediaRule (List.append queries nestedMediaQueries) styleBlocks
                        :: nestedMediaRules rest

                first :: rest ->
                    first :: nestedMediaRules rest
    in
    Preprocess.Snippet (mediaRuleFromStyleBlocks :: nestedMediaRules snippetDeclarations)


{-| Manually specify a `@media` rule using a List of strings.

    mediaQuery [ "screen and (min-width: 320px)", "screen and (max-height: 400px)" ]
        [ body [ fontSize (px 14)] ]

The above code translates into the following CSS.

```css
@media screen and (min-width: 320px), screen and (max-height: 400px) {
    body {
        font-size: 14px;
    }
}
```

-}
mediaQuery : List String -> List Css.Snippet -> Css.Snippet
mediaQuery stringQueries snippets =
    media (List.map Structure.CustomQuery stringQueries) snippets


{-| Combines media queries that are nested under selectors into a `@media` rule.

    (stylesheet << namespace "homepage")
        [ footer
            [ withMedia [ only screen [ Media.minWidth (px 300), Media.maxWidth (px 800) ] ]
                [ Css.maxWidth (px 300) ]
        ]

The above code translates into the following CSS.

```css
@media only screen and (min-width: 300px) and (max-width: 800px) {
    footer {
        max-width: 300px;
    }
}
```

-}
withMedia : List MediaQuery -> List Css.Style -> Css.Style
withMedia queries =
    Preprocess.WithMedia queries


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
withMediaQuery : List String -> List Css.Style -> Css.Style
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


connectWith :
    (Structure.MediaQuery -> Structure.MediaQuery -> Structure.MediaQuery)
    -> List Structure.MediaQuery
    -> Maybe Structure.MediaQuery
connectWith connect queries =
    case queries of
        [] ->
            Nothing

        first :: rest ->
            case connectWith connect rest of
                Nothing ->
                    Just first

                Just second ->
                    Just (connect first second)



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
    { compatible | value : String, absoluteLength : Compatible }


{-| Media feature [`min-width`](https://drafts.csswg.org/mediaqueries/#width)
Queries the width of the output device.

    media (Media.minWidth (px 600)) [ Css.class Container [ Css.maxWidth (px 500) ] ]

-}
minWidth : AbsoluteLength compatible -> Expression
minWidth value =
    feature "min-width" value


{-| Media feature [`width`](https://drafts.csswg.org/mediaqueries/#width)

    media (Media.width (px 200)) [ ... ]

-}
width : AbsoluteLength compatible -> Expression
width value =
    feature "width" value


{-| Media feature [`max-width`](https://drafts.csswg.org/mediaqueries/#width)

    media (Media.maxWidth (px 800)) [ Css.class MobileNav [ display none] ]

-}
maxWidth : AbsoluteLength compatible -> Expression
maxWidth value =
    feature "max-width" value


{-| Media feature [`min-height`](https://drafts.csswg.org/mediaqueries/#height)

    media (Media.minHeight(px 400)) [ Css.class TopBanner [ display block] ]

-}
minHeight : AbsoluteLength compatible -> Expression
minHeight value =
    feature "min-height" value


{-| Media feature [`height`](https://drafts.csswg.org/mediaqueries/#height)
-}
height : AbsoluteLength compatible -> Expression
height value =
    feature "height" value


{-| Media feature [`max-height`](https://drafts.csswg.org/mediaqueries/#height)

    media (Media.maxHeight(px 399)) [ Css.class TopBanner [ display none] ]

-}
maxHeight : AbsoluteLength compatible -> Expression
maxHeight value =
    feature "max-height" value


{-| -}
type alias Ratio =
    { value : String, ratio : Compatible }


{-| Create a ratio.

    --a ratio of 4/3
    ratio 4 3

-}
ratio : Int -> Int -> Ratio
ratio numerator denominator =
    { value = toString numerator ++ "/" ++ toString denominator, ratio = Compatible }


{-| Media feature [`min-aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media (minAspectRatio (ratio 1 1)) [ ... ]

-}
minAspectRatio : Ratio -> Expression
minAspectRatio value =
    feature "min-aspect-ratio" value


{-| Media feature [`aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media (aspectRatio (ratio 16 10)) [ ... ]

-}
aspectRatio : Ratio -> Expression
aspectRatio value =
    feature "aspect-ratio" value


{-| Media feature [`max-aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media (maxAspectRatio (ratio 16 9)) [ ... ]

-}
maxAspectRatio : Ratio -> Expression
maxAspectRatio value =
    feature "max-aspect-ratio" value


type alias Orientation a =
    { a | value : String, orientation : Compatible }


{-| -}
type alias Landscape =
    { value : String, orientation : Compatible }


{-| -}
type alias Portrait =
    { value : String, orientation : Compatible }


{-| CSS value [`landscape`](https://drafts.csswg.org/mediaqueries/#valdef-media-orientation-portrait)
-}
landscape : Landscape
landscape =
    { value = "landscape", orientation = Compatible }


{-| CSS value [`portrait`](https://drafts.csswg.org/mediaqueries/#valdef-media-orientation-portrait)
-}
portrait : Portrait
portrait =
    { value = "portrait", orientation = Compatible }


{-| Media feature [`orientation`](https://drafts.csswg.org/mediaqueries/#orientation).
Accepts `portrait` or `landscape`.
-}
orientation : Orientation a -> Expression
orientation value =
    feature "orientation" value



{--Display Quality Media Features --}


{-| Display Resolution. <https://www.w3.org/TR/css3-values/#resolution-value>
-}
type alias Resolution =
    { value : String, resolution : Compatible }


{-| `dpi`: Dots per inch. <https://www.w3.org/TR/css3-values/#resolution-value>

    dpi 166

-}
dpi : Float -> Resolution
dpi value =
    { value = toString value ++ "dpi", resolution = Compatible }


{-| `dpcm`: Dots per centimeter. <https://www.w3.org/TR/css3-values/#resolution-value>

    dpcm 65

-}
dpcm : Float -> Resolution
dpcm value =
    { value = toString value ++ "dpcm", resolution = Compatible }


{-| `dppx`: Dots per pixel. <https://www.w3.org/TR/css3-values/#resolution-value>

    dppx 1.5

-}
dppx : Float -> Resolution
dppx value =
    { value = toString value ++ "dppx", resolution = Compatible }


{-| Media feature [`min-resolution`](https://drafts.csswg.org/mediaqueries/#resolution).
Describes the resolution of the output device.

    media (minResolution (dpi 600)) [ Css.class HiResImg [ display block ] ]

-}
minResolution : Resolution -> Expression
minResolution value =
    feature "min-resolution" value


{-| Media feature [`resolution`](https://drafts.csswg.org/mediaqueries/#resolution)
Describes the resolution of the output device.

    media (resolution (dppx 2)) [ img [ width (pct 50) ] ]

-}
resolution : Resolution -> Expression
resolution value =
    feature "resolution" value


{-| Media feature [`max-resolution`](https://drafts.csswg.org/mediaqueries/#resolution)
Describes the resolution of the output device.

    media (maxResolution (dpcm 65)) [ Css.class HiResImg [ display none ] ]

-}
maxResolution : Resolution -> Expression
maxResolution value =
    feature "max-resolution" value


type alias ScanningProcess a =
    { a | value : String, scanningProcess : Compatible }


{-| -}
type alias Progressive =
    { value : String, scanningProcess : Compatible }


{-| -}
type alias Interlace =
    { value : String, scanningProcess : Compatible }


{-| CSS value [`progressive`](https://drafts.csswg.org/mediaqueries/#valdef-media-scan-progressive)
-}
progressive : Progressive
progressive =
    { value = "progressive", scanningProcess = Compatible }


{-| CSS value [`interlace`](https://drafts.csswg.org/mediaqueries/#valdef-media-scan-interlace)
-}
interlace : Interlace
interlace =
    { value = "interlace", scanningProcess = Compatible }


{-| Media feature [`scan`](https://drafts.csswg.org/mediaqueries/#scan).
Queries scanning process of the device. Accepts `innterlace` (some TVs) or `progressive` (most things).
-}
scan : ScanningProcess a -> Expression
scan value =
    feature "scan" value


{-| Media feature [`grid`](https://drafts.csswg.org/mediaqueries/#grid).
Queries whether the output device is a grid or bitmap.
-}
grid : Expression
grid =
    unparameterizedFeature "grid"


type alias UpdateFrequency a =
    { a | value : String, updateFrequency : Compatible }


{-| -}
type alias Slow =
    { value : String, updateFrequency : Compatible }


{-| -}
type alias Fast =
    { value : String, updateFrequency : Compatible }


{-| CSS value [`slow`](https://drafts.csswg.org/mediaqueries/#valdef-media-update-slow)
-}
slow : Slow
slow =
    { value = "slow", updateFrequency = Compatible }


{-| CSS value [`fast`](https://drafts.csswg.org/mediaqueries/#valdef-media-update-fast)
-}
fast : Fast
fast =
    { value = "fast", updateFrequency = Compatible }


{-| Media feature [`update`](https://drafts.csswg.org/mediaqueries/#update)
The update frequency of the device. Accepts `none`, `slow`, or `fast`
-}
update : UpdateFrequency a -> Expression
update value =
    feature "update" value


type alias BlockAxisOverflow a =
    { a | value : String, blockAxisOverflow : Compatible }


{-| -}
type alias Paged =
    { value : String, blockAxisOverflow : Compatible }


{-| -}
type alias OptionalPaged =
    { value : String, blockAxisOverflow : Compatible }


{-| CSS value [`paged`](https://drafts.csswg.org/mediaqueries/#valdef-media-overflow-block-paged)
-}
paged : Paged
paged =
    { value = "paged", blockAxisOverflow = Compatible }


{-| CSS value [`optional-paged`](https://drafts.csswg.org/mediaqueries/#valdef-media-overflow-block-optional-paged)
-}
optionalPaged : OptionalPaged
optionalPaged =
    { value = "optional-paged", blockAxisOverflow = Compatible }


{-| Media feature [`overflow-block`](https://drafts.csswg.org/mediaqueries/#overflow-block)
Describes the behavior of the device when content overflows the initial containing block in the block axis.
-}
overflowBlock : BlockAxisOverflow a -> Expression
overflowBlock value =
    feature "overflow-block" value


type alias InlineAxisOverflow a =
    { a | value : String, inlineAxisOverflow : Compatible }


{-| Media feature [`overflow-inline`](https://drafts.csswg.org/mediaqueries/#overflow-inline).
Describes the behavior of the device when content overflows the initial containing block in the inline axis.
-}
overflowInline : InlineAxisOverflow a -> Expression
overflowInline value =
    feature "overflow-inline" value



{--Color Media Features--}


{-| -}
type alias Bits =
    { value : String, bits : Compatible }


{-| Get a bumber of bits

    bits 8

-}
bits : Int -> Bits
bits value =
    { value = toString value, bits = Compatible }


{-| Media Feature [`min-nncolor`](https://drafts.csswg.org/mediaqueries/#color)
Queries the user agent's bits per color channel

    media (screen (minColor (bits 256))) [ a [ Css.color (hex "D9534F") ] ]

-}
minColor : Bits -> Expression
minColor value =
    feature "min-color" value


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
maxColor value =
    feature "max-color" value


{-| Media feature [`monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)

    media [ monochrome ] [ body [Css.color (hex "000000")] ]

-}
monochrome : Expression
monochrome =
    unparameterizedFeature "monochrome"


{-| Media Feature [`min-monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)
-}
minMonochrome : Bits -> Expression
minMonochrome value =
    feature "min-monochrome" value


{-| Media feature [`max-monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)
-}
maxMonochrome : Bits -> Expression
maxMonochrome value =
    feature "max-monochrome" value


{-| Media feature [`color-index`](https://drafts.csswg.org/mediaqueries/#color-index)
Queries the number of colors in the user agent's color lookup table.

    media (and screen (colorIndex (int 16777216))) [ a [ Css.color (hex "D9534F") ] ]

-}
colorIndex : Number a -> Expression
colorIndex value =
    feature "color-index" value


{-| Media Feature [`min-color-index`](https://drafts.csswg.org/mediaqueries/nn#color-index)
Queries the number of colors in the user agent's color lookup table.

    media (and screen (minColorIndex (int 16777216))) [ a [ Css.color (hex "D9534F")] ]

-}
minColorIndex : Number a -> Expression
minColorIndex value =
    feature "min-color-index" value


{-| Media feature [`max-color-index`](https://drafts.csswg.org/mediaqueries/#color-index).
Queries the number of colors in the user agent's color lookup table.

    media (and screen (maxColorIndex (int 256))) [ a [ Css.color (hex "FF0000")] ]

-}
maxColorIndex : Number a -> Expression
maxColorIndex value =
    feature "max-color-index" value


type alias ColorGamut a =
    { a | value : String, colorGamut : Compatible }


{-| -}
type alias SRGB =
    { value : String, colorGamut : Compatible }


{-| -}
type alias P3 =
    { value : String, colorGamut : Compatible }


{-| -}
type alias Rec2020 =
    { value : String, colorGamut : Compatible }


{-| CSS value [`srgb`](https://drafts.csswg.org/mediaqueries/#valdef-media-color-gamut-srgb)
-}
srgb : SRGB
srgb =
    { value = "srgb", colorGamut = Compatible }


{-| CSS value [`p3`](https://drafts.csswg.org/mediaqueries/#valdef-media-color-gamut-p3)
-}
p3 : P3
p3 =
    { value = "p3", colorGamut = Compatible }


{-| CSS value [`rec2020`](https://drafts.csswg.org/mediaqueries/#valdef-media-color-gamut-rec2020)
-}
rec2020 : Rec2020
rec2020 =
    { value = "rec2020", colorGamut = Compatible }


{-| Media feature [`color-gamut`](https://drafts.csswg.org/mediaqueries/#color-gamut).
Describes the approximate range of colors supported by the user agent and device.

    media (and screen (colorGamut rec2020)) [ Css.class HiColorImg [ display block ] ]

-}
colorGamut : ColorGamut a -> Expression
colorGamut value =
    feature "color-gamut" value



{--Interaction Media Features--}


{-| Describes the presence and accuracy of a pointing device such as a mouse
<https://drafts.csswg.org/mediaqueries/#pointer>
-}
type alias PointerDevice a =
    { a | value : String, pointerDevice : Compatible }


{-| -}
type alias Fine =
    { value : String, pointerDevice : Compatible }


{-| -}
type alias Coarse =
    { value : String, pointerDevice : Compatible }


{-| CSS Value [`fine`](https://drafts.csswg.org/mediaqueries/#valdef-media-pointer-fine)
-}
fine : Fine
fine =
    { value = "fine", pointerDevice = Compatible }


{-| CSS Value [`coarse`](https://drafts.csswg.org/mediaqueries/#valdef-media-pointer-coarse)
-}
coarse : Coarse
coarse =
    { value = "coarse", pointerDevice = Compatible }


{-| Media feature [`pointer`](https://drafts.csswg.org/mediaqueries/#pointer)
Queries the presence and accuracy of a pointing device, such as a mouse, touchscreen, or Wii remote.
Reflects the capabilities of the primary input mechanism.
Accepts `none`, `fine`, and `coarse`.

    media (Media.pointer coarse) [ a [ display block, Css.height (px 24) ] ]

-}
pointer : PointerDevice a -> Expression
pointer value =
    feature "pointer" value


{-| Media feature [`any-pointer`](https://drafts.csswg.org/mediaqueries/#any-input)
Queries the presence and accuracy of a pointing device, such as a mouse, touchscreen, or Wii remote.
Reflects the capabilities of the most capable input mechanism.
Accepts `none`, `fine`, and `coarse`.

    media (anyPointer coarse) [ a [ display block, Css.height (px 24) ] ]

-}
anyPointer : PointerDevice a -> Expression
anyPointer value =
    feature "any-pointer" value


{-| -}
type alias HoverCapability a =
    { a | value : String, hoverCapability : Compatible }


{-| -}
type alias CanHover =
    { value : String, hoverCapability : Compatible }


{-| The value [`hover`](https://drafts.csswg.org/mediaqueries/#valdef-media-hover-hover).
Named `canHover` to avoid conflict with the media feature of the same name
-}
canHover : CanHover
canHover =
    { value = "hover", hoverCapability = Compatible }


{-| Media feature [`hover`](https://drafts.csswg.org/mediaqueries/#hover).
Queries the if the user agent's primary input mechanism has the ability to hover over elements.
Accepts `none` or `canHover`.

    media (Media.hover canHover) [ a [ Css.hover [ textDecoration underline] ] ]

-}
hover : HoverCapability a -> Expression
hover value =
    feature "hover" value


{-| Media feature [`any-hover`](https://drafts.csswg.org/mediaqueries/#any-input)
Queries the if any of user agent's input mechanisms have the ability to hover over elements
Accepts `none` or `canHover`.

    media (anyHover canHover) [ a [ Css.hover [ textDecoration underline] ] ]

-}
anyHover : HoverCapability a -> Expression
anyHover value =
    feature "any-hover" value



{--Scripting Media Features--}


{-| -}
type alias ScriptingSupport a =
    { a | value : String, scriptingSupport : Compatible }


{-| -}
type alias InitialOnly =
    { value : String, scriptingSupport : Compatible }


{-| -}
type alias Enabled =
    { value : String, scriptingSupport : Compatible }


{-| CSS value [`initial-only`](https://drafts.csswg.org/mediaqueries/#valdef-media-scripting-initial-only).
-}
initialOnly : InitialOnly
initialOnly =
    { value = "initial-only", scriptingSupport = Compatible }


{-| CSS value [`enabled`](https://drafts.csswg.org/mediaqueries/#valdef-media-scripting-enabled).
-}
enabled : Enabled
enabled =
    { value = "enabled", scriptingSupport = Compatible }


{-| The [`scripting`](https://drafts.csswg.org/mediaqueries/#scripting) media feature
for querying the user agents support for scripting languages like JavaScript.
Accepts `none`, `initialOnly`, and `enabled`.

    media (scripting none) [ Css.class NoScript [ display block ] ]

-}
scripting : ScriptingSupport a -> Expression
scripting value =
    feature "scripting" value



-- PRIVATE HELPERS --


feature : String -> Value a -> Expression
feature key { value } =
    { feature = key, value = Just value }


unparameterizedFeature : String -> Expression
unparameterizedFeature key =
    { feature = key, value = Nothing }
