module Svg.Styled exposing
    ( styled, fromUnstyled, toUnstyled
    , Svg, Attribute, text, node, map
    , svg, foreignObject
    , circle, ellipse, image, line, path, polygon, polyline, rect, use
    , animate, animateColor, animateMotion, animateTransform, mpath, set
    , desc, metadata, title
    , a, defs, g, marker, mask, pattern, switch, symbol
    , altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef, textPath, text_
    , tref, tspan
    , font
    , linearGradient, radialGradient, stop
    , feBlend, feColorMatrix, feComponentTransfer, feComposite
    , feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feFlood, feFuncA
    , feFuncB, feFuncG, feFuncR, feGaussianBlur, feImage, feMerge, feMergeNode
    , feMorphology, feOffset, feSpecularLighting, feTile, feTurbulence
    , feDistantLight, fePointLight, feSpotLight
    , clipPath, colorProfile, cursor, filter, style, view
    )

{-| Drop-in replacement for the `Svg` module from the `elm-lang/svg` package.

The only functions added are `styled`, `toUnstyled` and `fromUnstyled`:

@docs styled, fromUnstyled, toUnstyled


# SVG Nodes

@docs Svg, Attribute, text, node, map


# HTML Embedding

@docs svg, foreignObject


# Graphics elements

@docs circle, ellipse, image, line, path, polygon, polyline, rect, use


# Animation elements

@docs animate, animateColor, animateMotion, animateTransform, mpath, set


# Descriptive elements

@docs desc, metadata, title


# Containers

@docs a, defs, g, marker, mask, pattern, switch, symbol


# Text

@docs altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef, textPath, text_
@docs tref, tspan


# Fonts

@docs font


# Gradients

@docs linearGradient, radialGradient, stop


# Filters

@docs feBlend, feColorMatrix, feComponentTransfer, feComposite
@docs feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feFlood, feFuncA
@docs feFuncB, feFuncG, feFuncR, feGaussianBlur, feImage, feMerge, feMergeNode
@docs feMorphology, feOffset, feSpecularLighting, feTile, feTurbulence


# Light source elements

@docs feDistantLight, fePointLight, feSpotLight


# Miscellaneous

@docs clipPath, colorProfile, cursor, filter, style, view

-}

import Css exposing (Style)
import Html.Styled as Html
import Json.Encode as Json
import Svg.Styled.Internal as Internal
import VirtualDom
import VirtualDom.Styled



-- PRIMITIVES


{-| The core building block to create SVG. This library is filled with helper
functions to create these `Svg` values.

This is backed by `VirtualDom.Node` in `evancz/virtual-dom`, but you do not
need to know any details about that to use this library!

-}
type alias Svg msg =
    VirtualDom.Styled.Node msg


{-| Set attributes on your `Svg`.
-}
type alias Attribute msg =
    VirtualDom.Styled.Attribute msg


{-| Create any SVG node. To create a `<rect>` helper function, you would write:

    rect : List (Attribute msg) -> List (Svg msg) -> Svg msg
    rect attributes children =
        node "rect" attributes children

You should always be able to use the helper functions already defined in this
library though!

-}
node : String -> List (Attribute msg) -> List (Svg msg) -> Svg msg
node =
    VirtualDom.Styled.nodeNS "http://www.w3.org/2000/svg"


{-| A simple text node, no tags at all.

Warning: not to be confused with `text_` which produces the SVG `<text>` tag!

-}
text : String -> Svg msg
text =
    VirtualDom.Styled.text


{-| Transform the messages produced by some `Svg`.
-}
map : (a -> msg) -> Svg a -> Svg msg
map =
    VirtualDom.Styled.map


{-| Takes a function that creates an element, and pre-applies styles to it.
-}
styled :
    (List (Attribute msg) -> List (Svg msg) -> Svg msg)
    -> List Style
    -> List (Attribute msg)
    -> List (Svg msg)
    -> Svg msg
styled fn styles =
    let
        stylesAttribute =
            Internal.css styles
    in
    \attrs children ->
        fn (stylesAttribute :: attrs) children


{-| -}
toUnstyled : Svg msg -> VirtualDom.Node msg
toUnstyled =
    VirtualDom.Styled.toUnstyled


{-| -}
fromUnstyled : VirtualDom.Node msg -> Svg msg
fromUnstyled =
    VirtualDom.Styled.unstyledNode



-- TAGS


{-| The root `<svg>` node for any SVG scene. This example shows a scene
containing a rounded rectangle:

    import Svg exposing (..)
    import Svg.Attributes exposing (..)

    roundRect =
        svg
            [ width "120", height "120", viewBox "0 0 120 120" ]
            [ rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] [] ]

-}
svg : List (Html.Attribute msg) -> List (Svg msg) -> Html.Html msg
svg =
    node "svg"


{-| -}
foreignObject : List (Attribute msg) -> List (Html.Html msg) -> Svg msg
foreignObject =
    node "foreignObject"



-- Animation elements


{-| -}
animate : List (Attribute msg) -> List (Svg msg) -> Svg msg
animate =
    node "animate"


{-| -}
animateColor : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateColor =
    node "animateColor"


{-| -}
animateMotion : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateMotion =
    node "animateMotion"


{-| -}
animateTransform : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateTransform =
    node "animateTransform"


{-| -}
mpath : List (Attribute msg) -> List (Svg msg) -> Svg msg
mpath =
    node "mpath"


{-| -}
set : List (Attribute msg) -> List (Svg msg) -> Svg msg
set =
    node "set"



-- Container elements


{-| The SVG Anchor Element defines a hyperlink.
-}
a : List (Attribute msg) -> List (Svg msg) -> Svg msg
a =
    node "a"


{-| -}
defs : List (Attribute msg) -> List (Svg msg) -> Svg msg
defs =
    node "defs"


{-| -}
g : List (Attribute msg) -> List (Svg msg) -> Svg msg
g =
    node "g"


{-| -}
marker : List (Attribute msg) -> List (Svg msg) -> Svg msg
marker =
    node "marker"


{-| -}
mask : List (Attribute msg) -> List (Svg msg) -> Svg msg
mask =
    node "mask"


{-| -}
pattern : List (Attribute msg) -> List (Svg msg) -> Svg msg
pattern =
    node "pattern"


{-| -}
switch : List (Attribute msg) -> List (Svg msg) -> Svg msg
switch =
    node "switch"


{-| -}
symbol : List (Attribute msg) -> List (Svg msg) -> Svg msg
symbol =
    node "symbol"



-- Descriptive elements


{-| -}
desc : List (Attribute msg) -> List (Svg msg) -> Svg msg
desc =
    node "desc"


{-| -}
metadata : List (Attribute msg) -> List (Svg msg) -> Svg msg
metadata =
    node "metadata"


{-| -}
title : List (Attribute msg) -> List (Svg msg) -> Svg msg
title =
    node "title"



-- Filter primitive elements


{-| -}
feBlend : List (Attribute msg) -> List (Svg msg) -> Svg msg
feBlend =
    node "feBlend"


{-| -}
feColorMatrix : List (Attribute msg) -> List (Svg msg) -> Svg msg
feColorMatrix =
    node "feColorMatrix"


{-| -}
feComponentTransfer : List (Attribute msg) -> List (Svg msg) -> Svg msg
feComponentTransfer =
    node "feComponentTransfer"


{-| -}
feComposite : List (Attribute msg) -> List (Svg msg) -> Svg msg
feComposite =
    node "feComposite"


{-| -}
feConvolveMatrix : List (Attribute msg) -> List (Svg msg) -> Svg msg
feConvolveMatrix =
    node "feConvolveMatrix"


{-| -}
feDiffuseLighting : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDiffuseLighting =
    node "feDiffuseLighting"


{-| -}
feDisplacementMap : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDisplacementMap =
    node "feDisplacementMap"


{-| -}
feFlood : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFlood =
    node "feFlood"


{-| -}
feFuncA : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncA =
    node "feFuncA"


{-| -}
feFuncB : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncB =
    node "feFuncB"


{-| -}
feFuncG : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncG =
    node "feFuncG"


{-| -}
feFuncR : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncR =
    node "feFuncR"


{-| -}
feGaussianBlur : List (Attribute msg) -> List (Svg msg) -> Svg msg
feGaussianBlur =
    node "feGaussianBlur"


{-| -}
feImage : List (Attribute msg) -> List (Svg msg) -> Svg msg
feImage =
    node "feImage"


{-| -}
feMerge : List (Attribute msg) -> List (Svg msg) -> Svg msg
feMerge =
    node "feMerge"


{-| -}
feMergeNode : List (Attribute msg) -> List (Svg msg) -> Svg msg
feMergeNode =
    node "feMergeNode"


{-| -}
feMorphology : List (Attribute msg) -> List (Svg msg) -> Svg msg
feMorphology =
    node "feMorphology"


{-| -}
feOffset : List (Attribute msg) -> List (Svg msg) -> Svg msg
feOffset =
    node "feOffset"


{-| -}
feSpecularLighting : List (Attribute msg) -> List (Svg msg) -> Svg msg
feSpecularLighting =
    node "feSpecularLighting"


{-| -}
feTile : List (Attribute msg) -> List (Svg msg) -> Svg msg
feTile =
    node "feTile"


{-| -}
feTurbulence : List (Attribute msg) -> List (Svg msg) -> Svg msg
feTurbulence =
    node "feTurbulence"



-- Font elements


{-| -}
font : List (Attribute msg) -> List (Svg msg) -> Svg msg
font =
    node "font"



-- Gradient elements


{-| -}
linearGradient : List (Attribute msg) -> List (Svg msg) -> Svg msg
linearGradient =
    node "linearGradient"


{-| -}
radialGradient : List (Attribute msg) -> List (Svg msg) -> Svg msg
radialGradient =
    node "radialGradient"


{-| -}
stop : List (Attribute msg) -> List (Svg msg) -> Svg msg
stop =
    node "stop"



-- Graphics elements


{-| The circle element is an SVG basic shape, used to create circles based on
a center point and a radius.

    circle [ cx "60", cy "60", r "50" ] []

-}
circle : List (Attribute msg) -> List (Svg msg) -> Svg msg
circle =
    node "circle"


{-| -}
ellipse : List (Attribute msg) -> List (Svg msg) -> Svg msg
ellipse =
    node "ellipse"


{-| -}
image : List (Attribute msg) -> List (Svg msg) -> Svg msg
image =
    node "image"


{-| -}
line : List (Attribute msg) -> List (Svg msg) -> Svg msg
line =
    node "line"


{-| -}
path : List (Attribute msg) -> List (Svg msg) -> Svg msg
path =
    node "path"


{-| -}
polygon : List (Attribute msg) -> List (Svg msg) -> Svg msg
polygon =
    node "polygon"


{-| The polyline element is an SVG basic shape, used to create a series of
straight lines connecting several points. Typically a polyline is used to
create open shapes.

    polyline [ fill "none", stroke "black", points "20,100 40,60 70,80 100,20" ] []

-}
polyline : List (Attribute msg) -> List (Svg msg) -> Svg msg
polyline =
    node "polyline"


{-| -}
rect : List (Attribute msg) -> List (Svg msg) -> Svg msg
rect =
    node "rect"


{-| -}
use : List (Attribute msg) -> List (Svg msg) -> Svg msg
use =
    node "use"



-- Light source elements


{-| -}
feDistantLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDistantLight =
    node "feDistantLight"


{-| -}
fePointLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
fePointLight =
    node "fePointLight"


{-| -}
feSpotLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
feSpotLight =
    node "feSpotLight"



-- Text content elements


{-| -}
altGlyph : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyph =
    node "altGlyph"


{-| -}
altGlyphDef : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyphDef =
    node "altGlyphDef"


{-| -}
altGlyphItem : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyphItem =
    node "altGlyphItem"


{-| -}
glyph : List (Attribute msg) -> List (Svg msg) -> Svg msg
glyph =
    node "glyph"


{-| -}
glyphRef : List (Attribute msg) -> List (Svg msg) -> Svg msg
glyphRef =
    node "glyphRef"


{-| -}
textPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
textPath =
    node "textPath"


{-| -}
text_ : List (Attribute msg) -> List (Svg msg) -> Svg msg
text_ =
    node "text"


{-| -}
tref : List (Attribute msg) -> List (Svg msg) -> Svg msg
tref =
    node "tref"


{-| -}
tspan : List (Attribute msg) -> List (Svg msg) -> Svg msg
tspan =
    node "tspan"



-- Uncategorized elements


{-| -}
clipPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
clipPath =
    node "clipPath"


{-| -}
colorProfile : List (Attribute msg) -> List (Svg msg) -> Svg msg
colorProfile =
    node "colorProfile"


{-| -}
cursor : List (Attribute msg) -> List (Svg msg) -> Svg msg
cursor =
    node "cursor"


{-| -}
filter : List (Attribute msg) -> List (Svg msg) -> Svg msg
filter =
    node "filter"


{-| -}
style : List (Attribute msg) -> List (Svg msg) -> Svg msg
style =
    node "style"


{-| -}
view : List (Attribute msg) -> List (Svg msg) -> Svg msg
view =
    node "view"
