module Css exposing
    ( Value, Supported
    , Style, batch
    , property
    , unset, initial, inherit
    , all, revert
    , zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pt, pc, pct, num, int
    , calc, CalcOperation, minus, plus, times, dividedBy
    , Color, color, backgroundColor, hex, rgb, rgba, hsl, hsla
    , pseudoClass, active, disabled
    , pseudoElement, before, after
    , width
    , backgroundAttachment, backgroundAttachments, scroll, local
    , backgroundBlendMode, backgroundBlendModes, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity
    , backgroundClip, backgroundClips, backgroundOrigin, backgroundOrigins, paddingBox, text_
    , backgroundImage, backgroundImages, backgroundPosition, backgroundPosition2, backgroundPosition4, backgroundRepeat, backgroundRepeat2, backgroundSize, backgroundSize2
    , linearGradient, stop, stop2, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight
    , repeat, noRepeat, repeatX, repeatY, space, round
    , cover, contain
    , BoxShadowConfig, boxShadow, defaultBoxShadow
    , border, border2, border3
    , borderTop, borderTop2, borderTop3
    , borderRight, borderRight2, borderRight3
    , borderBottom, borderBottom2, borderBottom3
    , borderLeft, borderLeft2, borderLeft3
    , borderWidth, borderWidth2, borderWidth3, borderWidth4, borderTopWidth, borderRightWidth, borderBottomWidth, borderLeftWidth
    , thin, thick
    , borderStyle, borderStyle2, borderStyle3, borderStyle4, borderTopStyle, borderRightStyle, borderBottomStyle, borderLeftStyle
    , dotted, dashed, solid, double, groove, ridge, inset, outset
    , borderColor, borderColor2, borderColor3, borderColor4, borderTopColor, borderRightColor, borderBottomColor, borderLeftColor
    , borderRadius, borderRadius2, borderRadius3, borderRadius4, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderBottomLeftRadius, borderBottomLeftRadius2
    , borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4
    , borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4
    , display, displayFlex
    , block, grid, inline, inlineBlock, inlineFlex, table, tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup
    , position, top, right, bottom, left, zIndex
    , absolute, fixed, relative, static, sticky
    , padding, padding2, padding3, padding4, paddingTop, paddingRight, paddingBottom, paddingLeft
    , margin, margin2, margin3, margin4, marginTop, marginRight, marginBottom, marginLeft
    , boxSizing
    , alignItems, alignSelf, justifyContent, spaceBetween, spaceAround, spaceEvenly
    , wordSpacing
    , tabSize
    , fontDisplay, fallback, swap, optional
    , writingMode, verticalLr, verticalRl, horizontalTb
    , hyphens, manual
    , hangingPunctuation, first, last, forceEnd, allowEnd
    , lineClamp
    , fontSize, xxSmall, xSmall, small, medium, large, xLarge, xxLarge, smaller, larger, lineHeight
    , fontSizeAdjust
    , fontFamily, fontFamilies, serif, sansSerif, monospace, cursive, fantasy, systemUi
    , fontStyle, italic, oblique
    , fontWeight, bold, lighter, bolder
    , fontStretch, ultraCondensed, extraCondensed, condensed, semiCondensed, normal, semiExpanded, expanded, extraExpanded, ultraExpanded
    , fontVariantCaps, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps
    , fontVariantLigatures, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual
    , fontVariantNumeric, fontVariantNumeric4, ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions
    , stretch, center, start, end, flexStart, flexEnd, selfStart, selfEnd, left_, right_, top_, bottom_, baseline, firstBaseline, lastBaseline, safeCenter, unsafeCenter
    , url
    , cursor, pointer, default, contextMenu, help, progress, wait, cell
    , crosshair, text, verticalText, alias, copy, move, noDrop
    , notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
    , wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
    , neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing
    , listStyle, listStyle2, listStyle3, listStylePosition
    , inside, outside
    , arabicIndic, armenian, bengali, cjkEarthlyBranch, cjkHeavenlyStem, devanagari, georgian, gujarati, gurmukhi, kannada, khmer, lao, malayalam, myanmar, oriya, telugu, thai
    , auto, none
    , hidden, visible
    , contentBox, borderBox
    , overflow, overflowX, overflowY
    , overflowAnchor
    , overflowWrap
    , breakWord
    , deg, grad, rad, turn
    , direction, ltr, rtl
    , justify, matchParent, textAlign, textJustify, interWord, interCharacter, textUnderlinePositon, under
    , textOrientation
    , mixed, sideways, upright
    , textRendering
    , geometricPrecision, optimizeLegibility, optimizeSpeed
    , textTransform
    , capitalize, uppercase, lowercase, fullWidth
    , textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorationLine2, textDecorationLine3, textDecorationStyle, textDecorationColor
    , textDecorationSkip, objects, spaces, ink, edges, boxDecoration
    , wavy, underline, overline, lineThrough
    , textStroke, textStroke2, textStrokeColor, textStrokeWidth
    , borderCollapse
    , collapse, separate
    , borderSpacing, borderSpacing2
    , captionSide
    , emptyCells
    , show, hide
    , tableLayout
    , verticalAlign
    , sub, super, textTop, textBottom, middle
    , whiteSpace
    , pre, preWrap, preLine, nowrap
    , wordBreak
    , breakAll, keepAll
    , float
    , clear, both, inlineStart, inlineEnd
    , visibility
    , order
    , fill
    , strokeDasharray, strokeDashoffset, strokeWidth, strokeAlign, strokeColor, strokeImage, strokeMiterlimit, strokeOpacity, strokePosition, strokePosition2, strokePosition4, strokeRepeat, strokeRepeat2, strokeSize, strokeSize2, strokeDashCorner
    , strokeLinecap, butt, square
    , strokeBreak, boundingBox, slice, clone
    , strokeOrigin, fillBox, strokeBox
    , strokeLinejoin, strokeLinejoin2, crop, arcs, miter, bevel
    , strokeDashJustify, compress, dashes, gaps
    , columns, columns2, columnWidth, columnCount, columnGap, columnRuleWidth, columnRuleStyle, columnRuleColor, columnRule, columnRule2, columnRule3
    , columnFill, balance, balanceAll
    , columnSpan, all_
    , transform, transformOrigin, transformOrigin2
    , matrix, matrix3d
    , perspective
    , rotate, rotateX, rotateY, rotateZ, rotate3d
    , scale, scale2, scaleX, scaleY, scaleZ, scale3d
    , skew, skew2, skewX, skewY
    , translate, translate2, translateX, translateY, translateZ, translate3d
    , opacity
    , zoom
    , scrollBehavior, smooth, scrollSnapAlign, always, scrollSnapStop
    , scrollSnapType, scrollSnapType2, x, y, mandatory, proximity
    , scrollMargin, scrollMargin2, scrollMargin3, scrollMargin4, scrollMarginTop, scrollMarginLeft, scrollMarginRight, scrollMarginBottom
    , scrollPadding, scrollPadding2, scrollPadding3, scrollPadding4, scrollPaddingTop, scrollPaddingLeft, scrollPaddingRight, scrollPaddingBottom
    , speak, spellOut
    , userSelect
    , unicodeBidi, embed, bidiOverride, isolateOverride, plaintext
    , bleed
    , orphans, widows
    , breakInside, avoid, avoidPage, avoidColumn, avoidRegion
    , pageBreakBefore, pageBreakInside, pageBreakAfter
    , mixBlendMode
    , imageRendering, crispEdges, pixelated
    , backfaceVisibility
    , objectFit, fill_, scaleDown
    , objectPosition, objectPosition2, objectPosition4
    , boxDecorationBreak
    , isolation, isolate
    , caretColor
    , pointerEvents
    )

{-| If you need something that `elm-css` does not support right now, the
[`Css.property`](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#property)
and [`Css.Global.selector`](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css-Global#selector)
functions let you define custom properties and selectors, respectively.


## CSS Values

@docs Value, Supported


## Reusable Styles

@docs Style, batch


## Custom Properties

@docs property


## General Values

All CSS properties can have the values `unset`, `initial`, and `inherit`.

@docs unset, initial, inherit

@docs all, revert


## Numeric Units

@docs zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pt, pc, pct, num, int


## Calc

@docs calc, CalcOperation, minus, plus, times, dividedBy


## Color

@docs Color, color, backgroundColor, hex, rgb, rgba, hsl, hsla


## Pseudo-Classes

@docs pseudoClass, active, disabled


## Pseudo-Elements

@docs pseudoElement, before, after


## Sizing

@docs width


## Background Attachment

@docs backgroundAttachment, backgroundAttachments, scroll, local


## Background Blend Mode

@docs backgroundBlendMode, backgroundBlendModes, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity


## Background Clip and Origin

@docs backgroundClip, backgroundClips, backgroundOrigin, backgroundOrigins, paddingBox, text_


## Background Image

@docs backgroundImage, backgroundImages, backgroundPosition, backgroundPosition2, backgroundPosition4, backgroundRepeat, backgroundRepeat2, backgroundSize, backgroundSize2

@docs linearGradient, stop, stop2, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight

@docs repeat, noRepeat, repeatX, repeatY, space, round

@docs cover, contain


## Box Shadow

@docs BoxShadowConfig, boxShadow, defaultBoxShadow


## Border

@docs border, border2, border3

@docs borderTop, borderTop2, borderTop3

@docs borderRight, borderRight2, borderRight3

@docs borderBottom, borderBottom2, borderBottom3

@docs borderLeft, borderLeft2, borderLeft3


## Border Width

@docs borderWidth, borderWidth2, borderWidth3, borderWidth4, borderTopWidth, borderRightWidth, borderBottomWidth, borderLeftWidth

@docs thin, thick


## Border Style

@docs borderStyle, borderStyle2, borderStyle3, borderStyle4, borderTopStyle, borderRightStyle, borderBottomStyle, borderLeftStyle

@docs dotted, dashed, solid, double, groove, ridge, inset, outset


## Border Color

@docs borderColor, borderColor2, borderColor3, borderColor4, borderTopColor, borderRightColor, borderBottomColor, borderLeftColor


## Border Radius

@docs borderRadius, borderRadius2, borderRadius3, borderRadius4, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderBottomLeftRadius, borderBottomLeftRadius2


## Border Image

@docs borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4

@docs borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4


## Display

@docs display, displayFlex

@docs block, grid, inline, inlineBlock, inlineFlex, table, tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup


## Positions

@docs position, top, right, bottom, left, zIndex

@docs absolute, fixed, relative, static, sticky


## Paddings

@docs padding, padding2, padding3, padding4, paddingTop, paddingRight, paddingBottom, paddingLeft


## Margins

@docs margin, margin2, margin3, margin4, marginTop, marginRight, marginBottom, marginLeft


## Box Sizing

@docs boxSizing


## Flexbox

@docs alignItems, alignSelf, justifyContent, spaceBetween, spaceAround, spaceEvenly


# Typography


## Spacing

@docs wordSpacing
@docs tabSize


## Display

@docs fontDisplay, fallback, swap, optional
@docs writingMode, verticalLr, verticalRl, horizontalTb
@docs hyphens, manual
@docs hangingPunctuation, first, last, forceEnd, allowEnd
@docs lineClamp


## Font Size

@docs fontSize, xxSmall, xSmall, small, medium, large, xLarge, xxLarge, smaller, larger, lineHeight
@docs fontSizeAdjust


## Font Family

@docs fontFamily, fontFamilies, serif, sansSerif, monospace, cursive, fantasy, systemUi


## Font Styles

@docs fontStyle, italic, oblique

[`normal`](#normal) is also a supported font style.


## Font Weights

@docs fontWeight, bold, lighter, bolder

[`normal`](#normal) is also a supported font weight.

@docs fontStretch, ultraCondensed, extraCondensed, condensed, semiCondensed, normal, semiExpanded, expanded, extraExpanded, ultraExpanded


## Font Variant Caps

@docs fontVariantCaps, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps


## Font Variant Ligatures

@docs fontVariantLigatures, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual


## Font Variant Numeric

@docs fontVariantNumeric, fontVariantNumeric4, ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions


# Align Items

@docs stretch, center, start, end, flexStart, flexEnd, selfStart, selfEnd, left_, right_, top_, bottom_, baseline, firstBaseline, lastBaseline, safeCenter, unsafeCenter


# Url

@docs url


## Cursors

@docs cursor, pointer, default, contextMenu, help, progress, wait, cell
@docs crosshair, text, verticalText, alias, copy, move, noDrop
@docs notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
@docs wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
@docs neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing


## List Style Type

@docs listStyle, listStyle2, listStyle3, listStylePosition
@docs inside, outside
@docs arabicIndic, armenian, bengali, cjkEarthlyBranch, cjkHeavenlyStem, devanagari, georgian, gujarati, gurmukhi, kannada, khmer, lao, malayalam, myanmar, oriya, telugu, thai


## Shared Values

Multiple CSS properties use these values.

@docs auto, none
@docs hidden, visible
@docs contentBox, borderBox


## Overflow

@docs overflow, overflowX, overflowY
@docs overflowAnchor

@docs overflowWrap
@docs breakWord


## Angles

@docs deg, grad, rad, turn


## Direction

@docs direction, ltr, rtl


## Text Align

@docs justify, matchParent, textAlign, textJustify, interWord, interCharacter, textUnderlinePositon, under


## Text Orientation

@docs textOrientation
@docs mixed, sideways, upright


## Text Rendering

@docs textRendering
@docs geometricPrecision, optimizeLegibility, optimizeSpeed


## Text Transform

@docs textTransform
@docs capitalize, uppercase, lowercase, fullWidth


## Text Decoration

@docs textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorationLine2, textDecorationLine3, textDecorationStyle, textDecorationColor
@docs textDecorationSkip, objects, spaces, ink, edges, boxDecoration

@docs wavy, underline, overline, lineThrough

@docs textStroke, textStroke2, textStrokeColor, textStrokeWidth


# Tables


## Border Collapse

@docs borderCollapse
@docs collapse, separate


## Border Spacing

@docs borderSpacing, borderSpacing2


## Caption Side

@docs captionSide


## Empty Cells

@docs emptyCells
@docs show, hide


## Table Layout

@docs tableLayout


## Vertical Align

@docs verticalAlign
@docs sub, super, textTop, textBottom, middle


## White space

@docs whiteSpace
@docs pre, preWrap, preLine, nowrap


## Word break

@docs wordBreak
@docs breakAll, keepAll


## Float

@docs float
@docs clear, both, inlineStart, inlineEnd


# Visibility

@docs visibility


# Flexbox

@docs order


# SVG


## Fill

@docs fill


## Stroke

@docs strokeDasharray, strokeDashoffset, strokeWidth, strokeAlign, strokeColor, strokeImage, strokeMiterlimit, strokeOpacity, strokePosition, strokePosition2, strokePosition4, strokeRepeat, strokeRepeat2, strokeSize, strokeSize2, strokeDashCorner
@docs strokeLinecap, butt, square
@docs strokeBreak, boundingBox, slice, clone
@docs strokeOrigin, fillBox, strokeBox
@docs strokeLinejoin, strokeLinejoin2, crop, arcs, miter, bevel
@docs strokeDashJustify, compress, dashes, gaps


# Columns

@docs columns, columns2, columnWidth, columnCount, columnGap, columnRuleWidth, columnRuleStyle, columnRuleColor, columnRule, columnRule2, columnRule3
@docs columnFill, balance, balanceAll
@docs columnSpan, all_


# Transformation

@docs transform, transformOrigin, transformOrigin2


## Matrix transformation

@docs matrix, matrix3d


## Perspective

@docs perspective


## Rotation

@docs rotate, rotateX, rotateY, rotateZ, rotate3d


## Scaling (resizing)

@docs scale, scale2, scaleX, scaleY, scaleZ, scale3d


## Skewing (distortion)

@docs skew, skew2, skewX, skewY


## Translation (moving)

@docs translate, translate2, translateX, translateY, translateZ, translate3d


# Opacity

@docs opacity


# Viewport

@docs zoom


# Scroll

@docs scrollBehavior, smooth, scrollSnapAlign, always, scrollSnapStop
@docs scrollSnapType, scrollSnapType2, x, y, mandatory, proximity
@docs scrollMargin, scrollMargin2, scrollMargin3, scrollMargin4, scrollMarginTop, scrollMarginLeft, scrollMarginRight, scrollMarginBottom
@docs scrollPadding, scrollPadding2, scrollPadding3, scrollPadding4, scrollPaddingTop, scrollPaddingLeft, scrollPaddingRight, scrollPaddingBottom


# Accessibility

@docs speak, spellOut
@docs userSelect
@docs unicodeBidi, embed, bidiOverride, isolateOverride, plaintext


# Printing

@docs bleed
@docs orphans, widows
@docs breakInside, avoid, avoidPage, avoidColumn, avoidRegion
@docs pageBreakBefore, pageBreakInside, pageBreakAfter


# Rendering

@docs mixBlendMode
@docs imageRendering, crispEdges, pixelated
@docs backfaceVisibility
@docs objectFit, fill_, scaleDown
@docs objectPosition, objectPosition2, objectPosition4
@docs boxDecorationBreak
@docs isolation, isolate


# Other

@docs caretColor
@docs pointerEvents

-}

import Css.Preprocess as Preprocess exposing (Style(..))
import Css.Structure as Structure



-- TYPES --


{-| A CSS property (such as `color`), or multiple properties grouped into one.

    invisible : Style
    invisible =
        display none

This corresponds to the CSS `display: none`.

    boldAndUnderlineOnHover : Style
    boldAndUnderlineOnHover =
        hover [ textDecoration underline, fontWeight bold ]

This (roughly) corresponds to the CSS `:hover { text-decoration: underline; font-weight: bold; }`.

You can use `Style` values to reuse styles (like [mixins](http://sass-lang.com/guide#topic-6)
in other CSS systems). [`batch`](#batch) comes in handy for this!

-}
type alias Style =
    Preprocess.Style


{-| A value that can be passed to a CSS property.

    limeGreen : Value { supports | rgb : Supported }
    limeGreen =
        rgb 0 100 44

The type variable value of `{ supports | rgb : Supported }` is there because
CSS has so many overloaded values. For example, it's important that
`display none` and `flex none` both compile, yet whereas `display block` should
compile, `flex block` should not. Having open records in the type variables
for `Value` makes satisfying these overlapping constraints possible.

For convenience, there are type aliases for certain values which are often
reused. [`Color`](#Color) is one of these.

    limeGreen : Css.Color
    limeGreen =
        rgb 0 100 44

-}
type Value supports
    = Value String


{-| A type used to specify which properties and which values work together.
-}
type Supported
    = Supported



-- CUSTOM PROPERTIES --


{-| Define a custom property.

    css [ property "-webkit-font-smoothing" "none" ]

...outputs

    -webkit-font-smoothing: none;

-}
property : String -> String -> Style
property key value =
    Preprocess.AppendProperty (key ++ ":" ++ value)



-- STYLES --


{-| Create a style from multiple other styles.

    underlineOnHover =
        batch
            [ textDecoration none

            , hover
                [ textDecoration underline ]
            ]

    css
        [ color (rgb 128 64 32)
        , underlineOnHover
        ]

...has the same result as:

    css
        [ color (rgb 128 64 32)
        , textDecoration none
        , hover
            [ textDecoration underline ]
        ]

-}
batch : List Style -> Style
batch =
    Preprocess.ApplyStyles



-- GLOBAL VALUES --


{-| The [`inherit`](https://developer.mozilla.org/en-US/docs/Web/CSS/inherit) value.
Any CSS property can be set to this value.

    display inherit

-}
inherit : Value { provides | inherit : Supported }
inherit =
    Value "inherit"


{-| The [`initial`](https://developer.mozilla.org/en-US/docs/Web/CSS/initial) value.
Any CSS property can be set to this value.

    display initial

    borderStyle initial

-}
initial : Value { provides | initial : Supported }
initial =
    Value "initial"


{-| The [`unset`](https://developer.mozilla.org/en-US/docs/Web/CSS/unset) value.
Any CSS property can be set to this value.

    display unset

    borderStyle unset

-}
unset : Value { provides | unset : Supported }
unset =
    Value "unset"


{-| Sets an [`all`](https://css-tricks.com/almanac/properties/a/all/) property.

    all inherit

-}
all :
    Value
        { accepts
            | revert : Supported
            , initial : Supported
            , inherit : Supported
            , unset : Supported
        }
    -> Style
all (Value val) =
    AppendProperty ("all:" ++ val)


{-| The `revert` value for the [`all`](#all) property.

    all revert

-}
revert : Value { provides | revert : Supported }
revert =
    Value "revert"



-- SHARED VALUES --


{-| The `url` value for the [`cursor`](#cursor),
[`fill`](#fill),
[`strokeImage`](#strokeImage),
and [`backgroundImage`](#backgroundImage) properties.
-}
url : String -> Value { provides | url : Supported }
url str =
    Value ("url(" ++ str ++ ")")


{-| The `auto` value used for properties such as [`width`](#width),
and [`zoom`](#zoom).

    width auto

    zoom auto

-}
auto : Value { provides | auto : Supported }
auto =
    Value "auto"


{-| The `none` value used for properties such as [`display`](#display),
[`borderStyle`](#borderStyle),
[`clear`](#clear),
and [`strokeDashJustify`](#strokeDashJustify).

    display none

    borderStyle none

    strokeDashJustify none

-}
none : Value { provides | none : Supported }
none =
    Value "none"


{-| The `hidden` value used for properties such as [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/), [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/) and [`border style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style).

    visibility hidden

    overflow hidden

    borderStyle hidden

-}
hidden : Value { provides | hidden : Supported }
hidden =
    Value "hidden"


{-| The `visible` value used for properties such as [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/), [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/) and [`pointer-events`](https://developer.mozilla.org/en-US/docs/Web/CSS/pointer-events).

    visibility visible

    overflow visible

    pointerEvents visible

-}
visible : Value { provides | visible : Supported }
visible =
    Value "visible"


{-| The `scroll` value used for properties such as [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) and [`background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment).

    overflow scroll

    backgroundAttachment scroll

-}
scroll : Value { provides | scroll : Supported }
scroll =
    Value "scroll"


{-| The `content-box` value, used with [`boxSizing`](#boxSizing),
[`backgroundClip`](#backgroundClip), [`backgroundOrigin`](#backgroundOrigin),
and [`strokeOrigin`](#strokeOrigin).

    boxSizing contentBox

    backgroundClip contentBox

    backgroundOrigin contentBox

    strokeOrigin contentBox

-}
contentBox : Value { provides | contentBox : Supported }
contentBox =
    Value "content-box"


{-| The `border-box` value, used with [`boxSizing`](#boxSizing),
[`backgroundClip`](#backgroundClip), [`backgroundOrigin`](backgroundOrigin),
and [`strokeOrigin`](#strokeOrigin).

    boxSizing borderBox

    backgroundClip borderBox

    backgroundOrigin borderBox

    strokeOrigin borderBox

-}
borderBox : Value { provides | borderBox : Supported }
borderBox =
    Value "border-box"



-- OVERFLOW --


{-| Sets [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflow visible

    overflow hidden

    overflow scroll

    overflow auto

-}
overflow :
    Value
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
overflow (Value val) =
    AppendProperty ("overflow:" ++ val)


{-| Sets [`overflow-x`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflowX visible

    overflowX hidden

    overflowX scroll

    overflowX auto

-}
overflowX :
    Value
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
overflowX (Value val) =
    AppendProperty ("overflow-x:" ++ val)


{-| Sets [`overflow-y`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflowY visible

    overflowY hidden

    overflowY scroll

    overflowY auto

-}
overflowY :
    Value
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
overflowY (Value val) =
    AppendProperty ("overflow-y:" ++ val)


{-| Sets [`overflow-wrap`](https://css-tricks.com/almanac/properties/o/overflow-wrap/)

    overflowWrap breakWord

    overflowWrap normal

-}
overflowWrap :
    Value
        { breakWord : Supported
        , normal : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
overflowWrap (Value val) =
    AppendProperty ("overflow-wrap:" ++ val)


{-| The `break-word` value, which can be used with such properties as
[`overflow-wrap`](https://css-tricks.com/almanac/properties/o/overflow-wrap/)
and [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/).

    overflowWrap breakWord

    wordBreak breakWord

-}
breakWord : Value { provides | breakWord : Supported }
breakWord =
    Value "break-word"



-- COLORS --


{-| A color created with [`hex`](#hex), [`rgb`](#rgb), [`rgba`](#rgba),
[`hsl`](#hsl), or [`hsla`](#hsla). `Color` can be used to annotate values
returned by any of those functions.

    limeGreen : Css.Color
    limeGreen =
        rgb 0 100 44

    rebeccaPurple : Css.Color
    rebeccaPurple =
        hex "#663399"

-}
type alias Color =
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        }


{-| Sets [`color`](https://css-tricks.com/almanac/properties/c/color/).

    color (hex "#60b5cc")

    color (rgb 96 181 204)

    color (rgba 96 181 204 0.5)

-}
color :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
color (Value val) =
    AppendProperty ("color:" ++ val)


{-| Sets [`background-color`](https://css-tricks.com/almanac/properties/b/background-color/).

    backgroundColor (hex "#60b5cc")

    backgroundColor (rgb 96 181 204)

    backgroundColor (rgba 96 181 204 0.5)

-}
backgroundColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
backgroundColor (Value val) =
    AppendProperty ("background-color:" ++ val)


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in functional notation.

    color (rgb 96 181 204)

-}
rgb : Int -> Int -> Int -> Value { provides | rgb : Supported }
rgb red green blue =
    Value <|
        "rgb("
            ++ String.fromInt red
            ++ ","
            ++ String.fromInt green
            ++ ","
            ++ String.fromInt blue
            ++ ")"


{-| [RGBA color value](https://css-tricks.com/the-power-of-rgba/).

    color (rgba 96 181 204 0.25)

-}
rgba : Int -> Int -> Int -> Float -> Value { provides | rgba : Supported }
rgba red green blue alpha =
    Value <|
        "rgba("
            ++ String.fromInt red
            ++ ","
            ++ String.fromInt green
            ++ ","
            ++ String.fromInt blue
            ++ ","
            ++ String.fromFloat alpha
            ++ ")"


{-| [HSL color value](https://css-tricks.com/mother-effing-hsl/).

The `s` and `l` values are expressed as a number between 0 and 1 and are converted to the appropriate percentage.

    color (hsl 193 0.51 0.59) -- hsl(193, 51%, 59%)

-}
hsl : Float -> Float -> Float -> Value { provides | hsl : Supported }
hsl hueVal sat lightness =
    Value <|
        "hsl("
            ++ String.fromFloat hueVal
            ++ ","
            ++ String.fromFloat (sat * 100)
            ++ "%,"
            ++ String.fromFloat (lightness * 100)
            ++ "%"
            ++ ")"


{-| [HSLA color value](https://css-tricks.com/yay-for-hsla/)

The `s` and `l` values are expressed as a number between 0 and 1 and are converted to the appropriate percentage.

    color (hsla 193 0.51 0.59 0.25) -- hsl(193, 51%, 59%, 0.25)

-}
hsla : Float -> Float -> Float -> Float -> Value { provides | hsla : Supported }
hsla hueVal sat lightness alpha =
    Value <|
        "hsla("
            ++ String.fromFloat hueVal
            ++ ","
            ++ String.fromFloat (sat * 100)
            ++ "%,"
            ++ String.fromFloat (lightness * 100)
            ++ "%,"
            ++ String.fromFloat alpha
            ++ ")"


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()) in hexadecimal notation.

You can optionally include `#` as the first character, for benefits like syntax highlighting in editors, ease of copy/pasting from tools which express these as e.g. `#abcdef0`, etc.

    color (hex "#60b5cc")

    color (hex "60b5cc")

-}
hex : String -> Value { provides | hex : Supported }
hex str =
    Value <|
        if String.startsWith "#" str then
            str

        else
            "#" ++ str



-- POSITIONS --


{-| Sets the [`position`](https://css-tricks.com/almanac/properties/p/position/) of an element.

    position absolute

    position relative

-}
position :
    Value
        { absolute : Supported
        , fixed : Supported
        , relative : Supported
        , static : Supported
        , sticky : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
position (Value val) =
    AppendProperty ("position:" ++ val)


{-| Sets the [`top` property](https://css-tricks.com/almanac/properties/t/top/).

    top (px 10)

    top (pct 50)

    top auto

    top zero

If you need to use `top` as a CSS _value_ instead of as a _property_,
for example in `vertical-align: top`, use [`top_`](#top_) instead of this.

-}
top :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
top (Value val) =
    AppendProperty ("top:" ++ val)


{-| Sets the [`bottom` property](https://css-tricks.com/almanac/properties/b/bottom/).

    bottom (px 10)

    bottom (pct 50)

    bottom auto

    bottom zero

If you need to use `bottom` as a CSS _value_ instead of as a _property_,
for example in `vertical-align: bottom`, use [`bottom_`](#bottom_) instead of this.

-}
bottom :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
bottom (Value val) =
    AppendProperty ("bottom:" ++ val)


{-| Sets the [`left` property](https://css-tricks.com/almanac/properties/l/left/).

    left (px 10)

    left (pct 50)

    left auto

    left zero

If you need to use `left` as a CSS _value_ instead of as a _property_,
for example in `float: left`, use [`left_`](#left_) instead of this.

-}
left :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
left (Value val) =
    AppendProperty ("left:" ++ val)


{-| Sets the [`right` property](https://css-tricks.com/almanac/properties/r/right).

    right (px 10)

    right (pct 50)

    right auto

    right zero

If you need to use `right` as a CSS _value_ instead of as a _property_,
for example in `float: right`, use [`right_`](#right_) instead of this.

-}
right :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
right (Value val) =
    AppendProperty ("right:" ++ val)


{-| An [`absolute` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#relative).

    position absolute

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](<https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/>

-}
absolute : Value { provides | absolute : Supported }
absolute =
    Value "absolute"


{-| A [`fixed` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values)
or [`fixed` `background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)
or [`fixed` `table-layout`](https://css-tricks.com/almanac/properties/t/table-layout/)

    position fixed

    backgroundAttachment fixed

    tableLayout fixed

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/)

-}
fixed : Value { provides | fixed : Supported }
fixed =
    Value "fixed"


{-| A [`relative` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values).

    position relative

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/).

-}
relative : Value { provides | relative : Supported }
relative =
    Value "relative"


{-| A [`static` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values).

    position static

This is the default `position` value. See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/).

-}
static : Value { provides | static : Supported }
static =
    Value "static"


{-| A [`sticky` `position`](https://css-tricks.com/position-sticky-2/)

    position sticky

The default `position` value is [`static`](#static). See also [the differences between absolute, relative, and fixed positioning](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/).

-}
sticky : Value { provides | sticky : Supported }
sticky =
    Value "sticky"


{-| Sets [`z-index`](https://css-tricks.com/almanac/properties/z/z-index/)

    zIndex (int 10)

    zIndex auto

**NOTE:** Z-index is not as simple as it looks! Make sure to read about [stacking contexts](https://css-tricks.com/css-stacking-contexts/) if you're not already familiar with them.

-}
zIndex :
    Value
        { int : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
zIndex (Value val) =
    AppendProperty ("z-index:" ++ val)



-- PADDINGS --


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom paddings are set to the first value and the right and
left paddings are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    padding (em 4) -- set all margins to 4em

    padding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    padding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    padding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
padding :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
padding (Value value) =
    AppendProperty ("padding:" ++ value)


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding2` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    padding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

-}
padding2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
padding2 (Value valueTopBottom) (Value valueRightLeft) =
    AppendProperty ("padding:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding3` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

The top padding is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    padding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

-}
padding3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
padding3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    AppendProperty ("padding:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`padding`](https://css-tricks.com/almanac/properties/p/padding/) property.
The `padding4` property is a shorthand property for setting `padding-top`,
`padding-right`, `padding-bottom`, and `padding-left` in a single declaration.

The four values apply to the top, right, bottom, and left paddings.

    padding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
padding4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
padding4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("padding:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top) property.

    paddingTop (px 4)

-}
paddingTop :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
paddingTop (Value value) =
    AppendProperty ("padding-top:" ++ value)


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right) property.

    paddingRight (px 4)

-}
paddingRight :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
paddingRight (Value value) =
    AppendProperty ("padding-right:" ++ value)


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom) property.

    paddingBottom (px 4)

-}
paddingBottom :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
paddingBottom (Value value) =
    AppendProperty ("padding-bottom:" ++ value)


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left) property.

    paddingLeft (px 4)

-}
paddingLeft :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
paddingLeft (Value value) =
    AppendProperty ("padding-left:" ++ value)



-- MARGINS --


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom margins are set to the first value and the right and
left margins are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    margin (em 4) -- set all margins to 4em

    margin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    margin3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    margin4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
margin (Value value) =
    AppendProperty ("margin:" ++ value)


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin2` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    margin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
margin2 (Value valueTopBottom) (Value valueRightLeft) =
    AppendProperty ("margin:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin3` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

The top margin is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    margin3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
margin3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    AppendProperty ("margin:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`margin`](https://css-tricks.com/almanac/properties/m/margin/) property.
The `margin4` property is a shorthand property for setting `margin-top`,
`margin-right`, `margin-bottom`, and `margin-left` in a single declaration.

The four values apply to the top, right, bottom, and left margins.

    margin4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
margin4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
margin4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("margin:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top) property.

    marginTop (px 4)

This article on [`margin-top` versus `margin-bottom`](https://css-tricks.com/margin-bottom-margin-top/) may be useful.

-}
marginTop :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
marginTop (Value value) =
    AppendProperty ("margin-top:" ++ value)


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right) property.

    marginRight (px 4)

-}
marginRight :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
marginRight (Value value) =
    AppendProperty ("margin-right:" ++ value)


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom) property.

    marginBottom (px 4)

This article on [`margin-top` versus `margin-bottom`](https://css-tricks.com/margin-bottom-margin-top/) may be useful.

-}
marginBottom :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
marginBottom (Value value) =
    AppendProperty ("margin-bottom:" ++ value)


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left) property.

    marginLeft (px 4)

-}
marginLeft :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
marginLeft (Value value) =
    AppendProperty ("margin-left:" ++ value)



-- BOX SIZING --


{-| Sets [`box-sizing`](https://css-tricks.com/almanac/properties/b/box-sizing/) property.

    boxSizing contentBox

    boxSizing borderBox

-}
boxSizing :
    Value
        { contentBox : Supported
        , borderBox : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
boxSizing (Value value) =
    AppendProperty ("box-sizing:" ++ value)



-- PSEUDO-CLASSES --


{-| Define a custom pseudo-class.

This can be useful for deprecated [pseudo-classes](https://css-tricks.com/pseudo-class-selectors/) such as `-moz-any-link`, which
[has been deprecated and removed](https://www.fxsitecompat.com/en-CA/docs/2016/any-link-css-pseudo-class-has-been-unprefixed/)
in modern browsers.

    button
        [ css [ pseudoClass "-moz-any-link" [ color (hex "f00") ] ] ]
        [ text "Whee!" ]

...outputs

    <button class="f9fcb2">Whee!</button>

    <style>
        .f9fcb2:-moz-any-link {
            color: #f00;
        }
    </style>

-}
pseudoClass : String -> List Style -> Style
pseudoClass pseudoClassName =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector pseudoClassName)


{-| An [`:active`](https://css-tricks.com/almanac/selectors/a/active/)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    button [ active [ color (rgb 12 160 190) ] ]

-}
active : List Style -> Style
active =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector "active")


{-| A [`:disabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    button [ disabled [ color (rgb 194 194 194) ] ]

-}
disabled : List Style -> Style
disabled =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector "disabled")



-- PSEUDO-ELEMENTS--


{-| Define a custom [pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    textarea
        [ css [ pseudoElement "-webkit-scrollbar" [ display none ] ] ]
        []

...outputs

    <textarea class="d84ff7"></textarea>

    <style>
        .d84ff7::-webkit-scrollbar {
            display: none;
        }
    </style>

-}
pseudoElement : String -> List Style -> Style
pseudoElement element =
    Preprocess.WithPseudoElement (Structure.PseudoElement element)


{-| An [`::after`](https://css-tricks.com/almanac/selectors/a/after-and-before/)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    div [ after [ content "hi!" ] ]

--TODO : Introduce aw way to do [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/content) - lots of options there, not just text. Also it's overloaded with `flexBasis content`.

-}
after : List Style -> Style
after =
    Preprocess.WithPseudoElement (Structure.PseudoElement "after")


{-| A [`::before`](https://css-tricks.com/almanac/selectors/a/after-and-before/)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    div [ before [ content "hi!" ] ]

--TODO : Introduce aw way to do [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/content) - lots of options there, not just text. Also it's overloaded with `flexBasis content`.

-}
before : List Style -> Style
before =
    pseudoElement "before"



-- NUMBERS --


{-| Compiles to a 0 with no units.

    css [ padding zero ]

...compiles to:

    padding: 0;

This conveniently lets you avoid doing things like `padding (px 0)`

-}
zero : Value { provides | zero : Supported }
zero =
    Value "0"


{-| [`px`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (px 5)

-}
px : Float -> Value { provides | px : Supported }
px value =
    Value (String.fromFloat value ++ "px")


{-| [`em`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (em 5)

-}
em : Float -> Value { provides | em : Supported }
em value =
    Value (String.fromFloat value ++ "em")


{-| [`ex`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (ex 5)

-}
ex : Float -> Value { provides | ex : Supported }
ex value =
    Value (String.fromFloat value ++ "ex")


{-| [`ch`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (ch 5)

-}
ch : Float -> Value { provides | ch : Supported }
ch value =
    Value (String.fromFloat value ++ "ch")


{-| [`rem`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (rem 5)

-}
rem : Float -> Value { provides | rem : Supported }
rem value =
    Value (String.fromFloat value ++ "rem")


{-| [`vh`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vh 5)

-}
vh : Float -> Value { provides | vh : Supported }
vh value =
    Value (String.fromFloat value ++ "vh")


{-| [`vw`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vw 5)

-}
vw : Float -> Value { provides | vw : Supported }
vw value =
    Value (String.fromFloat value ++ "vw")


{-| [`vmin`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vmin 5)

-}
vmin : Float -> Value { provides | vmin : Supported }
vmin value =
    Value (String.fromFloat value ++ "vmin")


{-| [`vmax`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vmax 5)

-}
vmax : Float -> Value { provides | vmax : Supported }
vmax value =
    Value (String.fromFloat value ++ "vmax")


{-| [`mm`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (mm 5)

-}
mm : Float -> Value { provides | mm : Supported }
mm value =
    Value (String.fromFloat value ++ "mm")


{-| [`cm`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (cm 5)

-}
cm : Float -> Value { provides | cm : Supported }
cm value =
    Value (String.fromFloat value ++ "cm")


{-| [`in`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (inches 5)

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)

-}
inches : Float -> Value { provides | inches : Supported }
inches value =
    Value (String.fromFloat value ++ "in")


{-| [`pt`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pt 5)

-}
pt : Float -> Value { provides | pt : Supported }
pt value =
    Value (String.fromFloat value ++ "pt")


{-| [`pc`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pc 5)

-}
pc : Float -> Value { provides | pc : Supported }
pc value =
    Value (String.fromFloat value ++ "pc")


{-| [`pct`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pct 5)

-}
pct : Float -> Value { provides | pct : Supported }
pct value =
    Value (String.fromFloat value ++ "%")


{-| A unitless number. Useful with properties like
[`flexGrow`](#flexGrow),
and [`order`](#order)
which accept unitless numbers.

    flexGrow (num 2)

    order (num -2)

-}
num : Float -> Value { provides | num : Supported }
num value =
    Value (String.fromFloat value)


{-| A unitless integer. Useful with properties like [`zIndex`](#zIndex) which accept unitless integers.

    zIndex (int 3)

-}
int : Int -> Value { provides | int : Supported }
int value =
    Value (String.fromInt value)



-- BOX SHADOW --


{-| Configuration for [`boxShadow`](#boxShadow).
-}
type alias BoxShadowConfig =
    { offsetX :
        Value
            { px : Supported
            , em : Supported
            , ex : Supported
            , ch : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , mm : Supported
            , cm : Supported
            , inches : Supported
            , pt : Supported
            , pc : Supported
            , pct : Supported
            , zero : Supported
            , calc : Supported
            }
    , offsetY :
        Value
            { px : Supported
            , em : Supported
            , ex : Supported
            , ch : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , mm : Supported
            , cm : Supported
            , inches : Supported
            , pt : Supported
            , pc : Supported
            , pct : Supported
            , zero : Supported
            , calc : Supported
            }
    , blurRadius :
        Maybe
            (Value
                { px : Supported
                , em : Supported
                , ex : Supported
                , ch : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmin : Supported
                , vmax : Supported
                , mm : Supported
                , cm : Supported
                , inches : Supported
                , pt : Supported
                , pc : Supported
                , pct : Supported
                , zero : Supported
                , calc : Supported
                }
            )
    , spreadRadius :
        Maybe
            (Value
                { px : Supported
                , em : Supported
                , ex : Supported
                , ch : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmin : Supported
                , vmax : Supported
                , mm : Supported
                , cm : Supported
                , inches : Supported
                , pt : Supported
                , pc : Supported
                , pct : Supported
                , zero : Supported
                , calc : Supported
                }
            )
    , color :
        Maybe
            (Value
                { rgb : Supported
                , rgba : Supported
                , hsl : Supported
                , hsla : Supported
                , hex : Supported
                , transparent : Supported
                , currentColor : Supported
                }
            )
    , inset : Bool
    }


{-| Default [`boxShadow`](#boxShadow) configuration.

It is equivalent to the following CSS:

    box-shadow: 0 0;

-}
defaultBoxShadow : BoxShadowConfig
defaultBoxShadow =
    { offsetX = zero
    , offsetY = zero
    , blurRadius = Nothing
    , spreadRadius = Nothing
    , color = Nothing
    , inset = False
    }


{-| Sets [`box-shadow`](https://css-tricks.com/almanac/properties/b/box-shadow/).

    boxShadow [] -- "box-shadow: none"

    -- "box-shadow: 3px 5px #aabbcc"
    button
        [ css
            [ boxShadow
                [ { defaultBoxShadow
                    | offsetX = px 3
                    , offsetY = px 5
                    , color = Just (hex "#aabbcc")
                  }
                ]
            ]
        ]
        [ text "Zap!" ]

-}
boxShadow : List BoxShadowConfig -> Style
boxShadow configs =
    let
        value =
            case configs of
                [] ->
                    "none"

                _ ->
                    configs
                        |> List.map boxShadowConfigToString
                        |> String.join ", "
    in
    AppendProperty ("box-shadow:" ++ value)


boxShadowConfigToString : BoxShadowConfig -> String
boxShadowConfigToString config =
    let
        (Value offsetX) =
            config.offsetX

        (Value offsetY) =
            config.offsetY

        blurRadius =
            case config.blurRadius of
                Just (Value value) ->
                    " " ++ value

                Nothing ->
                    ""

        spreadRadius =
            case config.spreadRadius of
                Just (Value value) ->
                    " " ++ value

                Nothing ->
                    ""

        insetStr =
            if config.inset then
                "inset "

            else
                ""

        colorVal =
            config.color
                |> Maybe.map (unpackValue >> (++) " ")
                |> Maybe.withDefault ""
    in
    insetStr ++ offsetX ++ " " ++ offsetY ++ blurRadius ++ spreadRadius ++ colorVal



-- CALC --


{-| The css [`calc`](https://css-tricks.com/a-couple-of-use-cases-for-calc) function.

    almostPct100 =
        calc (pct 100) (minus (px 2))

    -- The following compiles to: calc(100vh - (2px + 2rem))
    screenMinusBorderAndFooter =
        calc (vh 100) (minus (calc (px 2) (plus (rem 2))))

    myWidth =
        width almostPct100

    myHeight =
        height screenMinusBorderAndFooter

**CAUTION:** `calc` can easily be used to create invalid CSS values! For example,
`zIndex (calc (pct 100) (minus (px 5)))` compiles to `z-index: calc(100% - 5px);`
which is invalid. According to the spec, `calc` may return values that have no
relation to its arguments, so unfortunately there's not much `elm-css` can do
to make `calc` more reliable. Use with caution!

-}
calc :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , num : Supported
        , int : Supported
        , zero : Supported
        , calc : Supported
        }
    -> CalcOperation
    -> Value { provides | calc : Supported }
calc (Value head) (CalcOperation operation) =
    Value
        ("calc("
            ++ getCalcExpression head
            ++ operation
            ++ ")"
        )


{-| Either [`plus`](#plus) or [`minus`](#minus).

See [`calc`](#calc) for how to use this.

-}
type CalcOperation
    = CalcOperation String


getCalcExpression : String -> String
getCalcExpression str =
    if String.startsWith "calc(" str then
        String.dropLeft 4 str

    else
        str


{-| Use with [`calc`](#calc) to subtract one value from another.

    calc (pct 100) (minus (px 2))
    -- calc: (100% - 2px)

-}
minus :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , num : Supported
        , int : Supported
        , zero : Supported
        , calc : Supported
        }
    -> CalcOperation
minus (Value second) =
    -- The calc `-` operator MUST be surrounded by whitespace.
    CalcOperation (" - " ++ getCalcExpression second)


{-| Use with [`calc`](#calc) to add one numeric value to another.

    calc (pct 100) (plus (px 2))
    -- calc: (100% + 2px)

-}
plus :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , num : Supported
        , int : Supported
        , zero : Supported
        , calc : Supported
        }
    -> CalcOperation
plus (Value second) =
    -- The calc `+` operator MUST be surrounded by whitespace.
    CalcOperation (" + " ++ getCalcExpression second)


{-| Use with [`calc`](#calc) to multiply a value by a unitless number.

    calc (pct 100) (times (int 2))
    -- calc: (100% * 2px)

-}
times :
    Value
        { num : Supported
        , int : Supported
        , zero : Supported
        }
    -> CalcOperation
times (Value second) =
    -- The calc `*` operator does not need to be surrounded by whitespace.
    CalcOperation ("*" ++ getCalcExpression second)


{-| Use with [`calc`](#calc) to divide a value by a unitless number.

    calc (pct 100) (dividedBy (int 2))
    -- calc: (100% / 2px)

-}
dividedBy :
    Value
        { num : Supported
        , int : Supported
        , zero : Supported
        }
    -> CalcOperation
dividedBy (Value second) =
    -- The calc `/` operator does not need to be surrounded by whitespace.
    CalcOperation ("/" ++ getCalcExpression second)



-- DISPLAY --


{-| Sets [`display`](https://css-tricks.com/almanac/properties/d/display/).

    display block

For `display: flex`, use [`displayFlex`](#displayFlex).

-}
display :
    Value
        { block : Supported
        , grid : Supported
        , inline : Supported
        , inlineBlock : Supported
        , inlineFlex : Supported
        , none : Supported
        , table : Supported
        , tableCaption : Supported
        , tableCell : Supported
        , tableColumn : Supported
        , tableColumnGroup : Supported
        , tableFooterGroup : Supported
        , tableHeaderGroup : Supported
        , tableRow : Supported
        , tableRowGroup : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
display (Value val) =
    AppendProperty ("display:" ++ val)


{-| [`display: flex`](https://css-tricks.com/snippets/css/a-guide-to-flexbox/). This works around the fact that [`flex` is already taken](#flex).

    div [ displayFlex ]

-}
displayFlex : Style
displayFlex =
    AppendProperty "display:flex"


{-| The `block` value used by [`display`](#display)

    display block

-}
block : Value { provides | block : Supported }
block =
    Value "block"


{-| The `grid` value used by [`display`](#display)

    display grid

-}
grid : Value { provides | block : Supported }
grid =
    Value "grid"


{-| The `inline` value used by [`display`](#display)

    display inline

-}
inline : Value { provides | inline : Supported }
inline =
    Value "inline"


{-| The `inline-block` value used by [`display`](#display)

    display inlineBlock

-}
inlineBlock : Value { provides | inlineBlock : Supported }
inlineBlock =
    Value "inline-block"


{-| The `inline-flex` value used by [`display`](#display)

    display inlineFlex

-}
inlineFlex : Value { provides | inlineFlex : Supported }
inlineFlex =
    Value "inline-flex"


{-| The `table` value used by [`display`](#display)

    display table

-}
table : Value { provides | table : Supported }
table =
    Value "table"


{-| The `table-caption` value used by [`display`](#display)

    display tableCaption

-}
tableCaption : Value { provides | tableCaption : Supported }
tableCaption =
    Value "table-caption"


{-| The `table-cell` value used by [`display`](#display)

    display tableCell

-}
tableCell : Value { provides | tableCell : Supported }
tableCell =
    Value "table-cell"


{-| The `table-column` value used by [`display`](#display)

    display tableColumn

-}
tableColumn : Value { provides | tableColumn : Supported }
tableColumn =
    Value "table-column"


{-| The `table-column-group` value used by [`display`](#display)

    display tableColumnGroup

-}
tableColumnGroup : Value { provides | tableColumnGroup : Supported }
tableColumnGroup =
    Value "table-column-group"


{-| The `table-footer-group` value used by [`display`](#display)

    display tableFooterGroup

-}
tableFooterGroup : Value { provides | tableFooterGroup : Supported }
tableFooterGroup =
    Value "table-footer-group"


{-| The `table-header-group` value used by [`display`](#display)

    display tableHeaderGroup

-}
tableHeaderGroup : Value { provides | tableHeaderGroup : Supported }
tableHeaderGroup =
    Value "table-header-group"


{-| The `table-row` value used by [`display`](#display)

    display tableRow

-}
tableRow : Value { provides | tableRow : Supported }
tableRow =
    Value "table-row"


{-| The `table-row-group` value used by [`display`](#display)

    display tableRowGroup

-}
tableRowGroup : Value { provides | tableRowGroup : Supported }
tableRowGroup =
    Value "table-row-group"



-- ALIGN-ITEMS VALUES --


{-| -}
stretch : Value { provides | stretch : Supported }
stretch =
    Value "stretch"


{-| -}
center : Value { provides | center : Supported }
center =
    Value "center"


{-| -}
start : Value { provides | start : Supported }
start =
    Value "start"


{-| -}
end : Value { provides | end : Supported }
end =
    Value "end"


{-| -}
flexStart : Value { provides | flexStart : Supported }
flexStart =
    Value "flex-start"


{-| -}
flexEnd : Value { provides | flexEnd : Supported }
flexEnd =
    Value "flex-end"


{-| -}
selfStart : Value { provides | selfStart : Supported }
selfStart =
    Value "self-start"


{-| -}
selfEnd : Value { provides | selfEnd : Supported }
selfEnd =
    Value "self-end"


{-| The `left` value used for alignment.

    float left_

The value is called `left_` instead of `left` because [`left` is already a function](#left).

-}
left_ : Value { provides | left_ : Supported }
left_ =
    Value "left"


{-| The `right` value used for alignment.

    float right_

The value is called `right_` instead of `right` because [`right` is already a function](#right).

-}
right_ : Value { provides | right_ : Supported }
right_ =
    Value "right"


{-| The `top` value used by [`verticalAlign`](#verticalAlign).

    verticalAlign top_

The value is called `top_` instead of `top` because [`top` is already a function](#top).

-}
top_ : Value { provides | top_ : Supported }
top_ =
    Value "top"


{-| The `bottom` value used by [`verticalAlign`](#verticalAlign).

    verticalAlign bottom_

The value is called `bottom_` instead of `bottom` because [`bottom` is already a function](#bottom).

-}
bottom_ : Value { provides | bottom_ : Supported }
bottom_ =
    Value "bottom"


{-| -}
baseline : Value { provides | baseline : Supported }
baseline =
    Value "baseline"


{-| -}
firstBaseline : Value { provides | firstBaseline : Supported }
firstBaseline =
    Value "first baseline"


{-| -}
lastBaseline : Value { provides | lastBaseline : Supported }
lastBaseline =
    Value "last baseline"


{-| -}
safeCenter : Value { provides | safeCenter : Supported }
safeCenter =
    Value "safe center"


{-| -}
unsafeCenter : Value { provides | unsafeCenter : Supported }
unsafeCenter =
    Value "unsafe center"



-- FLEXBOX --


{-| Sets [`align-items`](https://css-tricks.com/almanac/properties/a/align-items/).

    alignItems firstBaseline

**Note:** This function accepts `left_` and `right_` rather than `left` and `right`,
because `Css.left` and `Css.right` are functions!

-}
alignItems :
    Value
        { accepts
            | normal : Supported
            , stretch : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            , baseline : Supported
            , firstBaseline : Supported
            , lastBaseline : Supported
            , safeCenter : Supported
            , unsafeCenter : Supported
            , inherit : Supported
            , initial : Supported
            , unset : Supported
        }
    -> Style
alignItems (Value val) =
    AppendProperty ("align-items:" ++ val)


{-| Sets [`align-self`](https://css-tricks.com/almanac/properties/a/align-self/).

    alignSelf firstBaseline

**Note:** This function accepts `left_` and `right_` rather than `left` and `right`,
because `Css.left` and `Css.right` are functions!

-}
alignSelf :
    Value
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , left_ : Supported
        , right_ : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , safeCenter : Supported
        , unsafeCenter : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
alignSelf (Value val) =
    AppendProperty ("align-self:" ++ val)


{-| Sets [`justify-content`](https://css-tricks.com/almanac/properties/j/justify-content/).

    justifyContent center

-}
justifyContent :
    Value
        { flexStart : Supported
        , flexEnd : Supported
        , center : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
justifyContent (Value val) =
    AppendProperty ("justify-content:" ++ val)


{-| Distribute items evenly, with the first and last items aligned to the start
and end.

    justifyContent spaceBetween

-}
spaceBetween : Value { provides | spaceBetween : Supported }
spaceBetween =
    Value "space-between"


{-| Distribute items evenly, with a half-size space on either end.

    justifyContent spaceAround

-}
spaceAround : Value { provides | spaceAround : Supported }
spaceAround =
    Value "space-around"


{-| Distribute items evenly, with an equal size space between each element and
the start and end.

    justifyContent spaceEvenly

-}
spaceEvenly : Value { provides | spaceEvenly : Supported }
spaceEvenly =
    Value "space-evenly"



-- FONT SIZE --


{-| Sets [`font-size`](https://css-tricks.com/almanac/properties/f/font-size/)

    fontSize xxSmall

    fontSize (px 12)

Check out [fluid typography](https://css-tricks.com/snippets/css/fluid-typography/) for some cool stuff you can do with this.

-}
fontSize :
    Value
        { xxSmall : Supported
        , xSmall : Supported
        , small : Supported
        , medium : Supported
        , large : Supported
        , xLarge : Supported
        , xxLarge : Supported
        , smaller : Supported
        , larger : Supported
        , px : Supported
        , em : Supported
        , ex : Supported
        , ch : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , mm : Supported
        , cm : Supported
        , inches : Supported
        , pt : Supported
        , pc : Supported
        , pct : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontSize (Value val) =
    AppendProperty ("font-size:" ++ val)


{-| The `xx-small` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xxSmall

-}
xxSmall : Value { provides | xxSmall : Supported }
xxSmall =
    Value "xx-small"


{-| The `x-small` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xSmall

-}
xSmall : Value { provides | xSmall : Supported }
xSmall =
    Value "x-small"


{-| The `small` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize small

-}
small : Value { provides | small : Supported }
small =
    Value "small"


{-| The `medium` value used by properties such as [`fontSize`](#fontSize),
[`borderWidth`](#borderWidth),
[`columnRuleWidth`](#columnRuleWidth).

    fontSize medium

    borderWidth medium

    columnRuleWidth medium

The value is equivalent of 3px when using for `border-width`.

-}
medium : Value { provides | medium : Supported }
medium =
    Value "medium"


{-| The `large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize large

-}
large : Value { provides | large : Supported }
large =
    Value "large"


{-| The `x-large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xLarge

-}
xLarge : Value { provides | xLarge : Supported }
xLarge =
    Value "x-large"


{-| The `xx-large` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize xxLarge

-}
xxLarge : Value { provides | xxLarge : Supported }
xxLarge =
    Value "xx-large"


{-| The `smaller` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize smaller

-}
smaller : Value { provides | smaller : Supported }
smaller =
    Value "smaller"


{-| The `larger` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize larger

-}
larger : Value { provides | larger : Supported }
larger =
    Value "larger"



-- FONT FAMILY --


{-| For when your font is one of the six [generic font family names](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E) - [`serif`](#serif), [`sansSerif`](#sansSerif), [`monospace`](#monospace), [`cursive`](#cursive), [`fantasy`](#fantasy), or [`systemUi`](#systemUi).

If you want to refer to a font by its name (like Helvetica or Arial), use [`fontFamilies`](#fontFamilies) instead.

-}
fontFamily :
    Value
        { serif : Supported
        , sansSerif : Supported
        , monospace : Supported
        , cursive : Supported
        , fantasy : Supported
        , systemUi : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontFamily (Value genericFont) =
    AppendProperty ("font-family:" ++ genericFont)


{-| The `serif` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E).

    fontFamily serif

    fontFamilies [ "Gill Sans", "Helvetica" ] serif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilies`](#fontFamilies).

-}
serif : Value { provides | serif : Supported }
serif =
    Value "serif"


{-| The `sans-serif` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E).

    fontFamily sansSerif

    fontFamilies [ "Georgia", "Times" ] sansSerif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilies`](#fontFamilies).

-}
sansSerif : Value { provides | sansSerif : Supported }
sansSerif =
    Value "sans-serif"


{-| The `monospace` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

    fontFamily monospace

    fontFamilies [ "Source Code Pro", "Lucida Console" ] monospace

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilies`](#fontFamilies).

-}
monospace : Value { provides | monospace : Supported }
monospace =
    Value "monospace"


{-| The `cursive` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

    fontFamily cursive

    fontFamilies [ "Brush Sript Std", "Lucida Calligraphy" ] cursive

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilies`](#fontFamilies).

-}
cursive : Value { provides | cursive : Supported }
cursive =
    Value "cursive"


{-| The `fantasy` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

    fontFamily fantasy
    fontFamilies [ "Herculanum", Harrington" ] fantasy

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilies`](#fontFamilies).

-}
fantasy : Value { provides | fantasy : Supported }
fantasy =
    Value "fantasy"


{-| The `system-ui` [generic font family name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#3Cgeneric-name%3E).

You may want to [read more about the system font stack](https://css-tricks.com/snippets/css/system-font-stack/) before using this one.

    fontFamily systemUi

    fontFamilies [ "", "Segoe UI" ] systemUi

    fontFamilies [ "system-ui", "Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" ] sansSerif

This can be used with [`fontFamily`](#fontFamily) and [`fontFamilies`](#fontFamilies).

-}
systemUi : Value { provides | systemUi : Supported }
systemUi =
    Value "system-ui"


{-| Define multiple [font families](https://css-tricks.com/almanac/properties/f/font-family/).

Per the CSS spec, a [generic name](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E) must always be at the end of this list. (The generic names are [`serif`](#serif), [`sansSerif`](#sansSerif), [`monospace`](#monospace), [`cursive`](#cursive) or [`fantasy`](#fantasy).)

    fontFamilies [ "Gill Sans Extrabold", "Helvetica", "Arial" ] sansSerif

This function will automatically wrap each font family in quotation marks unless it is one of the six [generic names]((https://developer.mozilla.org/en-US/docs/Web/CSS/font-family#%3Cgeneric-name%3E)) (like `sans-serif`), which must never be quoted.

-}
fontFamilies :
    List String
    ->
        Value
            { serif : Supported
            , sansSerif : Supported
            , monospace : Supported
            , cursive : Supported
            , fantasy : Supported
            , systemUi : Supported
            }
    -> Style
fontFamilies list (Value genericFont) =
    case list of
        [] ->
            AppendProperty ("font-family:" ++ genericFont)

        fonts ->
            AppendProperty
                ("font-family:"
                    ++ String.join "," (List.map enquoteIfNotGeneric fonts)
                    ++ ("," ++ genericFont)
                )


enquoteIfNotGeneric : String -> String
enquoteIfNotGeneric fontName =
    case fontName of
        "serif" ->
            fontName

        "sans-serif" ->
            fontName

        "monospace" ->
            fontName

        "cursive" ->
            fontName

        "fantasy" ->
            fontName

        "system-ui" ->
            fontName

        _ ->
            "\"" ++ fontName ++ "\""



-- FONT STYLES --


{-| Sets [`font-style`](https://css-tricks.com/almanac/properties/f/font-style/)

    fontStyle italic

-}
fontStyle :
    Value
        { normal : Supported
        , italic : Supported
        , oblique : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontStyle (Value val) =
    AppendProperty ("font-style:" ++ val)


{-| -}
italic : Value { provides | italic : Supported }
italic =
    Value "italic"


{-| -}
oblique : Value { provides | oblique : Supported }
oblique =
    Value "oblique"



-- FONT WEIGHTS --


{-| Sets [`font-weight`](https://css-tricks.com/almanac/properties/f/font-weight/)

    fontWeight bold

    fontWeight (int 300)

-}
fontWeight :
    Value
        { normal : Supported
        , bold : Supported
        , bolder : Supported
        , lighter : Supported
        , int : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontWeight (Value val) =
    AppendProperty ("font-weight:" ++ val)


{-| -}
bold : Value { provides | bold : Supported }
bold =
    Value "bold"


{-| -}
lighter : Value { provides | lighter : Supported }
lighter =
    Value "lighter"


{-| -}
bolder : Value { provides | bolder : Supported }
bolder =
    Value "bolder"



-- FONT VARIANT CAPS --


{-| Sets [`font-variant-caps`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps).

    fontVariantCaps normal

    fontVariantCaps smallCaps

    fontVariantCaps allSmallCaps

    fontVariantCaps petiteCaps

    fontVariantCaps allPetiteCaps

    fontVariantCaps unicase

    fontVariantCaps titlingCaps

-}
fontVariantCaps :
    Value
        { normal : Supported
        , smallCaps : Supported
        , petiteCaps : Supported
        , allPetiteCaps : Supported
        , unicase : Supported
        , titlingCaps : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontVariantCaps (Value str) =
    AppendProperty ("font-variant-caps:" ++ str)


{-| The `normal` value, which can be used with such properties as
[`fontVariantCaps`](#fontVariantCaps),
[`whiteSpace`](#whiteSpace),
[`wordBreak`](#wordBreak),
[`columnGap`](#columnGap),
[`zoom`](#zoom),
and [`alignItems`](#alignItems).

    alignItems normal

    columnGap normal

    fontVariantCaps normal

    whiteSpace normal

    wordBreak normal

    zoom normal

-}
normal : Value { provides | normal : Supported }
normal =
    Value "normal"


{-| The `small-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps smallCaps

-}
smallCaps : Value { provides | smallCaps : Supported }
smallCaps =
    Value "small-caps"


{-| The `all-small-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps allSmallCaps

-}
allSmallCaps : Value { provides | allSmallCaps : Supported }
allSmallCaps =
    Value "all-small-caps"


{-| The `petite-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps petiteCaps

-}
petiteCaps : Value { provides | petiteCaps : Supported }
petiteCaps =
    Value "petite-caps"


{-| The `all-petite-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps allPetiteCaps

-}
allPetiteCaps : Value { provides | allPetiteCaps : Supported }
allPetiteCaps =
    Value "all-petite-caps"


{-| The `unicase` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps unicase

-}
unicase : Value { provides | unicase : Supported }
unicase =
    Value "unicase"


{-| The `titling-caps` [`font-variant-caps` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values).

    fontVariantCaps titlingCaps

-}
titlingCaps : Value { provides | titlingCaps : Supported }
titlingCaps =
    Value "titling-caps"



-- FONT VARIANT LIGATURES --


{-| Sets [`font-variant-ligatures`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures).

    fontVariantLigatures discretionaryLigatures

    fontVariantLigatures none

-}
fontVariantLigatures :
    Value
        { normal : Supported
        , none : Supported
        , commonLigatures : Supported
        , noCommonLigatures : Supported
        , discretionaryLigatures : Supported
        , noDiscretionaryLigatures : Supported
        , historicalLigatures : Supported
        , noHistoricalLigatures : Supported
        , contextual : Supported
        , noContextual : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontVariantLigatures (Value str) =
    AppendProperty ("font-variant-ligatures:" ++ str)


{-| The `common-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures commonLigatures

-}
commonLigatures : Value { provides | commonLigatures : Supported }
commonLigatures =
    Value "common-ligatures"


{-| The `no-common-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noCommonLigatures

-}
noCommonLigatures : Value { provides | noCommonLigatures : Supported }
noCommonLigatures =
    Value "no-common-ligatures"


{-| The `discretionary-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures discretionaryLigatures

-}
discretionaryLigatures : Value { provides | discretionaryLigatures : Supported }
discretionaryLigatures =
    Value "discretionary-ligatures"


{-| The `no-discretionary-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noDiscretionaryLigatures

-}
noDiscretionaryLigatures : Value { provides | noDiscretionaryLigatures : Supported }
noDiscretionaryLigatures =
    Value "no-discretionary-ligatures"


{-| The `historical-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures historicalLigatures

-}
historicalLigatures : Value { provides | historicalLigatures : Supported }
historicalLigatures =
    Value "historical-ligatures"


{-| The `no-historical-ligatures` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noHistoricalLigatures

-}
noHistoricalLigatures : Value { provides | noHistoricalLigatures : Supported }
noHistoricalLigatures =
    Value "no-historical-ligatures"


{-| The `contextual` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures contextual

-}
contextual : Value { provides | contextual : Supported }
contextual =
    Value "contextual"


{-| The `no-contextual` [`font-variant-ligatures` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Values).

    fontVariantLigatures noContextual

-}
noContextual : Value { provides | noContextual : Supported }
noContextual =
    Value "no-contextual"



-- FONT VARIANT NUMERIC --


{-| Sets [`font-variant-numeric`](https://css-tricks.com/almanac/properties/f/font-variant-numeric/).

    fontVariantNumeric ordinal

See [`fontVariantNumeric4`](#fontVariantNumeric4) for a more advanced version.

-}
fontVariantNumeric :
    Value
        { normal : Supported
        , ordinal : Supported
        , slashedZero : Supported
        , liningNums : Supported
        , oldstyleNums : Supported
        , proportionalNums : Supported
        , tabularNums : Supported
        , diagonalFractions : Supported
        , stackedFractions : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontVariantNumeric (Value str) =
    AppendProperty ("font-variant-numeric:" ++ str)


{-| Sets [`font-variant-numeric`](https://css-tricks.com/almanac/properties/f/font-variant-numeric/).

This one can be tricky to use because many of the options are mutually exclusive.
For example, `normal` cannot be used with any of the others, so the only way
to get it from this function is to pass `Nothing` for everything. The other
arguments are chosen such that you can choose between the mutually exclusive
values, or leave that value off.

    fontVariantNumeric4 Nothing Nothing Nothing Nothing -- "normal"

    fontVariantNumeric4
        (Just ordinal)
        Nothing
        (Just tabularNums)
        Nothing
        -- "ordinal tabular-nums"

See [`fontVariantNumeric`](#fontVariantNumeric) for a more concise version.

-}
fontVariantNumeric4 :
    Maybe (Value { ordinal : Supported, slashedZero : Supported })
    -> Maybe (Value { liningNums : Supported, oldstyleNums : Supported })
    -> Maybe (Value { proportionalNums : Supported, tabularNums : Supported })
    -> Maybe (Value { diagonalFractions : Supported, stackedFractions : Supported })
    -> Style
fontVariantNumeric4 val1 val2 val3 val4 =
    let
        valueStr =
            case
                [ maybeValToString val1
                , maybeValToString val2
                , maybeValToString val3
                , maybeValToString val4
                ]
                    |> List.filterMap identity
            of
                [] ->
                    "normal"

                strings ->
                    String.join "," strings
    in
    AppendProperty ("font-variant-numeric:" ++ valueStr)


maybeValToString : Maybe (Value a) -> Maybe String
maybeValToString =
    Maybe.map unpackValue


{-| The `ordinal` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric ordinal

-}
ordinal : Value { provides | ordinal : Supported }
ordinal =
    Value "ordinal"


{-| The `slashed-zero` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric slashedZero

-}
slashedZero : Value { provides | slashedZero : Supported }
slashedZero =
    Value "slashed-zero"


{-| The `lining-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric liningNums

-}
liningNums : Value { provides | liningNums : Supported }
liningNums =
    Value "lining-nums"


{-| The `oldstyle-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric oldstyleNums

-}
oldstyleNums : Value { provides | oldstyleNums : Supported }
oldstyleNums =
    Value "oldstyle-nums"


{-| The `proportional-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric proportionalNums

-}
proportionalNums : Value { provides | proportionalNums : Supported }
proportionalNums =
    Value "proportional-nums"


{-| The `tabular-nums` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric tabularNums

-}
tabularNums : Value { provides | tabularNums : Supported }
tabularNums =
    Value "tabular-nums"


{-| The `diagonal-fractions` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric diagonalFractions

-}
diagonalFractions : Value { provides | diagonalFractions : Supported }
diagonalFractions =
    Value "diagonal-fractions"


{-| The `stacked-fractions` [`font-variant-numeric` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric).

    fontVariantNumeric stackedFractions

-}
stackedFractions : Value { provides | stackedFractions : Supported }
stackedFractions =
    Value "stacked-fractions"



-- CURSOR --


{-| A [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.
-}
cursor :
    Value
        { pointer : Supported
        , auto : Supported
        , default : Supported
        , none : Supported
        , contextMenu : Supported
        , help : Supported
        , progress : Supported
        , wait : Supported
        , cell : Supported
        , crosshair : Supported
        , text : Supported
        , verticalText : Supported
        , alias : Supported
        , copy : Supported
        , move : Supported
        , noDrop : Supported
        , notAllowed : Supported
        , allScroll : Supported
        , colResize : Supported
        , rowResize : Supported
        , nResize : Supported
        , eResize : Supported
        , sResize : Supported
        , wResize : Supported
        , neResize : Supported
        , nwResize : Supported
        , seResize : Supported
        , swResize : Supported
        , ewResize : Supported
        , nsResize : Supported
        , neswResize : Supported
        , nwseResize : Supported
        , zoomIn : Supported
        , zoomOut : Supported
        , grab : Supported
        , grabbing : Supported
        , url : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
cursor (Value val) =
    AppendProperty ("cursor:" ++ val)


{-| The `pointer` value for the [`cursor`](#cursor) property.
-}
pointer : Value { provides | pointer : Supported }
pointer =
    Value "pointer"


{-| The `default` value for the [`cursor`](#cursor) property.
-}
default : Value { provides | default : Supported }
default =
    Value "default"


{-| The `context-menu` value for the [`cursor`](#cursor) property.
-}
contextMenu : Value { provides | contextMenu : Supported }
contextMenu =
    Value "context-menu"


{-| The `help` value for the [`cursor`](#cursor) property.
-}
help : Value { provides | help : Supported }
help =
    Value "help"


{-| The `progress` value for the [`cursor`](#cursor) property.
-}
progress : Value { provides | progress : Supported }
progress =
    Value "progress"


{-| The `wait` value for the [`cursor`](#cursor) property.
-}
wait : Value { provides | wait : Supported }
wait =
    Value "wait"


{-| The `cell` value for the [`cursor`](#cursor) property.
-}
cell : Value { provides | cell : Supported }
cell =
    Value "cell"


{-| The `crosshair` value for the [`cursor`](#cursor) property.
-}
crosshair : Value { provides | crosshair : Supported }
crosshair =
    Value "crosshair"


{-| The `text` value for the [`cursor`](#cursor), and [`user-select`](#userSelect) properties.
-}
text : Value { provides | text : Supported }
text =
    Value "text"


{-| The `vertical-text` value for the [`cursor`](#cursor) property.
-}
verticalText : Value { provides | verticalText : Supported }
verticalText =
    Value "vertical-text"


{-| The `alias` value for the [`cursor`](#cursor) property.
-}
alias : Value { provides | alias : Supported }
alias =
    Value "alias"


{-| The `copy` value for the [`cursor`](#cursor) property.
-}
copy : Value { provides | copy : Supported }
copy =
    Value "copy"


{-| The `move` value for the [`cursor`](#cursor) property.
-}
move : Value { provides | move : Supported }
move =
    Value "move"


{-| The `no-drop` value for the [`cursor`](#cursor) property.
-}
noDrop : Value { provides | noDrop : Supported }
noDrop =
    Value "no-drop"


{-| The `notAllowed` value for the [`cursor`](#cursor) property.
-}
notAllowed : Value { provides | notAllowed : Supported }
notAllowed =
    Value "not-allowed"


{-| The `all-scroll` value for the [`cursor`](#cursor) property.
-}
allScroll : Value { provides | allScroll : Supported }
allScroll =
    Value "all-scroll"


{-| The `col-resize` value for the [`cursor`](#cursor) property.
-}
colResize : Value { provides | colResize : Supported }
colResize =
    Value "col-resize"


{-| The `row-resize` value for the [`cursor`](#cursor) property.
-}
rowResize : Value { provides | rowResize : Supported }
rowResize =
    Value "row-resize"


{-| The `n-resize` value for the [`cursor`](#cursor) property.
-}
nResize : Value { provides | nResize : Supported }
nResize =
    Value "n-resize"


{-| The `e-resize` value for the [`cursor`](#cursor) property.
-}
eResize : Value { provides | eResize : Supported }
eResize =
    Value "e-resize"


{-| The `s-resize` value for the [`cursor`](#cursor) property.
-}
sResize : Value { provides | sResize : Supported }
sResize =
    Value "s-resize"


{-| The `w-resize` value for the [`cursor`](#cursor) property.
-}
wResize : Value { provides | wResize : Supported }
wResize =
    Value "w-resize"


{-| The `ne-resize` value for the [`cursor`](#cursor) property.
-}
neResize : Value { provides | neResize : Supported }
neResize =
    Value "ne-resize"


{-| The `nw-resize` value for the [`cursor`](#cursor) property.
-}
nwResize : Value { provides | nwResize : Supported }
nwResize =
    Value "nw-resize"


{-| The `se-resize` value for the [`cursor`](#cursor) property.
-}
seResize : Value { provides | seResize : Supported }
seResize =
    Value "se-resize"


{-| The `sw-resize` value for the [`cursor`](#cursor) property.
-}
swResize : Value { provides | swResize : Supported }
swResize =
    Value "sw-resize"


{-| The `ew-resize` value for the [`cursor`](#cursor) property.
-}
ewResize : Value { provides | ewResize : Supported }
ewResize =
    Value "ew-resize"


{-| The `ns-resize` value for the [`cursor`](#cursor) property.
-}
nsResize : Value { provides | nsResize : Supported }
nsResize =
    Value "ns-resize"


{-| The `nesw-resize` value for the [`cursor`](#cursor) property.
-}
neswResize : Value { provides | neswResize : Supported }
neswResize =
    Value "nesw-resize"


{-| The `nwse-resize` value for the [`cursor`](#cursor) property.
-}
nwseResize : Value { provides | nwseResize : Supported }
nwseResize =
    Value "nwse-resize"


{-| The `zoom-in` value for the [`cursor`](#cursor) property.
-}
zoomIn : Value { provides | zoomIn : Supported }
zoomIn =
    Value "zoom-in"


{-| The `zoom-out` value for the [`cursor`](#cursor) property.
-}
zoomOut : Value { provides | zoomOut : Supported }
zoomOut =
    Value "zoom-out"


{-| The `grab` value for the [`cursor`](#cursor) property.
-}
grab : Value { provides | grab : Supported }
grab =
    Value "grab"


{-| The `grabbing` value for the [`cursor`](#cursor) property.
-}
grabbing : Value { provides | grabbing : Supported }
grabbing =
    Value "grabbing"



-- LIST STYLE TYPE --


{-| -}
arabicIndic : Value { provides | arabicIndic : Supported }
arabicIndic =
    Value "arabic-indic"


{-| -}
armenian : Value { provides | armenian : Supported }
armenian =
    Value "armenian"


{-| -}
bengali : Value { provides | bengali : Supported }
bengali =
    Value "bengali"


{-| -}
cjkEarthlyBranch : Value { provides | cjkEarthlyBranch : Supported }
cjkEarthlyBranch =
    Value "cjkEarthlyBranch"


{-| -}
cjkHeavenlyStem : Value { provides | cjkHeavenlyStem : Supported }
cjkHeavenlyStem =
    Value "cjkHeavenlyStem"


{-| -}
devanagari : Value { provides | devanagari : Supported }
devanagari =
    Value "devanagari"


{-| -}
georgian : Value { provides | georgian : Supported }
georgian =
    Value "georgian"


{-| -}
gujarati : Value { provides | gujarati : Supported }
gujarati =
    Value "gujarati"


{-| -}
gurmukhi : Value { provides | gurmukhi : Supported }
gurmukhi =
    Value "gurmukhi"


{-| -}
kannada : Value { provides | kannada : Supported }
kannada =
    Value "kannada"


{-| -}
khmer : Value { provides | khmer : Supported }
khmer =
    Value "khmer"


{-| -}
lao : Value { provides | lao : Supported }
lao =
    Value "lao"


{-| -}
malayalam : Value { provides | malayalam : Supported }
malayalam =
    Value "malayalam"


{-| -}
myanmar : Value { provides | myanmar : Supported }
myanmar =
    Value "myanmar"


{-| -}
oriya : Value { provides | oriya : Supported }
oriya =
    Value "oriya"


{-| -}
telugu : Value { provides | telugu : Supported }
telugu =
    Value "telugu"


{-| -}
thai : Value { provides | thai : Supported }
thai =
    Value "thai"


{-| Sets [`background-attachment`](https://css-tricks.com/almanac/properties/b/background-attachment/).

    backgroundAttachment local

See [`backgroundAttachments`](#backgroundAttachments) to set more than one `background-attachment` value.

-}
backgroundAttachment :
    Value
        { fixed : Supported
        , scroll : Supported
        , local : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
backgroundAttachment (Value str) =
    AppendProperty ("background-attachment:" ++ str)


{-| Sets [`background-attachment`](https://css-tricks.com/almanac/properties/b/background-attachment/).

    backgroundAttachments scroll [ fixed, scroll, fixed ]

See [`backgroundAttachment`](#backgroundAttachment) to set a single `background-attachment` value.

-}
backgroundAttachments :
    Value
        { fixed : Supported
        , scroll : Supported
        , local : Supported
        }
    ->
        List
            (Value
                { fixed : Supported
                , scroll : Supported
                , local : Supported
                }
            )
    -> Style
backgroundAttachments firstValue values =
    let
        str =
            (firstValue :: values)
                |> List.map unpackValue
                |> String.join ","
    in
    AppendProperty ("background-attachment:" ++ str)


{-| The `local` [`background-attachment` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)

    backgroundAttachment local

-}
local : Value { provides | local : Supported }
local =
    Value "local"


{-| The `text` [`background-clip` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip#Values).

    backgroundClip text_

-}
text_ : Value { provides | text_ : Supported }
text_ =
    Value "text"


{-| Sets [`background-blend-mode`](https://css-tricks.com/almanac/properties/b/background-blend-mode/).
Note that this takes an argument of [`color_`](#color_), not [`color`](#color)!

    backgroundBlendMode color_

    backgroundBlendMode darken

    backgroundBlendMode colorBurn

See [`backgroundBlendModes`](#backgroundBlendModes) to set more than one `background-blend-mode` value.

-}
backgroundBlendMode :
    Value
        { normal : Supported
        , multiply : Supported
        , screen : Supported
        , overlay : Supported
        , darken : Supported
        , lighten : Supported
        , colorDodge : Supported
        , colorBurn : Supported
        , hardLight : Supported
        , softLight : Supported
        , difference : Supported
        , exclusion : Supported
        , hue : Supported
        , saturation : Supported
        , color_ : Supported
        , luminosity : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
backgroundBlendMode (Value str) =
    AppendProperty ("background-blend-mode:" ++ str)


{-| Sets [`background-blend-mode`](https://css-tricks.com/almanac/properties/b/background-blend-mode/).

Note that this takes an argument of [`color_`](#color_), not [`color`](#color)!

    backgroundBlendMode normal [ darken, color_ ]

See [`backgroundBlendMode`](#backgroundBlendMode) to set a single `background-blend-mode` value.

-}
backgroundBlendModes :
    Value
        { normal : Supported
        , multiply : Supported
        , screen : Supported
        , overlay : Supported
        , darken : Supported
        , lighten : Supported
        , colorDodge : Supported
        , colorBurn : Supported
        , hardLight : Supported
        , softLight : Supported
        , difference : Supported
        , exclusion : Supported
        , hue : Supported
        , saturation : Supported
        , color_ : Supported
        , luminosity : Supported
        }
    ->
        List
            (Value
                { normal : Supported
                , multiply : Supported
                , screen : Supported
                , overlay : Supported
                , darken : Supported
                , lighten : Supported
                , colorDodge : Supported
                , colorBurn : Supported
                , hardLight : Supported
                , softLight : Supported
                , difference : Supported
                , exclusion : Supported
                , hue : Supported
                , saturation : Supported
                , color_ : Supported
                , luminosity : Supported
                }
            )
    -> Style
backgroundBlendModes firstValue values =
    let
        str =
            (firstValue :: values)
                |> List.map unpackValue
                |> String.join ","
    in
    AppendProperty ("background-blend-mode:" ++ str)


{-| The `multiply` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode multiply

-}
multiply : Value { provides | multiply : Supported }
multiply =
    Value "multiply"


{-| The `screen` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode screen

-}
screen : Value { provides | screen : Supported }
screen =
    Value "screen"


{-| The `overlay` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode overlay

-}
overlay : Value { provides | overlay : Supported }
overlay =
    Value "overlay"


{-| The `darken` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode darken

-}
darken : Value { provides | darken : Supported }
darken =
    Value "darken"


{-| The `lighten` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode lighten

-}
lighten : Value { provides | lighten : Supported }
lighten =
    Value "lighten"


{-| The `color-dodge` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode color - colorDodge

-}
colorDodge : Value { provides | colorDodge : Supported }
colorDodge =
    Value "color-dodge"


{-| The `color-burn` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode colorBurn

-}
colorBurn : Value { provides | colorBurn : Supported }
colorBurn =
    Value "color-burn"


{-| The `hard-light` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode hardLight

-}
hardLight : Value { provides | hardLight : Supported }
hardLight =
    Value "hard-light"


{-| The `soft-light` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode softLight

-}
softLight : Value { provides | softLight : Supported }
softLight =
    Value "soft-light"


{-| The `difference` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode difference

-}
difference : Value { provides | difference : Supported }
difference =
    Value "difference"


{-| The `exclusion` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode exclusion

-}
exclusion : Value { provides | exclusion : Supported }
exclusion =
    Value "exclusion"


{-| The `hue` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode hue

-}
hue : Value { provides | hue : Supported }
hue =
    Value "hue"


{-| The `saturation` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode saturation

-}
saturation : Value { provides | saturation : Supported }
saturation =
    Value "saturation"


{-| The `color` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode color_

Not to be confused with [`color`](#color).

-}
color_ : Value { provides | color_ : Supported }
color_ =
    Value "color"


{-| The `luminosity` [`background-blend-mode` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode#Values)

    backgroundBlendMode luminosity

-}
luminosity : Value { provides | luminosity : Supported }
luminosity =
    Value "luminosity"



-- BACKGROUND CLIP --


{-| Sets [`background-clip`](https://css-tricks.com/almanac/properties/b/background-clip/).
Note that this takes an argument of [`text_`](#text_), not [`color`](#color)!

    backgroundClip text_

    backgroundClip paddingBox

    backgroundClip contentBox

See [`backgroundClips`](#backgroundClips) to set more than one `background-clip` value.

-}
backgroundClip :
    Value
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , text_ : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
backgroundClip (Value str) =
    AppendProperty ("background-clip:" ++ str)


{-| Sets [`background-clip`](https://css-tricks.com/almanac/properties/b/background-clip/).
Note that this takes an argument of [`text_`](#text_), not [`color`](#color)!

    backgroundClips text_ [ borderBox, text_ ]

See [`backgroundClip`](#backgroundClip) to set a single `background-clip` value.

-}
backgroundClips :
    Value
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , text_ : Supported
        }
    ->
        List
            (Value
                { borderBox : Supported
                , paddingBox : Supported
                , contentBox : Supported
                , text_ : Supported
                }
            )
    -> Style
backgroundClips firstValue values =
    let
        str =
            (firstValue :: values)
                |> List.map unpackValue
                |> String.join ","
    in
    AppendProperty ("background-clip:" ++ str)


{-| The `padding-box` value, used with [`backgroundClip`](#backgroundClip),
[`backgroundOrigin`](#backgroundOrigin),
and [`strokeOrigin`](#strokeOrigin).

    backgroundClip paddingBox

    backgroundOrigin paddingBox

    strokeOrigin paddingBox

-}
paddingBox : Value { provides | paddingBox : Supported }
paddingBox =
    Value "padding-box"



-- BACKGROUND ORIGIN --


{-| Sets [`background-origin`](https://css-tricks.com/almanac/properties/b/background-origin/).

    backgroundOrigin paddingBox

    backgroundOrigin contentBox

See [`backgroundOrigins`](#backgroundOrigins) to set more than one `background-origin` value.

-}
backgroundOrigin :
    Value
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
backgroundOrigin (Value str) =
    AppendProperty ("background-origin:" ++ str)


{-| Sets [`background-origin`](https://css-tricks.com/almanac/properties/b/background-origin/).

    backgroundOrigins contentBox [ borderBox, contentBox ]

See [`backgroundOrigin`](#backgroundOrigin`background-origin` value.

-}
backgroundOrigins :
    Value
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        }
    ->
        List
            (Value
                { borderBox : Supported
                , paddingBox : Supported
                , contentBox : Supported
                }
            )
    -> Style
backgroundOrigins firstValue values =
    let
        str =
            (firstValue :: values)
                |> List.map unpackValue
                |> String.join ","
    in
    AppendProperty ("background-origin:" ++ str)


{-| Sets [`background-image`](https://css-tricks.com/almanac/properties/b/background-image/).

    backgroundImage (url "http://www.example.com/chicken.jpg")

    backgroundImage (linearGradient (stop red) (stop blue))

See also [`backgroundImages`](#backgroundImages) if you need multiple images.

-}
backgroundImage :
    Value
        { url : Supported
        , linearGradient : Supported
        , none : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
backgroundImage (Value value) =
    AppendProperty ("background-image:" ++ value)


{-| Sets [`background-image`](https://css-tricks.com/almanac/properties/b/background-image/) for multiple images.

    backgroundImages
        (linearGradient (stop red) (stop blue))
        [ url "http://www.example.com/chicken.jpg" ]

See also [`backgroundImage`](#backgroundImage) if you need only one.

-}
backgroundImages :
    Value
        { url : Supported
        , linearGradient : Supported
        }
    ->
        List
            (Value
                { url : Supported
                , linearGradient : Supported
                }
            )
    -> Style
backgroundImages (Value head) rest =
    let
        peeled =
            List.map unpackValue rest

        values =
            String.join "," (head :: peeled)
    in
    AppendProperty ("background-image:" ++ values)



-- BACKGROUND POSITION --


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition left_

    backgroundPosition (px 45)

`backgroundPosition` sets the horizontal direction. If you need the vertical
direction instead, use [`backgroundPosition2`](#backgroundPosition2) like this:

    backgroundPosition zero (px 45)

If you need to set the offsets from the right or bottom, use
[`backgroundPosition4`](#backgroundPosition4) like this:

    backgroundPosition4 right_ (px 20) bottom_ (pct 25)

-}
backgroundPosition :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        , inherit : Supported
        , unset : Supported
        , initial : Supported
        }
    -> Style
backgroundPosition (Value horiz) =
    AppendProperty ("background-position:" ++ horiz)


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition2 left_ top_

    backgroundPosition2 (px 45) (pct 50)

`backgroundPosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`backgroundPosition`](#backgroundPosition) instead:

    backgroundPosition left_

If you need to set the offsets from the right or bottom, use
[`backgroundPosition4`](#backgroundPosition4) like this:

    backgroundPosition4 right_ (px 20) bottom_ (pct 25)

-}
backgroundPosition2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
    -> Style
backgroundPosition2 (Value horiz) (Value vert) =
    AppendProperty ("background-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition4 right_ (px 20) bottom_ (pct 30)

The four-argument form of background position alternates sides and offets. So the
example above would position the background image 20px from the right, and 30%
from the bottom.

See also [`backgroundPosition`](#backgroundPosition) for horizontal alignment and
[`backgroundPosition2`](#backgroundPosition2) for horizontal (from left) and
vertical (from top) alignment.

-}
backgroundPosition4 :
    Value
        { left_ : Supported
        , right_ : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
backgroundPosition4 (Value horiz) (Value horizAmount) (Value vert) (Value vertAmount) =
    AppendProperty
        ("background-position:"
            ++ horiz
            ++ " "
            ++ horizAmount
            ++ " "
            ++ vert
            ++ " "
            ++ vertAmount
        )



-- BACKGROUND REPEAT --


{-| Sets [`background-repeat`](https://css-tricks.com/almanac/properties/b/background-repeat/)

    backgroundRepeat repeat

    backgroundRepeat repeatX

If you need to set horizontal and vertical direction separately, see
[`backgroundRepeat2`](#backgroundRepeat2)

-}
backgroundRepeat :
    Value
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round : Supported
        , noRepeat : Supported
        , initial : Supported
        , unset : Supported
        , inherit : Supported
        }
    -> Style
backgroundRepeat (Value amount) =
    AppendProperty ("background-repeat:" ++ amount)


{-| Sets [`background-repeat`](https://css-tricks.com/almanac/properties/b/background-repeat/) along the horizontal axis, then the vertical axis.

    backgroundRepeat2 repeat space

    backgroundRepeat2 space round

If you only need to set one value for both, see
[`backgroundRepeat`](#backgroundRepeat) instead.

-}
backgroundRepeat2 :
    Value
        { repeat : Supported
        , space : Supported
        , round : Supported
        , noRepeat : Supported
        }
    ->
        Value
            { repeat : Supported
            , space : Supported
            , round : Supported
            , noRepeat : Supported
            }
    -> Style
backgroundRepeat2 (Value horiz) (Value vert) =
    AppendProperty ("background-repeat:" ++ horiz ++ " " ++ vert)


{-| Compiles to [`repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat#Values) for [backgrounds](#backgroundRepeat),
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeat

    strokeRepeat repeat

-}
repeat : Value { provides | repeat : Supported }
repeat =
    Value "repeat"


{-| Compiles to [`no-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat#Values) for [backgrounds](#backgroundRepeat),
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat noRepeat

    strokeRpeat noRepeat

-}
noRepeat : Value { provides | repeat : Supported }
noRepeat =
    Value "no-repeat"


{-| Compiles to [`repeat-x`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat#Values) for [repeating backgrounds](#backgroundRepeat),
and [`strokeRepeat`](#strokeRepeat) horizontally.

    backgroundRepeat repeatX

    strokeRepeat repeatX

-}
repeatX : Value { provides | repeatX : Supported }
repeatX =
    Value "repeat-x"


{-| Compiles to [`repeat-y`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat#Values) for [repeating backgrounds](#backgroundRepeat),
and [`strokeRepeat`](#strokeRepeat) vertically.

    backgroundRepeat repeatY

    strokeRepeat repeatY

-}
repeatY : Value { provides | repeatY : Supported }
repeatY =
    Value "repeat-y"


{-| Compiles to [`space`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat#Values) for [repeating backgrounds](#backgroundRepeat),
and [`strokeRepeat`](#strokeRepeat) without cutting off edges by adding space.

    backgroundRepeat space

    strokeRepeat space

-}
space : Value { provides | space : Supported }
space =
    Value "space"


{-| The `round` value used for properties such as [repeating background](#backgroundRepeat) without cutting off edges by stretching or shrinking the image,
and [`strokeLinecap`](#strokeLinecap),
and [`strokeRepeat`](#strokeRepeat),
and [`strokeLinejoin`](#strokeLinejoin2).

    backgroundRepeat round

    strokeLineCap round

    strokeLinejoin2 miter round

    strokeRepeat round

-}
round : Value { provides | round : Supported }
round =
    Value "round"



-- BACKGROUND SIZE --


{-| Sets [`background-size`](https://css-tricks.com/almanac/properties/b/background-size/).

    backgroundSize cover

    backgroundSize (px 400)

If you give a length value, it will be used for the width. The height will be set
proportional to the size of the [`background-image`](#backgroundImage). If you
need to set both width and height explicitly, use
[`backgroundImage2`](#backgroundImage2) instead.

-}
backgroundSize :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , cover : Supported
        , contain : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
backgroundSize (Value size) =
    AppendProperty ("background-size:" ++ size)


{-| Sets [`background-size`](https://css-tricks.com/almanac/properties/b/background-size/) for both width and height (in that order.)

    backgroundSize2 (px 300) (px 100)

    backgroundSize2 auto (px 400)

If you only want to set the width, use [`backgroundImage`](#backgroundImage) instead.

-}
backgroundSize2 :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        }
    ->
        Value
            { px : Supported
            , cm : Supported
            , mm : Supported
            , inches : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , ch : Supported
            , em : Supported
            , ex : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , auto : Supported
            }
    -> Style
backgroundSize2 (Value width_) (Value height) =
    AppendProperty ("background-size:" ++ width_ ++ " " ++ height)


{-| Sets [`contain`](https://css-tricks.com/almanac/properties/b/background-size/)
for [`backgroundSize`](#backgroundSize). It always show the whole background
image, even if it leaves empty spaces on the sides.

    backgroundSize contain

-}
contain : Value { provides | contain : Supported }
contain =
    Value "contain"


{-| Sets [`cover`](https://css-tricks.com/almanac/properties/b/background-size/)
for [`backgroundSize`](#backgroundSize), and [`strokeSize`](#strokeSize). It fills the whole space available with
the background image by scaling, even if it cuts off some of the image.

    backgroundSize cover

    strokeSize cover

-}
cover : Value { provides | cover : Supported }
cover =
    Value "cover"



{- GRADIENTS -}


{-| Sets [`linear-gradient`](https://css-tricks.com/snippets/css/css-linear-gradient/)

    linearGradient toTop (stop red) (stop blue) []

    linearGradient toTop (stop red) (stop blue) [ stop green ]

-}
linearGradient :
    Value
        { to : Supported
        , deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Value { provides | linearGradient : Supported }
linearGradient (Value angle) (Value firstStop) (Value secondStop) moreStops =
    let
        peeledStops =
            List.map unpackValue moreStops

        stops =
            String.join "," (firstStop :: secondStop :: peeledStops)
    in
    Value ("linear-gradient(" ++ angle ++ "," ++ stops ++ ")")


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient toTop (stop red) (stop blue) []

See also [`stop2`](#stop2) for controlling stop positioning.

-}
stop : Color -> Value { provides | colorStop : Supported }
stop (Value colorVal) =
    Value colorVal


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient toTop (stop2 red (px 20)) (stop blue) []

See also [`stop`](#stop) if you don't need to control the stop position.

-}
stop2 :
    Color
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Value { supported | colorStop : Supported }
stop2 (Value colorVal) (Value pos) =
    Value (colorVal ++ " " ++ pos)


{-| Provides the [`to bottom` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottom (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toBottomLeft`](#toBottomLeft) or [`toBottomRight`](#toBottomRight):

    linearGradient toBottomLeft (stop red) (stop blue) []

    linearGradient toBottomRight (stop red) (stop blue) []

-}
toBottom : Value { provides | provides : Supported }
toBottom =
    Value "to bottom"


{-| Provides the [`to bottom left` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottomLeft (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toBottom`](#toBottom) or [`toLeft`](#toLeft) instead:

    linearGradient toBottom (stop red) (stop blue) []

    linearGradient toLeft (stop red) (stop blue) []

-}
toBottomLeft : Value { provides | toBottomLeft : Supported }
toBottomLeft =
    Value "to bottom left"


{-| Provides the [`to bottom right` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottomRight (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toBottom`](#toBottom) or [`toRight`](#toRight) instead:

    linearGradient toBottom (stop red) (stop blue) []

    linearGradient toRight (stop red) (stop blue) []

-}
toBottomRight : Value { provides | toBottomRight : Supported }
toBottomRight =
    Value "to bottom right"


{-| Provides the [`to left` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toLeft (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toTopLeft`](#toTopLeft) or [`toBottomLeft`](#toBottomLeft):

    linearGradient toTopLeft (stop red) (stop blue) []

    linearGradient toBottomLeft (stop red) (stop blue) []

-}
toLeft : Value { provides | toLeft : Supported }
toLeft =
    Value "to left"


{-| Provides the [`to right` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toRight (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toTopRight`](#toTopRight) or [`toBottomRight`](#toBottomRight):

    linearGradient toTopRight (stop red) (stop blue) []

    linearGradient toBottomRight (stop red) (stop blue) []

-}
toRight : Value { provides | toRight : Supported }
toRight =
    Value "to right"


{-| Provides the [`to top` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toTop (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toTopLeft`](#toTopLeft) or [`toTopRight`](#toTopRight):

    linearGradient toTopLeft (stop red) (stop blue) []

    linearGradient toTopRight (stop red) (stop blue) []

-}
toTop : Value { provides | toTop : Supported }
toTop =
    Value "to top"


{-| Provides the [`to top left` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toTopLeft (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toTop`](#toTop) or [`toLeft`](#toLeft) instead:

    linearGradient toTop (stop red) (stop blue) []

    linearGradient toLeft (stop red) (stop blue) []

-}
toTopLeft : Value { provides | toTopLeft : Supported }
toTopLeft =
    Value "to top left"


{-| Provides the [`to top right` corner angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toTopRight (stop red) (stop blue) []

If you want your gradient to go to a side, use [`toTop`](#toTop) or [`toRight`](#toRight) instead:

    linearGradient toTop (stop red) (stop blue) []

    linearGradient toRight (stop red) (stop blue) []

-}
toTopRight : Value { provides | toTopRight : Supported }
toTopRight =
    Value "to top right"



{- LIST STYLE SHORTHAND -}


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.
-}
listStyle :
    Value
        { armenian : Supported
        , bengali : Supported
        , cjkEarthlyBranch : Supported
        , cjkHeavenlyStem : Supported
        , devanagari : Supported
        , georgian : Supported
        , gujarati : Supported
        , gurmukhi : Supported
        , kannada : Supported
        , khmer : Supported
        , lao : Supported
        , malayalam : Supported
        , myanmar : Supported
        , oriya : Supported
        , telugu : Supported
        , thai : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
listStyle (Value val) =
    AppendProperty ("list-style:" ++ val)


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.
-}
listStyle2 :
    Value
        { armenian : Supported
        , bengali : Supported
        , cjkEarthlyBranch : Supported
        , cjkHeavenlyStem : Supported
        , devanagari : Supported
        , georgian : Supported
        , gujarati : Supported
        , gurmukhi : Supported
        , kannada : Supported
        , khmer : Supported
        , lao : Supported
        , malayalam : Supported
        , myanmar : Supported
        , oriya : Supported
        , telugu : Supported
        , thai : Supported
        }
    ->
        Value
            { armenian : Supported
            , bengali : Supported
            , cjkEarthlyBranch : Supported
            , cjkHeavenlyStem : Supported
            , devanagari : Supported
            , georgian : Supported
            , gujarati : Supported
            , gurmukhi : Supported
            , kannada : Supported
            , khmer : Supported
            , lao : Supported
            , malayalam : Supported
            , myanmar : Supported
            , oriya : Supported
            , telugu : Supported
            , thai : Supported
            }
    -> Style
listStyle2 (Value val1) (Value val2) =
    AppendProperty ("list-style:" ++ val1 ++ " " ++ val2)


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.
-}
listStyle3 :
    Value
        { armenian : Supported
        , bengali : Supported
        , cjkEarthlyBranch : Supported
        , cjkHeavenlyStem : Supported
        , devanagari : Supported
        , georgian : Supported
        , gujarati : Supported
        , gurmukhi : Supported
        , kannada : Supported
        , khmer : Supported
        , lao : Supported
        , malayalam : Supported
        , myanmar : Supported
        , oriya : Supported
        , telugu : Supported
        , thai : Supported
        }
    ->
        Value
            { armenian : Supported
            , bengali : Supported
            , cjkEarthlyBranch : Supported
            , cjkHeavenlyStem : Supported
            , devanagari : Supported
            , georgian : Supported
            , gujarati : Supported
            , gurmukhi : Supported
            , kannada : Supported
            , khmer : Supported
            , lao : Supported
            , malayalam : Supported
            , myanmar : Supported
            , oriya : Supported
            , telugu : Supported
            , thai : Supported
            }
    ->
        Value
            { armenian : Supported
            , bengali : Supported
            , cjkEarthlyBranch : Supported
            , cjkHeavenlyStem : Supported
            , devanagari : Supported
            , georgian : Supported
            , gujarati : Supported
            , gurmukhi : Supported
            , kannada : Supported
            , khmer : Supported
            , lao : Supported
            , malayalam : Supported
            , myanmar : Supported
            , oriya : Supported
            , telugu : Supported
            , thai : Supported
            }
    -> Style
listStyle3 (Value val1) (Value val2) (Value val3) =
    AppendProperty ("list-style:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| The [`list-style-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position) property

    listStylePosition inside

    listStylePosition outside

-}
listStylePosition :
    Value
        { inside : Supported
        , outside : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
listStylePosition (Value pos) =
    AppendProperty ("list-style-position:" ++ pos)


{-| The `inside` value for [`list-style-position`](#listStylePosition)

    listStylePosition inside

-}
inside : Value { provides | inside : Supported }
inside =
    Value "inside"


{-| The `inside` value for [`list-style-position`](#listStylePosition)

    listStylePosition outside

-}
outside : Value { provides | outside : Supported }
outside =
    Value "outside"



-- BORDERS --


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
border (Value width_) =
    AppendProperty ("border:" ++ width_)


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
border2 (Value width_) (Value style) =
    AppendProperty ("border:" ++ width_ ++ " " ++ style)


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
border3 (Value width_) (Value style) (Value colorVal) =
    AppendProperty ("border:" ++ width_ ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderTop (Value width_) =
    AppendProperty ("border-top:" ++ width_)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderTop2 (Value width_) (Value style) =
    AppendProperty ("border-top:" ++ width_ ++ " " ++ style)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderTop3 (Value width_) (Value style) (Value colorVal) =
    AppendProperty ("border-top:" ++ width_ ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderRight (Value width_) =
    AppendProperty ("border-right:" ++ width_)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderRight2 (Value width_) (Value style) =
    AppendProperty ("border-right:" ++ width_ ++ " " ++ style)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderRight3 (Value width_) (Value style) (Value colorVal) =
    AppendProperty ("border-right:" ++ width_ ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderBottom (Value width_) =
    AppendProperty ("border-bottom:" ++ width_)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderBottom2 (Value width_) (Value style) =
    AppendProperty ("border-bottom:" ++ width_ ++ " " ++ style)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderBottom3 (Value width_) (Value style) (Value colorVal) =
    AppendProperty ("border-bottom:" ++ width_ ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderLeft (Value width_) =
    AppendProperty ("border-left:" ++ width_)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderLeft2 (Value width_) (Value style) =
    AppendProperty ("border-left:" ++ width_ ++ " " ++ style)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderLeft3 (Value width_) (Value style) (Value colorVal) =
    AppendProperty ("border-left:" ++ width_ ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderWidth (Value width_) =
    AppendProperty ("border-width:" ++ width_)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
            }
    -> Style
borderWidth2 (Value widthTopBottom) (Value widthRightLeft) =
    AppendProperty ("border-width:" ++ widthTopBottom ++ " " ++ widthRightLeft)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
            }
    -> Style
borderWidth3 (Value widthTop) (Value widthRightLeft) (Value widthBottom) =
    AppendProperty ("border-width:" ++ widthTop ++ " " ++ widthRightLeft ++ " " ++ widthBottom)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , thin : Supported
            , medium : Supported
            , thick : Supported
            }
    -> Style
borderWidth4 (Value widthTop) (Value widthRight) (Value widthBottom) (Value widthLeft) =
    AppendProperty ("border-width:" ++ widthTop ++ " " ++ widthRight ++ " " ++ widthBottom ++ " " ++ widthLeft)


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width) property.

    borderTopWidth (px 1)

-}
borderTopWidth :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderTopWidth (Value width_) =
    AppendProperty ("border-top-width:" ++ width_)


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width) property.

    borderRightWidth (px 1)

-}
borderRightWidth :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderRightWidth (Value width_) =
    AppendProperty ("border-right-width:" ++ width_)


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width) property.

    borderBottomWidth (px 1)

-}
borderBottomWidth :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderBottomWidth (Value width_) =
    AppendProperty ("border-bottom-width:" ++ width_)


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width) property.

    borderLeftWidth (px 1)

-}
borderLeftWidth :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , thin : Supported
        , medium : Supported
        , thick : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderLeftWidth (Value width_) =
    AppendProperty ("border-left-width:" ++ width_)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

    borderStyle2 solid none

    borderStyle3 solid none dotted

    borderStyle4 solid none dotted inherit

-}
borderStyle :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderStyle (Value style) =
    AppendProperty ("border-style:" ++ style)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

    borderStyle2 solid none

    borderStyle3 solid none dotted

    borderStyle4 solid none dotted inherit

-}
borderStyle2 :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderStyle2 (Value styleTopBottom) (Value styleRigthLeft) =
    AppendProperty ("border-style:" ++ styleTopBottom ++ " " ++ styleRigthLeft)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

    borderStyle2 solid none

    borderStyle3 solid none dotted

    borderStyle4 solid none dotted inherit

-}
borderStyle3 :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderStyle3 (Value styleTop) (Value styleRigthLeft) (Value styleBottom) =
    AppendProperty ("border-style:" ++ styleTop ++ " " ++ styleRigthLeft ++ " " ++ styleBottom)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

    borderStyle2 solid none

    borderStyle3 solid none dotted

    borderStyle4 solid none dotted inherit

-}
borderStyle4 :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
borderStyle4 (Value styleTop) (Value styleRigt) (Value styleBottom) (Value styleLeft) =
    AppendProperty ("border-style:" ++ styleTop ++ " " ++ styleRigt ++ " " ++ styleBottom ++ " " ++ styleLeft)


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style) property.

    borderTopStyle solid

-}
borderTopStyle :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderTopStyle (Value style) =
    AppendProperty ("border-top-style:" ++ style)


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style) property.

    borderRightStyle solid

-}
borderRightStyle :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderRightStyle (Value style) =
    AppendProperty ("border-right-style:" ++ style)


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style) property.

    borderBottomStyle solid

-}
borderBottomStyle :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderBottomStyle (Value style) =
    AppendProperty ("border-bottom-style:" ++ style)


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style) property.

    borderLeftStyle solid

-}
borderLeftStyle :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderLeftStyle (Value style) =
    AppendProperty ("border-left-style:" ++ style)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderColor (Value colorVal) =
    AppendProperty ("border-color:" ++ colorVal)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor2 :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderColor2 (Value colorTopBottom) (Value colorRightLeft) =
    AppendProperty ("border-color:" ++ colorTopBottom ++ " " ++ colorRightLeft)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor3 :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderColor3 (Value colorTop) (Value colorRightLeft) (Value colorBottom) =
    AppendProperty ("border-color:" ++ colorTop ++ " " ++ colorRightLeft ++ " " ++ colorBottom)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor4 :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
borderColor4 (Value colorTop) (Value colorRight) (Value colorBottom) (Value colorLeft) =
    AppendProperty ("border-color:" ++ colorTop ++ " " ++ colorRight ++ " " ++ colorBottom ++ " " ++ colorLeft)


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color) property.

    borderTopColor (rgb 0 0 0)

-}
borderTopColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderTopColor (Value colorVal) =
    AppendProperty ("border-top-color:" ++ colorVal)


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color) property.

    borderRightColor (rgb 0 0 0)

-}
borderRightColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderRightColor (Value colorVal) =
    AppendProperty ("border-right-color:" ++ colorVal)


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color) property.

    borderBottomColor (rgb 0 0 0)

-}
borderBottomColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderBottomColor (Value colorVal) =
    AppendProperty ("border-bottom-color:" ++ colorVal)


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color) property.

    borderLeftColor (rgb 0 0 0)

-}
borderLeftColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderLeftColor (Value colorVal) =
    AppendProperty ("border-left-color:" ++ colorVal)



-- BORDER WIDTH --


{-| The `thin` value used by properties such as [`borderWidth`](#borderWidth),
and [`columnRuleWidth`](#columnRuleWidth).

    borderWidth thin

    columnRuleWidth thin

The value is equivalent of 1px.

-}
thin : Value { provides | thin : Supported }
thin =
    Value "thin"


{-| The `thick` value used by properties such as [`borderWidth`](#borderWidth),
and [`columnRuleWidth`](#columnRuleWidth).

    borderWidth thick

    columnRuleWidth thick

The value is equivalent of 5px.

-}
thick : Value { provides | thick : Supported }
thick =
    Value "thick"



-- BORDER STYLE --


{-| The `dotted` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

It represents a line that consists of dots.

    borderStyle dotted

    columnRuleStyle dotted

    textDecorationStyle dotted

-}
dotted : Value { provides | dotted : Supported }
dotted =
    Value "dotted"


{-| The `dashed` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle dashed

    columnRuleStyle dashed

    textDecorationStyle dashed

It represents a line that consists of dashes.

-}
dashed : Value { provides | dashed : Supported }
dashed =
    Value "dashed"


{-| The `solid` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle solid

    columnRuleStyle solid

    textDecorationStyle solid

It represents a solid, continuous line.

-}
solid : Value { provides | solid : Supported }
solid =
    Value "solid"


{-| The `double` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle double

    columnRuleStyle double

    textDecorationStyle double

It represents a double line: two lines side by side.

-}
double : Value { provides | double : Supported }
double =
    Value "double"


{-| The `groove` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle groove

    columnRuleStyle groove

    textDecorationStyle groove

Adds a bevel based on the color value, which makes things appear pressed into the document.

-}
groove : Value { provides | groove : Supported }
groove =
    Value "groove"


{-| The `ridge` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle ridge

    columnRuleStyle ridge

    textDecorationStyle ridge

Similar to [`groove`](#groove), but reverses the color values in a way that makes things appear raised.

-}
ridge : Value { provides | ridge : Supported }
ridge =
    Value "ridge"


{-| The `inset` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle), and [`textDecorationStyle`](#textDecorationStyle).

    borderStyle inset

    columnRuleStyle inset

    textDecorationStyle inset

Adds a split tone to the line that makes it appear slightly depressed.

Contrast with [`outset`](#outset)

-}
inset : Value { provides | inset : Supported }
inset =
    Value "inset"


{-| The `outset` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle),
and [`textDecorationStyle`](#textDecorationStyle),
and [`strokeAlign`](#strokeAlign).

    borderStyle outset

    columnRuleStyle outset

    strokeAlign outset

    textDecorationStyle outset

Similar to [`inset`](#inset), but reverses the colors in a way that makes it appear slightly raised.

-}
outset : Value { provides | outset : Supported }
outset =
    Value "outset"



{- BORDER RADIUS -}


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderRadius (Value radius) =
    AppendProperty ("border-radius:" ++ radius)


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderRadius2 (Value radiusTopLeftAndBottomRight) (Value radiusTopRightAndBottomLeft) =
    AppendProperty ("border-radius:" ++ radiusTopLeftAndBottomRight ++ " " ++ radiusTopRightAndBottomLeft)


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderRadius3 (Value radiusTopLeft) (Value radiusTopRightAndBottomLeft) (Value radiusBottomRight) =
    AppendProperty ("border-radius:" ++ radiusTopLeft ++ " " ++ radiusTopRightAndBottomLeft ++ " " ++ radiusBottomRight)


{-| Sets [`border-radius`](https://css-tricks.com/almanac/properties/b/border-radius/) property.

    borderRadius (em 4)

    borderRadius2 (em 4) (px 2)

    borderRadius3 (em 4) (px 2) (pct 5)

    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderRadius4 (Value radiusTopLeft) (Value radiusTopRight) (Value radiusBottomRight) (Value radiusBottomLeft) =
    AppendProperty ("border-radius:" ++ radiusTopLeft ++ " " ++ radiusTopRight ++ " " ++ radiusBottomRight ++ " " ++ radiusBottomLeft)


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius) property.

    borderTopLeftRadius (em 4)

    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderTopLeftRadius (Value radius) =
    AppendProperty ("border-top-left-radius:" ++ radius)


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius) property.

    borderTopLeftRadius (em 4)

    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderTopLeftRadius2 (Value horizontal) (Value vertical) =
    AppendProperty ("border-top-left-radius:" ++ horizontal ++ " " ++ vertical)


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius) property.

    borderTopRightRadius (em 4)

    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderTopRightRadius (Value radius) =
    AppendProperty ("border-top-right-radius:" ++ radius)


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius) property.

    borderTopRightRadius (em 4)

    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderTopRightRadius2 (Value horizontal) (Value vertical) =
    AppendProperty ("border-top-right-radius:" ++ horizontal ++ " " ++ vertical)


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius) property.

    borderBottomRightRadius (em 4)

    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderBottomRightRadius (Value radius) =
    AppendProperty ("border-bottom-right-radius:" ++ radius)


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius) property.

    borderBottomRightRadius (em 4)

    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderBottomRightRadius2 (Value horizontal) (Value vertical) =
    AppendProperty ("border-bottom-right-radius:" ++ horizontal ++ " " ++ vertical)


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius) property.

    borderBottomLeftRadius (em 4)

    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderBottomLeftRadius (Value radius) =
    AppendProperty ("border-bottom-left-radius:" ++ radius)


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius) property.

    borderBottomLeftRadius (em 4)

    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
borderBottomLeftRadius2 (Value horizontal) (Value vertical) =
    AppendProperty ("border-bottom-left-radius:" ++ horizontal ++ " " ++ vertical)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderImageOutset (Value width_) =
    AppendProperty ("border-image-outset:" ++ width_)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            }
    -> Style
borderImageOutset2 (Value valueTopBottom) (Value valueRightLeft) =
    AppendProperty ("border-image-outset:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            }
    -> Style
borderImageOutset3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    AppendProperty ("border-image-outset:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            }
    -> Style
borderImageOutset4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("border-image-outset:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
borderImageWidth (Value width_) =
    AppendProperty ("border-image-width:" ++ width_)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            , auto : Supported
            }
    -> Style
borderImageWidth2 (Value valueTopBottom) (Value valueRightLeft) =
    AppendProperty ("border-image-width:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            , auto : Supported
            }
    -> Style
borderImageWidth3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    AppendProperty ("border-image-width:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , num : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , num : Supported
            , auto : Supported
            }
    -> Style
borderImageWidth4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("border-image-width:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)



-- TEXT ORIENTATION --


{-| Sets [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation).

    textOrientation sideways

    textOrientation upright

-}
textOrientation :
    Value
        { mixed : Supported
        , sideways : Supported
        , upright : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textOrientation (Value str) =
    AppendProperty ("text-orientation:" ++ str)


{-| A `mixed` value for the [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation) property.

    textOrientation mixed

-}
mixed : Value { provides | mixed : Supported }
mixed =
    Value "mixed"


{-| A `sideways` value for the [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation) property.

    textOrientation sideways

-}
sideways : Value { provides | sideways : Supported }
sideways =
    Value "sideways"


{-| A `upright` value for the [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation) property.

    textOrientation upright

-}
upright : Value { provides | upright : Supported }
upright =
    Value "upright"



-- TEXT RENDERING --


{-| Sets [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/).

    textRendering geometricPrecision

    textRendering optimizeSpeed

-}
textRendering :
    Value
        { auto : Supported
        , geometricPrecision : Supported
        , optimizeLegibility : Supported
        , optimizeSpeed : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textRendering (Value str) =
    AppendProperty ("text-rendering:" ++ str)


{-| A `geometricPrecision` value for the [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/) property.

    textRendering geometricPrecision

-}
geometricPrecision : Value { provides | geometricPrecision : Supported }
geometricPrecision =
    Value "geometricPrecision"


{-| An `optimizeLegibility` value for the [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/) property.

    textRendering optimizeLegibility

-}
optimizeLegibility : Value { provides | optimizeLegibility : Supported }
optimizeLegibility =
    Value "optimizeLegibility"


{-| An `optimizeSpeed` value for the [`text-rendering`](https://css-tricks.com/almanac/properties/t/text-rendering/) property.

    textRendering optimizeSpeed

-}
optimizeSpeed : Value { provides | optimizeSpeed : Supported }
optimizeSpeed =
    Value "optimizeSpeed"



-- TEXT TRANSFORM --


{-| Sets [`text-transform`](https://css-tricks.com/almanac/properties/t/text-transform/).

    textTransform capitalize

    textTransform uppercase

-}
textTransform :
    Value
        { capitalize : Supported
        , uppercase : Supported
        , lowercase : Supported
        , fullWidth : Supported
        , none : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textTransform (Value str) =
    AppendProperty ("text-transform:" ++ str)


{-| A `capitalize` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform capitalize

-}
capitalize : Value { provides | capitalize : Supported }
capitalize =
    Value "capitalize"


{-| An `uppercase` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform uppercase

-}
uppercase : Value { provides | uppercase : Supported }
uppercase =
    Value "uppercase"


{-| A `lowercase` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform lowercase

-}
lowercase : Value { provides | lowercase : Supported }
lowercase =
    Value "lowercase"


{-| A `full-width` value for the [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Syntax) property.

    textTransform fullWidth

-}
fullWidth : Value { provides | fullWidth : Supported }
fullWidth =
    Value "full-width"



-- TEXT DECORATION --


{-| Sets [`text-decoration`][text-decoration] property.

    textDecoration underline

    textDecoration2 underline dotted

    textDecoration3 underline dotted (hex "#cf0")

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration :
    Value
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
textDecoration (Value line) =
    AppendProperty ("text-decoration:" ++ line)


{-| Sets [`text-decoration`][text-decoration] property.

    textDecoration underline

    textDecoration2 underline dotted

    textDecoration3 underline dotted (hex "#cf0")

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration2 :
    Value
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { solid : Supported
            , double : Supported
            , dotted : Supported
            , dashed : Supported
            , wavy : Supported
            }
    -> Style
textDecoration2 (Value line) (Value style) =
    AppendProperty ("text-decoration:" ++ line ++ " " ++ style)


{-| Sets [`text-decoration`][text-decoration] property.

    textDecoration underline

    textDecoration2 underline dotted

    textDecoration3 underline dotted (hex "#cf0")

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration3 :
    Value
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { solid : Supported
            , double : Supported
            , dotted : Supported
            , dashed : Supported
            , wavy : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
textDecoration3 (Value line) (Value style) (Value colorVal) =
    AppendProperty ("text-decoration:" ++ line ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine underline

    textDecorationLine2 underline overline

    textDecorationLine3 underline overline lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine :
    Value
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
textDecorationLine (Value line) =
    AppendProperty ("text-decoration-line:" ++ line)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine underline

    textDecorationLine2 underline overline

    textDecorationLine3 underline overline lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine2 :
    Value
        { underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { underline : Supported
            , overline : Supported
            , lineThrough : Supported
            }
    -> Style
textDecorationLine2 (Value line1) (Value line2) =
    AppendProperty ("text-decoration-line:" ++ line1 ++ " " ++ line2)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine underline

    textDecorationLine2 underline overline

    textDecorationLine3 underline overline lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine3 :
    Value
        { underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    ->
        Value
            { underline : Supported
            , overline : Supported
            , lineThrough : Supported
            }
    ->
        Value
            { underline : Supported
            , overline : Supported
            , lineThrough : Supported
            }
    -> Style
textDecorationLine3 (Value line1) (Value line2) (Value line3) =
    AppendProperty ("text-decoration-line:" ++ line1 ++ " " ++ line2 ++ " " ++ line3)


{-| Sets [`text-decoration-style`][text-decoration-style] property.

    textDecorationStyle wavy

[text-decoration-style]: https://css-tricks.com/almanac/properties/t/text-decoration-style/

-}
textDecorationStyle :
    Value
        { solid : Supported
        , double : Supported
        , dotted : Supported
        , dashed : Supported
        , wavy : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
textDecorationStyle (Value style) =
    AppendProperty ("text-decoration-style:" ++ style)


{-| Sets [`text-decoration-color`][text-decoration-color] property.

    textDecorationColor (hex "#0cf")

[text-decoration-color]: https://css-tricks.com/almanac/properties/t/text-decoration-color/

-}
textDecorationColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
textDecorationColor (Value colorVal) =
    AppendProperty ("text-decoration-color:" ++ colorVal)


{-| Sets [`text-decoration-color`][https://css-tricks.com/almanac/properties/t/text-decoration-skip/] property.

    textDecorationSkip objects

    textDecorationSkip none

    textDecorationSkip spaces

    textDecorationSkip ink

    textDecorationSkip edges

    textDecorationSkip boxDecoration

-}
textDecorationSkip :
    Value
        { objects : Supported
        , none : Supported
        , spaces : Supported
        , ink : Supported
        , edges : Supported
        , boxDecoration : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
textDecorationSkip (Value val) =
    AppendProperty ("text-decoration-skip:" ++ val)


{-| Sets `objects` value for usage with [`textDecorationSkip`](#textDecorationSkip).

    textDecorationSkip objects

-}
objects : Value { provides | objects : Supported }
objects =
    Value "objects"


{-| Sets `spaces` value for usage with [`textDecorationSkip`](#textDecorationSkip).

    textDecorationSkip spaces

-}
spaces : Value { provides | spaces : Supported }
spaces =
    Value "spaces"


{-| Sets `ink` value for usage with [`textDecorationSkip`](#textDecorationSkip).

    textDecorationSkip ink

-}
ink : Value { provides | ink : Supported }
ink =
    Value "ink"


{-| Sets `edges` value for usage with [`textDecorationSkip`](#textDecorationSkip).

    textDecorationSkip edges

-}
edges : Value { provides | edges : Supported }
edges =
    Value "edges"


{-| Sets `boxDecoration` value for usage with [`textDecorationSkip`](#textDecorationSkip).

    textDecorationSkip boxDecoration

-}
boxDecoration : Value { provides | boxDecoration : Supported }
boxDecoration =
    Value "box-decoration"



-- ANGLES --


{-| A [`deg` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    deg 360 -- one full circle

    deg 14.23

-}
deg : Float -> Value { provides | deg : Supported }
deg degrees =
    Value (String.fromFloat degrees ++ "deg")


{-| A [`grad` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    grad 400 -- one full circle

    grad 38.8

-}
grad : Float -> Value { provides | grad : Supported }
grad gradians =
    Value (String.fromFloat gradians ++ "grad")


{-| A [`rad` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    rad 6.2832 -- approximately one full circle

    rad 1

-}
rad : Float -> Value { provides | rad : Supported }
rad radians =
    Value (String.fromFloat radians ++ "rad")


{-| A [`turn` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    turn 1 -- one full circle

    turn 0.25

-}
turn : Float -> Value { provides | turn : Supported }
turn turns =
    Value (String.fromFloat turns ++ "turn")



-- TEXT DECORATION --


{-| The `wavy` [`text-decoration-style`][text-decoration-style] value.

    textDecorationStyle wavy

[text-decoration-style]: https://css-tricks.com/almanac/properties/t/text-decoration-style/#article-header-id-0

-}
wavy : Value { provides | wavy : Supported }
wavy =
    Value "wavy"


{-| The `underline` [`text-decoration-line`][text-decoration-line] value.

    textDecorationLine underline

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/#article-header-id-0

-}
underline : Value { provides | underline : Supported }
underline =
    Value "underline"


{-| The `overline` [`text-decoration-line`][text-decoration-line] value.

    textDecorationLine overline

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/#article-header-id-0

-}
overline : Value { provides | overline : Supported }
overline =
    Value "overline"


{-| The `line-through` [`text-decoration-line`][text-decoration-line] value.

    textDecorationLine lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/#article-header-id-0

-}
lineThrough : Value { provides | lineThrough : Supported }
lineThrough =
    Value "line-through"



-- TABLES --
-- BORDER COLLAPSE --


{-| Sets [`border-collapse`](https://css-tricks.com/almanac/properties/b/border-collapse/).

    borderCollapse collapse

    borderCollapse separate

-}
borderCollapse :
    Value
        { collapse : Supported
        , separate : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
borderCollapse (Value str) =
    AppendProperty ("border-collapse:" ++ str)


{-| A `collapse` value for the [`border-collapse`](https://css-tricks.com/almanac/properties/b/border-collapse/) and
[`visibility`](https://css-tricks.com/almanac/properties/v/visibility/) property.

    borderCollapse collapse

    visibility collapse

-}
collapse : Value { provides | collapse : Supported }
collapse =
    Value "collapse"


{-| A `separate` value for the [`border-separate`](https://css-tricks.com/almanac/properties/b/border-collapse/) property.

    borderCollapse separate

-}
separate : Value { provides | separate : Supported }
separate =
    Value "separate"



-- BORDER SPACING --


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing).

    borderSpacing zero

    borderSpacing (px 5)

-}
borderSpacing :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
borderSpacing (Value str) =
    AppendProperty ("border-spacing:" ++ str)


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing), defining horizontal and vertical spacing separately.

    borderSpacing2 (cm 1) (em 2)

-}
borderSpacing2 :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    ->
        Value
            { zero : Supported
            , calc : Supported
            , ch : Supported
            , em : Supported
            , ex : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , px : Supported
            , cm : Supported
            , mm : Supported
            , inches : Supported
            , pc : Supported
            , pt : Supported
            }
    -> Style
borderSpacing2 (Value horizontal) (Value vertical) =
    AppendProperty ("border-spacing:" ++ horizontal ++ " " ++ vertical)



-- CAPTION SIDE --


{-| Sets [`caption-side`](https://css-tricks.com/almanac/properties/c/caption-side/).

    captionSide top_

    captionSide bottom_

-}
captionSide :
    Value
        { top_ : Supported
        , bottom_ : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
captionSide (Value str) =
    AppendProperty ("caption-side:" ++ str)



-- EMPTY CELLS --


{-| Sets [`empty-cells`](https://css-tricks.com/almanac/properties/e/empty-cells/).

    emptyCells show

    emptyCells hide

-}
emptyCells :
    Value
        { show : Supported
        , hide : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
emptyCells (Value str) =
    AppendProperty ("empty-cells:" ++ str)


{-| A `show` value for the [`empty-cells`](https://css-tricks.com/almanac/properties/e/empty-cells/) property.

    emptyCells show

-}
show : Value { provides | show : Supported }
show =
    Value "show"


{-| A `hide` value for the [`empty-cells`](https://css-tricks.com/almanac/properties/e/empty-cells/) property.

    emptyCells hide

-}
hide : Value { provides | hide : Supported }
hide =
    Value "hide"



-- TABLE LAYOUT --


{-| Sets [`table-layout`](https://css-tricks.com/almanac/properties/t/table-layout/).

    tableLayout auto

    tableLayout fixed

-}
tableLayout :
    Value
        { auto : Supported
        , fixed : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
tableLayout (Value str) =
    AppendProperty ("table-layout:" ++ str)



-- VERTICAL ALIGN


{-| Sets [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/).

    verticalAlign textBottom

    verticalAlign (em 1)

-}
verticalAlign :
    Value
        { baseline : Supported
        , sub : Supported
        , super : Supported
        , textTop : Supported
        , textBottom : Supported
        , middle : Supported
        , top_ : Supported
        , bottom_ : Supported
        , pct : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
verticalAlign (Value str) =
    AppendProperty ("vertical-align:" ++ str)


{-| A `sub` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign sub

-}
sub : Value { provides | sub : Supported }
sub =
    Value "sub"


{-| A `super` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign super

-}
super : Value { provides | super : Supported }
super =
    Value "super"


{-| A `textTop` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign textTop

-}
textTop : Value { provides | textTop : Supported }
textTop =
    Value "text-top"


{-| A `textBottom` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign textBottom

-}
textBottom : Value { provides | textBottom : Supported }
textBottom =
    Value "text-bottom"


{-| A `middle` value for the [`vertical-align`](https://css-tricks.com/almanac/properties/v/vertical-align/) property.

    verticalAlign middle

-}
middle : Value { provides | middle : Supported }
middle =
    Value "middle"


{-| Sets [`direction`](https://css-tricks.com/almanac/properties/d/direction/)

    direction ltr

    direction rtl

-}
direction :
    Value
        { rtl : Supported
        , ltr : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
direction (Value str) =
    AppendProperty ("direction:" ++ str)


{-| Sets [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/)

    textAlign left_

    textAlign justfy

-}
textAlign :
    Value
        { left_ : Supported
        , right_ : Supported
        , center : Supported
        , justify : Supported
        , start : Supported
        , end : Supported
        , matchParent : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
textAlign (Value str) =
    AppendProperty ("text-align:" ++ str)


{-| A `justify` value for the [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/)

    textAlign justify

-}
justify : Value { provides | justify : Supported }
justify =
    Value "justify"


{-| A `match-parent` value for the [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/),
and [`strokeOrigin`](#strokeOrigin) properties.

    textAlign matchParent

    strokeOrigin matchParent

-}
matchParent : Value { provides | matchParent : Supported }
matchParent =
    Value "match-parent"


{-| Sets [`text-justify`](https://css-tricks.com/almanac/properties/t/text-justify/)

    textJustify interWord

    textJustify interCharacter

    textJustify auto

    textJustify none

-}
textJustify :
    Value
        { interWord : Supported
        , interCharacter : Supported
        , auto : Supported
        , none : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textJustify (Value val) =
    AppendProperty ("text-justify:" ++ val)


{-| A `inter-word` value for the [`textJustify`](#textJustify) property.

    textJustify interWord

-}
interWord : Value { provides | interWord : Supported }
interWord =
    Value "inter-word"


{-| A `inter-character` value for the [`textJustify`](#textJustify) property.

    textJustify interCharacter

-}
interCharacter : Value { provides | interCharacter : Supported }
interCharacter =
    Value "inter-character"


{-| Sets [`text-underline-position`](https://css-tricks.com/almanac/properties/t/text-underline-position/)

    textUnderlinePositon auto

    textUnderlinePositon under

    textUnderlinePositon left_

    textUnderlinePositon right_

-}
textUnderlinePositon :
    Value
        { auto : Supported
        , under : Supported
        , left_ : Supported
        , right_ : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textUnderlinePositon (Value val) =
    AppendProperty ("text-underline-position:" ++ val)


{-| A `under` value for the [`textUnderlinePositon`](#textUnderlinePositon) property.

    textUnderlinePositon under

-}
under : Value { provides | under : Supported }
under =
    Value "under"


{-| A `ltr` value for the [`direction`](https://css-tricks.com/almanac/properties/d/direction/) property.

    direction ltr

-}
ltr : Value { provides | ltr : Supported }
ltr =
    Value "ltr"


{-| A `rtl` value for the [`direction`](https://css-tricks.com/almanac/properties/d/direction/) property.

    direction rtl

-}
rtl : Value { provides | rtl : Supported }
rtl =
    Value "rtl"



-- WHITE-SPACE --


{-| Sets [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/)

    whiteSpace pre

    whiteSpace nowrap

    whiteSpace preWrap

    whiteSpace preLine

-}
whiteSpace :
    Value
        { normal : Supported
        , nowrap : Supported
        , pre : Supported
        , preWrap : Supported
        , preLine : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
whiteSpace (Value str) =
    AppendProperty ("white-space:" ++ str)


{-| A `nowrap` value for the [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/) property.

    whiteSpace nowrap

-}
nowrap : Value { provides | nowrap : Supported }
nowrap =
    Value "nowrap"


{-| A `pre` value for the [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/) property.

    whiteSpace pre

-}
pre : Value { provides | pre : Supported }
pre =
    Value "pre"


{-| A `pre-wrap` value for the [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/) property.

    whiteSpace preWrap

-}
preWrap : Value { provides | preWrap : Supported }
preWrap =
    Value "pre-wrap"


{-| A `pre-line` value for the [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/) property.

    whiteSpace preLine

-}
preLine : Value { provides | preLine : Supported }
preLine =
    Value "pre-line"



--- WORD-BREAK ---


{-| Sets [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/)

      wordBreak normal
      wordBreak breakAll
      wordBreak keepAll
      wordBreak breakWord

-}
wordBreak :
    Value
        { normal : Supported
        , breakAll : Supported
        , keepAll : Supported
        , breakWord : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
wordBreak (Value str) =
    AppendProperty ("word-break:" ++ str)


{-| A `breakAll` value for the [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/) property.

      wordBreak breakAll

-}
breakAll : Value { provides | breakAll : Supported }
breakAll =
    Value "break-all"


{-| A `keepAll` value for the [`word-break`](https://css-tricks.com/almanac/properties/w/word-break/) property.

      wordBreak keepAll

-}
keepAll : Value { provides | keepAll : Supported }
keepAll =
    Value "keep-all"



-- FLOAT --


{-| Sets [`float`](https://css-tricks.com/almanac/properties/f/float/).

    float none

    float left_

    float right_

-}
float :
    Value
        { none : Supported
        , left_ : Supported
        , right_ : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
float (Value str) =
    AppendProperty ("float:" ++ str)



-- VISIBILITY --


{-| Sets [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/)

      visibility visible
      visibility hidden
      visibility collapse

-}
visibility :
    Value
        { visible : Supported
        , hidden : Supported
        , collapse : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
visibility (Value str) =
    AppendProperty ("visibility:" ++ str)



-- ORDER --


{-| Sets [`order`](https://css-tricks.com/almanac/properties/o/order/)

    order (num 2)

    order (num -2)

-}
order :
    Value
        { num : Supported
        , zero : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
order (Value val) =
    AppendProperty ("order:" ++ val)


{-| Sets [`fill`](https://css-tricks.com/almanac/properties/f/fill/)
**Note:** `fill` also accepts the patterns of SVG shapes that are defined inside of a [`defs`](https://css-tricks.com/snippets/svg/svg-patterns/) element.

    fill (hex "#60b5cc")

    fill (rgb 96 181 204)

    fill (rgba 96 181 204 0.5)

    fill (url "#pattern")

-}
fill :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , currentColor : Supported
        , transparent : Supported
        , url : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fill (Value val) =
    AppendProperty ("fill:" ++ val)



-- COLUMNS --


{-| Sets [`columns`](https://css-tricks.com/almanac/properties/c/columns/)

    columns (px 300)

    columns2 (px 300) (num 2)

-}
columns :
    Value
        { auto : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columns (Value width_) =
    AppendProperty ("columns:" ++ width_)


{-| Sets [`columns`](https://css-tricks.com/almanac/properties/c/columns/)

    columns (px 300)

    columns2 (px 300) (num 2)

-}
columns2 :
    Value
        { auto : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    ->
        Value
            { auto : Supported
            , num : Supported
            }
    -> Style
columns2 (Value width_) (Value count) =
    AppendProperty ("columns:" ++ width_ ++ " " ++ count)


{-| Sets [`column-width`](https://css-tricks.com/almanac/properties/c/column-width/)

    columnWidth auto

    columnWidth (px 200)

-}
columnWidth :
    Value
        { auto : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnWidth (Value width_) =
    AppendProperty ("column-width:" ++ width_)


{-| Sets [`column-count`](https://css-tricks.com/almanac/properties/c/column-count/)

    columnCount auto

    columnCount (num 3)

-}
columnCount :
    Value
        { auto : Supported
        , num : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnCount (Value count) =
    AppendProperty ("column-count:" ++ count)


{-| Sets [`column-fill`](https://css-tricks.com/almanac/properties/c/column-fill/)

    columnFill auto

    columnFill balance

    columnFill balanceAll

-}
columnFill :
    Value
        { auto : Supported
        , balance : Supported
        , balanceAll : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnFill (Value val) =
    AppendProperty ("column-fill:" ++ val)


{-| A `balance` value used in properties such as [`columnFill`](#columnFill)

    columnFill balance

-}
balance : Value { provides | balance : Supported }
balance =
    Value "balance"


{-| A `balance-all` value used in properties such as [`columnFill`](#columnFill)

    columnFill balanceAll

-}
balanceAll : Value { provides | balanceAll : Supported }
balanceAll =
    Value "balance-all"


{-| Sets [`column-span`](https://css-tricks.com/almanac/properties/c/column-span/)

    columnSpan all_

    columnSpan none

-}
columnSpan :
    Value
        { none : Supported
        , all_ : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnSpan (Value span) =
    AppendProperty ("column-span:" ++ span)


{-| A `all` value used in properties such as [`columnSpan`](#columnSpan).

    columnSpan all_

-}
all_ : Value { provides | all_ : Supported }
all_ =
    Value "all"


{-| Sets [`column-gap`](https://css-tricks.com/almanac/properties/c/column-gap/)

    columnGap normal

    columnGap (px 20)

-}
columnGap :
    Value
        { normal : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnGap (Value width_) =
    AppendProperty ("column-gap:" ++ width_)


{-| Sets [`column-rule-width`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-width)

    columnRuleWidth thin

    columnRuleWidth (px 2)

-}
columnRuleWidth :
    Value
        { thin : Supported
        , medium : Supported
        , thick : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnRuleWidth (Value width_) =
    AppendProperty ("column-rule-width:" ++ width_)


{-| Sets [`column-rule-style`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-style)

    columnRuleStyle solid

    columnRuleStyle dotted

    columnRuleStyle dashed

-}
columnRuleStyle :
    Value
        { solid : Supported
        , none : Supported
        , hidden : Supported
        , dashed : Supported
        , dotted : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
columnRuleStyle (Value style) =
    AppendProperty ("column-rule-style:" ++ style)


{-| Sets [`column-rule-color`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-color)

    columnRuleColor (rgb 0 0 0)

    columnRuleColor (hex "#fff")

-}
columnRuleColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
columnRuleColor (Value colorVal) =
    AppendProperty ("column-rule-color:" ++ colorVal)



-- STROKE --


{-| Sets [`stroke-dasharray`](https://css-tricks.com/almanac/properties/s/stroke-dasharray/)

    strokeDasharray (num 2)

    strokeDasharray (num 2.5)

    strokeDasharray (em 2)

    strokeDasharray (pct 15)

-}
strokeDasharray :
    Value
        { zero : Supported
        , calc : Supported
        , num : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeDasharray (Value val) =
    AppendProperty ("stroke-dasharray:" ++ val)


{-| Sets [`stroke-dashoffset`](https://css-tricks.com/almanac/properties/s/stroke-dashoffset/)

    strokeDashoffset zero

    strokeDashoffset (num 100)

    strokeDashoffset (pct 25)

-}
strokeDashoffset :
    Value
        { zero : Supported
        , calc : Supported
        , num : Supported
        , pct : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeDashoffset (Value val) =
    AppendProperty ("stroke-dashoffset:" ++ val)


{-| Sets [`stroke-linecap`](https://css-tricks.com/almanac/properties/s/stroke-linecap/)

    strokeLinecap butt

    strokeLinecap square

    strokeLinecap round

-}
strokeLinecap :
    Value
        { butt : Supported
        , square : Supported
        , round : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeLinecap (Value val) =
    AppendProperty ("stroke-linecap:" ++ val)


{-| A `butt` value for the [`strokeLinecap`](#strokeLinecap) property.

      strokeLinecap butt

-}
butt : Value { provides | butt : Supported }
butt =
    Value "butt"


{-| A `square` value for the [`strokeLinecap`](#strokeLinecap) property.

      strokeLinecap square

-}
square : Value { provides | square : Supported }
square =
    Value "square"


{-| Sets [`stroke-width`](https://css-tricks.com/almanac/properties/s/stroke-width/)

    strokeWidth zero

    strokeWidth (px 2)

    strokeWidth (em 2)

    strokeWidth (num 2)

    strokeWidth (num 2.5)

    strokeWidth (pct 15)

-}
strokeWidth :
    Value
        { zero : Supported
        , calc : Supported
        , num : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeWidth (Value val) =
    AppendProperty ("stroke-width:" ++ val)


{-| Sets [`stroke-align`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-align)

      strokeAlign center
      strokeAlign inset
      strokeAlign outset

-}
strokeAlign :
    Value
        { center : Supported
        , inset : Supported
        , outset : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeAlign (Value val) =
    AppendProperty ("stroke-align:" ++ val)


{-| Sets [`stroke-break`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-break)

      strokeBreak boundingBox
      strokeBreak slice
      strokeBreak clone

-}
strokeBreak :
    Value
        { boundingBox : Supported
        , slice : Supported
        , clone : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeBreak (Value val) =
    AppendProperty ("stroke-break:" ++ val)


{-| A `boundingBox` value for the [`strokeBreak`](#strokeBreak) property.

      strokeBreak boundingBox

-}
boundingBox : Value { provides | boundingBox : Supported }
boundingBox =
    Value "bounding-box"


{-| A `slice` value for the [`strokeBreak`](#strokeBreak) property.

      strokeBreak slice

-}
slice : Value { provides | slice : Supported }
slice =
    Value "slice"


{-| A `clone` value for the [`strokeBreak`](#strokeBreak) property.

      strokeBreak clone

-}
clone : Value { provides | clone : Supported }
clone =
    Value "clone"


{-| Sets [`stroke-color`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-color)

    strokeColor (rgb 0 100 44)

    strokeColor (hex "#FF9E2C")

-}
strokeColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , currentColor : Supported
        , transparent : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeColor (Value val) =
    AppendProperty ("stroke-color:" ++ val)


{-| Sets [`stroke-image`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-image)

    strokeImage (url "#svg-pattern")

    strokeImage (url "http://www.example.com/chicken.jpg")

-}
strokeImage :
    Value
        { url : Supported
        , none : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeImage (Value value) =
    AppendProperty ("stroke-image:" ++ value)


{-| Sets [`stroke-miterlimit`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-miterlimit)

    strokeMiterlimit (num 4)

-}
strokeMiterlimit :
    Value
        { num : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeMiterlimit (Value val) =
    AppendProperty ("stroke-miterlimit:" ++ val)


{-| Sets [`stroke-opacity`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-opacity)

    strokeOpacity (num 0.5)

-}
strokeOpacity :
    Value
        { num : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeOpacity (Value val) =
    AppendProperty ("stroke-opacity:" ++ val)


{-| Sets [`stroke-origin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-origin)

    strokeOrign matchParent

    strokeOrign fillBox

    strokeOrign strokeBox

    strokeOrign contentBox

    strokeOrign paddingBox

    strokeOrign borderBox

-}
strokeOrigin :
    Value
        { matchParent : Supported
        , fillBox : Supported
        , strokeBox : Supported
        , contentBox : Supported
        , paddingBox : Supported
        , borderBox : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeOrigin (Value val) =
    AppendProperty ("stroke-origin:" ++ val)


{-| A `fillBox` value for the [`strokeOrigin`](#strokeOrigin) property.

      strokeOrigin fillBox

-}
fillBox : Value { provides | fillBox : Supported }
fillBox =
    Value "fill-box"


{-| A `strokeBox` value for the [`strokeOrigin`](#strokeOrigin) property.

      strokeOrigin strokeBox

-}
strokeBox : Value { provides | strokeBox : Supported }
strokeBox =
    Value "stroke-box"


{-| Sets [`stroke-position`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-position).

    strokePosition left_

    strokePosition (px 45)

`strokePosition` sets the horizontal direction. If you need the vertical
direction instead, use [`strokePosition2`](#strokePosition2) like this:

    strokePosition zero (px 45)

If you need to set the offsets from the right or bottom, use
[`strokePosition4`](#strokePosition4) like this:

    strokePosition4 right_ (px 20) bottom_ (pct 25)

-}
strokePosition :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        , inherit : Supported
        , unset : Supported
        , initial : Supported
        }
    -> Style
strokePosition (Value horiz) =
    AppendProperty ("stroke-position:" ++ horiz)


{-| Sets [`stroke-position`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-position).

    strokePosition2 left_ top_

    strokePosition2 (px 45) (pct 50)

`strokePosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`strokePosition`](#strokePosition) instead:

    strokePosition left_

If you need to set the offsets from the right or bottom, use
[`strokePosition4`](#strokePosition4) like this:

    strokePosition4 right_ (px 20) bottom_ (pct 25)

-}
strokePosition2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
    -> Style
strokePosition2 (Value horiz) (Value vert) =
    AppendProperty ("stroke-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`stroke-position`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-position).

    strokePosition4 right_ (px 20) bottom_ (pct 30)

The four-argument form of stroke-position alternates sides and offets. So the
example above would position the stroke-image 20px from the right, and 30%
from the bottom.

See also [`strokePosition`](#strokePosition) for horizontal alignment and
[`strokePosition2`](#strokePosition2) for horizontal (from left) and
vertical (from top) alignment.

-}
strokePosition4 :
    Value
        { left_ : Supported
        , right_ : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
strokePosition4 (Value horiz) (Value horizAmount) (Value vert) (Value vertAmount) =
    AppendProperty
        ("stroke-position:"
            ++ horiz
            ++ " "
            ++ horizAmount
            ++ " "
            ++ vert
            ++ " "
            ++ vertAmount
        )


{-| Sets [`stroke-repeat`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-repeat)

    strokeRepeat repeat

    strokeRepeat repeatX

If you need to set horizontal and vertical direction separately, see
[`strokeRepeat2`](#strokeRepeat2)

-}
strokeRepeat :
    Value
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round : Supported
        , noRepeat : Supported
        , initial : Supported
        , unset : Supported
        , inherit : Supported
        }
    -> Style
strokeRepeat (Value amount) =
    AppendProperty ("stroke-repeat:" ++ amount)


{-| Sets [`stroke-repeat`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-repeat) along the horizontal axis, then the vertical axis.

    strokeRepeat2 repeat space

    strokeRepeat2 space round

If you only need to set one value for both, see
[`strokeRepeat`](#strokeRepeat) instead.

-}
strokeRepeat2 :
    Value
        { repeat : Supported
        , space : Supported
        , round : Supported
        , noRepeat : Supported
        }
    ->
        Value
            { repeat : Supported
            , space : Supported
            , round : Supported
            , noRepeat : Supported
            }
    -> Style
strokeRepeat2 (Value horiz) (Value vert) =
    AppendProperty ("stroke-repeat:" ++ horiz ++ " " ++ vert)


{-| Sets [`stroke-size`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-size).

    strokeSize cover

    strokeSize (px 400)

If you give a length value, it will be used for the width. The height will be set
proportional to the size of the [`stroke-image`](#strokeImage). If you
need to set both width and height explicitly, use
[`strokeImage2`](#strokeImage2) instead.

-}
strokeSize :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , cover : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeSize (Value size) =
    AppendProperty ("stroke-size:" ++ size)


{-| Sets [`stroke-size`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-size).

    strokeSize2 (px 300) (px 100)

    strokeSize2 auto (px 400)

If you only want to set the width, use [`strokeImage`](#strokeImage) instead.

-}
strokeSize2 :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        }
    ->
        Value
            { px : Supported
            , cm : Supported
            , mm : Supported
            , inches : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , ch : Supported
            , em : Supported
            , ex : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , auto : Supported
            }
    -> Style
strokeSize2 (Value width_) (Value height) =
    AppendProperty ("stroke-size:" ++ width_ ++ " " ++ height)


{-| Sets [`stroke-dash-corner`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-dash-corner).

    strokeDashCorner none

    strokeDashCorner (px 10)

    strokeDashCorner (em 5)

-}
strokeDashCorner :
    Value
        { none : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , cover : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeDashCorner (Value size) =
    AppendProperty ("stroke-dash-corner:" ++ size)


{-| Sets [`stroke-linejoin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-linejoin).

    strokeLinejoin crop

    strokeLinejoin arcs

    strokeLinejoin miter

**Note:** if you only want to specifiy the rendering of the cap of a corner you need to use [`strokeLinejoin2`](#strokeLinejoin2)
and set it's first value to `miter` like so: `strokeLinejoin2 miter bevel`.

-}
strokeLinejoin :
    Value
        { crop : Supported
        , arcs : Supported
        , miter : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeLinejoin (Value val) =
    AppendProperty ("stroke-linejoin:" ++ val)


{-| Sets [`stroke-linejoin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-linejoin).

    strokeLinejoin crop bevel

    strokeLinejoin arcs round

    strokeLinejoin miter fallback

-}
strokeLinejoin2 :
    Value
        { crop : Supported
        , arcs : Supported
        , miter : Supported
        }
    ->
        Value
            { bevel : Supported
            , round : Supported
            , fallback : Supported
            }
    -> Style
strokeLinejoin2 (Value extendCorner) (Value capRender) =
    AppendProperty ("stroke-linejoin:" ++ extendCorner ++ " " ++ capRender)


{-| Sets `crop` value for usage with [`strokeLinejoin`](#strokeLinejoin).

    strokeLinejoin crop

-}
crop : Value { provides | crop : Supported }
crop =
    Value "crop"


{-| Sets `arcs` value for usage with [`strokeLinejoin`](#strokeLinejoin).

    strokeLinejoin arcs

-}
arcs : Value { provides | arcs : Supported }
arcs =
    Value "arcs"


{-| Sets `miter` value for usage with [`strokeLinejoin`](#strokeLinejoin).

    strokeLinejoin miter

-}
miter : Value { provides | miter : Supported }
miter =
    Value "miter"


{-| Sets `bevel` value for usage with [`strokeLinejoin`](#strokeLinejoins2).

    strokeLinejoin miter bevel

-}
bevel : Value { provides | bevel : Supported }
bevel =
    Value "bevel"


{-| Sets [`stroke-dash-justify`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-dash-justify).

      strokeDashJustify none
      strokeDashJustify stretch
      strokeDashJustify compress
      strokeDashJustify dashes
      strokeDashJustify gaps

-}
strokeDashJustify :
    Value
        { none : Supported
        , stretch : Supported
        , compress : Supported
        , dashes : Supported
        , gaps : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
strokeDashJustify (Value val) =
    AppendProperty ("stroke-dash-justify:" ++ val)


{-| Sets `compress` value for usage with [`strokeDashJustify`](#strokeDashJustify).

      strokeDashJustify compress

-}
compress : Value { provides | compress : Supported }
compress =
    Value "compress"


{-| Sets `dashes` value for usage with [`strokeDashJustify`](#strokeDashJustify).

      strokeDashJustify dashes

-}
dashes : Value { provides | dashes : Supported }
dashes =
    Value "dashes"


{-| Sets `gaps` value for usage with [`strokeDashJustify`](#strokeDashJustify).

      strokeDashJustify gaps

-}
gaps : Value { provides | gaps : Supported }
gaps =
    Value "gaps"


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule :
    Value
        { thin : Supported
        , medium : Supported
        , thick : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
columnRule (Value width_) =
    AppendProperty ("column-rule:" ++ width_)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule2 :
    Value
        { thin : Supported
        , medium : Supported
        , thick : Supported
        , zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    -> Style
columnRule2 (Value width_) (Value style) =
    AppendProperty ("column-rule:" ++ width_ ++ " " ++ style)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule3 :
    Value
        { thin : Supported
        , medium : Supported
        , thick : Supported
        , zero : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    ->
        Value
            { solid : Supported
            , none : Supported
            , hidden : Supported
            , dashed : Supported
            , dotted : Supported
            , double : Supported
            , groove : Supported
            , ridge : Supported
            , inset : Supported
            , outset : Supported
            }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
columnRule3 (Value width_) (Value style) (Value colorVal) =
    AppendProperty ("column-rule:" ++ width_ ++ " " ++ style ++ " " ++ colorVal)



-- TRANSFORM


{-| Sets [`transform`](https://css-tricks.com/almanac/properties/t/transform/)
with a series of transform-functions. If an empty list is provided, the CSS
output will be none, as if to state directly that the set of transforms applied
to the current selector is empty.

    transform [] -- transform: none;
    transform [ (matrix 1.0 2.0 3.0 4.0 5.0 6.0) ]
    transform [ (matrix3d 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1) ]
    transform [ (translate (px 12)) ]
    transform [ (translate2 (px 12) (pct 50)) ]
    transform [ (translateX (em 2)) ]
    transform [ (translateY (in 3)) ]
    transform [ (translateZ (px 2)) ]
    transform [ (translate3d (px 12) (pct 50) (em 3)) ]
    transform [ (scale 2) ]
    transform [ (scale2 2, 0.5) ]
    transform [ (scaleX 2) ]
    transform [ (scaleY 0.5) ]
    transform [ (scaleZ 0.3) ]
    transform [ (scale3d 2.5 1.2 0.3) ]
    transform [ (skew (deg 20)) ]
    transform [ (skew2 (deg 30) (deg 20)) ]
    transform [ (skewX (deg 30)) ]
    transform [ (skewY (rad 1.07)) ]
    transform [ (rotate (turn 0.5)) ]
    transform [ (rotateX (deg 10)) ]
    transform [ (rotateY (deg 10)) ]
    transform [ (rotateZ (deg 10)) ]
    transform [ (rotate3d 1 2.0 3.0 (deg 10)) ]
    transform [ (perspective (px 17)) ]
    transform [ (translate (px 12)), (scale 2), (skew (deg 20)) ]

-}
transform :
    List
        (Value
            { matrix : Supported
            , matrix3d : Supported
            , translate : Supported
            , translate2 : Supported
            , translateX : Supported
            , translateY : Supported
            , translateZ : Supported
            , translate3d : Supported
            , scale : Supported
            , scale2 : Supported
            , scaleX : Supported
            , scaleY : Supported
            , scaleZ : Supported
            , scale3d : Supported
            , skew : Supported
            , skew2 : Supported
            , skewX : Supported
            , skewY : Supported
            , rotate : Supported
            , rotateX : Supported
            , rotateY : Supported
            , rotateZ : Supported
            , rotate3d : Supported
            , perspective : Supported
            }
        )
    -> Style
transform values =
    let
        intoTransform =
            List.map unpackValue
                >> String.join ","
                >> (++) "transform:"
                >> AppendProperty
    in
    case values of
        [] ->
            intoTransform [ none ]

        list ->
            intoTransform list


unpackValue : Value a -> String
unpackValue (Value value) =
    value



-- MATRIX TRANSFORMATION


{-| Sets `matrix` value for usage with [`transform`](#transform).
The first four numeric values describe the linear transformation.
The last two numeric values describe the translation to apply.

        transform (matrix 1 2 -1 1 80 80)

-}
matrix :
    Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Value { provides | matrix : Supported }
matrix a b c d tx ty =
    Value
        ("matrix("
            ++ String.fromFloat a
            ++ " "
            ++ String.fromFloat b
            ++ " "
            ++ String.fromFloat c
            ++ " "
            ++ String.fromFloat d
            ++ " "
            ++ String.fromFloat tx
            ++ " "
            ++ String.fromFloat ty
            ++ ")"
        )


{-| Sets `matrix3d` value for usage with [`transform`](#transform).
Every fourth number describes the translation to apply. All other describe the
linear tranformation.

        transform (matrix3d 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1)

-}
matrix3d :
    Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> Value { provides | matrix : Supported }
matrix3d a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 d3 a4 b4 c4 d4 =
    Value
        ("matrix3d:"
            ++ String.fromFloat a1
            ++ ","
            ++ String.fromFloat b1
            ++ ","
            ++ String.fromFloat c1
            ++ ","
            ++ String.fromFloat d1
            ++ ","
            ++ String.fromFloat a2
            ++ ","
            ++ String.fromFloat b2
            ++ ","
            ++ String.fromFloat c2
            ++ ","
            ++ String.fromFloat d2
            ++ ","
            ++ String.fromFloat a3
            ++ ","
            ++ String.fromFloat b3
            ++ ","
            ++ String.fromFloat c3
            ++ ","
            ++ String.fromFloat d3
            ++ ","
            ++ String.fromFloat a4
            ++ ","
            ++ String.fromFloat b4
            ++ ","
            ++ String.fromFloat c4
            ++ ","
            ++ String.fromFloat d4
            ++ ")"
        )



-- TRANSLATION (moving)


{-| Sets `translate` value for usage with [`transform`](#transform).

    transform (translate (px 10))

-}
translate :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    -> Value { provides | translate : Supported }
translate (Value valX) =
    Value ("translate(" ++ valX ++ ")")


{-| Sets `translate` value for usage with [`transform`](#transform).

    transform (translate (px 10) (px 20))

-}
translate2 :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    ->
        Value
            { zero : Supported
            , calc : Supported
            , ch : Supported
            , em : Supported
            , ex : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , px : Supported
            , cm : Supported
            , mm : Supported
            , inches : Supported
            , pc : Supported
            , pt : Supported
            }
    -> Value { provides | translate2 : Supported }
translate2 (Value valX) (Value valY) =
    Value ("translate(" ++ valX ++ "," ++ valY ++ ")")


{-| Sets `translateX` value for usage with [`transform`](#transform).

    transform (translateX (px 10))

-}
translateX :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    -> Value { provides | translateX : Supported }
translateX (Value valX) =
    Value ("translateX(" ++ valX ++ ")")


{-| Sets `translateY` value for usage with [`transform`](#transform).

    transform (translateY (px 10))

-}
translateY :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    -> Value { provides | translateY : Supported }
translateY (Value valY) =
    Value ("translateY(" ++ valY ++ ")")


{-| Sets `translateZ` value for usage with [`transform`](#transform).

    transform (translateZ (px 10))

-}
translateZ :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    -> Value { provides | translateZ : Supported }
translateZ (Value z) =
    Value ("translateZ(" ++ z ++ ")")


{-| Sets `translate3d` value for usage with [`transform`](#transform).

    transform (translate3d (px 12) (pct 50) (em 3))

-}
translate3d :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        }
    ->
        Value
            { zero : Supported
            , calc : Supported
            , ch : Supported
            , em : Supported
            , ex : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , px : Supported
            , cm : Supported
            , mm : Supported
            , inches : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            }
    ->
        Value
            { zero : Supported
            , calc : Supported
            , ch : Supported
            , em : Supported
            , ex : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmin : Supported
            , vmax : Supported
            , px : Supported
            , cm : Supported
            , mm : Supported
            , inches : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            }
    -> Value { provides | translate3d : Supported }
translate3d (Value valX) (Value valY) (Value z) =
    Value ("translate3d(" ++ valX ++ "," ++ valY ++ "," ++ z ++ ")")



-- SCALING (resizing)


{-| Sets `scale` value for usage with [`transform`](#transform).

    transform (scale 0.7)

-}
scale : Float -> Value { provides | scale : Supported }
scale val =
    Value ("scale(" ++ String.fromFloat val ++ ")")


{-| Sets `scale` value for usage with [`transform`](#transform).

    transform (scale 0.7 0.7)

-}
scale2 : Float -> Float -> Value { provides | scale2 : Supported }
scale2 valX valY =
    Value ("scale(" ++ String.fromFloat valX ++ ", " ++ String.fromFloat valY ++ ")")


{-| Sets `scaleX` value for usage with [`transform`](#transform).

    transform (scaleX 0.7)

-}
scaleX : Float -> Value { provides | scaleX : Supported }
scaleX valX =
    Value ("scaleX(" ++ String.fromFloat valX ++ ")")


{-| Sets `scaleY` value for usage with [`transform`](#transform).

    transform (scaleY 0.7)

-}
scaleY : Float -> Value { provides | scaleY : Supported }
scaleY valY =
    Value ("scaleY(" ++ String.fromFloat valY ++ ")")


{-| Sets `scaleZ` value for usage with [`transform`](#transform).

    transform (scaleZ 0.7)

-}
scaleZ : Float -> Value { provides | scaleZ : Supported }
scaleZ z =
    Value ("scaleZ(" ++ String.fromFloat z ++ ")")


{-| Sets `scale3d` value for usage with [`transform`](#transform).

    transform (scale3d 2 0.7 0.2)

-}
scale3d :
    Float
    -> Float
    -> Float
    -> Value { provides | scale3d : Supported }
scale3d valX valY z =
    Value ("scale3d(" ++ String.fromFloat valX ++ "," ++ String.fromFloat valY ++ "," ++ String.fromFloat z ++ ")")



-- SKEWING (distortion)


{-| Sets `skew` value for usage with [`transform`](#transform).

    transform (skew (deg 30))

-}
skew :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | skew : Supported }
skew (Value angle) =
    Value ("skew(" ++ angle ++ ")")


{-| Sets `skew` value for usage with [`transform`](#transform).

    transform (skew2 (deg 30) (deg 10))

-}
skew2 :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    ->
        Value
            { deg : Supported
            , grad : Supported
            , rad : Supported
            , turn : Supported
            }
    -> Value { provides | skew2 : Supported }
skew2 (Value angle1) (Value angle2) =
    Value ("skew(" ++ angle1 ++ "," ++ angle2 ++ ")")


{-| Sets `skewX` value for usage with [`transform`](#transform).

    transform (skewX (deg 30))

-}
skewX :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | skewX : Supported }
skewX (Value angle) =
    Value ("skewX(" ++ angle ++ ")")


{-| Sets `skewY` value for usage with [`transform`](#transform).

    transform (skewY (deg 30))

-}
skewY :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | skewY : Supported }
skewY (Value angle) =
    Value ("skewY(" ++ angle ++ ")")



-- ROTATION


{-| Sets `rotate` value for usage with [`transform`](#transform).

    transform (rotate (deg 30))

-}
rotate :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | rotate : Supported }
rotate (Value angle) =
    Value ("rotate(" ++ angle ++ ")")


{-| Sets `rotateX` value for usage with [`transform`](#transform).

    transform (rotateX (deg 30))

-}
rotateX :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | rotateX : Supported }
rotateX (Value angle) =
    Value ("rotateX(" ++ angle ++ ")")


{-| Sets `rotateY` value for usage with [`transform`](#transform).

    transform (rotateY (deg 30))

-}
rotateY :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | rotateY : Supported }
rotateY (Value angle) =
    Value ("rotateY(" ++ angle ++ ")")


{-| Sets `rotateZ` value for usage with [`transform`](#transform).

    transform (rotateZ (deg 30))

-}
rotateZ :
    Value
        { deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        }
    -> Value { provides | rotateZ : Supported }
rotateZ (Value angle) =
    Value ("rotateZ(" ++ angle ++ ")")


{-| Sets `rotate3d` value for usage with [`transform`](#transform).

    transform (rotate3d 0 1 0 (deg 30))

-}
rotate3d :
    Float
    -> Float
    -> Float
    ->
        Value
            { deg : Supported
            , grad : Supported
            , rad : Supported
            , turn : Supported
            }
    -> Value { provides | rotate3d : Supported }
rotate3d valX valY z (Value angle) =
    Value
        ("rotate3d("
            ++ String.fromFloat valX
            ++ ","
            ++ String.fromFloat valY
            ++ ","
            ++ String.fromFloat z
            ++ ","
            ++ angle
            ++ ")"
        )



-- PERSPECTIVE


{-| Sets `perspective` value for usage with [`transform`](#transform).

    transform (perspective (px 17))

-}
perspective :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        }
    -> Value { provides | perspective : Supported }
perspective (Value length) =
    Value ("perspective(" ++ length ++ ")")


{-| Sets [`clear`](https://css-tricks.com/almanac/properties/c/clear/) property.

    clear none

    clear both

    clear left_

    clear right_

    clear inlineStart

    clear inlineEnd

-}
clear :
    Value
        { none : Supported
        , left_ : Supported
        , right_ : Supported
        , both : Supported
        , inlineStart : Supported
        , inlineEnd : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
clear (Value val) =
    AppendProperty ("clear:" ++ val)


{-| Sets `both` value for usage with [`clear`](#clear).

      clear both

-}
both : Value { provides | both : Supported }
both =
    Value "both"


{-| Sets `inline-start` value for usage with [`clear`](#clear).

      clear inlineStart

-}
inlineStart : Value { provides | inlineStart : Supported }
inlineStart =
    Value "inline-start"


{-| Sets `inline-end` value for usage with [`clear`](#clear).

      clear inlineEnd

-}
inlineEnd : Value { provides | inlineEnd : Supported }
inlineEnd =
    Value "inline-end"


{-| Sets [`opacity`](https://css-tricks.com/almanac/properties/o/opacity/)

    opacity (num 0.5)

    opacity (num 1.0)

    opacity zero

-}
opacity :
    Value
        { num : Supported
        , zero : Supported
        , calc : Supported
        , pct : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
opacity (Value val) =
    AppendProperty ("opacity:" ++ val)


{-| Sets [`zoom`](https://css-tricks.com/almanac/properties/z/zoom/)

    zoom (pct 150)

    zoom (num 1.5)

    zoom normal

-}
zoom :
    Value
        { pct : Supported
        , zero : Supported
        , num : Supported
        , normal : Supported
        , calc : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
zoom (Value val) =
    AppendProperty ("zoom:" ++ val)


{-| Sets [`line-height`](https://css-tricks.com/almanac/properties/l/line-height/)

    lineHeight (pct 150)

    lineHeight (em 2)

    lineHeight (num 1.5)

    lineHeight normal

-}
lineHeight :
    Value
        { pct : Supported
        , normal : Supported
        , num : Supported
        , ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
lineHeight (Value val) =
    AppendProperty ("line-height:" ++ val)


{-| Sets [`letter-spacing`](https://css-tricks.com/almanac/properties/l/letter-spacing/)

    letterSpacing (pct 150)

    letterSpacing (em 2)

    letterSpacing (num 1.5)

    letterSpacing normal

-}
letterSpacing :
    Value
        { inherit : Supported
        , normal : Supported
        , initial : Supported
        , unset : Supported
        , rem : Supported
        , px : Supported
        , em : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
letterSpacing (Value val) =
    AppendProperty ("letter-spacing:" ++ val)


{-| Sets [`width`](https://css-tricks.com/almanac/properties/w/width/).

    width (px 150)

    width (em 1.5)

    width auto

-}
width :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
width (Value size) =
    AppendProperty ("width:" ++ size)


{-| Sets [`minWidth`](https://css-tricks.com/almanac/properties/m/min-width/).

    minWidth (px 150)

    minWidth (em 1.5)

    minWidth auto

-}
minWidth :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
minWidth (Value size) =
    AppendProperty ("min-width:" ++ size)


{-| Sets [`maxWidth`](https://css-tricks.com/almanac/properties/m/max-width/).

    maxWidth (px 150)

    maxWidth (em 1.5)

    maxWidth auto

-}
maxWidth :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
maxWidth (Value size) =
    AppendProperty ("max-width:" ++ size)


{-| Sets [`backface-visibility`](https://css-tricks.com/almanac/properties/b/backface-visibility/)

    backfaceVisibility visible

    backfaceVisibility hidden

-}
backfaceVisibility :
    Value
        { visible : Supported
        , hidden : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
backfaceVisibility (Value val) =
    AppendProperty ("backface-visibility" ++ val)


{-| Sets [`bleed`](https://css-tricks.com/almanac/properties/b/bleed/)

    bleed auto

    bleed (pt 10)

-}
bleed :
    Value
        { auto : Supported
        , pt : Supported
        , cm : Supported
        , inches : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
bleed (Value val) =
    AppendProperty ("bleed:" ++ val)


{-| Sets [`caret-color`](https://css-tricks.com/almanac/properties/c/caret-color/)

    caretColor (hex "#60b5cc")

    caretColor (rgb 96 181 204)

    caretColor (rgba 96 181 204 0.5)

-}
caretColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , currentColor : Supported
        , transparent : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
caretColor (Value val) =
    AppendProperty ("caret-color:" ++ val)


{-| Sets `avoid` value for usage with [`breakInside`](#breakInside).

      breakInside avoid

-}
avoid : Value { provides | avoid : Supported }
avoid =
    Value "avoid"


{-| Sets `avoid-page` value for usage with [`breakInside`](#breakInside).

      breakInside avoidPage

-}
avoidPage : Value { provides | avoidPage : Supported }
avoidPage =
    Value "avoid-page"


{-| Sets `avoid-column` value for usage with [`breakInside`](#breakInside).

      breakInside avoidColumn

-}
avoidColumn : Value { provides | avoidColumn : Supported }
avoidColumn =
    Value "avoid-column"


{-| Sets `avoid-region` value for usage with [`breakInside`](#breakInside).

      breakInside avoidRegion

-}
avoidRegion : Value { provides | avoidRegion : Supported }
avoidRegion =
    Value "avoid-region"


{-| Sets [`break-inside`](https://css-tricks.com/almanac/properties/b/break-inside/)

    breakInside auto

    breakInside avoid

    breakInside avoidPage

    breakInside avoidColumn

    breakInside avoidRegion

-}
breakInside :
    Value
        { auto : Supported
        , avoid : Supported
        , avoidPage : Supported
        , avoidColumn : Supported
        , avoidRegion : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
breakInside (Value val) =
    AppendProperty ("break-inside:" ++ val)


{-| Sets [`box-decoration-break`](https://css-tricks.com/almanac/properties/b/box-decoration-break/)

    boxDecorationBreak slice

    boxDecorationBreak clone

-}
boxDecorationBreak :
    Value
        { slice : Supported
        , clone : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
boxDecorationBreak (Value val) =
    AppendProperty ("box-decoration-break:" ++ val)


{-| Sets `swap` value for usage with [`fontDisplay`](#fontDisplay).

    fontDisplay swap

-}
swap : Value { provides | swap : Supported }
swap =
    Value "swap"


{-| Sets `fallback` value for usage with [`fontDisplay`](#fontDisplay) or [`strokeLinejoin`](#strokeLinejoin2).

      fontDisplay fallback
      strokeLinejoin2 miter fallback

-}
fallback : Value { provides | fallback : Supported }
fallback =
    Value "fallback"


{-| Sets `optional` value for usage with [`fontDisplay`](#fontDisplay).

      fontDisplay optional

-}
optional : Value { provides | optional : Supported }
optional =
    Value "optional"


{-| Sets [`font-display`](https://css-tricks.com/almanac/properties/f/font-display/)

    fontDisplay auto

    fontDisplay block

    fontDisplay swap

    fontDisplay fallback

    fontDisplay optional

-}
fontDisplay :
    Value
        { auto : Supported
        , block : Supported
        , swap : Supported
        , fallback : Supported
        , optional : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontDisplay (Value val) =
    AppendProperty ("font-display:" ++ val)


{-| Sets [`font-size-adjust`](https://css-tricks.com/almanac/properties/f/font-size-adjust/)

    fontSizeAdjust zero

    fontSizeAdjust none

    fontSizeAdjust (num 0.5)

-}
fontSizeAdjust :
    Value
        { none : Supported
        , zero : Supported
        , num : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontSizeAdjust (Value val) =
    AppendProperty ("font-size-adjust:" ++ val)


{-| Sets `ultra-condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay ultraCondensed

-}
ultraCondensed : Value { provides | ultraCondensed : Supported }
ultraCondensed =
    Value "ultra-condensed"


{-| Sets `extra-condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay extraCondensed

-}
extraCondensed : Value { provides | extraCondensed : Supported }
extraCondensed =
    Value "extra-condensed"


{-| Sets `condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay Condensed

-}
condensed : Value { provides | condensed : Supported }
condensed =
    Value "condensed"


{-| Sets `semi-condensed` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay semiCondensed

-}
semiCondensed : Value { provides | semiCondensed : Supported }
semiCondensed =
    Value "semi-condensed"


{-| Sets `ultra-expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay ultraExpanded

-}
ultraExpanded : Value { provides | ultraExpanded : Supported }
ultraExpanded =
    Value "ultra-expanded"


{-| Sets `extra-expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay extraExpanded

-}
extraExpanded : Value { provides | extraExpanded : Supported }
extraExpanded =
    Value "extra-expanded"


{-| Sets `expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay Expanded

-}
expanded : Value { provides | expanded : Supported }
expanded =
    Value "expanded"


{-| Sets `semi-expanded` value for usage with [`fontStretch`](#fontStretch).

      fontDisplay semiExpanded

-}
semiExpanded : Value { provides | semiExpanded : Supported }
semiExpanded =
    Value "semi-expanded"


{-| Sets [`font-stretch`](https://css-tricks.com/almanac/properties/f/font-stretch/)

    fontStretch ultraCondensed

    fontStretch extraCondensed

    fontStretch condensed

    fontStretch semiCondensed

    fontStretch normal

    fontStretch semiExpanded

    fontStretch expanded

    fontStretch extraExpanded

    fontStretch ultraExpanded

-}
fontStretch :
    Value
        { ultraCondensed : Supported
        , extraCondensed : Supported
        , condensed : Supported
        , semiCondensed : Supported
        , normal : Supported
        , semiExpanded : Supported
        , expanded : Supported
        , extraExpanded : Supported
        , ultraExpanded : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
fontStretch (Value val) =
    AppendProperty ("font-stretch:" ++ val)


{-| Sets `first` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation first

-}
first : Value { provides | first : Supported }
first =
    Value "first"


{-| Sets `last` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation last

-}
last : Value { provides | last : Supported }
last =
    Value "last"


{-| Sets `force-end` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation forceEnd

-}
forceEnd : Value { provides | forceEnd : Supported }
forceEnd =
    Value "force-end"


{-| Sets `allow-end` value for usage with [`hangingPunctuation`](#hangingPunctuation).

      hangingPunctuation allowEnd

-}
allowEnd : Value { provides | allowEnd : Supported }
allowEnd =
    Value "allow-end"


{-| Sets [`hanging-punctuation`](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)

    hangingPunctuation none

    hangingPunctuation first

    hangingPunctuation forceEnd

    hangingPunctuation allowEnd

    hangingPunctuation last

-}
hangingPunctuation :
    Value
        { none : Supported
        , first : Supported
        , forceEnd : Supported
        , allowEnd : Supported
        , last : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
hangingPunctuation (Value val) =
    AppendProperty ("hanging-punctuation:" ++ val)


{-| Sets `manual` value for usage with [`hyphens`](#hyphens).

    hyphens manual

-}
manual : Value { provides | manual : Supported }
manual =
    Value "manual"


{-| Sets [`hyphens`](https://css-tricks.com/almanac/properties/h/hyphens/)

    hyphens none

    hyphens manual

    hyphens auto

-}
hyphens :
    Value
        { none : Supported
        , manual : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
hyphens (Value val) =
    AppendProperty ("hyphens:" ++ val)


{-| Sets `pixelated` value for usage with [`imageRendering`](#imageRendering).

    imageRendering pixelated

-}
pixelated : Value { provides | pixelated : Supported }
pixelated =
    Value "pixelated"


{-| Sets `crisp-edges` value for usage with [`imageRendering`](#imageRendering).

    imageRendering crispEdges

-}
crispEdges : Value { provides | crispEdges : Supported }
crispEdges =
    Value "crisp-edges"


{-| Sets [`image-rendering`](https://css-tricks.com/almanac/properties/i/image-rendering/)

    imageRendering auto

    imageRendering crispEdges

    imageRendering pixelated

-}
imageRendering :
    Value
        { auto : Supported
        , crispEdges : Supported
        , pixelated : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
imageRendering (Value val) =
    AppendProperty ("image-rendering:" ++ val)


{-| Sets `isolate` value for usage with [`isolation`](#isolation), and
[`unicodeBidi`](#unicodeBidi).

    isolation isolate

    unicodeBidi isolate

-}
isolate : Value { provides | isolate : Supported }
isolate =
    Value "isolate"


{-| Sets [`isolation`](https://css-tricks.com/almanac/properties/i/isolation/)

    isolation auto

    isolation isolate

-}
isolation :
    Value
        { auto : Supported
        , isolate : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
isolation (Value val) =
    AppendProperty ("isolation:" ++ val)


{-| Sets [`lineClamp`](https://css-tricks.com/almanac/properties/l/line-clamp/)

    lineClamp none

    lineClamp zero

    lineClamp (int 3)

-}
lineClamp :
    Value
        { none : Supported
        , zero : Supported
        , int : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
lineClamp (Value val) =
    AppendProperty ("line-clamp:" ++ val)


{-| Sets [`mix-blend-mode`](https://css-tricks.com/almanac/properties/m/mix-blend-mode/)

    mixBlendMode multiply

    mixBlendMode saturation

-}
mixBlendMode :
    Value
        { normal : Supported
        , multiply : Supported
        , screen : Supported
        , overlay : Supported
        , darken : Supported
        , lighten : Supported
        , colorDodge : Supported
        , colorBurn : Supported
        , hardLight : Supported
        , softLight : Supported
        , difference : Supported
        , exclusion : Supported
        , hue : Supported
        , saturation : Supported
        , color_ : Supported
        , luminosity : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
mixBlendMode (Value val) =
    AppendProperty ("mix-blend-mode:" ++ val)


{-| Sets `fill` value for usage with [`objectFit`](#objectFit).

    objectFit fill_

-}
fill_ : Value { provides | fill_ : Supported }
fill_ =
    Value "fill"


{-| Sets `scale-down` value for usage with [`objectFit`](#objectFit).

    objectFit scaleDown

-}
scaleDown : Value { provides | scaleDown : Supported }
scaleDown =
    Value "scale-down"


{-| Sets [`object-fit`](https://css-tricks.com/almanac/properties/o/object-fit/)

    objectFit fill_

    objectFit contain

    objectFit cover

    objectFit scaleDown

    objectFit none

-}
objectFit :
    Value
        { fill_ : Supported
        , contain : Supported
        , cover : Supported
        , none : Supported
        , scaleDown : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
objectFit (Value val) =
    AppendProperty ("object-fit:" ++ val)


{-| Sets [`object-position`](https://css-tricks.com/almanac/properties/o/object-position/).

    objectPosition left_

    objectPosition (px 45)

`objectPosition` sets the horizontal direction. If you need the vertical
direction instead, use [`objectPosition2`](#objectPosition2) like this:

    objectPosition zero (px 45)

If you need to set the offsets from the right or bottom, use
[`objectPosition4`](#objectPosition4) like this:

    objectPosition4 right_ (px 20) bottom_ (pct 25)

-}
objectPosition :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        , inherit : Supported
        , unset : Supported
        , initial : Supported
        }
    -> Style
objectPosition (Value horiz) =
    AppendProperty ("object-position:" ++ horiz)


{-| Sets [`object-position`](https://css-tricks.com/almanac/properties/o/object-position/).

    objectPosition2 left_ top_

    objectPosition2 (px 45) (pct 50)

`objectPosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`objectPosition`](#objectPosition) instead:

    objectPosition left_

If you need to set the offsets from the right or bottom, use
[`objectPosition4`](#objectPosition4) like this:

    objectPosition4 right_ (px 20) bottom_ (pct 25)

-}
objectPosition2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , left_ : Supported
        , right_ : Supported
        , center : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
    -> Style
objectPosition2 (Value horiz) (Value vert) =
    AppendProperty ("object-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`object-position`](https://css-tricks.com/almanac/properties/o/object-position/).

    objectPosition4 right_ (px 20) bottom_ (pct 30)

The four-argument form of object position alternates sides and offets. So the
example above would position the object image 20px from the right, and 30%
from the bottom.

See also [`objectPosition`](#objectPosition) for horizontal alignment and
[`objectPosition2`](#objectPosition2) for horizontal (from left) and
vertical (from top) alignment.

-}
objectPosition4 :
    Value
        { left_ : Supported
        , right_ : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pct : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Style
objectPosition4 (Value horiz) (Value horizAmount) (Value vert) (Value vertAmount) =
    AppendProperty
        ("object-position:"
            ++ horiz
            ++ " "
            ++ horizAmount
            ++ " "
            ++ vert
            ++ " "
            ++ vertAmount
        )


{-| Sets [`orphans`](https://css-tricks.com/almanac/properties/o/orphans/)
**Note:** This function accepts only positive integers.

    orphans (int 2)

-}
orphans :
    Value
        { int : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
orphans (Value val) =
    AppendProperty ("orphans:" ++ val)


{-| Sets [`overflow-anchor`](https://css-tricks.com/almanac/properties/o/overflow-anchor/)

    overflowAnchor auto

    overflowAnchor none

-}
overflowAnchor :
    Value
        { auto : Supported
        , none : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
overflowAnchor (Value val) =
    AppendProperty ("overflow-anchor:" ++ val)



-- Page break


{-| Sets [`page-break-before`](https://css-tricks.com/almanac/properties/p/page-break/)

    pageBreakBefore auto

    pageBreakBefore always

    pageBreakBefore avoid

    pageBreakBefore left_

    pageBreakBefore right_

-}
pageBreakBefore :
    Value
        { auto : Supported
        , always : Supported
        , avoid : Supported
        , left_ : Supported
        , right_ : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
pageBreakBefore (Value val) =
    AppendProperty ("page-break-before:" ++ val)


{-| Sets [`page-break-inside`](https://css-tricks.com/almanac/properties/p/page-break/)

    pageBreakInside auto

    pageBreakInside avoid

-}
pageBreakInside :
    Value
        { auto : Supported
        , avoid : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
pageBreakInside (Value val) =
    AppendProperty ("page-break-inside:" ++ val)


{-| Sets [`page-break-after`](https://css-tricks.com/almanac/properties/p/page-break/)

    pageBreakAfter auto

    pageBreakAfter always

    pageBreakAfter avoid

    pageBreakAfter left_

    pageBreakAfter right_

-}
pageBreakAfter :
    Value
        { auto : Supported
        , always : Supported
        , avoid : Supported
        , left_ : Supported
        , right_ : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
pageBreakAfter (Value val) =
    AppendProperty ("page-break-after:" ++ val)


{-| Sets [`pointer-events`](https://css-tricks.com/almanac/properties/b/pointer-events/)

    pointerEvents none

    pointerEvents auto

-}
pointerEvents :
    Value
        { auto : Supported
        , none : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
pointerEvents (Value val) =
    AppendProperty ("pointer-events:" ++ val)



--- Scroll ---


{-| Sets `smooth` value for usage with [`scrollBehavior`](#scrollBehavior).

    scrollBehavior smooth

-}
smooth : Value { provides | smooth : Supported }
smooth =
    Value "smooth"


{-| Sets [`scroll-behavior`](https://css-tricks.com/almanac/properties/s/scroll-behavior/)

    scrollBehavior auto

    scrollBehavior smooth

-}
scrollBehavior :
    Value
        { auto : Supported
        , smooth : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
scrollBehavior (Value val) =
    AppendProperty ("scroll-behavior:" ++ val)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom margins are set to the first value and the right and
left margins are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    scrollMargin (em 4) -- set all margins to 4em

    scrollMargin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    scrollMargin3 (em 4) (px 2) (pt 5) -- top = 4em, right = 2px, bottom = 5pt, left = 2px

    scrollMargin4 (em 4) (px 2) (pt 5) (px 3) -- top = 4em, right = 2px, bottom = 5pt, left = 3px

-}
scrollMargin :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
scrollMargin (Value value) =
    AppendProperty ("scroll-margin:" ++ value)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin2` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    scrollMargin2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

-}
scrollMargin2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
scrollMargin2 (Value valueTopBottom) (Value valueRightLeft) =
    AppendProperty ("scroll-margin:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin3` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

The top margin is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    scrollMargin3 (em 4) (px 2) (pt 5) -- top = 4em, right = 2px, bottom = 5pt, left = 2px

-}
scrollMargin3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
scrollMargin3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    AppendProperty ("scroll-margin:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`scroll-margin`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.
The `scrollMargin4` property is a shorthand property for setting
`scroll-margin-top`, `scroll-margin-right`, `scroll-margin-bottom`,
and `scroll-margin-left` in a single declaration.

The four values apply to the top, right, bottom, and left margins.

    scrollMargin4 (em 4) (px 2) (pt 5) (px 3) -- top = 4em, right = 2px, bottom = 5pt, left = 3px

-}
scrollMargin4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
scrollMargin4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("scroll-margin:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`scroll-margin-top`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginTop (px 4)

-}
scrollMarginTop :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollMarginTop (Value value) =
    AppendProperty ("scroll-margin-top:" ++ value)


{-| Sets [`scroll-margin-right`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginRight (px 4)

-}
scrollMarginRight :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollMarginRight (Value value) =
    AppendProperty ("scroll-margin-right:" ++ value)


{-| Sets [`scroll-margin-bottom`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginBottom (px 4)

-}
scrollMarginBottom :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollMarginBottom (Value value) =
    AppendProperty ("scroll-margin-bottom:" ++ value)


{-| Sets [`scroll-margin-left`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginLeft (px 4)

-}
scrollMarginLeft :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollMarginLeft (Value value) =
    AppendProperty ("scroll-margin-left:" ++ value)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

If there is only one argument value, it applies to all sides. If there are two
values, the top and bottom paddings are set to the first value and the right and
left paddings are set to the second. If there are three values, the top is set
to the first value, the left and right are set to the second, and the bottom is
set to the third. If there are four values they apply to the top, right,
bottom, and left, respectively.

    scrollPadding (em 4) -- set all margins to 4em

    scrollPadding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    scrollPadding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    scrollPadding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
scrollPadding :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
scrollPadding (Value value) =
    AppendProperty ("scroll-padding:" ++ value)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding2` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

The top and bottom margins are set to the first value and the right and left
margins are set to the second.

    scrollPadding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

-}
scrollPadding2 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
scrollPadding2 (Value valueTopBottom) (Value valueRightLeft) =
    AppendProperty ("scroll-padding:" ++ valueTopBottom ++ " " ++ valueRightLeft)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding3` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

The top padding is set to the first value, the left and right are set to the
second, and the bottom is set to the third.

    scrollPadding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

-}
scrollPadding3 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
scrollPadding3 (Value valueTop) (Value valueRightLeft) (Value valueBottom) =
    AppendProperty ("scroll-padding:" ++ valueTop ++ " " ++ valueRightLeft ++ " " ++ valueBottom)


{-| Sets [`scroll-padding`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.
The `scrollPadding4` property is a shorthand property for setting
`scroll-padding-top`, `scroll-padding-right`, `scroll-padding-bottom`,
and `scroll-padding-left` in a single declaration.

The four values apply to the top, right, bottom, and left paddings.

    scrollPadding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
scrollPadding4 :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , auto : Supported
        }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    ->
        Value
            { ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , pct : Supported
            , px : Supported
            , rem : Supported
            , vh : Supported
            , vmax : Supported
            , vmin : Supported
            , vw : Supported
            , zero : Supported
            , calc : Supported
            , auto : Supported
            }
    -> Style
scrollPadding4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("scroll-padding:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`scroll-padding-top`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingTop (px 4)

-}
scrollPaddingTop :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollPaddingTop (Value value) =
    AppendProperty ("scroll-padding-top:" ++ value)


{-| Sets [`scroll-padding-right`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingRight (px 4)

-}
scrollPaddingRight :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollPaddingRight (Value value) =
    AppendProperty ("scroll-padding-right:" ++ value)


{-| Sets [`scroll-padding-bottom`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingBottom (px 4)

-}
scrollPaddingBottom :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollPaddingBottom (Value value) =
    AppendProperty ("scroll-padding-bottom:" ++ value)


{-| Sets [`scroll-padding-left`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingLeft (px 4)

-}
scrollPaddingLeft :
    Value
        { ch : Supported
        , cm : Supported
        , em : Supported
        , ex : Supported
        , inches : Supported
        , mm : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , px : Supported
        , rem : Supported
        , vh : Supported
        , vmax : Supported
        , vmin : Supported
        , vw : Supported
        , zero : Supported
        , calc : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        , auto : Supported
        }
    -> Style
scrollPaddingLeft (Value value) =
    AppendProperty ("scroll-padding-left:" ++ value)


{-| Sets [`scroll-snap-align`](https://css-tricks.com/almanac/properties/s/scroll-snap-align/)

    scrollSnapAlign none

    scrollSnapAlign start

    scrollSnapAlign center

    scrollSnapAlign end

-}
scrollSnapAlign :
    Value
        { none : Supported
        , start : Supported
        , center : Supported
        , end : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
scrollSnapAlign (Value val) =
    AppendProperty ("scroll-snap-align:" ++ val)


{-| Sets `always` value for usage with [`scrollSnapStop`](#scrollSnapStop), [`pageBreakBefore`](#pageBreakBefore), and [`pageBreakAfter`](#pageBreakAfter).

    scrollSnapStop always

    pageBreakBefore always

    pageBreakAfter always

-}
always : Value { provides | always : Supported }
always =
    Value "always"


{-| Sets [`scroll-snap-stop`](https://css-tricks.com/almanac/properties/s/scroll-snap-stop/)

    scrollSnapStop normal

    scrollSnapStop always

-}
scrollSnapStop :
    Value
        { normal : Supported
        , always : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
scrollSnapStop (Value val) =
    AppendProperty ("scroll-snap-stop:" ++ val)


{-| Sets [`scroll-snap-type`](https://css-tricks.com/almanac/properties/s/scroll-snap-type/)

    scrollSnapType none

-}
scrollSnapType :
    Value
        { none : Supported
        , x : Supported
        , y : Supported
        , block : Supported
        , inline : Supported
        , both : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
scrollSnapType (Value val) =
    AppendProperty ("scroll-snap-type:" ++ val)


{-| Sets `x` value for usage with [`scrollSnapType2`](#scrollSnapType2).

    scrollSnapType2 x mandatory

-}
x : Value { provides | x : Supported }
x =
    Value "x"


{-| Sets `y` value for usage with [`scrollSnapType2`](#scrollSnapType2).

    scrollSnapType2 y mandatory

-}
y : Value { provides | y : Supported }
y =
    Value "y"


{-| Sets `mandatory` value for usage with [`scrollSnapType2`](#scrollSnapType2).

    scrollSnapType2 x mandatory

-}
mandatory : Value { provides | mandatory : Supported }
mandatory =
    Value "mandatory"


{-| Sets `proximity` value for usage with [`scrollSnapType2`](#scrollSnapType2).

    scrollSnapType2 x proximity

-}
proximity : Value { provides | proximity : Supported }
proximity =
    Value "proximity"


{-| Sets [`scroll-snap-type`](https://css-tricks.com/almanac/properties/s/scroll-snap-type/)

    scrollSnapType2 x mandatory

    scrollSnapType2 both proximity

-}
scrollSnapType2 :
    Value
        { x : Supported
        , y : Supported
        , block : Supported
        , inline : Supported
        , both : Supported
        }
    ->
        Value
            { mandatory : Supported
            , proximity : Supported
            }
    -> Style
scrollSnapType2 (Value val1) (Value val2) =
    AppendProperty ("scroll-snap-type:" ++ val1 ++ " " ++ val2)


{-| Sets `spellOut` value for usage with [`speak`](#speak).

    speak spellOut

-}
spellOut : Value { provides | spellOut : Supported }
spellOut =
    Value "spell-out"


{-| Sets [`speak`](https://css-tricks.com/almanac/properties/s/speak/)

    speak none

    speak normal

    speak spellOut

-}
speak :
    Value
        { none : Supported
        , normal : Supported
        , spellOut : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
speak (Value val) =
    AppendProperty ("speak:" ++ val)


{-| Sets [`tab-size`](https://css-tricks.com/almanac/properties/t/tab-size/)
**Note:** only positive integer values are allowed.

    tabSize (int 4)

-}
tabSize :
    Value
        { int : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
tabSize (Value val) =
    AppendProperty ("tab-size:" ++ val)



--- Text stroke ---


{-| Sets [`text-stroke`](https://css-tricks.com/almanac/properties/t/text-stroke/)
This is a shorthand for [`text-stroke-width`](#textStrokeWidth) and [`text-stroke-color`](#textStrokeColor).

    tabStroke (px 2)

-}
textStroke :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textStroke (Value val) =
    AppendProperty ("text-stroke:" ++ val)


{-| Sets [`text-stroke`](https://css-tricks.com/almanac/properties/t/text-stroke/)

    tabStroke2 (px 2) (hex "#60b5cc")

-}
textStroke2 :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { rgb : Supported
            , rgba : Supported
            , hsl : Supported
            , hsla : Supported
            , hex : Supported
            , transparent : Supported
            , currentColor : Supported
            }
    -> Style
textStroke2 (Value val1) (Value val2) =
    AppendProperty ("text-stroke:" ++ val1 ++ " " ++ val2)


{-| Sets [`text-stroke-width`](https://css-tricks.com/almanac/properties/t/text-stroke/)

    tabStrokeWidth (px 2)

-}
textStrokeWidth :
    Value
        { px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pct : Supported
        , pt : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , auto : Supported
        , zero : Supported
        , calc : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textStrokeWidth (Value val) =
    AppendProperty ("text-stroke-width:" ++ val)


{-| Sets [`text-stroke-color`](https://css-tricks.com/almanac/properties/t/text-stroke/)

    tabStrokeColor (hex "#60b5cc")

-}
textStrokeColor :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , transparent : Supported
        , currentColor : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
textStrokeColor (Value val) =
    AppendProperty ("text-stroke-color:" ++ val)


{-| Sets [`transform-origin`](https://css-tricks.com/almanac/properties/t/transform-origin/).

    transformOrigin top_

    transformOrigin center

    transformOrigin bottom

    transformOrigin (pct 50)

-}
transformOrigin :
    Value
        { top_ : Supported
        , center : Supported
        , bottom_ : Supported
        , pct : Supported
        , inherit : Supported
        , initial : Supported
        }
    -> Style
transformOrigin (Value vert) =
    AppendProperty ("transform-origin:" ++ vert)


{-| Sets [`transform-origin`](https://css-tricks.com/almanac/properties/t/transform-origin/).

    transformOrigin2 top_ left

    transformOrigin2 center right_

    transformOrigin2 bottom_ right_

    transformOrigin2 (pct 50) (pct 50)

-}
transformOrigin2 :
    Value
        { top_ : Supported
        , center : Supported
        , bottom_ : Supported
        , pct : Supported
        }
    ->
        Value
            { left_ : Supported
            , center : Supported
            , right_ : Supported
            , pct : Supported
            }
    -> Style
transformOrigin2 (Value vert) (Value horiz) =
    AppendProperty ("transform-origin:" ++ vert ++ " " ++ horiz)



--- unicode-bidi ---


{-| Sets `embed` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi embed

-}
embed : Value { provides | embed : Supported }
embed =
    Value "embed"


{-| Sets `plaintext` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi plaintext

-}
plaintext : Value { provides | plaintext : Supported }
plaintext =
    Value "plaintext"


{-| Sets `bidi-override` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi bidiOverride

-}
bidiOverride : Value { provides | bidiOverride : Supported }
bidiOverride =
    Value "bidi-override"


{-| Sets `isolate-override` value for usage with [`unicodeBidi`](#unicodeBidi).

    unicodeBidi isolateOverride

-}
isolateOverride : Value { provides | isolateOverride : Supported }
isolateOverride =
    Value "isolate-override"


{-| Sets [`unicode-bidi`](https://css-tricks.com/almanac/properties/u/unicode-bidi/)

    unicodeBidi normal

    unicodeBidi embed

    unicodeBidi isolate

    unicodeBidi bidiOverride

    unicodeBidi isolateOverride

    unicodeBidi plaintext

-}
unicodeBidi :
    Value
        { normal : Supported
        , embed : Supported
        , isolate : Supported
        , bidiOverride : Supported
        , isolateOverride : Supported
        , plaintext : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
unicodeBidi (Value val) =
    AppendProperty ("unicode-bidi:" ++ val)


{-| Sets [`user-select`](https://css-tricks.com/almanac/properties/u/user-select/)

    userSelect none

    userSelect auto

    userSelect text

    userSelect contain

    userSelect all_

-}
userSelect :
    Value
        { none : Supported
        , auto : Supported
        , text : Supported
        , contain : Supported
        , all_ : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
userSelect (Value val) =
    AppendProperty ("user-select:" ++ val)


{-| Sets [`widows`](https://css-tricks.com/almanac/properties/w/widows/)
**Note:** This function accepts only positive integers.

    widows (int 2)

-}
widows :
    Value
        { int : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
widows (Value val) =
    AppendProperty ("widows:" ++ val)


{-| Sets [`word-spacing`](https://css-tricks.com/almanac/properties/w/word-spacing/).

    wordSpacing normal

    wordSpacing zero

    wordSpacing (px 5)

-}
wordSpacing :
    Value
        { zero : Supported
        , calc : Supported
        , ch : Supported
        , em : Supported
        , ex : Supported
        , rem : Supported
        , vh : Supported
        , vw : Supported
        , vmin : Supported
        , vmax : Supported
        , px : Supported
        , cm : Supported
        , mm : Supported
        , inches : Supported
        , pc : Supported
        , pt : Supported
        , pct : Supported
        , normal : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
wordSpacing (Value str) =
    AppendProperty ("word-spacing:" ++ str)


{-| Sets `horizontal-tb` value for usage with [`writingMode`](#writingMode).

    writingMode horizontalTb

-}
horizontalTb : Value { provides | horizontalTb : Supported }
horizontalTb =
    Value "horizontal-tb"


{-| Sets `vertical-lr` value for usage with [`writingMode`](#writingMode).

    writingMode verticalLr

-}
verticalLr : Value { provides | verticalLr : Supported }
verticalLr =
    Value "vertical-lr"


{-| Sets `vertical-rl` value for usage with [`writingMode`](#writingMode).

    writingMode verticalRl

-}
verticalRl : Value { provides | verticalRl : Supported }
verticalRl =
    Value "vertical-rl"


{-| Sets [`writing-mode`](https://css-tricks.com/almanac/properties/w/writing-mode/).

    writingMode horizontalTb

    writingMode verticalRl

    writingMode verticalLr

-}
writingMode :
    Value
        { horizontalTb : Supported
        , verticalRl : Supported
        , verticalLr : Supported
        , initial : Supported
        , inherit : Supported
        , unset : Supported
        }
    -> Style
writingMode (Value str) =
    AppendProperty ("writing-mode:" ++ str)
