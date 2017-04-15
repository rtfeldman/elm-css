module Css.Media
    exposing
        ( MediaQueryComponent
        , MediaQuery
        , media
        , mediaQuery
        , withMedia
        , withMediaQuery
        , only
        , not
        , or
        , all
        , screen
        , print
        , speech
        , braille
        , embossed
        , handheld
        , projection
        , tty
        , tv
        , aural
        , minWidth
        , width
        , maxWidth
        , minHeight
        , height
        , maxHeight
        , Landscape
        , Portrait
        , landscape
        , portrait
        , orientation
        , Ratio
        , ratio
        , minAspectRatio
        , aspectRatio
        , maxAspectRatio
        , Resolution
        , dpi
        , dpcm
        , dppx
        , minResolution
        , resolution
        , maxResolution
        , Progressive
        , Interlace
        , progressive
        , interlace
        , scan
        , grid
        , Slow
        , Fast
        , slow
        , fast
        , update
        , Paged
        , OptionalPaged
        , paged
        , optionalPaged
        , overflowBlock
        , overflowInline
        , Bits
        , bits
        , minColor
        , color
        , maxColor
        , minColorIndex
        , colorIndex
        , maxColorIndex
        , minMonochrome
        , monochrome
        , maxMonochrome
        , SRGB
        , P3
        , Rec2020
        , srgb
        , p3
        , rec2020
        , colorGamut
        , Fine
        , Coarse
        , fine
        , coarse
        , pointer
        , anyPointer
        , CanHover
        , canHover
        , hover
        , anyHover
        , InitialOnly
        , Enabled
        , initialOnly
        , enabled
        , scripting
        )

{-| Functions for composing
[media queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries).

# Basics
@docs MediaQueryComponent, MediaQuery

# Query constructors
@docs media, withMedia, mediaQuery, withMediaQuery

# Query composition
@docs only, not, or

# Media Types
@docs all, screen, print, speech, aural, braille, embossed, tv, tty,
      handheld, projection

# Viewport/Page Dimensions Media Features
@docs minWidth, width, maxWidth, minHeight, height, maxHeight, Ratio, ratio,
      minAspectRatio, aspectRatio, maxAspectRatio, Landscape, Portrait,
      landscape, portrait, orientation

# Display Quality Media Features
@docs Resolution, dpi, dpcm, dppx, minResolution, resolution, maxResolution,
      scan, Progressive, Interlace, progressive, interlace, scan, grid, Slow,
      Fast, slow, fast, update, Paged, OptionalPaged, paged, optionalPaged,
      overflowBlock, overflowInline

# Color Media Features
@docs Bits, bits, minColor, color, maxColor, minMonochrome, monochrome,
      maxMonochrome, minColorIndex, colorIndex, maxColorIndex, SRGB, P3,
      Rec2020, srgb, p3, rec2020, colorGamut

# Interaction Media Features
@docs Fine, Coarse, fine, coarse, pointer, anyPointer, CanHover, canHover,
      hover, anyHover

# Scripting Media Features
@docs InitialOnly, Enabled, initialOnly, enabled, scripting

-}

import Css
import Css.Preprocess as Preprocess exposing (Snippet, unwrapSnippet)
import Css.Structure as Structure exposing (..)


-- {- TODO: docs }
{--Basics--}


{-| The basic unit of a media query. Includes all media modifiers,
media types, media features, and the `or` separator.
Components are put together in lists, which are given to the media function.
-}
type alias MediaQueryComponent =
    Structure.MediaQueryComponent


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
_If the device is a printer or is a monoschrome screen, the body color is black._

In elm-css, queries are joined into rules using a special `MediaQueryComponent`
returned by the `or` function.
-}
type alias MediaQuery =
    Structure.MediaQuery


type alias Value compatible =
    { compatible | value : String }



{--Query constructors--}


{-| Combines media query components into media queries.

    (stylesheet << namespace "homepage")
        [  media [ screen, Media.minWidth (px 300), Media.maxWidth (px 800) ]
               [ footer [ Css.maxWidth (px 300) ] ]
        ]

The above code translates into the following css.

```css
@media screen and (min-width: 300px) and (max-width: 800px) {
    footer {
        max-width: 300px;
    }
}
```
-}
media : List MediaQueryComponent -> List Snippet -> Snippet
media components snippets =
    mediaQuery (componentsToStringQueries components) snippets


{-| Manually specify a media query using a List of strings.

    mediaQuery ["screen and (min-width: 320px)", "screen and (max-height: 400px)" ]
        [ body [ fontSize (px 14)] ]


The above code translates into the following css.

```css
@media screen and (min-width: 320px), screen and (min-height: 400px) {
    body {
        font-size: 14px;
    }
}
```
-}
mediaQuery : List String -> List Snippet -> Snippet
mediaQuery stringQueries snippets =
    let
        mediaQueries =
            List.map (\q -> Structure.MediaQuery q) stringQueries

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
            Preprocess.MediaRule mediaQueries
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
                    (Preprocess.MediaRule (mediaQueries ++ nestedMediaQueries) styleBlocks)
                        :: nestedMediaRules rest

                first :: rest ->
                    first :: nestedMediaRules rest
    in
        Preprocess.Snippet (mediaRuleFromStyleBlocks :: (nestedMediaRules snippetDeclarations))


{-| Combines media query components into media queries that are nested under selectors.

    (stylesheet << namespace "homepage")
        [ footer
            [ widthmedia [ screen, Media.minWidth (px 300), Media.maxWidth (px 800) ]
                [ Css.maxWidth (px 300) ]
        ]

```css
@media screen and (min-width: 300px) and (max-width: 800px) {
    footer {
        max-width: 300px;
    }
}
```
-}
withMedia : List MediaQueryComponent -> List Css.Mixin -> Css.Mixin
withMedia components =
    components
        |> componentsToStringQueries
        |> List.map (\q -> Structure.MediaQuery q)
        |> Preprocess.WithMedia


{-| Manually specify a media query that is nested under an element or class
using a List of strings.

    body
      [ mediaQuery ["screen and (min-width: 320px)", "screen and (max-height: 400px)"
          [ fontSize (px 14px) ]
      ]


The above code translates into the following css.

```css
@media screen and (min-width: 320px), screen and (min-height: 400px) {
    body {
        font-size: 14px;
    }
}
```
-}
withMediaQuery : List String -> List Css.Mixin -> Css.Mixin
withMediaQuery queries =
    queries
        |> List.map (\q -> Structure.MediaQuery q)
        |> Preprocess.WithMedia



{--Query Composition--}


{-| Media modifier to force old browsers to ignore a media query they won't understand.

    media [ only, screen, minResolution (dppx 2) ] [ ... ]
-}
only : MediaQueryComponent
only =
    PrependMediaModifier (MediaModifier "only")


{-| Media modifier to negate a query

    media [ not, screen, color ] [ body [ Css.color (hex "000000") ] ]
-}
not : MediaQueryComponent
not =
    PrependMediaModifier (MediaModifier "not")


{-| Combine media queries, where matching either query should apply the following CSS properties.

    media [ screen, or, print ] [ ... ]

The rule above will apply to either screens or printers.
-}
or : MediaQueryComponent
or =
    AppendOrSeparator MediaOrSeparator



{--Media Types --}


{-| Media type  for all devices. This is assumed by default if no other media type is specified.
-}
all : MediaQueryComponent
all =
    Structure.AppendMediaType (Structure.MediaType "all")


{-| Media type for printers

    media [ print ] [ a [ color (hex 000000), textDecoration none ] ]
-}
print : MediaQueryComponent
print =
    Structure.AppendMediaType (Structure.MediaType "print")


{-| Media type for any device not matched by print or speech.

    media [ screen, maxWidth (px 600) ] [ (.) MobileNav display none ]
-}
screen : MediaQueryComponent
screen =
    Structure.AppendMediaType (Structure.MediaType "screen")


{-| Media type for screenreaders and similar devices that read out a page

    media [ not, speech ] [ (.) SROnly [ display none ] ]
-}
speech : MediaQueryComponent
speech =
    Structure.AppendMediaType (Structure.MediaType "speech")


{-| Media type aural devices. Will be deprecated in CSS 4 Media queries.
-}
aural : MediaQueryComponent
aural =
    Structure.AppendMediaType (Structure.MediaType "aural")


{-| Media type for TTY devices (text terminals). Will be deprecated in CSS 4 Media queries.
-}
tty : MediaQueryComponent
tty =
    Structure.AppendMediaType (Structure.MediaType "tty")


{-| Media type for televisions.  Will be deprecated in CSS 4 Media queries.
-}
tv : MediaQueryComponent
tv =
    Structure.AppendMediaType (Structure.MediaType "tv")


{-| Media type for projectors. Will be deprecated in CSS 4 Media queries.
-}
projection : MediaQueryComponent
projection =
    Structure.AppendMediaType (Structure.MediaType "projection")


{-| Media type for paged braille readers. Will be deprecated in CSS 4 Media queries.
-}
embossed : MediaQueryComponent
embossed =
    Structure.AppendMediaType (Structure.MediaType "embossed")


{-| Media type braille devices. Will be deprecated in CSS 4 Media queries.
-}
braille : MediaQueryComponent
braille =
    Structure.AppendMediaType (Structure.MediaType "braille")


{-| Media type handheld devices. Will be deprecated in CSS 4 Media queries.
-}
handheld : MediaQueryComponent
handheld =
    Structure.AppendMediaType (Structure.MediaType "handheld")



{--Viewport/Page Dimensions Media Features--}


{-| A length that is not in any way relative to the window size
(percent, vh, vw, and so on), such as px, pt, cm, em, rem, and so on.
-}
type alias AbsoluteLength compatible =
    { compatible | value : String, absoluteLength : Compatible }


{-| Media feature [`min-width`](https://drafts.csswg.org/mediaqueries/#width)
Queries the width of the output device.

    media [ Media.minWidth (px 600) ] [ (.) Container [ Css.maxWidth (px 500) ] ]
-}
minWidth : AbsoluteLength compatible -> MediaQueryComponent
minWidth value =
    feature "min-width" value


{-| Media feature [`width`](https://drafts.csswg.org/mediaqueries/#width)

    media [ Media.width (px 200) ] [ ... ]
-}
width : AbsoluteLength compatible -> MediaQueryComponent
width value =
    feature "width" value


{-| Media feature [`max-width`](https://drafts.csswg.org/mediaqueries/#width)

    media [ Media.maxWidth (px 800) ] [ (.) MobileNav [ display none] ]
-}
maxWidth : AbsoluteLength compatible -> MediaQueryComponent
maxWidth value =
    feature "max-width" value


{-| Media feature [`min-height`](https://drafts.csswg.org/mediaqueries/#height)

    media [ Media.minHeight(px 400) ] [ (.) TopBanner [ display block] ]
-}
minHeight : AbsoluteLength compatible -> MediaQueryComponent
minHeight value =
    feature "min-height" value


{-| Media feature [`height`](https://drafts.csswg.org/mediaqueries/#height)
-}
height : AbsoluteLength compatible -> MediaQueryComponent
height value =
    feature "height" value


{-| Media feature [`max-height`](https://drafts.csswg.org/mediaqueries/#height)

    media [ Media.maxHeight(px 399) ] [ (.) TopBanner [ display none] ]
-}
maxHeight : AbsoluteLength compatible -> MediaQueryComponent
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
    { value = (toString numerator) ++ "/" ++ (toString denominator), ratio = Compatible }


{-| Media feature [`min-aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media [ minAspectRatio (ratio 1 1) ] [ ... ]
-}
minAspectRatio : Ratio -> MediaQueryComponent
minAspectRatio value =
    feature "min-aspect-ratio" value


{-| Media feature [`aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media [ aspectRatio (ratio 16 10) ] [ ... ]
-}
aspectRatio : Ratio -> MediaQueryComponent
aspectRatio value =
    feature "aspect-ratio" value


{-| Media feature [`max-aspect-ratio`](https://drafts.csswg.org/mediaqueries/#aspect-ratio)

    media [ maxAspectRatio (ratio 16 9) ] [ ... ]
-}
maxAspectRatio : Ratio -> MediaQueryComponent
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
orientation : Orientation a -> MediaQueryComponent
orientation value =
    feature "orientation" value



{--Display Quality Media Features --}


{-| Display Resolution. https://www.w3.org/TR/css3-values/#resolution-value
-}
type alias Resolution =
    { value : String, resolution : Compatible }


{-| `dpi`: Dots per inch. https://www.w3.org/TR/css3-values/#resolution-value

    dpi 166
-}
dpi : Float -> Resolution
dpi value =
    { value = (toString value) ++ "dpi", resolution = Compatible }


{-| `dpcm`: Dots per centimeter. https://www.w3.org/TR/css3-values/#resolution-value

    dpcm 65
-}
dpcm : Float -> Resolution
dpcm value =
    { value = (toString value) ++ "dpcm", resolution = Compatible }


{-| `dppx`: Dots per pixel. https://www.w3.org/TR/css3-values/#resolution-value

    dppx 1.5
-}
dppx : Float -> Resolution
dppx value =
    { value = (toString value) ++ "dppx", resolution = Compatible }


{-| Media feature [`min-resolution`](https://drafts.csswg.org/mediaqueries/#resolution).
Describes the resolution of the output device.

    media [ minResolution (dpi 600) ] [ (.) HiResImg [ display block ] ]
-}
minResolution : Resolution -> MediaQueryComponent
minResolution value =
    feature "min-resolution" value


{-| Media feature [`resolution`](https://drafts.csswg.org/mediaqueries/#resolution)
Describes the resolution of the output device.

    media [ resolution (dppx 2) ] [ img [ width (pct 50) ] ]
-}
resolution : Resolution -> MediaQueryComponent
resolution value =
    feature "resolution" value


{-| Media feature [`max-resolution`](https://drafts.csswg.org/mediaqueries/#resolution)
Describes the resolution of the output device.

    media [ maxResolution (dpcm 65) ] [ (.) HiResImg [ display none ] ]
-}
maxResolution : Resolution -> MediaQueryComponent
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
scan : ScanningProcess a -> MediaQueryComponent
scan value =
    feature "scan" value


{-| Media feature [`grid`](https://drafts.csswg.org/mediaqueries/#grid).
Queries whether the output device is a grid or bitmap.
-}
grid : MediaQueryComponent
grid =
    booleanFeature "grid"


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
update : UpdateFrequency a -> MediaQueryComponent
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
overflowBlock : BlockAxisOverflow a -> MediaQueryComponent
overflowBlock value =
    feature "overflow-block" value


type alias InlineAxisOverflow a =
    { a | value : String, inlineAxisOverflow : Compatible }


{-| Media feature [`overflow-inline`](https://drafts.csswg.org/mediaqueries/#overflow-inline).
Describes the behavior of the device when content overflows the initial containing block in the inline axis.
-}
overflowInline : InlineAxisOverflow a -> MediaQueryComponent
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
    { value = (toString value), bits = Compatible }


{-| Media Feature [`min-nncolor`](https://drafts.csswg.org/mediaqueries/#color)
Queries the user agent's bits per color channel

    media [ screen, minColor (bits 256) ] [ a [ Css.color (hex "D9534F") ] ]
-}
minColor : Bits -> MediaQueryComponent
minColor value =
    feature "min-color" value


{-| Media feature [`color`](https://drafts.csswg.org/mediaqueries/#color)

    media [ not, color ] [ body [Css.color (hex "000000")] ]
-}
color : MediaQueryComponent
color =
    booleanFeature "color"


{-| Media feature [`max-color`](https://drafts.csswg.org/mediaqueries/#color)
Queries the user agent's bits per color channel

    media [ screen, maxColor (bits 8) ] [ a [ Css.color (hex "FF0000") ] ]
-}
maxColor : Bits -> MediaQueryComponent
maxColor value =
    feature "max-color" value


{-| Media feature [`monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)

    media [ monochrome ] [ body [Css.color (hex "000000")] ]
-}
monochrome : MediaQueryComponent
monochrome =
    booleanFeature "monochrome"


{-| Media Feature [`min-monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)
-}
minMonochrome : Bits -> MediaQueryComponent
minMonochrome value =
    feature "min-monochrome" value


{-| Media feature [`max-monochrome`](https://drafts.csswg.org/mediaqueries/#monochrome)
-}
maxMonochrome : Bits -> MediaQueryComponent
maxMonochrome value =
    feature "max-monochrome" value


{-| Media feature [`color-index`](https://drafts.csswg.org/mediaqueries/#color-index)
Queries the  number of colors in the user agent's color lookup table.

    media [ screen, colorIndex (int 16777216) ] [ a [ Css.color (hex "D9534F") ] ]
-}
colorIndex : Number a -> MediaQueryComponent
colorIndex value =
    feature "color-index" value


{-| Media Feature [`min-color-index`](https://drafts.csswg.org/mediaqueries/nn#color-index)
Queries the  number of colors in the user agent's color lookup table.

    media [screen, minColorIndex (int 16777216)] [ a [ Css.color (hex "D9534F")] ]
-}
minColorIndex : Number a -> MediaQueryComponent
minColorIndex value =
    feature "min-color-index" value


{-| Media feature [`max-color-index`](https://drafts.csswg.org/mediaqueries/#color-index).
Queries the number of colors in the user agent's color lookup table.

    media [screen, maxColorIndex (int 256)] [ a [ Css.color (hex "FF0000")] ]
-}
maxColorIndex : Number a -> MediaQueryComponent
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

    media [screen, colorGamut rec2020] [ (.) HiColorImg [ display block ] ]
-}
colorGamut : ColorGamut a -> MediaQueryComponent
colorGamut value =
    feature "color-gamut" value



{--Interaction Media Features--}


{-| Describes the presence and accuracy of a pointing device such as a mouse
https://drafts.csswg.org/mediaqueries/#pointer
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


    media [ Media.pointer coarse ] [ a [ display block, Css.height (px 24) ] ]
-}
pointer : PointerDevice a -> MediaQueryComponent
pointer value =
    feature "pointer" value


{-| Media feature [`any-pointer`](https://drafts.csswg.org/mediaqueries/#any-input)
Queries the presence and accuracy of a pointing device, such as a mouse, touchscreen, or Wii remote.
Reflects the capabilities of the most capable input mechanism.
Accepts `none`, `fine`, and `coarse`.

    media [ anyPointer coarse ] [ a [ display block, Css.height (px 24) ] ]
-}
anyPointer : PointerDevice a -> MediaQueryComponent
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

    media [ Media.hover canHover ] [ a [ Css.hover [ textDecoration underline] ] ]
-}
hover : HoverCapability a -> MediaQueryComponent
hover value =
    feature "hover" value


{-| Media feature [`any-hover`](https://drafts.csswg.org/mediaqueries/#any-input)
Queries the if any of user agent's input mechanisms have the ability to hover over elements
Accepts `none` or `canHover`.

    media [ anyHover canHover ] [ a [ Css.hover [ textDecoration underline] ] ]
-}
anyHover : HoverCapability a -> MediaQueryComponent
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

    media [scripting none] [ (.) NoScript [ display block ] ]
-}
scripting : ScriptingSupport a -> MediaQueryComponent
scripting value =
    feature "scripting" value



{--Private Helper functions--}


feature : String -> Value a -> MediaQueryComponent
feature key arg =
    Structure.AppendMediaFeature { key = key, value = (Just arg.value) }


booleanFeature : String -> MediaQueryComponent
booleanFeature key =
    Structure.AppendMediaFeature { key = key, value = Nothing }


componentsToStringQueries : List MediaQueryComponent -> List String
componentsToStringQueries components =
    components
        |> List.foldr splitOnOr []
        |> List.map buildQuery


splitOnOr : MediaQueryComponent -> List (List MediaQueryComponent) -> List (List MediaQueryComponent)
splitOnOr item splitLists =
    case item of
        AppendOrSeparator _ ->
            [] :: splitLists

        _ ->
            case List.head splitLists of
                Nothing ->
                    [ item ] :: splitLists

                Just head ->
                    (item :: head) :: (List.drop 1 splitLists)


buildQuery : List MediaQueryComponent -> String
buildQuery components =
    let
        start =
            components
                |> List.filter notFeature
                |> List.map componentToString
                |> String.join " "

        end =
            components
                |> List.filter isFeature
                |> List.map componentToString
                |> String.join " and "
    in
        if (String.isEmpty start) || (String.isEmpty end) then
            (start ++ end)
        else
            (start ++ " and " ++ end)


notFeature : MediaQueryComponent -> Bool
notFeature component =
    Basics.not (isFeature component)


isFeature : MediaQueryComponent -> Bool
isFeature component =
    case component of
        AppendMediaFeature _ ->
            True

        _ ->
            False


componentToString : MediaQueryComponent -> String
componentToString component =
    case component of
        PrependMediaModifier (MediaModifier modifier) ->
            modifier

        AppendMediaType (MediaType mediaType) ->
            mediaType

        AppendMediaFeature mediaFeature ->
            featureToString mediaFeature

        AppendOrSeparator _ ->
            Debug.crash "should never get here"


featureToString : MediaFeature -> String
featureToString mediaFeature =
    case mediaFeature.value of
        Just value ->
            "(" ++ mediaFeature.key ++ ": " ++ value ++ ")"

        Nothing ->
            "(" ++ mediaFeature.key ++ ")"
