module Svg.Styled.Attributes exposing
    ( css, fromUnstyled
    , accentHeight, accelerate, accumulate, additive, alphabetic, allowReorder
    , amplitude, arabicForm, ascent, attributeName, attributeType, autoReverse
    , azimuth, baseFrequency, baseProfile, bbox, begin, bias, by, calcMode
    , capHeight, class, clipPathUnits, contentScriptType, contentStyleType, cx, cy
    , d, decelerate, descent, diffuseConstant, divisor, dur, dx, dy, edgeMode
    , elevation, end, exponent, externalResourcesRequired, filterRes, filterUnits
    , format, from, fx, fy, g1, g2, glyphName, glyphRef, gradientTransform
    , gradientUnits, hanging, height, horizAdvX, horizOriginX, horizOriginY, id
    , ideographic, in_, in2, intercept, k, k1, k2, k3, k4, kernelMatrix
    , kernelUnitLength, keyPoints, keySplines, keyTimes, lang, lengthAdjust
    , limitingConeAngle, local, markerHeight, markerUnits, markerWidth
    , maskContentUnits, maskUnits, mathematical, max, media, method, min, mode
    , name, numOctaves, offset, operator, order, orient, orientation, origin
    , overlinePosition, overlineThickness, panose1, path, pathLength
    , patternContentUnits, patternTransform, patternUnits, pointOrder, points
    , pointsAtX, pointsAtY, pointsAtZ, preserveAlpha, preserveAspectRatio
    , primitiveUnits, r, radius, refX, refY, renderingIntent, repeatCount
    , repeatDur, requiredExtensions, requiredFeatures, restart, result, rotate
    , rx, ry, scale, seed, slope, spacing, specularConstant, specularExponent
    , speed, spreadMethod, startOffset, stdDeviation, stemh, stemv, stitchTiles
    , strikethroughPosition, strikethroughThickness, string, style, surfaceScale
    , systemLanguage, tableValues, target, targetX, targetY, textLength, title, to
    , transform, type_, u1, u2, underlinePosition, underlineThickness, unicode
    , unicodeRange, unitsPerEm, vAlphabetic, vHanging, vIdeographic, vMathematical
    , values, version, vertAdvY, vertOriginX, vertOriginY, viewBox, viewTarget
    , width, widths, x, xHeight, x1, x2, xChannelSelector, xlinkActuate
    , xlinkArcrole, xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType
    , xmlBase, xmlLang, xmlSpace, y, y1, y2, yChannelSelector, z, zoomAndPan
    , alignmentBaseline, baselineShift, clipPath, clipRule, clip
    , colorInterpolationFilters, colorInterpolation, colorProfile, colorRendering
    , color, cursor, direction, display, dominantBaseline, enableBackground
    , fillOpacity, fillRule, fill, filter, floodColor, floodOpacity, fontFamily
    , fontSizeAdjust, fontSize, fontStretch, fontStyle, fontVariant, fontWeight
    , glyphOrientationHorizontal, glyphOrientationVertical, imageRendering
    , kerning, letterSpacing, lightingColor, markerEnd, markerMid, markerStart
    , mask, opacity, overflow, pointerEvents, shapeRendering, stopColor
    , stopOpacity, strokeDasharray, strokeDashoffset, strokeLinecap
    , strokeLinejoin, strokeMiterlimit, strokeOpacity, strokeWidth, stroke
    , textAnchor, textDecoration, textRendering, unicodeBidi, visibility
    , wordSpacing, writingMode
    )

{-| Drop-in replacement for the `Svg.Attributes` module from the `elm-lang/svg` package.
The only functions added are `css`, and `fromUnstyled`:

@docs css, fromUnstyled


# Regular attributes

@docs accentHeight, accelerate, accumulate, additive, alphabetic, allowReorder
@docs amplitude, arabicForm, ascent, attributeName, attributeType, autoReverse
@docs azimuth, baseFrequency, baseProfile, bbox, begin, bias, by, calcMode
@docs capHeight, class, clipPathUnits, contentScriptType, contentStyleType, cx, cy
@docs d, decelerate, descent, diffuseConstant, divisor, dur, dx, dy, edgeMode
@docs elevation, end, exponent, externalResourcesRequired, filterRes, filterUnits
@docs format, from, fx, fy, g1, g2, glyphName, glyphRef, gradientTransform
@docs gradientUnits, hanging, height, horizAdvX, horizOriginX, horizOriginY, id
@docs ideographic, in_, in2, intercept, k, k1, k2, k3, k4, kernelMatrix
@docs kernelUnitLength, keyPoints, keySplines, keyTimes, lang, lengthAdjust
@docs limitingConeAngle, local, markerHeight, markerUnits, markerWidth
@docs maskContentUnits, maskUnits, mathematical, max, media, method, min, mode
@docs name, numOctaves, offset, operator, order, orient, orientation, origin
@docs overlinePosition, overlineThickness, panose1, path, pathLength
@docs patternContentUnits, patternTransform, patternUnits, pointOrder, points
@docs pointsAtX, pointsAtY, pointsAtZ, preserveAlpha, preserveAspectRatio
@docs primitiveUnits, r, radius, refX, refY, renderingIntent, repeatCount
@docs repeatDur, requiredExtensions, requiredFeatures, restart, result, rotate
@docs rx, ry, scale, seed, slope, spacing, specularConstant, specularExponent
@docs speed, spreadMethod, startOffset, stdDeviation, stemh, stemv, stitchTiles
@docs strikethroughPosition, strikethroughThickness, string, style, surfaceScale
@docs systemLanguage, tableValues, target, targetX, targetY, textLength, title, to
@docs transform, type_, u1, u2, underlinePosition, underlineThickness, unicode
@docs unicodeRange, unitsPerEm, vAlphabetic, vHanging, vIdeographic, vMathematical
@docs values, version, vertAdvY, vertOriginX, vertOriginY, viewBox, viewTarget
@docs width, widths, x, xHeight, x1, x2, xChannelSelector, xlinkActuate
@docs xlinkArcrole, xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType
@docs xmlBase, xmlLang, xmlSpace, y, y1, y2, yChannelSelector, z, zoomAndPan


# Presentation attributes

@docs alignmentBaseline, baselineShift, clipPath, clipRule, clip
@docs colorInterpolationFilters, colorInterpolation, colorProfile, colorRendering
@docs color, cursor, direction, display, dominantBaseline, enableBackground
@docs fillOpacity, fillRule, fill, filter, floodColor, floodOpacity, fontFamily
@docs fontSizeAdjust, fontSize, fontStretch, fontStyle, fontVariant, fontWeight
@docs glyphOrientationHorizontal, glyphOrientationVertical, imageRendering
@docs kerning, letterSpacing, lightingColor, markerEnd, markerMid, markerStart
@docs mask, opacity, overflow, pointerEvents, shapeRendering, stopColor
@docs stopOpacity, strokeDasharray, strokeDashoffset, strokeLinecap
@docs strokeLinejoin, strokeMiterlimit, strokeOpacity, strokeWidth, stroke
@docs textAnchor, textDecoration, textRendering, unicodeBidi, visibility
@docs wordSpacing, writingMode

-}

import Css exposing (Style)
import Svg.Styled exposing (Attribute)
import Svg.Styled.Internal as Internal
import VirtualDom
import VirtualDom.Styled


{-| -}
fromUnstyled : VirtualDom.Attribute msg -> Attribute msg
fromUnstyled =
    VirtualDom.Styled.unstyledAttribute


{-| Apply styles to an element.

See the [`Css` module documentation](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css) for an overview of how to use this function.

-}
css : List Style -> Attribute msg
css =
    Internal.css



-- REGULAR ATTRIBUTES


{-| -}
accentHeight : String -> Attribute msg
accentHeight =
    VirtualDom.Styled.attribute "accent-height"


{-| -}
accelerate : String -> Attribute msg
accelerate =
    VirtualDom.Styled.attribute "accelerate"


{-| -}
accumulate : String -> Attribute msg
accumulate =
    VirtualDom.Styled.attribute "accumulate"


{-| -}
additive : String -> Attribute msg
additive =
    VirtualDom.Styled.attribute "additive"


{-| -}
alphabetic : String -> Attribute msg
alphabetic =
    VirtualDom.Styled.attribute "alphabetic"


{-| -}
allowReorder : String -> Attribute msg
allowReorder =
    VirtualDom.Styled.attribute "allowReorder"


{-| -}
amplitude : String -> Attribute msg
amplitude =
    VirtualDom.Styled.attribute "amplitude"


{-| -}
arabicForm : String -> Attribute msg
arabicForm =
    VirtualDom.Styled.attribute "arabic-form"


{-| -}
ascent : String -> Attribute msg
ascent =
    VirtualDom.Styled.attribute "ascent"


{-| -}
attributeName : String -> Attribute msg
attributeName =
    VirtualDom.Styled.attribute "attributeName"


{-| -}
attributeType : String -> Attribute msg
attributeType =
    VirtualDom.Styled.attribute "attributeType"


{-| -}
autoReverse : String -> Attribute msg
autoReverse =
    VirtualDom.Styled.attribute "autoReverse"


{-| -}
azimuth : String -> Attribute msg
azimuth =
    VirtualDom.Styled.attribute "azimuth"


{-| -}
baseFrequency : String -> Attribute msg
baseFrequency =
    VirtualDom.Styled.attribute "baseFrequency"


{-| -}
baseProfile : String -> Attribute msg
baseProfile =
    VirtualDom.Styled.attribute "baseProfile"


{-| -}
bbox : String -> Attribute msg
bbox =
    VirtualDom.Styled.attribute "bbox"


{-| -}
begin : String -> Attribute msg
begin =
    VirtualDom.Styled.attribute "begin"


{-| -}
bias : String -> Attribute msg
bias =
    VirtualDom.Styled.attribute "bias"


{-| -}
by : String -> Attribute msg
by value =
    VirtualDom.Styled.attribute "by" value


{-| -}
calcMode : String -> Attribute msg
calcMode =
    VirtualDom.Styled.attribute "calcMode"


{-| -}
capHeight : String -> Attribute msg
capHeight =
    VirtualDom.Styled.attribute "cap-height"


{-| -}
class : String -> Attribute msg
class =
    VirtualDom.Styled.attribute "class"


{-| -}
clipPathUnits : String -> Attribute msg
clipPathUnits =
    VirtualDom.Styled.attribute "clipPathUnits"


{-| -}
contentScriptType : String -> Attribute msg
contentScriptType =
    VirtualDom.Styled.attribute "contentScriptType"


{-| -}
contentStyleType : String -> Attribute msg
contentStyleType =
    VirtualDom.Styled.attribute "contentStyleType"


{-| -}
cx : String -> Attribute msg
cx =
    VirtualDom.Styled.attribute "cx"


{-| -}
cy : String -> Attribute msg
cy =
    VirtualDom.Styled.attribute "cy"


{-| -}
d : String -> Attribute msg
d =
    VirtualDom.Styled.attribute "d"


{-| -}
decelerate : String -> Attribute msg
decelerate =
    VirtualDom.Styled.attribute "decelerate"


{-| -}
descent : String -> Attribute msg
descent =
    VirtualDom.Styled.attribute "descent"


{-| -}
diffuseConstant : String -> Attribute msg
diffuseConstant =
    VirtualDom.Styled.attribute "diffuseConstant"


{-| -}
divisor : String -> Attribute msg
divisor =
    VirtualDom.Styled.attribute "divisor"


{-| -}
dur : String -> Attribute msg
dur =
    VirtualDom.Styled.attribute "dur"


{-| -}
dx : String -> Attribute msg
dx =
    VirtualDom.Styled.attribute "dx"


{-| -}
dy : String -> Attribute msg
dy =
    VirtualDom.Styled.attribute "dy"


{-| -}
edgeMode : String -> Attribute msg
edgeMode =
    VirtualDom.Styled.attribute "edgeMode"


{-| -}
elevation : String -> Attribute msg
elevation =
    VirtualDom.Styled.attribute "elevation"


{-| -}
end : String -> Attribute msg
end =
    VirtualDom.Styled.attribute "end"


{-| -}
exponent : String -> Attribute msg
exponent =
    VirtualDom.Styled.attribute "exponent"


{-| -}
externalResourcesRequired : String -> Attribute msg
externalResourcesRequired =
    VirtualDom.Styled.attribute "externalResourcesRequired"


{-| -}
filterRes : String -> Attribute msg
filterRes =
    VirtualDom.Styled.attribute "filterRes"


{-| -}
filterUnits : String -> Attribute msg
filterUnits =
    VirtualDom.Styled.attribute "filterUnits"


{-| -}
format : String -> Attribute msg
format =
    VirtualDom.Styled.attribute "format"


{-| -}
from : String -> Attribute msg
from value =
    VirtualDom.Styled.attribute "from" value


{-| -}
fx : String -> Attribute msg
fx =
    VirtualDom.Styled.attribute "fx"


{-| -}
fy : String -> Attribute msg
fy =
    VirtualDom.Styled.attribute "fy"


{-| -}
g1 : String -> Attribute msg
g1 =
    VirtualDom.Styled.attribute "g1"


{-| -}
g2 : String -> Attribute msg
g2 =
    VirtualDom.Styled.attribute "g2"


{-| -}
glyphName : String -> Attribute msg
glyphName =
    VirtualDom.Styled.attribute "glyph-name"


{-| -}
glyphRef : String -> Attribute msg
glyphRef =
    VirtualDom.Styled.attribute "glyphRef"


{-| -}
gradientTransform : String -> Attribute msg
gradientTransform =
    VirtualDom.Styled.attribute "gradientTransform"


{-| -}
gradientUnits : String -> Attribute msg
gradientUnits =
    VirtualDom.Styled.attribute "gradientUnits"


{-| -}
hanging : String -> Attribute msg
hanging =
    VirtualDom.Styled.attribute "hanging"


{-| -}
height : String -> Attribute msg
height =
    VirtualDom.Styled.attribute "height"


{-| -}
horizAdvX : String -> Attribute msg
horizAdvX =
    VirtualDom.Styled.attribute "horiz-adv-x"


{-| -}
horizOriginX : String -> Attribute msg
horizOriginX =
    VirtualDom.Styled.attribute "horiz-origin-x"


{-| -}
horizOriginY : String -> Attribute msg
horizOriginY =
    VirtualDom.Styled.attribute "horiz-origin-y"


{-| -}
id : String -> Attribute msg
id =
    VirtualDom.Styled.attribute "id"


{-| -}
ideographic : String -> Attribute msg
ideographic =
    VirtualDom.Styled.attribute "ideographic"


{-| -}
in_ : String -> Attribute msg
in_ =
    VirtualDom.Styled.attribute "in"


{-| -}
in2 : String -> Attribute msg
in2 =
    VirtualDom.Styled.attribute "in2"


{-| -}
intercept : String -> Attribute msg
intercept =
    VirtualDom.Styled.attribute "intercept"


{-| -}
k : String -> Attribute msg
k =
    VirtualDom.Styled.attribute "k"


{-| -}
k1 : String -> Attribute msg
k1 =
    VirtualDom.Styled.attribute "k1"


{-| -}
k2 : String -> Attribute msg
k2 =
    VirtualDom.Styled.attribute "k2"


{-| -}
k3 : String -> Attribute msg
k3 =
    VirtualDom.Styled.attribute "k3"


{-| -}
k4 : String -> Attribute msg
k4 =
    VirtualDom.Styled.attribute "k4"


{-| -}
kernelMatrix : String -> Attribute msg
kernelMatrix =
    VirtualDom.Styled.attribute "kernelMatrix"


{-| -}
kernelUnitLength : String -> Attribute msg
kernelUnitLength =
    VirtualDom.Styled.attribute "kernelUnitLength"


{-| -}
keyPoints : String -> Attribute msg
keyPoints =
    VirtualDom.Styled.attribute "keyPoints"


{-| -}
keySplines : String -> Attribute msg
keySplines =
    VirtualDom.Styled.attribute "keySplines"


{-| -}
keyTimes : String -> Attribute msg
keyTimes =
    VirtualDom.Styled.attribute "keyTimes"


{-| -}
lang : String -> Attribute msg
lang =
    VirtualDom.Styled.attribute "lang"


{-| -}
lengthAdjust : String -> Attribute msg
lengthAdjust =
    VirtualDom.Styled.attribute "lengthAdjust"


{-| -}
limitingConeAngle : String -> Attribute msg
limitingConeAngle =
    VirtualDom.Styled.attribute "limitingConeAngle"


{-| -}
local : String -> Attribute msg
local =
    VirtualDom.Styled.attribute "local"


{-| -}
markerHeight : String -> Attribute msg
markerHeight =
    VirtualDom.Styled.attribute "markerHeight"


{-| -}
markerUnits : String -> Attribute msg
markerUnits =
    VirtualDom.Styled.attribute "markerUnits"


{-| -}
markerWidth : String -> Attribute msg
markerWidth =
    VirtualDom.Styled.attribute "markerWidth"


{-| -}
maskContentUnits : String -> Attribute msg
maskContentUnits =
    VirtualDom.Styled.attribute "maskContentUnits"


{-| -}
maskUnits : String -> Attribute msg
maskUnits =
    VirtualDom.Styled.attribute "maskUnits"


{-| -}
mathematical : String -> Attribute msg
mathematical =
    VirtualDom.Styled.attribute "mathematical"


{-| -}
max : String -> Attribute msg
max =
    VirtualDom.Styled.attribute "max"


{-| -}
media : String -> Attribute msg
media =
    VirtualDom.Styled.attribute "media"


{-| -}
method : String -> Attribute msg
method =
    VirtualDom.Styled.attribute "method"


{-| -}
min : String -> Attribute msg
min =
    VirtualDom.Styled.attribute "min"


{-| -}
mode : String -> Attribute msg
mode =
    VirtualDom.Styled.attribute "mode"


{-| -}
name : String -> Attribute msg
name =
    VirtualDom.Styled.attribute "name"


{-| -}
numOctaves : String -> Attribute msg
numOctaves =
    VirtualDom.Styled.attribute "numOctaves"


{-| -}
offset : String -> Attribute msg
offset =
    VirtualDom.Styled.attribute "offset"


{-| -}
operator : String -> Attribute msg
operator =
    VirtualDom.Styled.attribute "operator"


{-| -}
order : String -> Attribute msg
order =
    VirtualDom.Styled.attribute "order"


{-| -}
orient : String -> Attribute msg
orient =
    VirtualDom.Styled.attribute "orient"


{-| -}
orientation : String -> Attribute msg
orientation =
    VirtualDom.Styled.attribute "orientation"


{-| -}
origin : String -> Attribute msg
origin =
    VirtualDom.Styled.attribute "origin"


{-| -}
overlinePosition : String -> Attribute msg
overlinePosition =
    VirtualDom.Styled.attribute "overline-position"


{-| -}
overlineThickness : String -> Attribute msg
overlineThickness =
    VirtualDom.Styled.attribute "overline-thickness"


{-| -}
panose1 : String -> Attribute msg
panose1 =
    VirtualDom.Styled.attribute "panose-1"


{-| -}
path : String -> Attribute msg
path =
    VirtualDom.Styled.attribute "path"


{-| -}
pathLength : String -> Attribute msg
pathLength =
    VirtualDom.Styled.attribute "pathLength"


{-| -}
patternContentUnits : String -> Attribute msg
patternContentUnits =
    VirtualDom.Styled.attribute "patternContentUnits"


{-| -}
patternTransform : String -> Attribute msg
patternTransform =
    VirtualDom.Styled.attribute "patternTransform"


{-| -}
patternUnits : String -> Attribute msg
patternUnits =
    VirtualDom.Styled.attribute "patternUnits"


{-| -}
pointOrder : String -> Attribute msg
pointOrder =
    VirtualDom.Styled.attribute "point-order"


{-| -}
points : String -> Attribute msg
points =
    VirtualDom.Styled.attribute "points"


{-| -}
pointsAtX : String -> Attribute msg
pointsAtX =
    VirtualDom.Styled.attribute "pointsAtX"


{-| -}
pointsAtY : String -> Attribute msg
pointsAtY =
    VirtualDom.Styled.attribute "pointsAtY"


{-| -}
pointsAtZ : String -> Attribute msg
pointsAtZ =
    VirtualDom.Styled.attribute "pointsAtZ"


{-| -}
preserveAlpha : String -> Attribute msg
preserveAlpha =
    VirtualDom.Styled.attribute "preserveAlpha"


{-| -}
preserveAspectRatio : String -> Attribute msg
preserveAspectRatio =
    VirtualDom.Styled.attribute "preserveAspectRatio"


{-| -}
primitiveUnits : String -> Attribute msg
primitiveUnits =
    VirtualDom.Styled.attribute "primitiveUnits"


{-| -}
r : String -> Attribute msg
r =
    VirtualDom.Styled.attribute "r"


{-| -}
radius : String -> Attribute msg
radius =
    VirtualDom.Styled.attribute "radius"


{-| -}
refX : String -> Attribute msg
refX =
    VirtualDom.Styled.attribute "refX"


{-| -}
refY : String -> Attribute msg
refY =
    VirtualDom.Styled.attribute "refY"


{-| -}
renderingIntent : String -> Attribute msg
renderingIntent =
    VirtualDom.Styled.attribute "rendering-intent"


{-| -}
repeatCount : String -> Attribute msg
repeatCount =
    VirtualDom.Styled.attribute "repeatCount"


{-| -}
repeatDur : String -> Attribute msg
repeatDur =
    VirtualDom.Styled.attribute "repeatDur"


{-| -}
requiredExtensions : String -> Attribute msg
requiredExtensions =
    VirtualDom.Styled.attribute "requiredExtensions"


{-| -}
requiredFeatures : String -> Attribute msg
requiredFeatures =
    VirtualDom.Styled.attribute "requiredFeatures"


{-| -}
restart : String -> Attribute msg
restart =
    VirtualDom.Styled.attribute "restart"


{-| -}
result : String -> Attribute msg
result =
    VirtualDom.Styled.attribute "result"


{-| -}
rotate : String -> Attribute msg
rotate =
    VirtualDom.Styled.attribute "rotate"


{-| -}
rx : String -> Attribute msg
rx =
    VirtualDom.Styled.attribute "rx"


{-| -}
ry : String -> Attribute msg
ry =
    VirtualDom.Styled.attribute "ry"


{-| -}
scale : String -> Attribute msg
scale =
    VirtualDom.Styled.attribute "scale"


{-| -}
seed : String -> Attribute msg
seed =
    VirtualDom.Styled.attribute "seed"


{-| -}
slope : String -> Attribute msg
slope =
    VirtualDom.Styled.attribute "slope"


{-| -}
spacing : String -> Attribute msg
spacing =
    VirtualDom.Styled.attribute "spacing"


{-| -}
specularConstant : String -> Attribute msg
specularConstant =
    VirtualDom.Styled.attribute "specularConstant"


{-| -}
specularExponent : String -> Attribute msg
specularExponent =
    VirtualDom.Styled.attribute "specularExponent"


{-| -}
speed : String -> Attribute msg
speed =
    VirtualDom.Styled.attribute "speed"


{-| -}
spreadMethod : String -> Attribute msg
spreadMethod =
    VirtualDom.Styled.attribute "spreadMethod"


{-| -}
startOffset : String -> Attribute msg
startOffset =
    VirtualDom.Styled.attribute "startOffset"


{-| -}
stdDeviation : String -> Attribute msg
stdDeviation =
    VirtualDom.Styled.attribute "stdDeviation"


{-| -}
stemh : String -> Attribute msg
stemh =
    VirtualDom.Styled.attribute "stemh"


{-| -}
stemv : String -> Attribute msg
stemv =
    VirtualDom.Styled.attribute "stemv"


{-| -}
stitchTiles : String -> Attribute msg
stitchTiles =
    VirtualDom.Styled.attribute "stitchTiles"


{-| -}
strikethroughPosition : String -> Attribute msg
strikethroughPosition =
    VirtualDom.Styled.attribute "strikethrough-position"


{-| -}
strikethroughThickness : String -> Attribute msg
strikethroughThickness =
    VirtualDom.Styled.attribute "strikethrough-thickness"


{-| -}
string : String -> Attribute msg
string =
    VirtualDom.Styled.attribute "string"


{-| -}
style : String -> Attribute msg
style =
    VirtualDom.Styled.attribute "style"


{-| -}
surfaceScale : String -> Attribute msg
surfaceScale =
    VirtualDom.Styled.attribute "surfaceScale"


{-| -}
systemLanguage : String -> Attribute msg
systemLanguage =
    VirtualDom.Styled.attribute "systemLanguage"


{-| -}
tableValues : String -> Attribute msg
tableValues =
    VirtualDom.Styled.attribute "tableValues"


{-| -}
target : String -> Attribute msg
target =
    VirtualDom.Styled.attribute "target"


{-| -}
targetX : String -> Attribute msg
targetX =
    VirtualDom.Styled.attribute "targetX"


{-| -}
targetY : String -> Attribute msg
targetY =
    VirtualDom.Styled.attribute "targetY"


{-| -}
textLength : String -> Attribute msg
textLength =
    VirtualDom.Styled.attribute "textLength"


{-| -}
title : String -> Attribute msg
title =
    VirtualDom.Styled.attribute "title"


{-| -}
to : String -> Attribute msg
to value =
    VirtualDom.Styled.attribute "to" value


{-| -}
transform : String -> Attribute msg
transform =
    VirtualDom.Styled.attribute "transform"


{-| -}
type_ : String -> Attribute msg
type_ =
    VirtualDom.Styled.attribute "type"


{-| -}
u1 : String -> Attribute msg
u1 =
    VirtualDom.Styled.attribute "u1"


{-| -}
u2 : String -> Attribute msg
u2 =
    VirtualDom.Styled.attribute "u2"


{-| -}
underlinePosition : String -> Attribute msg
underlinePosition =
    VirtualDom.Styled.attribute "underline-position"


{-| -}
underlineThickness : String -> Attribute msg
underlineThickness =
    VirtualDom.Styled.attribute "underline-thickness"


{-| -}
unicode : String -> Attribute msg
unicode =
    VirtualDom.Styled.attribute "unicode"


{-| -}
unicodeRange : String -> Attribute msg
unicodeRange =
    VirtualDom.Styled.attribute "unicode-range"


{-| -}
unitsPerEm : String -> Attribute msg
unitsPerEm =
    VirtualDom.Styled.attribute "units-per-em"


{-| -}
vAlphabetic : String -> Attribute msg
vAlphabetic =
    VirtualDom.Styled.attribute "v-alphabetic"


{-| -}
vHanging : String -> Attribute msg
vHanging =
    VirtualDom.Styled.attribute "v-hanging"


{-| -}
vIdeographic : String -> Attribute msg
vIdeographic =
    VirtualDom.Styled.attribute "v-ideographic"


{-| -}
vMathematical : String -> Attribute msg
vMathematical =
    VirtualDom.Styled.attribute "v-mathematical"


{-| -}
values : String -> Attribute msg
values value =
    VirtualDom.Styled.attribute "values" value


{-| -}
version : String -> Attribute msg
version =
    VirtualDom.Styled.attribute "version"


{-| -}
vertAdvY : String -> Attribute msg
vertAdvY =
    VirtualDom.Styled.attribute "vert-adv-y"


{-| -}
vertOriginX : String -> Attribute msg
vertOriginX =
    VirtualDom.Styled.attribute "vert-origin-x"


{-| -}
vertOriginY : String -> Attribute msg
vertOriginY =
    VirtualDom.Styled.attribute "vert-origin-y"


{-| -}
viewBox : String -> Attribute msg
viewBox =
    VirtualDom.Styled.attribute "viewBox"


{-| -}
viewTarget : String -> Attribute msg
viewTarget =
    VirtualDom.Styled.attribute "viewTarget"


{-| -}
width : String -> Attribute msg
width =
    VirtualDom.Styled.attribute "width"


{-| -}
widths : String -> Attribute msg
widths =
    VirtualDom.Styled.attribute "widths"


{-| -}
x : String -> Attribute msg
x =
    VirtualDom.Styled.attribute "x"


{-| -}
xHeight : String -> Attribute msg
xHeight =
    VirtualDom.Styled.attribute "x-height"


{-| -}
x1 : String -> Attribute msg
x1 =
    VirtualDom.Styled.attribute "x1"


{-| -}
x2 : String -> Attribute msg
x2 =
    VirtualDom.Styled.attribute "x2"


{-| -}
xChannelSelector : String -> Attribute msg
xChannelSelector =
    VirtualDom.Styled.attribute "xChannelSelector"


{-| -}
xlinkActuate : String -> Attribute msg
xlinkActuate =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:actuate"


{-| -}
xlinkArcrole : String -> Attribute msg
xlinkArcrole =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:arcrole"


{-| -}
xlinkHref : String -> Attribute msg
xlinkHref value =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:href" value


{-| -}
xlinkRole : String -> Attribute msg
xlinkRole =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:role"


{-| -}
xlinkShow : String -> Attribute msg
xlinkShow =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:show"


{-| -}
xlinkTitle : String -> Attribute msg
xlinkTitle =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:title"


{-| -}
xlinkType : String -> Attribute msg
xlinkType =
    VirtualDom.Styled.attributeNS "http://www.w3.org/1999/xlink" "xlink:type"


{-| -}
xmlBase : String -> Attribute msg
xmlBase =
    VirtualDom.Styled.attributeNS "http://www.w3.org/XML/1998/namespace" "xml:base"


{-| -}
xmlLang : String -> Attribute msg
xmlLang =
    VirtualDom.Styled.attributeNS "http://www.w3.org/XML/1998/namespace" "xml:lang"


{-| -}
xmlSpace : String -> Attribute msg
xmlSpace =
    VirtualDom.Styled.attributeNS "http://www.w3.org/XML/1998/namespace" "xml:space"


{-| -}
y : String -> Attribute msg
y =
    VirtualDom.Styled.attribute "y"


{-| -}
y1 : String -> Attribute msg
y1 =
    VirtualDom.Styled.attribute "y1"


{-| -}
y2 : String -> Attribute msg
y2 =
    VirtualDom.Styled.attribute "y2"


{-| -}
yChannelSelector : String -> Attribute msg
yChannelSelector =
    VirtualDom.Styled.attribute "yChannelSelector"


{-| -}
z : String -> Attribute msg
z =
    VirtualDom.Styled.attribute "z"


{-| -}
zoomAndPan : String -> Attribute msg
zoomAndPan =
    VirtualDom.Styled.attribute "zoomAndPan"



-- PRESENTATION ATTRIBUTES


{-| -}
alignmentBaseline : String -> Attribute msg
alignmentBaseline =
    VirtualDom.Styled.attribute "alignment-baseline"


{-| -}
baselineShift : String -> Attribute msg
baselineShift =
    VirtualDom.Styled.attribute "baseline-shift"


{-| -}
clipPath : String -> Attribute msg
clipPath =
    VirtualDom.Styled.attribute "clip-path"


{-| -}
clipRule : String -> Attribute msg
clipRule =
    VirtualDom.Styled.attribute "clip-rule"


{-| -}
clip : String -> Attribute msg
clip =
    VirtualDom.Styled.attribute "clip"


{-| -}
colorInterpolationFilters : String -> Attribute msg
colorInterpolationFilters =
    VirtualDom.Styled.attribute "color-interpolation-filters"


{-| -}
colorInterpolation : String -> Attribute msg
colorInterpolation =
    VirtualDom.Styled.attribute "color-interpolation"


{-| -}
colorProfile : String -> Attribute msg
colorProfile =
    VirtualDom.Styled.attribute "color-profile"


{-| -}
colorRendering : String -> Attribute msg
colorRendering =
    VirtualDom.Styled.attribute "color-rendering"


{-| -}
color : String -> Attribute msg
color =
    VirtualDom.Styled.attribute "color"


{-| -}
cursor : String -> Attribute msg
cursor =
    VirtualDom.Styled.attribute "cursor"


{-| -}
direction : String -> Attribute msg
direction =
    VirtualDom.Styled.attribute "direction"


{-| -}
display : String -> Attribute msg
display =
    VirtualDom.Styled.attribute "display"


{-| -}
dominantBaseline : String -> Attribute msg
dominantBaseline =
    VirtualDom.Styled.attribute "dominant-baseline"


{-| -}
enableBackground : String -> Attribute msg
enableBackground =
    VirtualDom.Styled.attribute "enable-background"


{-| -}
fillOpacity : String -> Attribute msg
fillOpacity =
    VirtualDom.Styled.attribute "fill-opacity"


{-| -}
fillRule : String -> Attribute msg
fillRule =
    VirtualDom.Styled.attribute "fill-rule"


{-| -}
fill : String -> Attribute msg
fill =
    VirtualDom.Styled.attribute "fill"


{-| -}
filter : String -> Attribute msg
filter =
    VirtualDom.Styled.attribute "filter"


{-| -}
floodColor : String -> Attribute msg
floodColor =
    VirtualDom.Styled.attribute "flood-color"


{-| -}
floodOpacity : String -> Attribute msg
floodOpacity =
    VirtualDom.Styled.attribute "flood-opacity"


{-| -}
fontFamily : String -> Attribute msg
fontFamily =
    VirtualDom.Styled.attribute "font-family"


{-| -}
fontSizeAdjust : String -> Attribute msg
fontSizeAdjust =
    VirtualDom.Styled.attribute "font-size-adjust"


{-| -}
fontSize : String -> Attribute msg
fontSize =
    VirtualDom.Styled.attribute "font-size"


{-| -}
fontStretch : String -> Attribute msg
fontStretch =
    VirtualDom.Styled.attribute "font-stretch"


{-| -}
fontStyle : String -> Attribute msg
fontStyle =
    VirtualDom.Styled.attribute "font-style"


{-| -}
fontVariant : String -> Attribute msg
fontVariant =
    VirtualDom.Styled.attribute "font-variant"


{-| -}
fontWeight : String -> Attribute msg
fontWeight =
    VirtualDom.Styled.attribute "font-weight"


{-| -}
glyphOrientationHorizontal : String -> Attribute msg
glyphOrientationHorizontal =
    VirtualDom.Styled.attribute "glyph-orientation-horizontal"


{-| -}
glyphOrientationVertical : String -> Attribute msg
glyphOrientationVertical =
    VirtualDom.Styled.attribute "glyph-orientation-vertical"


{-| -}
imageRendering : String -> Attribute msg
imageRendering =
    VirtualDom.Styled.attribute "image-rendering"


{-| -}
kerning : String -> Attribute msg
kerning =
    VirtualDom.Styled.attribute "kerning"


{-| -}
letterSpacing : String -> Attribute msg
letterSpacing =
    VirtualDom.Styled.attribute "letter-spacing"


{-| -}
lightingColor : String -> Attribute msg
lightingColor =
    VirtualDom.Styled.attribute "lighting-color"


{-| -}
markerEnd : String -> Attribute msg
markerEnd =
    VirtualDom.Styled.attribute "marker-end"


{-| -}
markerMid : String -> Attribute msg
markerMid =
    VirtualDom.Styled.attribute "marker-mid"


{-| -}
markerStart : String -> Attribute msg
markerStart =
    VirtualDom.Styled.attribute "marker-start"


{-| -}
mask : String -> Attribute msg
mask =
    VirtualDom.Styled.attribute "mask"


{-| -}
opacity : String -> Attribute msg
opacity =
    VirtualDom.Styled.attribute "opacity"


{-| -}
overflow : String -> Attribute msg
overflow =
    VirtualDom.Styled.attribute "overflow"


{-| -}
pointerEvents : String -> Attribute msg
pointerEvents =
    VirtualDom.Styled.attribute "pointer-events"


{-| -}
shapeRendering : String -> Attribute msg
shapeRendering =
    VirtualDom.Styled.attribute "shape-rendering"


{-| -}
stopColor : String -> Attribute msg
stopColor =
    VirtualDom.Styled.attribute "stop-color"


{-| -}
stopOpacity : String -> Attribute msg
stopOpacity =
    VirtualDom.Styled.attribute "stop-opacity"


{-| -}
strokeDasharray : String -> Attribute msg
strokeDasharray =
    VirtualDom.Styled.attribute "stroke-dasharray"


{-| -}
strokeDashoffset : String -> Attribute msg
strokeDashoffset =
    VirtualDom.Styled.attribute "stroke-dashoffset"


{-| -}
strokeLinecap : String -> Attribute msg
strokeLinecap =
    VirtualDom.Styled.attribute "stroke-linecap"


{-| -}
strokeLinejoin : String -> Attribute msg
strokeLinejoin =
    VirtualDom.Styled.attribute "stroke-linejoin"


{-| -}
strokeMiterlimit : String -> Attribute msg
strokeMiterlimit =
    VirtualDom.Styled.attribute "stroke-miterlimit"


{-| -}
strokeOpacity : String -> Attribute msg
strokeOpacity =
    VirtualDom.Styled.attribute "stroke-opacity"


{-| -}
strokeWidth : String -> Attribute msg
strokeWidth =
    VirtualDom.Styled.attribute "stroke-width"


{-| -}
stroke : String -> Attribute msg
stroke =
    VirtualDom.Styled.attribute "stroke"


{-| -}
textAnchor : String -> Attribute msg
textAnchor =
    VirtualDom.Styled.attribute "text-anchor"


{-| -}
textDecoration : String -> Attribute msg
textDecoration =
    VirtualDom.Styled.attribute "text-decoration"


{-| -}
textRendering : String -> Attribute msg
textRendering =
    VirtualDom.Styled.attribute "text-rendering"


{-| -}
unicodeBidi : String -> Attribute msg
unicodeBidi =
    VirtualDom.Styled.attribute "unicode-bidi"


{-| -}
visibility : String -> Attribute msg
visibility =
    VirtualDom.Styled.attribute "visibility"


{-| -}
wordSpacing : String -> Attribute msg
wordSpacing =
    VirtualDom.Styled.attribute "word-spacing"


{-| -}
writingMode : String -> Attribute msg
writingMode =
    VirtualDom.Styled.attribute "writing-mode"
