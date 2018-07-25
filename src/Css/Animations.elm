module Css.Animations
    exposing
        ( Keyframes
        , Property
        , all
        , backgroundColor
        , backgroundPosition
        , backgroundSize
        , backgroundSize2
        , border
        , border2
        , border3
        , borderBottom
        , borderBottom2
        , borderBottom3
        , borderBottomColor
        , borderBottomLeftRadius
        , borderBottomRightRadius
        , borderBottomWidth
        , borderColor
        , borderLeft
        , borderLeftColor
        , borderLeftWidth
        , borderRadius
        , borderRight
        , borderRightColor
        , borderRightWidth
        , borderTop
        , borderTopColor
        , borderTopLeftRadius
        , borderTopRightRadius
        , borderTopWidth
        , borderWidth
        , bottom
        , boxShadow
        , caretColor
        , clip
        , clipPath
        , color
        , columnCount
        , columnGap
        , columnRule
        , columnRuleColor
        , columnRuleWidth
        , columnWidth
        , columns
        , custom
        , filter
        , flex
        , flexBasis
        , flexGrow
        , flexShrink
        , font
        , fontSize
        , fontSizeAdjust
        , fontStretch
        , fontVariationSettings
        , fontWeight
        , gap
        , gridColumnGap
        , gridGap
        , gridRowGap
        , height
        , keyframes
        , left
        , letterSpacing
        , lineClamp
        , lineHeight
        , margin
        , marginBottom
        , marginLeft
        , marginRight
        , marginTop
        , mask
        , maskBorder
        , maskPosition
        , maskSize
        , maxHeight
        , maxLines
        , maxWidth
        , minHeight
        , minWidth
        , objectPosition
        , offset
        , offsetAnchor
        , offsetDistance
        , offsetPath
        , offsetPosition
        , offsetRotate
        , opacity
        , order
        , outline
        , outlineColor
        , outlineOffset
        , outlineWidth
        , padding
        , paddingBottom
        , paddingLeft
        , paddingRight
        , paddingTop
        , perspective
        , perspectiveOrigin
        , right
        , rotate
        , rowGap
        , scale
        , scrollSnapCoordinate
        , scrollSnapDestination
        , shapeImageThreshold
        , shapeMargin
        , shapeOutside
        , tabSize
        , textDecoration
        , textDecorationColor
        , textEmphasis
        , textEmphasisColor
        , textIndent
        , textShadow
        , top
        , transform
        , transformOrigin
        , translate
        , verticalAlign
        , visibility
        , width
        , wordSpacing
        , zIndex
        , zoom
        )

{-|


# Animations

@docs Property, keyframes, Keyframes


# Animatable Properties

As [MDN explains](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties), only certain CSS properties are animatable.

The animatable properties (except for experimental properties, or properties with browser prefixes) are listed here. Many of them share a name and similar type with `Style` equivalents in the `Css` module, but they are different in that unlike `Style`s, animatable properties [are not compatible with `!important`](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes#!important_in_a_keyframe) or various selectors or media queries.

@docs custom, all, backgroundColor, backgroundPosition, backgroundSize, backgroundSize2, border, border2, border3, borderBottom, borderBottom2, borderBottom3, borderBottomColor, borderBottomLeftRadius, borderBottomRightRadius, borderBottomWidth, borderColor, borderLeft, borderLeftColor, borderLeftWidth, borderRadius, borderRight, borderRightColor, borderRightWidth, borderTop, borderTopColor, borderTopLeftRadius, borderTopRightRadius, borderTopWidth, borderWidth, bottom, boxShadow, caretColor, clip, clipPath, color, columnCount, columnGap, columnRule, columnRuleColor, columnRuleWidth, columnWidth, columns, filter, flex, flexBasis, flexGrow, flexShrink, font, fontSize, fontSizeAdjust, fontStretch, fontVariationSettings, fontWeight, gap, gridColumnGap, gridGap, gridRowGap, height, left, letterSpacing, lineClamp, lineHeight, margin, marginBottom, marginLeft, marginRight, marginTop, mask, maskBorder, maskPosition, maskSize, maxHeight, maxLines, maxWidth, minHeight, minWidth, objectPosition, offset, offsetAnchor, offsetDistance, offsetPath, offsetPosition, offsetRotate, opacity, order, outline, outlineColor, outlineOffset, outlineWidth, padding, paddingBottom, paddingLeft, paddingRight, paddingTop, perspective, perspectiveOrigin, right, rotate, rowGap, scale, scrollSnapCoordinate, scrollSnapDestination, shapeImageThreshold, shapeMargin, shapeOutside, tabSize, textDecoration, textDecorationColor, textEmphasis, textEmphasisColor, textIndent, textShadow, top, transform, transformOrigin, translate, verticalAlign, visibility, width, wordSpacing, zIndex, zoom

-}

import Css.Internal exposing (AnimationProperty(..), ColorValue, ExplicitLength, IncompatibleUnits, Length, LengthOrAutoOrCoverOrContain, lengthConverter, lengthForOverloadedProperty)
import Css.Preprocess as Preprocess
import Css.Structure exposing (Compatible(..))


{-| An [animatable property](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties).

Many of these share a name and similar type with `Style` equivalents in the `Css` module, but they are different in that unlike `Style`s, animatable properties [are not compatible with `!important`](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes#!important_in_a_keyframe) or various selectors or media queries.

If you need to use an experimental or vendor-prefixed animatable property, see [`custom`](#custom).

-}
type alias Property =
    AnimationProperty


type alias Style =
    Preprocess.Style


{-| -}
type alias Keyframes compatible =
    { compatible | keyframes : Compatible, none : Compatible, value : String }


{-| Specify a list of ( percentage, properties) tuples to use for
animation keyframes.

Pass the result to [`Css.animationName`](Css#animationName)!

`keyframes []` is equivalent to `none`.

-}
keyframes : List ( Int, List Property ) -> Keyframes {}
keyframes tuples =
    if List.isEmpty tuples then
        -- animationName is special-cased to pick up on this.
        { value = "none"
        , none = Compatible
        , keyframes = Compatible
        }

    else
        { value = Css.Internal.compileKeyframes tuples
        , none = Compatible
        , keyframes = Compatible
        }



-- ANIMATABLE PROPERTIES


{-| Create a custom animatable property with the given name and value. You can use this to define vendor-prefixed or experimental properties.

    custom "-moz-outline-radius" "25px"

**WARNING:** Some properties are not exposed in this module because they
are not animatable! This means browsers will refuse to animate them even if you pass them to this function.

MDN has [a list of the animatable properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties).

-}
custom : String -> String -> Property
custom name value =
    Property (name ++ ":" ++ value)


all : { compatible | value : String, all : Compatible } -> Property
all { value } =
    Property ("all:" ++ value)


backgroundColor : { compatible | value : String, color : Compatible } -> Property
backgroundColor { value } =
    Property ("background-color:" ++ value)


backgroundPosition : (ExplicitLength IncompatibleUnits -> Style) -> Property
backgroundPosition fn =
    getOverloadedProperty "backgroundPosition" "background-position" (fn lengthForOverloadedProperty)


backgroundSize : LengthOrAutoOrCoverOrContain compatible -> Property
backgroundSize { value } =
    Property ("background-size:" ++ value)


backgroundSize2 : LengthOrAutoOrCoverOrContain compatible -> LengthOrAutoOrCoverOrContain compatible -> Property
backgroundSize2 arg1 arg2 =
    Property ("background-size:" ++ arg1.value ++ " " ++ arg2.value)


border : Length compatible units -> Property
border { value } =
    Property ("border:" ++ value)


border2 : Length compatible units -> Length compatible units -> Property
border2 arg1 arg2 =
    Property ("border:" ++ arg1.value ++ " " ++ arg2.value)


border3 : Length compatible units -> Length compatible units -> Length compatible units -> Property
border3 arg1 arg2 arg3 =
    Property ("border:" ++ arg1.value ++ " " ++ arg2.value ++ " " ++ arg3.value)


borderBottom : Length compatible units -> Property
borderBottom { value } =
    Property ("border-bottom:" ++ value)


borderBottom2 : Length compatible units -> Length compatible units -> Property
borderBottom2 arg1 arg2 =
    Property ("border-bottom:" ++ arg1.value ++ " " ++ arg2.value)


borderBottom3 : Length compatible units -> Length compatible units -> Length compatible units -> Property
borderBottom3 arg1 arg2 arg3 =
    Property ("border-bottom:" ++ arg1.value ++ " " ++ arg2.value ++ " " ++ arg3.value)


borderBottomColor : ColorValue compatible -> Property
borderBottomColor { value } =
    Property ("border-bottom-color:" ++ value)


borderBottomLeftRadius : Property
borderBottomLeftRadius =
    "border-bottom-left-radius"


borderBottomRightRadius : Property
borderBottomRightRadius =
    "border-bottom-right-radius"


borderBottomWidth : Property
borderBottomWidth =
    "border-bottom-width"


borderColor : Property
borderColor =
    "border-color"


borderLeft : Property
borderLeft =
    "border-left"


borderLeftColor : Property
borderLeftColor =
    "border-left-color"


borderLeftWidth : Property
borderLeftWidth =
    "border-left-width"


borderRadius : Property
borderRadius =
    "border-radius"


borderRight : Property
borderRight =
    "border-right"


borderRightColor : Property
borderRightColor =
    "border-right-color"


borderRightWidth : Property
borderRightWidth =
    "border-right-width"


borderTop : Property
borderTop =
    "border-top"


borderTopColor : Property
borderTopColor =
    "border-top-color"


borderTopLeftRadius : Property
borderTopLeftRadius =
    "border-top-left-radius"


borderTopRightRadius : Property
borderTopRightRadius =
    "border-top-right-radius"


borderTopWidth : Property
borderTopWidth =
    "border-top-width"


borderWidth : Property
borderWidth =
    "border-width"


bottom : Property
bottom =
    "bottom"


boxShadow : Property
boxShadow =
    "box-shadow"


caretColor : Property
caretColor =
    "caret-color"


clip : Property
clip =
    "clip"


clipPath : Property
clipPath =
    "clip-path"


color : Property
color =
    "color"


columnCount : Property
columnCount =
    "column-count"


columnGap : Property
columnGap =
    "column-gap"


columnRule : Property
columnRule =
    "column-rule"


columnRuleColor : Property
columnRuleColor =
    "column-rule-color"


columnRuleWidth : Property
columnRuleWidth =
    "column-rule-width"


columnWidth : Property
columnWidth =
    "column-width"


columns : Property
columns =
    "columns"


filter : Property
filter =
    "filter"


flex : Property
flex =
    "flex"


flexBasis : Property
flexBasis =
    "flex-basis"


flexGrow : Property
flexGrow =
    "flex-grow"


flexShrink : Property
flexShrink =
    "flex-shrink"


font : Property
font =
    "font"


fontSize : Property
fontSize =
    "font-size"


fontSizeAdjust : Property
fontSizeAdjust =
    "font-size-adjust"


fontStretch : Property
fontStretch =
    "font-stretch"


fontVariationSettings : Property
fontVariationSettings =
    "font-variation-settings"


fontWeight : Property
fontWeight =
    "font-weight"


gap : Property
gap =
    "gap"


gridColumnGap : Property
gridColumnGap =
    "grid-column-gap"


gridGap : Property
gridGap =
    "grid-gap"


gridRowGap : Property
gridRowGap =
    "grid-row-gap"


height : Property
height =
    "height"


left : Property
left =
    "left"


letterSpacing : Property
letterSpacing =
    "letter-spacing"


lineClamp : Property
lineClamp =
    "line-clamp"


lineHeight : Property
lineHeight =
    "line-height"


margin : Property
margin =
    "margin"


marginBottom : Property
marginBottom =
    "margin-bottom"


marginLeft : Property
marginLeft =
    "margin-left"


marginRight : Property
marginRight =
    "margin-right"


marginTop : Property
marginTop =
    "margin-top"


mask : Property
mask =
    "mask"


maskBorder : Property
maskBorder =
    "mask-border"


maskPosition : Property
maskPosition =
    "mask-position"


maskSize : Property
maskSize =
    "mask-size"


maxHeight : Property
maxHeight =
    "max-height"


maxLines : Property
maxLines =
    "max-lines"


maxWidth : Property
maxWidth =
    "max-width"


minHeight : Property
minHeight =
    "min-height"


minWidth : Property
minWidth =
    "min-width"


objectPosition : Property
objectPosition =
    "object-position"


offset : Property
offset =
    "offset"


offsetAnchor : Property
offsetAnchor =
    "offset-anchor"


offsetDistance : Property
offsetDistance =
    "offset-distance"


offsetPath : Property
offsetPath =
    "offset-path"


offsetPosition : Property
offsetPosition =
    "offset-position"


offsetRotate : Property
offsetRotate =
    "offset-rotate"


opacity : Property
opacity =
    "opacity"


order : Property
order =
    "order"


outline : Property
outline =
    "outline"


outlineColor : Property
outlineColor =
    "outline-color"


outlineOffset : Property
outlineOffset =
    "outline-offset"


outlineWidth : Property
outlineWidth =
    "outline-width"


padding : Property
padding =
    "padding"


paddingBottom : Property
paddingBottom =
    "padding-bottom"


paddingLeft : Property
paddingLeft =
    "padding-left"


paddingRight : Property
paddingRight =
    "padding-right"


paddingTop : Property
paddingTop =
    "padding-top"


perspective : Property
perspective =
    "perspective"


perspectiveOrigin : Property
perspectiveOrigin =
    "perspective-origin"


right : Property
right =
    "right"


rotate : Property
rotate =
    "rotate"


rowGap : Property
rowGap =
    "row-gap"


scale : Property
scale =
    "scale"


scrollSnapCoordinate : Property
scrollSnapCoordinate =
    "scroll-snap-coordinate"


scrollSnapDestination : Property
scrollSnapDestination =
    "scroll-snap-destination"


shapeImageThreshold : Property
shapeImageThreshold =
    "shape-image-threshold"


shapeMargin : Property
shapeMargin =
    "shape-margin"


shapeOutside : Property
shapeOutside =
    "shape-outside"


tabSize : Property
tabSize =
    "tab-size"


textDecoration : Property
textDecoration =
    "text-decoration"


textDecorationColor : Property
textDecorationColor =
    "text-decoration-color"


textEmphasis : Property
textEmphasis =
    "text-emphasis"


textEmphasisColor : Property
textEmphasisColor =
    "text-emphasis-color"


textIndent : Property
textIndent =
    "text-indent"


textShadow : Property
textShadow =
    "text-shadow"


top : Property
top =
    "top"


transform : Property
transform =
    "transform"


transformOrigin : Property
transformOrigin =
    "transform-origin"


translate : Property
translate =
    "translate"


verticalAlign : Property
verticalAlign =
    "vertical-align"


visibility : Property
visibility =
    "visibility"


width : Property
width =
    "width"


wordSpacing : Property
wordSpacing =
    "word-spacing"


zIndex : Property
zIndex =
    "z-index"


zoom : Property
zoom =
    "zoom"


{-| Caution: trickery ahead!

This is for use with overloaded CSS properties like `left` that need to be keys
in some places and values in othes. You give it a Style that evaluates to the
relevant key, and then use that key as your value.

For example, `left` is a Style that takes a Length and adds a property like
"left: 3px". What this does is take `left`, pass it `zero` (to create a
"left: 0" definition), then inspects that definition that it just created to
extract the key (in this case the string "left"), then uses that key as the
value for this property.

In this way you can use this function to define textAlign, and allow textAlign
to accept `left` as a value, in which case it will construct "text-align: left"
as the end user expects.

Other notes:

`desiredKey` is the key of the property.
`functionName` is just for better error messages.

-}
getOverloadedProperty : String -> String -> Style -> Property
getOverloadedProperty functionName desiredKey style =
    case style of
        Preprocess.AppendProperty str ->
            let
                key =
                    String.split ":" str
                        |> List.head
                        |> Maybe.withDefault ""
            in
            -- Use the given style's Key as the resulting property's value.
            custom desiredKey key

        Preprocess.ExtendSelector selector _ ->
            custom desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-selector")

        Preprocess.NestSnippet combinator _ ->
            custom desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-combinator")

        Preprocess.WithPseudoElement pseudoElement _ ->
            custom desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-pseudo-element setter")

        Preprocess.WithMedia _ _ ->
            custom desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-media-query")

        Preprocess.WithKeyframes _ ->
            custom desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-keyframes")

        Preprocess.ApplyStyles [] ->
            custom desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-empty-Style")

        Preprocess.ApplyStyles (only :: []) ->
            getOverloadedProperty functionName desiredKey only

        Preprocess.ApplyStyles (first :: rest) ->
            getOverloadedProperty functionName desiredKey (Preprocess.ApplyStyles rest)


{-| Define a custom property.

    css [ property "-webkit-font-smoothing" "none" ]

...outputs

    -webkit-font-smoothing: none;

-}
property : String -> String -> Style
property key value =
    (key ++ ":" ++ value)
        |> Preprocess.AppendProperty


numberToString : number -> String
numberToString num =
    toString (num + 0)
