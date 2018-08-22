module Svg.Styled.Attributes exposing
    ( css, fromUnstyled
    , accentHeight, accelerate, accumulate, additive, alphabetic, allowReorder, amplitude, arabicForm, ascent, attributeName, attributeType, autoReverse, azimuth, baseFrequency, baseProfile, bbox, begin, bias, by, calcMode, capHeight, class, clipPathUnits, contentScriptType, contentStyleType, cx, cy, d, decelerate, descent, diffuseConstant, divisor, dur, dx, dy, edgeMode, elevation, end, exponent, externalResourcesRequired, filterRes, filterUnits, format, from, fx, fy, g1, g2, glyphName, glyphRef, gradientTransform, gradientUnits, hanging, height, horizAdvX, horizOriginX, horizOriginY, id, ideographic, in_, in2, intercept, k, k1, k2, k3, k4, kernelMatrix, kernelUnitLength, keyPoints, keySplines, keyTimes, lang, lengthAdjust, limitingConeAngle, local, markerHeight, markerUnits, markerWidth, maskContentUnits, maskUnits, mathematical, max, media, method, min, mode, name, numOctaves, offset, operator, order, orient, orientation, origin, overlinePosition, overlineThickness, panose1, path, pathLength, patternContentUnits, patternTransform, patternUnits, pointOrder, points, pointsAtX, pointsAtY, pointsAtZ, preserveAlpha, preserveAspectRatio, primitiveUnits, r, radius, refX, refY, renderingIntent, repeatCount, repeatDur, requiredExtensions, requiredFeatures, restart, result, rotate, rx, ry, scale, seed, slope, spacing, specularConstant, specularExponent, speed, spreadMethod, startOffset, stdDeviation, stemh, stemv, stitchTiles, strikethroughPosition, strikethroughThickness, string, style, surfaceScale, systemLanguage, tableValues, target, targetX, targetY, textLength, title, to, transform, type_, u1, u2, underlinePosition, underlineThickness, unicode, unicodeRange, unitsPerEm, vAlphabetic, vHanging, vIdeographic, vMathematical, values, version, vertAdvY, vertOriginX, vertOriginY, viewBox, viewTarget, width, widths, x, xHeight, x1, x2, xChannelSelector, xlinkActuate, xlinkArcrole, xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType, xmlBase, xmlLang, xmlSpace, y, y1, y2, yChannelSelector, z, zoomAndPan
    , alignmentBaseline, baselineShift, clipPath, clipRule, clip, colorInterpolationFilters, colorInterpolation, colorProfile, colorRendering, color, cursor, direction, display, dominantBaseline, enableBackground, fillOpacity, fillRule, fill, filter, floodColor, floodOpacity, fontFamily, fontSizeAdjust, fontSize, fontStretch, fontStyle, fontVariant, fontWeight, glyphOrientationHorizontal, glyphOrientationVertical, imageRendering, kerning, letterSpacing, lightingColor, markerEnd, markerMid, markerStart, mask, opacity, overflow, pointerEvents, shapeRendering, stopColor, stopOpacity, strokeDasharray, strokeDashoffset, strokeLinecap, strokeLinejoin, strokeMiterlimit, strokeOpacity, strokeWidth, stroke, textAnchor, textDecoration, textRendering, unicodeBidi, visibility, wordSpacing, writingMode
    )

{-| Drop-in replacement for the `Svg.Attributes` module from the `elm-lang/svg` package.
The only functions added are `css`, and `fromUnstyled`:

@docs css, fromUnstyled


# Regular attributes

@docs accentHeight, accelerate, accumulate, additive, alphabetic, allowReorder, amplitude, arabicForm, ascent, attributeName, attributeType, autoReverse, azimuth, baseFrequency, baseProfile, bbox, begin, bias, by, calcMode, capHeight, class, clipPathUnits, contentScriptType, contentStyleType, cx, cy, d, decelerate, descent, diffuseConstant, divisor, dur, dx, dy, edgeMode, elevation, end, exponent, externalResourcesRequired, filterRes, filterUnits, format, from, fx, fy, g1, g2, glyphName, glyphRef, gradientTransform, gradientUnits, hanging, height, horizAdvX, horizOriginX, horizOriginY, id, ideographic, in_, in2, intercept, k, k1, k2, k3, k4, kernelMatrix, kernelUnitLength, keyPoints, keySplines, keyTimes, lang, lengthAdjust, limitingConeAngle, local, markerHeight, markerUnits, markerWidth, maskContentUnits, maskUnits, mathematical, max, media, method, min, mode, name, numOctaves, offset, operator, order, orient, orientation, origin, overlinePosition, overlineThickness, panose1, path, pathLength, patternContentUnits, patternTransform, patternUnits, pointOrder, points, pointsAtX, pointsAtY, pointsAtZ, preserveAlpha, preserveAspectRatio, primitiveUnits, r, radius, refX, refY, renderingIntent, repeatCount, repeatDur, requiredExtensions, requiredFeatures, restart, result, rotate, rx, ry, scale, seed, slope, spacing, specularConstant, specularExponent, speed, spreadMethod, startOffset, stdDeviation, stemh, stemv, stitchTiles, strikethroughPosition, strikethroughThickness, string, style, surfaceScale, systemLanguage, tableValues, target, targetX, targetY, textLength, title, to, transform, type_, u1, u2, underlinePosition, underlineThickness, unicode, unicodeRange, unitsPerEm, vAlphabetic, vHanging, vIdeographic, vMathematical, values, version, vertAdvY, vertOriginX, vertOriginY, viewBox, viewTarget, width, widths, x, xHeight, x1, x2, xChannelSelector, xlinkActuate, xlinkArcrole, xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType, xmlBase, xmlLang, xmlSpace, y, y1, y2, yChannelSelector, z, zoomAndPan


# Presentation attributes

@docs alignmentBaseline, baselineShift, clipPath, clipRule, clip, colorInterpolationFilters, colorInterpolation, colorProfile, colorRendering, color, cursor, direction, display, dominantBaseline, enableBackground, fillOpacity, fillRule, fill, filter, floodColor, floodOpacity, fontFamily, fontSizeAdjust, fontSize, fontStretch, fontStyle, fontVariant, fontWeight, glyphOrientationHorizontal, glyphOrientationVertical, imageRendering, kerning, letterSpacing, lightingColor, markerEnd, markerMid, markerStart, mask, opacity, overflow, pointerEvents, shapeRendering, stopColor, stopOpacity, strokeDasharray, strokeDashoffset, strokeLinecap, strokeLinejoin, strokeMiterlimit, strokeOpacity, strokeWidth, stroke, textAnchor, textDecoration, textRendering, unicodeBidi, visibility, wordSpacing, writingMode

-}

import Css exposing (Style)
import Svg.Styled exposing (Attribute)
import Svg.Styled.Internal as Internal
import VirtualDom
import VirtualDom.Styled exposing (attribute, attributeNS)


{-| -}
fromUnstyled : VirtualDom.Property msg -> Attribute msg
fromUnstyled =
    VirtualDom.Styled.unstyledProperty


{-| Apply styles to an element.

See the [`Css` module documentation](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css) for an overview of how to use this function.

-}
css : List Style -> Attribute msg
css =
    Internal.css



-- Regular attributes


{-| -}
accentHeight : String -> Attribute msg
accentHeight =
    attribute "accent-height"


{-| -}
accelerate : String -> Attribute msg
accelerate =
    attribute "accelerate"


{-| -}
accumulate : String -> Attribute msg
accumulate =
    attribute "accumulate"


{-| -}
additive : String -> Attribute msg
additive =
    attribute "additive"


{-| -}
alphabetic : String -> Attribute msg
alphabetic =
    attribute "alphabetic"


{-| -}
allowReorder : String -> Attribute msg
allowReorder =
    attribute "allowReorder"


{-| -}
amplitude : String -> Attribute msg
amplitude =
    attribute "amplitude"


{-| -}
arabicForm : String -> Attribute msg
arabicForm =
    attribute "arabic-form"


{-| -}
ascent : String -> Attribute msg
ascent =
    attribute "ascent"


{-| -}
attributeName : String -> Attribute msg
attributeName =
    attribute "attributeName"


{-| -}
attributeType : String -> Attribute msg
attributeType =
    attribute "attributeType"


{-| -}
autoReverse : String -> Attribute msg
autoReverse =
    attribute "autoReverse"


{-| -}
azimuth : String -> Attribute msg
azimuth =
    attribute "azimuth"


{-| -}
baseFrequency : String -> Attribute msg
baseFrequency =
    attribute "baseFrequency"


{-| -}
baseProfile : String -> Attribute msg
baseProfile =
    attribute "baseProfile"


{-| -}
bbox : String -> Attribute msg
bbox =
    attribute "bbox"


{-| -}
begin : String -> Attribute msg
begin =
    attribute "begin"


{-| -}
bias : String -> Attribute msg
bias =
    attribute "bias"


{-| -}
by : String -> Attribute msg
by =
    attribute "by"


{-| -}
calcMode : String -> Attribute msg
calcMode =
    attribute "calcMode"


{-| -}
capHeight : String -> Attribute msg
capHeight =
    attribute "cap-height"


{-| -}
class : String -> Attribute msg
class =
    attribute "class"


{-| -}
clipPathUnits : String -> Attribute msg
clipPathUnits =
    attribute "clipPathUnits"


{-| -}
contentScriptType : String -> Attribute msg
contentScriptType =
    attribute "contentScriptType"


{-| -}
contentStyleType : String -> Attribute msg
contentStyleType =
    attribute "contentStyleType"


{-| -}
cx : String -> Attribute msg
cx =
    attribute "cx"


{-| -}
cy : String -> Attribute msg
cy =
    attribute "cy"


{-| -}
d : String -> Attribute msg
d =
    attribute "d"


{-| -}
decelerate : String -> Attribute msg
decelerate =
    attribute "decelerate"


{-| -}
descent : String -> Attribute msg
descent =
    attribute "descent"


{-| -}
diffuseConstant : String -> Attribute msg
diffuseConstant =
    attribute "diffuseConstant"


{-| -}
divisor : String -> Attribute msg
divisor =
    attribute "divisor"


{-| -}
dur : String -> Attribute msg
dur =
    attribute "dur"


{-| -}
dx : String -> Attribute msg
dx =
    attribute "dx"


{-| -}
dy : String -> Attribute msg
dy =
    attribute "dy"


{-| -}
edgeMode : String -> Attribute msg
edgeMode =
    attribute "edgeMode"


{-| -}
elevation : String -> Attribute msg
elevation =
    attribute "elevation"


{-| -}
end : String -> Attribute msg
end =
    attribute "end"


{-| -}
exponent : String -> Attribute msg
exponent =
    attribute "exponent"


{-| -}
externalResourcesRequired : String -> Attribute msg
externalResourcesRequired =
    attribute "externalResourcesRequired"


{-| -}
filterRes : String -> Attribute msg
filterRes =
    attribute "filterRes"


{-| -}
filterUnits : String -> Attribute msg
filterUnits =
    attribute "filterUnits"


{-| -}
format : String -> Attribute msg
format =
    attribute "format"


{-| -}
from : String -> Attribute msg
from =
    attribute "from"


{-| -}
fx : String -> Attribute msg
fx =
    attribute "fx"


{-| -}
fy : String -> Attribute msg
fy =
    attribute "fy"


{-| -}
g1 : String -> Attribute msg
g1 =
    attribute "g1"


{-| -}
g2 : String -> Attribute msg
g2 =
    attribute "g2"


{-| -}
glyphName : String -> Attribute msg
glyphName =
    attribute "glyph-name"


{-| -}
glyphRef : String -> Attribute msg
glyphRef =
    attribute "glyphRef"


{-| -}
gradientTransform : String -> Attribute msg
gradientTransform =
    attribute "gradientTransform"


{-| -}
gradientUnits : String -> Attribute msg
gradientUnits =
    attribute "gradientUnits"


{-| -}
hanging : String -> Attribute msg
hanging =
    attribute "hanging"


{-| -}
height : String -> Attribute msg
height =
    attribute "height"


{-| -}
horizAdvX : String -> Attribute msg
horizAdvX =
    attribute "horiz-adv-x"


{-| -}
horizOriginX : String -> Attribute msg
horizOriginX =
    attribute "horiz-origin-x"


{-| -}
horizOriginY : String -> Attribute msg
horizOriginY =
    attribute "horiz-origin-y"


{-| -}
id : String -> Attribute msg
id =
    attribute "id"


{-| -}
ideographic : String -> Attribute msg
ideographic =
    attribute "ideographic"


{-| -}
in_ : String -> Attribute msg
in_ =
    attribute "in"


{-| -}
in2 : String -> Attribute msg
in2 =
    attribute "in2"


{-| -}
intercept : String -> Attribute msg
intercept =
    attribute "intercept"


{-| -}
k : String -> Attribute msg
k =
    attribute "k"


{-| -}
k1 : String -> Attribute msg
k1 =
    attribute "k1"


{-| -}
k2 : String -> Attribute msg
k2 =
    attribute "k2"


{-| -}
k3 : String -> Attribute msg
k3 =
    attribute "k3"


{-| -}
k4 : String -> Attribute msg
k4 =
    attribute "k4"


{-| -}
kernelMatrix : String -> Attribute msg
kernelMatrix =
    attribute "kernelMatrix"


{-| -}
kernelUnitLength : String -> Attribute msg
kernelUnitLength =
    attribute "kernelUnitLength"


{-| -}
keyPoints : String -> Attribute msg
keyPoints =
    attribute "keyPoints"


{-| -}
keySplines : String -> Attribute msg
keySplines =
    attribute "keySplines"


{-| -}
keyTimes : String -> Attribute msg
keyTimes =
    attribute "keyTimes"


{-| -}
lang : String -> Attribute msg
lang =
    attribute "lang"


{-| -}
lengthAdjust : String -> Attribute msg
lengthAdjust =
    attribute "lengthAdjust"


{-| -}
limitingConeAngle : String -> Attribute msg
limitingConeAngle =
    attribute "limitingConeAngle"


{-| -}
local : String -> Attribute msg
local =
    attribute "local"


{-| -}
markerHeight : String -> Attribute msg
markerHeight =
    attribute "markerHeight"


{-| -}
markerUnits : String -> Attribute msg
markerUnits =
    attribute "markerUnits"


{-| -}
markerWidth : String -> Attribute msg
markerWidth =
    attribute "markerWidth"


{-| -}
maskContentUnits : String -> Attribute msg
maskContentUnits =
    attribute "maskContentUnits"


{-| -}
maskUnits : String -> Attribute msg
maskUnits =
    attribute "maskUnits"


{-| -}
mathematical : String -> Attribute msg
mathematical =
    attribute "mathematical"


{-| -}
max : String -> Attribute msg
max =
    attribute "max"


{-| -}
media : String -> Attribute msg
media =
    attribute "media"


{-| -}
method : String -> Attribute msg
method =
    attribute "method"


{-| -}
min : String -> Attribute msg
min =
    attribute "min"


{-| -}
mode : String -> Attribute msg
mode =
    attribute "mode"


{-| -}
name : String -> Attribute msg
name =
    attribute "name"


{-| -}
numOctaves : String -> Attribute msg
numOctaves =
    attribute "numOctaves"


{-| -}
offset : String -> Attribute msg
offset =
    attribute "offset"


{-| -}
operator : String -> Attribute msg
operator =
    attribute "operator"


{-| -}
order : String -> Attribute msg
order =
    attribute "order"


{-| -}
orient : String -> Attribute msg
orient =
    attribute "orient"


{-| -}
orientation : String -> Attribute msg
orientation =
    attribute "orientation"


{-| -}
origin : String -> Attribute msg
origin =
    attribute "origin"


{-| -}
overlinePosition : String -> Attribute msg
overlinePosition =
    attribute "overline-position"


{-| -}
overlineThickness : String -> Attribute msg
overlineThickness =
    attribute "overline-thickness"


{-| -}
panose1 : String -> Attribute msg
panose1 =
    attribute "panose-1"


{-| -}
path : String -> Attribute msg
path =
    attribute "path"


{-| -}
pathLength : String -> Attribute msg
pathLength =
    attribute "pathLength"


{-| -}
patternContentUnits : String -> Attribute msg
patternContentUnits =
    attribute "patternContentUnits"


{-| -}
patternTransform : String -> Attribute msg
patternTransform =
    attribute "patternTransform"


{-| -}
patternUnits : String -> Attribute msg
patternUnits =
    attribute "patternUnits"


{-| -}
pointOrder : String -> Attribute msg
pointOrder =
    attribute "point-order"


{-| -}
points : String -> Attribute msg
points =
    attribute "points"


{-| -}
pointsAtX : String -> Attribute msg
pointsAtX =
    attribute "pointsAtX"


{-| -}
pointsAtY : String -> Attribute msg
pointsAtY =
    attribute "pointsAtY"


{-| -}
pointsAtZ : String -> Attribute msg
pointsAtZ =
    attribute "pointsAtZ"


{-| -}
preserveAlpha : String -> Attribute msg
preserveAlpha =
    attribute "preserveAlpha"


{-| -}
preserveAspectRatio : String -> Attribute msg
preserveAspectRatio =
    attribute "preserveAspectRatio"


{-| -}
primitiveUnits : String -> Attribute msg
primitiveUnits =
    attribute "primitiveUnits"


{-| -}
r : String -> Attribute msg
r =
    attribute "r"


{-| -}
radius : String -> Attribute msg
radius =
    attribute "radius"


{-| -}
refX : String -> Attribute msg
refX =
    attribute "refX"


{-| -}
refY : String -> Attribute msg
refY =
    attribute "refY"


{-| -}
renderingIntent : String -> Attribute msg
renderingIntent =
    attribute "rendering-intent"


{-| -}
repeatCount : String -> Attribute msg
repeatCount =
    attribute "repeatCount"


{-| -}
repeatDur : String -> Attribute msg
repeatDur =
    attribute "repeatDur"


{-| -}
requiredExtensions : String -> Attribute msg
requiredExtensions =
    attribute "requiredExtensions"


{-| -}
requiredFeatures : String -> Attribute msg
requiredFeatures =
    attribute "requiredFeatures"


{-| -}
restart : String -> Attribute msg
restart =
    attribute "restart"


{-| -}
result : String -> Attribute msg
result =
    attribute "result"


{-| -}
rotate : String -> Attribute msg
rotate =
    attribute "rotate"


{-| -}
rx : String -> Attribute msg
rx =
    attribute "rx"


{-| -}
ry : String -> Attribute msg
ry =
    attribute "ry"


{-| -}
scale : String -> Attribute msg
scale =
    attribute "scale"


{-| -}
seed : String -> Attribute msg
seed =
    attribute "seed"


{-| -}
slope : String -> Attribute msg
slope =
    attribute "slope"


{-| -}
spacing : String -> Attribute msg
spacing =
    attribute "spacing"


{-| -}
specularConstant : String -> Attribute msg
specularConstant =
    attribute "specularConstant"


{-| -}
specularExponent : String -> Attribute msg
specularExponent =
    attribute "specularExponent"


{-| -}
speed : String -> Attribute msg
speed =
    attribute "speed"


{-| -}
spreadMethod : String -> Attribute msg
spreadMethod =
    attribute "spreadMethod"


{-| -}
startOffset : String -> Attribute msg
startOffset =
    attribute "startOffset"


{-| -}
stdDeviation : String -> Attribute msg
stdDeviation =
    attribute "stdDeviation"


{-| -}
stemh : String -> Attribute msg
stemh =
    attribute "stemh"


{-| -}
stemv : String -> Attribute msg
stemv =
    attribute "stemv"


{-| -}
stitchTiles : String -> Attribute msg
stitchTiles =
    attribute "stitchTiles"


{-| -}
strikethroughPosition : String -> Attribute msg
strikethroughPosition =
    attribute "strikethrough-position"


{-| -}
strikethroughThickness : String -> Attribute msg
strikethroughThickness =
    attribute "strikethrough-thickness"


{-| -}
string : String -> Attribute msg
string =
    attribute "string"


{-| -}
style : String -> Attribute msg
style =
    attribute "style"


{-| -}
surfaceScale : String -> Attribute msg
surfaceScale =
    attribute "surfaceScale"


{-| -}
systemLanguage : String -> Attribute msg
systemLanguage =
    attribute "systemLanguage"


{-| -}
tableValues : String -> Attribute msg
tableValues =
    attribute "tableValues"


{-| -}
target : String -> Attribute msg
target =
    attribute "target"


{-| -}
targetX : String -> Attribute msg
targetX =
    attribute "targetX"


{-| -}
targetY : String -> Attribute msg
targetY =
    attribute "targetY"


{-| -}
textLength : String -> Attribute msg
textLength =
    attribute "textLength"


{-| -}
title : String -> Attribute msg
title =
    attribute "title"


{-| -}
to : String -> Attribute msg
to =
    attribute "to"


{-| -}
transform : String -> Attribute msg
transform =
    attribute "transform"


{-| -}
type_ : String -> Attribute msg
type_ =
    attribute "type"


{-| -}
u1 : String -> Attribute msg
u1 =
    attribute "u1"


{-| -}
u2 : String -> Attribute msg
u2 =
    attribute "u2"


{-| -}
underlinePosition : String -> Attribute msg
underlinePosition =
    attribute "underline-position"


{-| -}
underlineThickness : String -> Attribute msg
underlineThickness =
    attribute "underline-thickness"


{-| -}
unicode : String -> Attribute msg
unicode =
    attribute "unicode"


{-| -}
unicodeRange : String -> Attribute msg
unicodeRange =
    attribute "unicode-range"


{-| -}
unitsPerEm : String -> Attribute msg
unitsPerEm =
    attribute "units-per-em"


{-| -}
vAlphabetic : String -> Attribute msg
vAlphabetic =
    attribute "v-alphabetic"


{-| -}
vHanging : String -> Attribute msg
vHanging =
    attribute "v-hanging"


{-| -}
vIdeographic : String -> Attribute msg
vIdeographic =
    attribute "v-ideographic"


{-| -}
vMathematical : String -> Attribute msg
vMathematical =
    attribute "v-mathematical"


{-| -}
values : String -> Attribute msg
values =
    attribute "values"


{-| -}
version : String -> Attribute msg
version =
    attribute "version"


{-| -}
vertAdvY : String -> Attribute msg
vertAdvY =
    attribute "vert-adv-y"


{-| -}
vertOriginX : String -> Attribute msg
vertOriginX =
    attribute "vert-origin-x"


{-| -}
vertOriginY : String -> Attribute msg
vertOriginY =
    attribute "vert-origin-y"


{-| -}
viewBox : String -> Attribute msg
viewBox =
    attribute "viewBox"


{-| -}
viewTarget : String -> Attribute msg
viewTarget =
    attribute "viewTarget"


{-| -}
width : String -> Attribute msg
width =
    attribute "width"


{-| -}
widths : String -> Attribute msg
widths =
    attribute "widths"


{-| -}
x : String -> Attribute msg
x =
    attribute "x"


{-| -}
xHeight : String -> Attribute msg
xHeight =
    attribute "x-height"


{-| -}
x1 : String -> Attribute msg
x1 =
    attribute "x1"


{-| -}
x2 : String -> Attribute msg
x2 =
    attribute "x2"


{-| -}
xChannelSelector : String -> Attribute msg
xChannelSelector =
    attribute "xChannelSelector"


{-| -}
xlinkActuate : String -> Attribute msg
xlinkActuate =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:actuate"


{-| -}
xlinkArcrole : String -> Attribute msg
xlinkArcrole =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:arcrole"


{-| -}
xlinkHref : String -> Attribute msg
xlinkHref =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:href"


{-| -}
xlinkRole : String -> Attribute msg
xlinkRole =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:role"


{-| -}
xlinkShow : String -> Attribute msg
xlinkShow =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:show"


{-| -}
xlinkTitle : String -> Attribute msg
xlinkTitle =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:title"


{-| -}
xlinkType : String -> Attribute msg
xlinkType =
    attributeNS "http://www.w3.org/1999/xlink" "xlink:type"


{-| -}
xmlBase : String -> Attribute msg
xmlBase =
    attributeNS "http://www.w3.org/XML/1998/namespace" "xml:base"


{-| -}
xmlLang : String -> Attribute msg
xmlLang =
    attributeNS "http://www.w3.org/XML/1998/namespace" "xml:lang"


{-| -}
xmlSpace : String -> Attribute msg
xmlSpace =
    attributeNS "http://www.w3.org/XML/1998/namespace" "xml:space"


{-| -}
y : String -> Attribute msg
y =
    attribute "y"


{-| -}
y1 : String -> Attribute msg
y1 =
    attribute "y1"


{-| -}
y2 : String -> Attribute msg
y2 =
    attribute "y2"


{-| -}
yChannelSelector : String -> Attribute msg
yChannelSelector =
    attribute "yChannelSelector"


{-| -}
z : String -> Attribute msg
z =
    attribute "z"


{-| -}
zoomAndPan : String -> Attribute msg
zoomAndPan =
    attribute "zoomAndPan"



-- Presentation attributes


{-| -}
alignmentBaseline : String -> Attribute msg
alignmentBaseline =
    attribute "alignment-baseline"


{-| -}
baselineShift : String -> Attribute msg
baselineShift =
    attribute "baseline-shift"


{-| -}
clipPath : String -> Attribute msg
clipPath =
    attribute "clip-path"


{-| -}
clipRule : String -> Attribute msg
clipRule =
    attribute "clip-rule"


{-| -}
clip : String -> Attribute msg
clip =
    attribute "clip"


{-| -}
colorInterpolationFilters : String -> Attribute msg
colorInterpolationFilters =
    attribute "color-interpolation-filters"


{-| -}
colorInterpolation : String -> Attribute msg
colorInterpolation =
    attribute "color-interpolation"


{-| -}
colorProfile : String -> Attribute msg
colorProfile =
    attribute "color-profile"


{-| -}
colorRendering : String -> Attribute msg
colorRendering =
    attribute "color-rendering"


{-| -}
color : String -> Attribute msg
color =
    attribute "color"


{-| -}
cursor : String -> Attribute msg
cursor =
    attribute "cursor"


{-| -}
direction : String -> Attribute msg
direction =
    attribute "direction"


{-| -}
display : String -> Attribute msg
display =
    attribute "display"


{-| -}
dominantBaseline : String -> Attribute msg
dominantBaseline =
    attribute "dominant-baseline"


{-| -}
enableBackground : String -> Attribute msg
enableBackground =
    attribute "enable-background"


{-| -}
fillOpacity : String -> Attribute msg
fillOpacity =
    attribute "fill-opacity"


{-| -}
fillRule : String -> Attribute msg
fillRule =
    attribute "fill-rule"


{-| -}
fill : String -> Attribute msg
fill =
    attribute "fill"


{-| -}
filter : String -> Attribute msg
filter =
    attribute "filter"


{-| -}
floodColor : String -> Attribute msg
floodColor =
    attribute "flood-color"


{-| -}
floodOpacity : String -> Attribute msg
floodOpacity =
    attribute "flood-opacity"


{-| -}
fontFamily : String -> Attribute msg
fontFamily =
    attribute "font-family"


{-| -}
fontSizeAdjust : String -> Attribute msg
fontSizeAdjust =
    attribute "font-size-adjust"


{-| -}
fontSize : String -> Attribute msg
fontSize =
    attribute "font-size"


{-| -}
fontStretch : String -> Attribute msg
fontStretch =
    attribute "font-stretch"


{-| -}
fontStyle : String -> Attribute msg
fontStyle =
    attribute "font-style"


{-| -}
fontVariant : String -> Attribute msg
fontVariant =
    attribute "font-variant"


{-| -}
fontWeight : String -> Attribute msg
fontWeight =
    attribute "font-weight"


{-| -}
glyphOrientationHorizontal : String -> Attribute msg
glyphOrientationHorizontal =
    attribute "glyph-orientation-horizontal"


{-| -}
glyphOrientationVertical : String -> Attribute msg
glyphOrientationVertical =
    attribute "glyph-orientation-vertical"


{-| -}
imageRendering : String -> Attribute msg
imageRendering =
    attribute "image-rendering"


{-| -}
kerning : String -> Attribute msg
kerning =
    attribute "kerning"


{-| -}
letterSpacing : String -> Attribute msg
letterSpacing =
    attribute "letter-spacing"


{-| -}
lightingColor : String -> Attribute msg
lightingColor =
    attribute "lighting-color"


{-| -}
markerEnd : String -> Attribute msg
markerEnd =
    attribute "marker-end"


{-| -}
markerMid : String -> Attribute msg
markerMid =
    attribute "marker-mid"


{-| -}
markerStart : String -> Attribute msg
markerStart =
    attribute "marker-start"


{-| -}
mask : String -> Attribute msg
mask =
    attribute "mask"


{-| -}
opacity : String -> Attribute msg
opacity =
    attribute "opacity"


{-| -}
overflow : String -> Attribute msg
overflow =
    attribute "overflow"


{-| -}
pointerEvents : String -> Attribute msg
pointerEvents =
    attribute "pointer-events"


{-| -}
shapeRendering : String -> Attribute msg
shapeRendering =
    attribute "shape-rendering"


{-| -}
stopColor : String -> Attribute msg
stopColor =
    attribute "stop-color"


{-| -}
stopOpacity : String -> Attribute msg
stopOpacity =
    attribute "stop-opacity"


{-| -}
strokeDasharray : String -> Attribute msg
strokeDasharray =
    attribute "stroke-dasharray"


{-| -}
strokeDashoffset : String -> Attribute msg
strokeDashoffset =
    attribute "stroke-dashoffset"


{-| -}
strokeLinecap : String -> Attribute msg
strokeLinecap =
    attribute "stroke-linecap"


{-| -}
strokeLinejoin : String -> Attribute msg
strokeLinejoin =
    attribute "stroke-linejoin"


{-| -}
strokeMiterlimit : String -> Attribute msg
strokeMiterlimit =
    attribute "stroke-miterlimit"


{-| -}
strokeOpacity : String -> Attribute msg
strokeOpacity =
    attribute "stroke-opacity"


{-| -}
strokeWidth : String -> Attribute msg
strokeWidth =
    attribute "stroke-width"


{-| -}
stroke : String -> Attribute msg
stroke =
    attribute "stroke"


{-| -}
textAnchor : String -> Attribute msg
textAnchor =
    attribute "text-anchor"


{-| -}
textDecoration : String -> Attribute msg
textDecoration =
    attribute "text-decoration"


{-| -}
textRendering : String -> Attribute msg
textRendering =
    attribute "text-rendering"


{-| -}
unicodeBidi : String -> Attribute msg
unicodeBidi =
    attribute "unicode-bidi"


{-| -}
visibility : String -> Attribute msg
visibility =
    attribute "visibility"


{-| -}
wordSpacing : String -> Attribute msg
wordSpacing =
    attribute "word-spacing"


{-| -}
writingMode : String -> Attribute msg
writingMode =
    attribute "writing-mode"
