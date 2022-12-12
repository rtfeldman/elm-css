module Css exposing
    ( Value, BaseValue, Supported
    , Style, batch
    , property
    , important
    , unset, initial, inherit
    , all, revert
    , Angle, AngleSupported, Width, WidthSupported
    , Length, LengthSupported, zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, q, inches, pt, pc, pct, num, int
    , calc, CalcOperation, minus, plus, times, dividedBy
    , Color, ColorSupported, color, backgroundColor, hex, rgb, rgba, hsl, hsla, currentcolor
    , Time, TimeSupported, s, ms
    , deg, grad, rad, turn
    , url
    , auto, none, normal, strict, all_, both, always
    , hidden, visible
    , contentBox, borderBox, paddingBox
    , left_, right_, top_, bottom_, block, inline, start, end
    , x, y
    , stretch, center, content, fill_, stroke, text, style
    , clip, cover, contain_
    , baseline, sub, super, ruby, fullWidth
    , pseudoClass, active, checked, disabled, empty, enabled
    , firstChild, firstOfType, focus, fullscreen, hover, inRange
    , indeterminate, invalid, lastChild, lastOfType, link, onlyChild
    , onlyOfType, outOfRange, readOnly, readWrite, required
    , root, scope, target, valid, visited
    , pseudoElement, before, after, backdrop, cue, marker, placeholder, selection
    , width, minWidth, maxWidth, height, minHeight, maxHeight
    , blockSize, minBlockSize, maxBlockSize, inlineSize, minInlineSize, maxInlineSize
    , minContent, maxContent, fitContent
    , backgroundAttachment, backgroundAttachments, scroll, local
    , backgroundBlendMode, backgroundBlendModes, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity
    , backgroundClip, backgroundClips, backgroundOrigin, backgroundOrigins
    , ImageSupported, Image
    , backgroundImage, backgroundImages, backgroundPosition, backgroundPosition2, backgroundPosition3, backgroundPosition4, backgroundRepeat, backgroundRepeat2, backgroundSize, backgroundSize2
    , linearGradient, linearGradient2, stop, stop2, stop3, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight
    , repeat, noRepeat, repeatX, repeatY, space, round
    , BoxShadowConfig, boxShadow, boxShadows, defaultBoxShadow
    , TextShadowConfig, textShadow, defaultTextShadow
    , LineWidth, LineWidthSupported, LineStyle, LineStyleSupported
    , border, border2, border3
    , borderTop, borderTop2, borderTop3
    , borderRight, borderRight2, borderRight3
    , borderBottom, borderBottom2, borderBottom3
    , borderLeft, borderLeft2, borderLeft3
    , borderBlock, borderBlock2, borderBlock3
    , borderBlockStart, borderBlockStart2, borderBlockStart3
    , borderBlockEnd, borderBlockEnd2, borderBlockEnd3
    , borderInline, borderInline2, borderInline3
    , borderInlineStart, borderInlineStart2, borderInlineStart3
    , borderInlineEnd, borderInlineEnd2, borderInlineEnd3
    , borderWidth, borderWidth2, borderWidth3, borderWidth4, borderTopWidth, borderRightWidth, borderBottomWidth, borderLeftWidth
    , borderBlockWidth, borderBlockStartWidth, borderBlockEndWidth, borderInlineWidth, borderInlineStartWidth, borderInlineEndWidth
    , thin, thick
    , borderStyle, borderStyle2, borderStyle3, borderStyle4, borderTopStyle, borderRightStyle, borderBottomStyle, borderLeftStyle
    , borderBlockStyle, borderBlockStartStyle, borderBlockEndStyle, borderInlineStyle, borderInlineStartStyle, borderInlineEndStyle
    , dotted, dashed, solid, double, groove, ridge, inset, outset
    , borderColor, borderColor2, borderColor3, borderColor4, borderTopColor, borderRightColor, borderBottomColor, borderLeftColor
    , borderBlockColor, borderBlockStartColor, borderBlockEndColor, borderInlineColor, borderInlineStartColor, borderInlineEndColor
    , borderRadius, borderRadius2, borderRadius3, borderRadius4, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderBottomLeftRadius, borderBottomLeftRadius2
    , borderStartStartRadius, borderStartStartRadius2, borderStartEndRadius, borderStartEndRadius2, borderEndStartRadius, borderEndStartRadius2, borderEndEndRadius, borderEndEndRadius2
    , borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4
    , borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4
    , outline, outline3, outlineWidth, outlineColor, invert, outlineStyle, outlineOffset
    , display, display2, displayListItem2, displayListItem3
    , flex_, flow, flowRoot, grid, contents, listItem, inlineBlock, inlineFlex, inlineTable, inlineGrid, rubyBase, rubyBaseContainer, rubyText, rubyTextContainer, runIn, table, tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup
    , position, zIndex
    , absolute, fixed, relative, static, sticky
    , inset, inset2, inset3, inset4, top, right, bottom, left
    , insetBlock, insetBlock2, insetInline, insetInline2, insetBlockStart, insetBlockEnd, insetInlineStart, insetInlineEnd
    , padding, padding2, padding3, padding4, paddingTop, paddingRight, paddingBottom, paddingLeft
    , paddingBlock, paddingBlock2, paddingBlockStart, paddingBlockEnd
    , paddingInline, paddingInline2, paddingInlineStart, paddingInlineEnd
    , margin, margin2, margin3, margin4, marginTop, marginRight, marginBottom, marginLeft
    , gap, gap2, rowGap, columnGap
    , marginBlock, marginBlock2, marginBlockStart, marginBlockEnd
    , marginInline, marginInline2, marginInlineStart, marginInlineEnd
    , boxSizing
    , alignContent, alignContent2, alignItems, alignItems2, alignSelf, alignSelf2, justifyContent, justifyContent2, justifyItems, justifyItems2, justifySelf, justifySelf2
    , placeContent, placeContent2, placeItems, placeItems2, placeSelf, placeSelf2
    , flexStart, flexEnd, selfStart, selfEnd, spaceBetween, spaceAround, spaceEvenly
    , firstBaseline, lastBaseline, safe, unsafe, legacy, legacyLeft, legacyRight, legacyCenter
    , flexDirection, row, rowReverse, column, columnReverse
    , order
    , flexGrow, flexShrink, flexBasis
    , flexWrap, nowrap, wrap, wrapReverse
    , flex, flex2, flex3, flexFlow, flexFlow2
    , wordSpacing
    , tabSize
    , fontDisplay, fallback, swap, optional
    , writingMode, verticalLr, verticalRl, horizontalTb
    , hyphens, quotes, quotes2, quotes4, textOverflow, textOverflow2, lineBreak, manual, ellipsis, loose
    , hangingPunctuation, hangingPunctuation2, hangingPunctuation3, first, last, forceEnd, allowEnd
    , lineClamp
    , fontSize, xxSmall, xSmall, small, medium, large, xLarge, xxLarge, smaller, larger, lineHeight, letterSpacing
    , fontSizeAdjust
    , fontFamily, fontFamilies, serif, sansSerif, monospace, cursive, fantasy, systemUi
    , fontStyle, italic, oblique
    , fontWeight, bold, lighter, bolder
    , fontStretch, ultraCondensed, extraCondensed, condensed, semiCondensed, semiExpanded, expanded, extraExpanded, ultraExpanded
    , fontFeatureSettings, fontFeatureSettingsList, featureTag, featureTag2
    , fontVariantCaps, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps
    , fontVariantEastAsian, fontVariantEastAsian2, fontVariantEastAsian3, jis78, jis83, jis90, jis04, simplified, traditional, proportionalWidth
    , fontVariantLigatures, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual
    , fontVariantNumeric, fontVariantNumeric4, ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions
    , fontKerning, fontLanguageOverride, fontSynthesis, fontSynthesis2, fontSynthesis3, fontOpticalSizing, fontVariantPosition
    , CursorKeyword
    , cursor, cursor2, cursor4
    , pointer, default, contextMenu, help, progress, wait, cell
    , crosshair, verticalText, alias, copy, move, noDrop
    , notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
    , wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
    , neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing
    , ListStyleType, ListStyleTypeSupported
    , listStyle, listStyle2, listStyle3, listStylePosition, inside, outside, listStyleType, string, customIdent, listStyleImage
    , arabicIndic, armenian, bengali, cambodian, circle, cjkDecimal, cjkEarthlyBranch, cjkHeavenlyStem, cjkIdeographic, decimal, decimalLeadingZero, devanagari, disclosureClosed, disclosureOpen, disc, ethiopicNumeric, georgian, gujarati, gurmukhi, hebrew, hiragana, hiraganaIroha, japaneseFormal, japaneseInformal, kannada, katakana, katakanaIroha, khmer, koreanHangulFormal, koreanHanjaFormal, koreanHanjaInformal, lao, lowerAlpha, lowerArmenian, lowerGreek, lowerLatin, lowerRoman, malayalam, monogolian, myanmar, oriya, persian, simpChineseFormal, simpChineseInformal, tamil, telugu, thai, tibetan, tradChineseFormal, tradChineseInformal, upperAlpha, upperArmenian, upperLatin, upperRoman
    , overflow, overflowX, overflowY, overflowBlock, overflowInline
    , overflowAnchor
    , overflowWrap
    , breakWord, anywhere
    , direction, ltr, rtl
    , justify, matchParent, textAlign, textJustify, interWord, interCharacter, textUnderlinePosition, textUnderlinePosition2, under
    , textOrientation
    , mixed, sideways, upright
    , textRendering
    , geometricPrecision, optimizeLegibility, optimizeSpeed
    , textTransform
    , capitalize, uppercase, lowercase, fullSizeKana
    , textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorationLine2, textDecorationLine3, textDecorationStyle, textDecorationColor
    , textDecorationSkip, objects, spaces, ink, edges, boxDecoration
    , wavy, underline, overline, lineThrough
    , textStroke, textStroke2, textStrokeColor, textStrokeWidth
    , textIndent, textIndent2, textIndent3, hanging, eachLine
    , borderCollapse
    , collapse, separate
    , borderSpacing, borderSpacing2
    , captionSide
    , emptyCells
    , show, hide
    , tableLayout
    , verticalAlign
    , textTop, textBottom, middle
    , whiteSpace
    , pre, preWrap, preLine
    , wordBreak
    , breakAll, keepAll
    , float
    , clear, inlineStart, inlineEnd
    , visibility
    , fill
    , strokeDasharray, strokeDashoffset, strokeWidth, strokeAlign, strokeColor, strokeImage, strokeMiterlimit, strokeOpacity, strokePosition, strokePosition2, strokePosition4, strokeRepeat, strokeRepeat2, strokeSize, strokeSize2, strokeDashCorner
    , strokeLinecap, butt, square
    , strokeBreak, boundingBox, slice, clone
    , strokeOrigin, fillBox, strokeBox
    , strokeLinejoin, strokeLinejoin2, crop, arcs, miter, bevel
    , strokeDashJustify, compress, dashes, gaps
    , paintOrder, paintOrder2, paintOrder3, markers
    , columns, columns2, columnWidth, columnCount, columnRuleWidth, columnRuleStyle, columnRuleColor, columnRule, columnRule2, columnRule3
    , columnFill, balance, balanceAll
    , columnSpan
    , transform, transforms, transformOrigin, transformOrigin2
    , TransformFunction, TransformFunctionSupported
    , matrix, matrix3d
    , perspective, perspectiveOrigin, perspectiveOrigin2
    , perspective_
    , rotate, rotate2, rotate_, rotateX, rotateY, rotateZ, rotate3d, vec3, z
    , scale, scale2, scale3, scale_, scale2_, scaleX, scaleY, scaleZ, scale3d
    , skew, skew2, skewX, skewY
    , translate, translate2, translateX, translateY, translateZ, translate3d
    , animationName, animationNames, animationDuration, animationDurations, animationTimingFunction, animationTimingFunctions, animationIterationCount, animationIterationCounts, animationDirection, animationDirections, animationPlayState, animationPlayStates, animationDelay, animationDelays, animationFillMode, animationFillModes
    , EasingFunction, EasingFunctionSupported, linear, ease, easeIn, easeOut, easeInOut, cubicBezier, stepStart, stepEnd, steps, steps2, jumpStart, jumpEnd, jumpNone, jumpBoth, infinite, reverse, alternate, alternateReverse, running, paused, forwards, backwards
    , opacity
    , zoom
    , scrollBehavior, smooth, scrollSnapAlign, scrollSnapStop
    , scrollSnapType, scrollSnapType2, mandatory, proximity
    , scrollMargin, scrollMargin2, scrollMargin3, scrollMargin4, scrollMarginTop, scrollMarginLeft, scrollMarginRight, scrollMarginBottom
    , scrollMarginBlock, scrollMarginBlock2, scrollMarginInline, scrollMarginInline2
    , scrollMarginBlockStart, scrollMarginBlockEnd, scrollMarginInlineStart, scrollMarginInlineEnd
    , scrollPadding, scrollPadding2, scrollPadding3, scrollPadding4, scrollPaddingTop, scrollPaddingLeft, scrollPaddingRight, scrollPaddingBottom
    , scrollPaddingBlock, scrollPaddingBlock2, scrollPaddingInline, scrollPaddingInline2
    , scrollPaddingBlockStart, scrollPaddingBlockEnd, scrollPaddingInlineStart, scrollPaddingInlineEnd
    , overscrollBehavior, overscrollBehavior2, overscrollBehaviorX, overscrollBehaviorY, overscrollBehaviorBlock, overscrollBehaviorInline
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
    , objectFit, scaleDown
    , objectPosition, objectPosition2, objectPosition4
    , boxDecorationBreak
    , isolation, isolate
    , caretColor
    , pointerEvents
    , visiblePainted, visibleFill, visibleStroke, painted
    , resize, horizontal, vertical
    , contain, contain2, contain3, contain4, size, layout, paint
    )

{-| If you need something that `elm-css` does not support right now, the
[`Css.property`](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#property)
and [`Css.Global.selector`](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css-Global#selector)
functions let you define custom properties and selectors, respectively.


## CSS Values

@docs Value, BaseValue, Supported


## Reusable Styles

@docs Style, batch


## Custom Properties

@docs property


## `!important`

@docs important


# General Values

All CSS properties can have the values `unset`, `initial`, and `inherit`.

@docs unset, initial, inherit

@docs all, revert

@docs Angle, AngleSupported, Width, WidthSupported


## Numeric Units

@docs Length, LengthSupported, zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, q, inches, pt, pc, pct, num, int


## Calc

@docs calc, CalcOperation, minus, plus, times, dividedBy


## Color

@docs Color, ColorSupported, color, backgroundColor, hex, rgb, rgba, hsl, hsla, currentcolor


## Time

@docs Time, TimeSupported, s, ms


## Angles

@docs deg, grad, rad, turn


## URLs

@docs url


# Shared Values

Many different kinds of CSS properties use these values.

@docs auto, none, normal, strict, all_, both, always
@docs hidden, visible
@docs contentBox, borderBox, paddingBox
@docs left_, right_, top_, bottom_, block, inline, start, end
@docs x, y
@docs stretch, center, content, fill_, stroke, text, style
@docs clip, cover, contain_
@docs baseline, sub, super, ruby, fullWidth


# Pseudo-Classes

@docs pseudoClass, active, checked, disabled, empty, enabled
@docs firstChild, firstOfType, focus, fullscreen, hover, inRange
@docs indeterminate, invalid, lastChild, lastOfType, link, onlyChild
@docs onlyOfType, outOfRange, readOnly, readWrite, required
@docs root, scope, target, valid, visited


# Pseudo-Elements

@docs pseudoElement, before, after, backdrop, cue, marker, placeholder, selection


# Sizing

@docs width, minWidth, maxWidth, height, minHeight, maxHeight
@docs blockSize, minBlockSize, maxBlockSize, inlineSize, minInlineSize, maxInlineSize
@docs minContent, maxContent, fitContent


# Backgrounds


## Background Attachment

@docs backgroundAttachment, backgroundAttachments, scroll, local


## Background Blend Mode

@docs backgroundBlendMode, backgroundBlendModes, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity


## Background Clip and Origin

@docs backgroundClip, backgroundClips, backgroundOrigin, backgroundOrigins


## Background Image

@docs ImageSupported, Image
@docs backgroundImage, backgroundImages, backgroundPosition, backgroundPosition2, backgroundPosition3, backgroundPosition4, backgroundRepeat, backgroundRepeat2, backgroundSize, backgroundSize2

@docs linearGradient, linearGradient2, stop, stop2, stop3, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight

@docs repeat, noRepeat, repeatX, repeatY, space, round


# Shadows


## Box Shadow

@docs BoxShadowConfig, boxShadow, boxShadows, defaultBoxShadow


## Text Shadow

@docs TextShadowConfig, textShadow, defaultTextShadow


# Borders

@docs LineWidth, LineWidthSupported, LineStyle, LineStyleSupported

@docs border, border2, border3

@docs borderTop, borderTop2, borderTop3

@docs borderRight, borderRight2, borderRight3

@docs borderBottom, borderBottom2, borderBottom3

@docs borderLeft, borderLeft2, borderLeft3

@docs borderBlock, borderBlock2, borderBlock3

@docs borderBlockStart, borderBlockStart2, borderBlockStart3

@docs borderBlockEnd, borderBlockEnd2, borderBlockEnd3

@docs borderInline, borderInline2, borderInline3

@docs borderInlineStart, borderInlineStart2, borderInlineStart3

@docs borderInlineEnd, borderInlineEnd2, borderInlineEnd3


## Border Width

@docs borderWidth, borderWidth2, borderWidth3, borderWidth4, borderTopWidth, borderRightWidth, borderBottomWidth, borderLeftWidth

@docs borderBlockWidth, borderBlockStartWidth, borderBlockEndWidth, borderInlineWidth, borderInlineStartWidth, borderInlineEndWidth

@docs thin, thick


## Border Style

@docs borderStyle, borderStyle2, borderStyle3, borderStyle4, borderTopStyle, borderRightStyle, borderBottomStyle, borderLeftStyle

@docs borderBlockStyle, borderBlockStartStyle, borderBlockEndStyle, borderInlineStyle, borderInlineStartStyle, borderInlineEndStyle

@docs dotted, dashed, solid, double, groove, ridge, inset, outset


## Border Color

@docs borderColor, borderColor2, borderColor3, borderColor4, borderTopColor, borderRightColor, borderBottomColor, borderLeftColor

@docs borderBlockColor, borderBlockStartColor, borderBlockEndColor, borderInlineColor, borderInlineStartColor, borderInlineEndColor


## Border Radius

@docs borderRadius, borderRadius2, borderRadius3, borderRadius4, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderBottomLeftRadius, borderBottomLeftRadius2

@docs borderStartStartRadius, borderStartStartRadius2, borderStartEndRadius, borderStartEndRadius2, borderEndStartRadius, borderEndStartRadius2, borderEndEndRadius, borderEndEndRadius2


## Border Image

@docs borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4

@docs borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4


# Outline

@docs outline, outline3, outlineWidth, outlineColor, invert, outlineStyle, outlineOffset


# Display

@docs display, display2, displayListItem2, displayListItem3


## Display values

You can also use [`block`](#block), [`inline`](#inline) and [`ruby`](#ruby) as values.

@docs flex_, flow, flowRoot, grid, contents, listItem, inlineBlock, inlineFlex, inlineTable, inlineGrid, rubyBase, rubyBaseContainer, rubyText, rubyTextContainer, runIn, table, tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup


# Positions

@docs position, zIndex

@docs absolute, fixed, relative, static, sticky


# Inset

@docs inset, inset2, inset3, inset4, top, right, bottom, left

@docs insetBlock, insetBlock2, insetInline, insetInline2, insetBlockStart, insetBlockEnd, insetInlineStart, insetInlineEnd


# Paddings

@docs padding, padding2, padding3, padding4, paddingTop, paddingRight, paddingBottom, paddingLeft


## Logical Paddings

@docs paddingBlock, paddingBlock2, paddingBlockStart, paddingBlockEnd

@docs paddingInline, paddingInline2, paddingInlineStart, paddingInlineEnd


## Margins

@docs margin, margin2, margin3, margin4, marginTop, marginRight, marginBottom, marginLeft


# Gaps

@docs gap, gap2, rowGap, columnGap


# Box Sizing
## Logical Margins

@docs marginBlock, marginBlock2, marginBlockStart, marginBlockEnd

@docs marginInline, marginInline2, marginInlineStart, marginInlineEnd


## Box Sizing

@docs boxSizing


# Flexbox

The CSS Flexible Box Layout Module.
See this [complete guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/).


## Flexbox Alignment

@docs alignContent, alignContent2, alignItems, alignItems2, alignSelf, alignSelf2, justifyContent, justifyContent2, justifyItems, justifyItems2, justifySelf, justifySelf2

@docs placeContent, placeContent2, placeItems, placeItems2, placeSelf, placeSelf2


### Align Items

Other values you can use for flex item alignment:

  - [`left_`](#left_)
  - [`right_`](#right_)
  - [`top_`](#top_)
  - [`bottom_`](#bottom_)
  - [`start`](#start)
  - [`end`](#end)
  - [`center`](#center)
  - [`stretch`](#stretch)
  - [`baseline`](#baseline)

@docs flexStart, flexEnd, selfStart, selfEnd, spaceBetween, spaceAround, spaceEvenly
@docs firstBaseline, lastBaseline, safe, unsafe, legacy, legacyLeft, legacyRight, legacyCenter


### Flexbox Direction

@docs flexDirection, row, rowReverse, column, columnReverse


### Flexbox Order

@docs order


### Flexbox Sizing

[`content`](#content) is also a supported value.

@docs flexGrow, flexShrink, flexBasis


### Flexbox Wrapping

@docs flexWrap, nowrap, wrap, wrapReverse


### Flexbox Shorthands

@docs flex, flex2, flex3, flexFlow, flexFlow2


# Typography


## Spacing

@docs wordSpacing
@docs tabSize


## Display

@docs fontDisplay, fallback, swap, optional
@docs writingMode, verticalLr, verticalRl, horizontalTb
@docs hyphens, quotes, quotes2, quotes4, textOverflow, textOverflow2, lineBreak, manual, ellipsis, loose
@docs hangingPunctuation, hangingPunctuation2, hangingPunctuation3, first, last, forceEnd, allowEnd
@docs lineClamp


## Font Size

@docs fontSize, xxSmall, xSmall, small, medium, large, xLarge, xxLarge, smaller, larger, lineHeight, letterSpacing
@docs fontSizeAdjust


## Font Family

@docs fontFamily, fontFamilies, serif, sansSerif, monospace, cursive, fantasy, systemUi


## Font Styles

@docs fontStyle, italic, oblique

[`normal`](#normal) is also a supported font style.


## Font Weights

@docs fontWeight, bold, lighter, bolder

[`normal`](#normal) is also a supported font weight.

@docs fontStretch, ultraCondensed, extraCondensed, condensed, semiCondensed, semiExpanded, expanded, extraExpanded, ultraExpanded


## Font Feature Settings

@docs fontFeatureSettings, fontFeatureSettingsList, featureTag, featureTag2

[`normal`](#normal) is also a supported font feature settings.


## Font Variant Caps

@docs fontVariantCaps, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps


## Font Variant East Asian

@docs fontVariantEastAsian, fontVariantEastAsian2, fontVariantEastAsian3, jis78, jis83, jis90, jis04, simplified, traditional, proportionalWidth


## Font Variant Ligatures

@docs fontVariantLigatures, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual


## Font Variant Numeric

@docs fontVariantNumeric, fontVariantNumeric4, ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions


## Font Optical Sizing

@docs fontKerning, fontLanguageOverride, fontSynthesis, fontSynthesis2, fontSynthesis3, fontOpticalSizing, fontVariantPosition


# Cursors

@docs CursorKeyword
@docs cursor, cursor2, cursor4


## Cursor values

[`text`](#text) is also a supported value for `cursor`.

@docs pointer, default, contextMenu, help, progress, wait, cell
@docs crosshair, verticalText, alias, copy, move, noDrop
@docs notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
@docs wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
@docs neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing


# List Style

@docs ListStyleType, ListStyleTypeSupported
@docs listStyle, listStyle2, listStyle3, listStylePosition, inside, outside, listStyleType, string, customIdent, listStyleImage
@docs arabicIndic, armenian, bengali, cambodian, circle, cjkDecimal, cjkEarthlyBranch, cjkHeavenlyStem, cjkIdeographic, decimal, decimalLeadingZero, devanagari, disclosureClosed, disclosureOpen, disc, ethiopicNumeric, georgian, gujarati, gurmukhi, hebrew, hiragana, hiraganaIroha, japaneseFormal, japaneseInformal, kannada, katakana, katakanaIroha, khmer, koreanHangulFormal, koreanHanjaFormal, koreanHanjaInformal, lao, lowerAlpha, lowerArmenian, lowerGreek, lowerLatin, lowerRoman, malayalam, monogolian, myanmar, oriya, persian, simpChineseFormal, simpChineseInformal, tamil, telugu, thai, tibetan, tradChineseFormal, tradChineseInformal, upperAlpha, upperArmenian, upperLatin, upperRoman

[`square`](#square) is also a supported value for [`listStyle`](#listStyle) and [`listStyleType`](#listStyleType).


# Overflow

@docs overflow, overflowX, overflowY, overflowBlock, overflowInline
@docs overflowAnchor

@docs overflowWrap
@docs breakWord, anywhere


# Direction

@docs direction, ltr, rtl


# Text Align

@docs justify, matchParent, textAlign, textJustify, interWord, interCharacter, textUnderlinePosition, textUnderlinePosition2, under


# Text Orientation

@docs textOrientation
@docs mixed, sideways, upright


# Text Rendering

@docs textRendering
@docs geometricPrecision, optimizeLegibility, optimizeSpeed


# Text Transform

@docs textTransform
@docs capitalize, uppercase, lowercase, fullSizeKana


# Text Decoration

@docs textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorationLine2, textDecorationLine3, textDecorationStyle, textDecorationColor
@docs textDecorationSkip, objects, spaces, ink, edges, boxDecoration

@docs wavy, underline, overline, lineThrough

@docs textStroke, textStroke2, textStrokeColor, textStrokeWidth

@docs textIndent, textIndent2, textIndent3, hanging, eachLine


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
@docs textTop, textBottom, middle


## White space

@docs whiteSpace
@docs pre, preWrap, preLine


## Word break

@docs wordBreak
@docs breakAll, keepAll


## Float

@docs float
@docs clear, inlineStart, inlineEnd


# Visibility

@docs visibility


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


## Other

@docs paintOrder, paintOrder2, paintOrder3, markers


# Columns

@docs columns, columns2, columnWidth, columnCount, columnRuleWidth, columnRuleStyle, columnRuleColor, columnRule, columnRule2, columnRule3
@docs columnFill, balance, balanceAll
@docs columnSpan


# Transformation

@docs transform, transforms, transformOrigin, transformOrigin2
@docs TransformFunction, TransformFunctionSupported


## Matrix transformation

@docs matrix, matrix3d


## Perspective

@docs perspective, perspectiveOrigin, perspectiveOrigin2
@docs perspective_


## Rotation

@docs rotate, rotate2, rotate_, rotateX, rotateY, rotateZ, rotate3d, vec3, z


## Scaling (resizing)

@docs scale, scale2, scale3, scale_, scale2_, scaleX, scaleY, scaleZ, scale3d


## Skewing (distortion)

@docs skew, skew2, skewX, skewY


## Translation (moving)

@docs translate, translate2, translateX, translateY, translateZ, translate3d


# Animation

@docs animationName, animationNames, animationDuration, animationDurations, animationTimingFunction, animationTimingFunctions, animationIterationCount, animationIterationCounts, animationDirection, animationDirections, animationPlayState, animationPlayStates, animationDelay, animationDelays, animationFillMode, animationFillModes
@docs EasingFunction, EasingFunctionSupported, linear, ease, easeIn, easeOut, easeInOut, cubicBezier, stepStart, stepEnd, steps, steps2, jumpStart, jumpEnd, jumpNone, jumpBoth, infinite, reverse, alternate, alternateReverse, running, paused, forwards, backwards


# Opacity

@docs opacity


# Viewport

@docs zoom


# Scroll

@docs scrollBehavior, smooth, scrollSnapAlign, scrollSnapStop
@docs scrollSnapType, scrollSnapType2, mandatory, proximity
@docs scrollMargin, scrollMargin2, scrollMargin3, scrollMargin4, scrollMarginTop, scrollMarginLeft, scrollMarginRight, scrollMarginBottom
@docs scrollMarginBlock, scrollMarginBlock2, scrollMarginInline, scrollMarginInline2
@docs scrollMarginBlockStart, scrollMarginBlockEnd, scrollMarginInlineStart, scrollMarginInlineEnd
@docs scrollPadding, scrollPadding2, scrollPadding3, scrollPadding4, scrollPaddingTop, scrollPaddingLeft, scrollPaddingRight, scrollPaddingBottom
@docs scrollPaddingBlock, scrollPaddingBlock2, scrollPaddingInline, scrollPaddingInline2
@docs scrollPaddingBlockStart, scrollPaddingBlockEnd, scrollPaddingInlineStart, scrollPaddingInlineEnd
@docs overscrollBehavior, overscrollBehavior2, overscrollBehaviorX, overscrollBehaviorY, overscrollBehaviorBlock, overscrollBehaviorInline


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
@docs objectFit, scaleDown
@docs objectPosition, objectPosition2, objectPosition4
@docs boxDecorationBreak
@docs isolation, isolate


# Other

@docs caretColor
@docs pointerEvents
@docs visiblePainted, visibleFill, visibleStroke, painted
@docs resize, horizontal, vertical
@docs contain, contain2, contain3, contain4, size, layout, paint

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


unpackValue : Value a -> String
unpackValue (Value value) =
    value


{-| A type that is used in properties for CSS wide values.
See [CSS-wide values](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Values_and_Units#css-wide_values).
-}
type alias BaseValue supported =
    Value
        { supported
            | initial : Supported
            , inherit : Supported
            , unset : Supported
        }


{-| A type used to specify which properties and which values work together.
-}
type Supported
    = Supported


{-| A type alias used to accept a [length](https://developer.mozilla.org/en-US/docs/Web/CSS/length)
among other values.
-}
type alias LengthSupported supported =
    { supported
        | ch : Supported
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
        , q : Supported
        , zero : Supported
        , calc : Supported
    }


{-| A type alias used to accept a [length](https://developer.mozilla.org/en-US/docs/Web/CSS/length).
-}
type alias Length =
    LengthSupported {}


{-| A type alias used to accept a [color](https://developer.mozilla.org/en-US/docs/Web/CSS/color)
among other values.
-}
type alias ColorSupported supported =
    { supported
        | rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        , currentcolor : Supported
    }


{-| A type alias used to accept a [color](https://developer.mozilla.org/en-US/docs/Web/CSS/color).
-}
type alias Color =
    ColorSupported {}


{-| A type alias used to accept a [line-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#line-style)
(without the `hidden`) value among other values.
-}
type alias LineStyleSupported supported =
    { supported
        | none : Supported
        , dotted : Supported
        , dashed : Supported
        , solid : Supported
        , double : Supported
        , groove : Supported
        , ridge : Supported
        , inset_ : Supported
        , outset : Supported
    }


{-| A type alias used to accept a [line-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#line-style).
This includes `hidden` as a possible value.
-}
type alias LineStyle =
    LineStyleSupported { hidden : Supported }


{-| A type alias used to accept a [line-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width#line-width)
among other values.
-}
type alias LineWidthSupported supported =
    LengthSupported
        { supported
            | thin : Supported
            , medium : Supported
            , thick : Supported
        }


{-| A type alias used to accept a [line-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width#line-width).
-}
type alias LineWidth =
    LineWidthSupported {}


{-| A type alias used to accept a ['width'](https://developer.mozilla.org/en-US/docs/Web/CSS/width#values)
among other values.
-}
type alias WidthSupported supported =
    LengthSupported
        { supported
            | auto : Supported
            , pct : Supported
            , minContent : Supported
            , maxContent : Supported
            , fitContent : Supported
        }


{-| A type alias used to accept a ['width'](https://developer.mozilla.org/en-US/docs/Web/CSS/width#values).
-}
type alias Width =
    WidthSupported {}


{-| A type alias used to accept an [angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)
among other values.
-}
type alias AngleSupported supported =
    { supported
        | deg : Supported
        , grad : Supported
        , rad : Supported
        , turn : Supported
        , zero : Supported
        , calc : Supported
    }


{-| A type alias used to accept an [angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle).
-}
type alias Angle =
    AngleSupported {}


{-| A type alias used to accept an [image](https://developer.mozilla.org/en-US/docs/Web/CSS/image)
among other values.
-}
type alias ImageSupported supported =
    { supported
        | url : Supported
        , linearGradient : Supported
        , radialGradient : Supported
        , repeatingLinearGradient : Supported
        , repeatingRadialGradient : Supported
    }


{-| A type alias used to accept an [image](https://developer.mozilla.org/en-US/docs/Web/CSS/image).
-}
type alias Image =
    ImageSupported {}


{-| A type alias used to accept an [time](https://developer.mozilla.org/en-US/docs/Web/CSS/time)
among other values.
-}
type alias TimeSupported supported =
    { supported
        | s : Supported
        , ms : Supported
    }


{-| A type alias used to accept an [time](https://developer.mozilla.org/en-US/docs/Web/CSS/time).
-}
type alias Time =
    TimeSupported {}


{-| Produces a [`string`](https://developer.mozilla.org/en-US/docs/Web/CSS/string)
value used by properties such as:

  - [`listStyle`](#listStyle)

  - [`listStyleType`](#listStyleType)

  - [`quotes2`](#quotes2)

  - [`fontLanguageOverride`](#fontLanguageOverride)

```
listStyleType (string "> ")

quotes2 (string "«") (string "»")

fontLanguageOverride (string "ENG")
```

-}
string : String -> Value { provides | string : Supported }
string =
    Value << enquoteString



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


{-| The `revert` value for the [`all`](#all) property.

    all revert

-}
revert : Value { provides | revert : Supported }
revert =
    Value "revert"


{-| Sets an [`all`](https://css-tricks.com/almanac/properties/a/all/) property.

    all inherit

-}
all : BaseValue { revert : Supported } -> Style
all (Value val) =
    AppendProperty ("all:" ++ val)


{-| Transforms the given property by adding !important to the end of its
declaration.
-}
important : Style -> Style
important =
    Preprocess.mapProperties makeImportant


makeImportant : Structure.Property -> Structure.Property
makeImportant str =
    if String.endsWith " !important" (String.toLower str) then
        str

    else
        str ++ " !important"



-- SHARED VALUES --


{-| The `url` value for the [`cursor`](#cursor),
[`fill`](#fill),
[`strokeImage`](#strokeImage),
and [`backgroundImage`](#backgroundImage) properties.
-}
url : String -> Value { provides | url : Supported }
url str =
    Value ("url(" ++ str ++ ")")



-- SHARED VALUES --


{-| The `auto` value used in many properties such as [`width`](#width),
[`zoom`](#zoom),
[`outlineStyle`](#outlineStyle),
and [`flexBasis`](#flexBasis).

    width auto

    zoom auto

    flexBasis auto

-}
auto : Value { provides | auto : Supported }
auto =
    Value "auto"


{-| The `none` value used in many properties such as [`display`](#display),
[`borderStyle`](#borderStyle),
[`maxWidth`](#maxWidth),
[`clear`](#clear),
[`strokeDashJustify`](#strokeDashJustify),
and [`flex`](#flex).

    display none

    borderStyle none

    strokeDashJustify none

    flex none

-}
none : Value { provides | none : Supported }
none =
    Value "none"


{-| The `normal` value, which can be used with such properties as:

  - [`fontVariantCaps`](#fontVariantCaps)
  - [`fontKerning`](#fontKerning)
  - [`fontLanguageOverride`](#fontLanguageOverride)
  - [`whiteSpace`](#whiteSpace)
  - [`wordBreak`](#wordBreak)
  - [`columnGap`](#columnGap)
  - [`zoom`](#zoom)
  - [`animationDirection`](#animationDirection)
  - [`alignItems`](#alignItems)
  - [`lineBreak`](#lineBreak)

```
alignItems normal

columnGap normal

fontVariantCaps normal

whiteSpace normal

wordBreak normal

zoom normal
```

-}
normal : Value { provides | normal : Supported }
normal =
    Value "normal"


{-| Sets `strict` value for usage with [`lineBreak`](#lineBreak) and [`contain`](#contain).

    contain strict

    lineBreak strict

-}
strict : Value { provides | strict : Supported }
strict =
    Value "strict"


{-| The `all` value used in properties such as [`columnSpan`](#columnSpan)
and [`pointerEvents`](#pointerEvents).

    columnSpan all_

    pointerEvents all_

-}
all_ : Value { provides | all_ : Supported }
all_ =
    Value "all"


{-| Sets `both` value for usage with [`clear`](#clear) and [`resize`](#resize).

      clear both

      resize both

-}
both : Value { provides | both : Supported }
both =
    Value "both"


{-| Sets `always` value for usage with [`scrollSnapStop`](#scrollSnapStop), [`pageBreakBefore`](#pageBreakBefore), and [`pageBreakAfter`](#pageBreakAfter).

    scrollSnapStop always

    pageBreakBefore always

    pageBreakAfter always

-}
always : Value { provides | always : Supported }
always =
    Value "always"


{-| The `hidden` value used for properties such as [`visibility`](https://css-tricks.com/almanac/properties/v/visibility/), [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/) and [`borderStyle`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style).

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


{-| The `content-box` value, used in the following properties:

  - [`boxSizing`](#boxSizing)
  - [`backgroundClip`](#backgroundClip)
  - [`backgroundOrigin`](#backgroundOrigin)
  - [`strokeOrigin`](#strokeOrigin)

```
boxSizing contentBox

backgroundClip contentBox

backgroundOrigin contentBox

strokeOrigin contentBox
```

-}
contentBox : Value { provides | contentBox : Supported }
contentBox =
    Value "content-box"


{-| The `border-box` value, used in the following properties:

  - [`boxSizing`](#boxSizing)
  - [`backgroundClip`](#backgroundClip)
  - [`backgroundOrigin`](backgroundOrigin)
  - [`strokeOrigin`](#strokeOrigin)

```
boxSizing borderBox

backgroundClip borderBox

backgroundOrigin borderBox

strokeOrigin borderBox
```

-}
borderBox : Value { provides | borderBox : Supported }
borderBox =
    Value "border-box"


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


{-| The `left` value, used in many properties such as:

  - [`backgroundPosition`](#backgroundPosition)
  - [`clear`](#clear)
  - [`float`](#float)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`pageBreakAfter`](#pageBreakAfter)
  - [`textAlign`](#textAlign)

```
backgroundPosition left_

clear left_

float left_

justifyContent left_

justifyItems left_

justifySelf left_

pageBreakAfter left_

textAlign left_
```

The value is called `left_` instead of `left` because [`left` is already a function](#left).

-}
left_ : Value { provides | left_ : Supported }
left_ =
    Value "left"


{-| The `right` value, used in many properties such as:

  - [`backgroundPosition`](#backgroundPosition)
  - [`clear`](#clear)
  - [`float`](#float)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`pageBreakAfter`](#pageBreakAfter)
  - [`textAlign`](#textAlign)

```
backgroundPosition right_

clear right_

float right_

justifyContent right_

justifyItems right_

justifySelf right_

pageBreakAfter right_

textAlign right_
```

The value is called `right_` instead of `right` because [`right` is already a function](#right).

-}
right_ : Value { provides | right_ : Supported }
right_ =
    Value "right"


{-| The `top` value, used in the following properties:

  - [`backgroundPosition`](#backgroundPosition)
  - [`captionSide`](#captionSide)
  - [`objectPosition2`](#objectPosition2)
  - [`perspectiveOrigin2`](#perspectiveOrigin2)
  - [`strokePosition2`](#strokePosition2)
  - [`transformOrigin`](#transformOrigin)
  - [`verticalAlign`](#verticalAlign)

```
backgroundPosition top_

captionSide top_

objectPosition2 right_ top_

perspectiveOrigin2 left_ top_

transformOrigin top_

verticalAlign top_
```

The value is called `top_` instead of `top` because [`top` is already a function](#top).

-}
top_ : Value { provides | top_ : Supported }
top_ =
    Value "top"


{-| The `bottom` value, used in the following properties:

  - [`backgroundPosition`](#backgroundPosition)
  - [`captionSide`](#captionSide)
  - [`objectPosition2`](#objectPosition2)
  - [`perspectiveOrigin2`](#perspectiveOrigin2)
  - [`strokePosition2`](#strokePosition2)
  - [`transformOrigin`](#transformOrigin)
  - [`verticalAlign`](#verticalAlign)

```
backgroundPosition bottom_

captionSide bottom_

objectPosition2 right_ bottom_

perspectiveOrigin2 left_ bottom_

transformOrigin bottom_

verticalAlign bottom_
```

The value is called `bottom_` instead of `bottom` because [`bottom` is already a function](#bottom).

-}
bottom_ : Value { provides | bottom_ : Supported }
bottom_ =
    Value "bottom"


{-| The `block` value used by [`display`](#display) and [`resize`](#resize).

    display block

    resize block

-}
block : Value { provides | block : Supported }
block =
    Value "block"


{-| The `inline` value used by [`display`](#display) and [`resize`](#resize).

    display inline

    resize inline

-}
inline : Value { provides | inline : Supported }
inline =
    Value "inline"


{-| The `start` value, used in the following properties:

  - [`alignItems`](#alignItems)
  - [`alignContent`](#alignContent)
  - [`alignSelf`](#alignSelf)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`steps2`](#steps2)

```
alignContent start

steps2 3 start
```

-}
start : Value { provides | start : Supported }
start =
    Value "start"


{-| The `end` value, used in the following properties:

  - [`alignItems`](#alignItems)
  - [`alignContent`](#alignContent)
  - [`alignSelf`](#alignSelf)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`steps2`](#steps2)

```
alignContent end

steps2 3 end
```

-}
end : Value { provides | end : Supported }
end =
    Value "end"


{-| Sets `x` value for usage with [`scrollSnapType2`](#scrollSnapType2)
and [`rotate2`](#rotate2).

    scrollSnapType2 x mandatory

    rotate x (deg 10)

-}
x : Value { provides | x : Supported }
x =
    Value "x"


{-| Sets `y` value for usage with [`scrollSnapType2`](#scrollSnapType2)
and [`rotate2`](#rotate2).

    scrollSnapType2 y mandatory

    rotate y (deg 50)

-}
y : Value { provides | y : Supported }
y =
    Value "y"


{-| The `stretch` value used in the following properties:

  - [`alignContent`](#alignContent)
  - [`alignItems`](#alignItems)
  - [`alignSelf`](#alignSelf)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`strokeDashJustify`](#strokeDashJustify)

```
alignContent stretch

strokeDashJustify stretch
```

-}
stretch : Value { provides | stretch : Supported }
stretch =
    Value "stretch"


{-| The `center` value, used in many properties such as:

  - [`alignContent`](#alignContent)
  - [`alignItems`](#alignItems)
  - [`alignSelf`](#alignSelf)
  - [`backgroundPosition`](#backgroundPosition)
  - [`justifyContent`](#justifyContent)
  - [`justifyItems`](#justifyItems)
  - [`justifySelf`](#justifySelf)
  - [`scrollSnapAlign`](#scrollSnapAlign)

```
backgroundPosition enter

justifyContent center
```

-}
center : Value { provides | center : Supported }
center =
    Value "center"


{-| The `content` value used in the following properties:

  - [`flex`](#flex)
  - [`flex-basis`](#flexBasis)
  - [`contain`](#contain)

```
flexBasis content

contain content
```

-}
content : Value { provides | content : Supported }
content =
    Value "content"


{-| The `fill` value used in properties such as [`objectFit`](#objectFit),
[`pointerEvents`](#pointerEvents) and [`paintOrder`](#paintOrder).

    objectFit fill_

    pointerEvents fill_

    paintOrder2 fill markers

-}
fill_ : Value { provides | fill_ : Supported }
fill_ =
    Value "fill"


{-| The `stroke` value used by [`pointerEvents`](#pointerEvents) and [`paintOrder`](#paintOrder).

    pointerEvents stroke

    paintOrder2 stroke markers

-}
stroke : Value { provides | stroke : Supported }
stroke =
    Value "stroke"


{-| The `text` value for the [`cursor`](#cursor),
[`backgroundClip`](#backgroundClip),
and [`user-select`](#userSelect) properties.

    backgroundClip text

    cursor text

    userSelect text

-}
text : Value { provides | text : Supported }
text =
    Value "text"


{-| Sets the `style` value for:

  - [`contain`](#contain). **(This value is considered at-risk from being depreciated for this property.)**
  - [`fontSynthesis`](#fontSynthesis)

```
    contain style

    fontSynthesis style
```

-}
style : Value { provides | style : Supported }
style =
    Value "style"


{-| The `clip` value used by [`overflow`](#overflow) and [`textOverflow`](#textOverflow).

    overflow clip

    overflowX clip

    overflowY clip

    textOverflow clip

-}
clip : Value { provides | clip : Supported }
clip =
    Value "clip"


{-| Sets `contain` for the following properties:

  - [`backgroundSize`](#backgroundSize) (It always show the whole background
    image, even if it leaves empty spaces on the sides.)
  - [`objectFit`](#objectFit) (Replaced content is scaled to maintain proportions within the element's content box.)
  - [`userSelect`](#userSelect) (Lets selection start within the element but that selection will be contained within that element's bounds.)
  - [`overscrollBehavior`](#overscrollBehavior) (This means that default scroll overflow behavior
    is observed inside the element, but scroll chaining will not happen to neighbouring elements.)

```
backgroundSize contain_

overscrollBehavior contain_
```

The value is called `contain_` instead of `contain` because [`contain`](#contain) is already a function.

-}
contain_ : Value { provides | contain_ : Supported }
contain_ =
    Value "contain"


{-| Sets `cover` for the following properties:

  - [`backgroundSize`](#backgroundSize)
  - [`objectFit`](#objectFit)
  - [`strokeDashCorner`](#strokeDashCorner)
  - [`strokeSize`](#strokeSize)

```
backgroundSize cover

strokeSize cover
```

-}
cover : Value { provides | cover : Supported }
cover =
    Value "cover"


{-| The `baseline` value, used in the following properties:

  - [`alignContent`](#alignContent)
  - [`alignItems`](#alignItems)
  - [`alignSelf`](#alignSelf)
  - [`verticalAlign`](#verticalAlign)

```
alignItems baseline

verticalAlign baseline
```

-}
baseline : Value { provides | baseline : Supported }
baseline =
    Value "baseline"


{-| A `sub` value for the following properties:

  - [`fontVariantPosition`](#fontVariantPosition)
  - [`verticalAlign`](#verticalAlign)

```
    fontVariantPosition sub

    verticalAlign sub
```

-}
sub : Value { provides | sub : Supported }
sub =
    Value "sub"


{-| A `super` value for the following properties:

  - [`fontVariantPosition`](#fontVariantPosition)
  - [`verticalAlign`](#verticalAlign)

```
    fontVariantPosition super

    verticalAlign super
```

-}
super : Value { provides | super : Supported }
super =
    Value "super"


{-| The `ruby` value used by [`display`](#display) and [`fontVariantEastAsian`](#fontVariantEastAsian).

    display ruby

    fontVariantEastAsian2 ruby jis83

-}
ruby : Value { provides | ruby : Supported }
ruby =
    Value "ruby"


{-| A `full-width` value for:


### [`textTransform`](#textTransform)

Forces the writing of characters in a square so they can be aligned in East Asian scripts.


### [`fontVariantEastAsian`](#fontVariantEastAsian)

Activates the East Asian characters that are roughly be the same width.

    textTransform fullWidth

    fontVariantEastAsian fullWidth

-}
fullWidth : Value { provides | fullWidth : Supported }
fullWidth =
    Value "full-width"



-- OVERFLOW --


{-| Sets [`overflow`](https://css-tricks.com/almanac/properties/o/overflow/).

    overflow visible

    overflow hidden

    overflow scroll

    overflow auto

-}
overflow :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
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
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
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
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        , clip : Supported
        }
    -> Style
overflowY (Value val) =
    AppendProperty ("overflow-y:" ++ val)


{-| Sets [`overflow-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-block).

    overflowBlock visible

    overflowBlock hidden

    overflowBlock scroll

    overflowBlock auto

-}
overflowBlock :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        }
    -> Style
overflowBlock (Value val) =
    AppendProperty ("overflow-block:" ++ val)


{-| Sets [`overflow-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-inline).

    overflowInline visible

    overflowInline hidden

    overflowInline scroll

    overflowInline auto

-}
overflowInline :
    BaseValue
        { visible : Supported
        , hidden : Supported
        , scroll : Supported
        , auto : Supported
        }
    -> Style
overflowInline (Value val) =
    AppendProperty ("overflow-inline:" ++ val)


{-| Sets [`overflow-wrap`](https://css-tricks.com/almanac/properties/o/overflow-wrap/)

    overflowWrap breakWord

    overflowWrap normal

-}
overflowWrap :
    BaseValue
        { anywhere : Supported
        , breakWord : Supported
        , normal : Supported
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


{-| The `anywhere` value used by [`overflowWrap`](#overflowWrap) and [`lineBreak`](#lineBreak).

    overflowWrap anywhere

    lineBreak anywhere

-}
anywhere : Value { provides | anywhere : Supported }
anywhere =
    Value "anywhere"



-- COLORS --


{-| Sets [`color`](https://css-tricks.com/almanac/properties/c/color/).

    color (hex "#60b5cc")

    color (rgb 96 181 204)

    color (rgba 96 181 204 0.5)

-}
color : BaseValue Color -> Style
color (Value val) =
    AppendProperty ("color:" ++ val)


{-| Sets [`background-color`](https://css-tricks.com/almanac/properties/b/background-color/).

    backgroundColor (hex "#60b5cc")

    backgroundColor (rgb 96 181 204)

    backgroundColor (rgba 96 181 204 0.5)

-}
backgroundColor : BaseValue Color -> Style
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


{-| The [`currentcolor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentcolor_keyword)
value used by properties such as [`color`](#color), [`backgroundColor`](#backgroundColor)

    color currentcolor

-}
currentcolor : Value { provides | currentcolor : Supported }
currentcolor =
    Value "currentcolor"



-- POSITIONS --


{-| Sets the [`position`](https://css-tricks.com/almanac/properties/p/position/) of an element.

    position absolute

    position relative

-}
position :
    BaseValue
        { absolute : Supported
        , fixed : Supported
        , relative : Supported
        , static : Supported
        , sticky : Supported
        }
    -> Style
position (Value val) =
    AppendProperty ("position:" ++ val)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
inset (Value val) =
    AppendProperty ("inset:" ++ val)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
inset2 (Value valTopBottom) (Value valRightLeft) =
    AppendProperty ("inset:" ++ valTopBottom ++ " " ++ valRightLeft)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset3 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
inset3 (Value valTop) (Value valRightLeft) (Value valBottom) =
    AppendProperty ("inset:" ++ valTop ++ " " ++ valRightLeft ++ " " ++ valBottom)


{-| Sets the [`inset`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset) property.

`inset` sets the `top`, `bottom`, `left` and `right` properties.

    inset (px 10) -- top, bottom, left and right are all 10px.

    inset2 (pct 5) (pct 5) -- top & bottom = 5%, left & right = 5%

    inset3 (px 20) (px 20) (px 20) -- top = 20px, left & right = 20px, bottom = 20px

    inset4 (px 20) (px 20) (px 40) (px 20) -- top = 20px, right = 20px, bottom = 40px, left = 20px

-}
inset4 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
inset4 (Value valTop) (Value valRight) (Value valBottom) (Value valLeft) =
    AppendProperty ("inset:" ++ valTop ++ " " ++ valRight ++ " " ++ valBottom ++ " " ++ valLeft)


{-| Sets the [`top`](https://css-tricks.com/almanac/properties/t/top/) property.

    top (px 10)

    top (pct 50)

    top auto

    top zero

If you need to use `top` as a CSS _value_ instead of as a _property_,
for example in `vertical-align: top`, use [`top_`](#top_) instead of this.

-}
top :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
top (Value val) =
    AppendProperty ("top:" ++ val)


{-| Sets the [`bottom`](https://css-tricks.com/almanac/properties/b/bottom/) property.

    bottom (px 10)

    bottom (pct 50)

    bottom auto

    bottom zero

If you need to use `bottom` as a CSS _value_ instead of as a _property_,
for example in `vertical-align: bottom`, use [`bottom_`](#bottom_) instead of this.

-}
bottom :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
bottom (Value val) =
    AppendProperty ("bottom:" ++ val)


{-| Sets the [`left`](https://css-tricks.com/almanac/properties/l/left/) property.

    left (px 10)

    left (pct 50)

    left auto

    left zero

If you need to use `left` as a CSS _value_ instead of as a _property_,
for example in `float: left`, use [`left_`](#left_) instead of this.

-}
left :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
left (Value val) =
    AppendProperty ("left:" ++ val)


{-| Sets the [`right`](https://css-tricks.com/almanac/properties/r/right) property.

    right (px 10)

    right (pct 50)

    right auto

    right zero

If you need to use `right` as a CSS _value_ instead of as a _property_,
for example in `float: right`, use [`right_`](#right_) instead of this.

-}
right :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
right (Value val) =
    AppendProperty ("right:" ++ val)


{-| Sets the [`inset-block`](https://css-tricks.com/almanac/properties/i/inset-block/) property.

`inset-block` sets the `inset-block-start` and `inset-block-end` properties.

    insetBlock (px 10) -- block start and block end are both 10px.

    insetBlock2 (pct 5) (pct 5) -- block start = 5%, block end = 5%

-}
insetBlock :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetBlock (Value val) =
    AppendProperty ("inset-block:" ++ val)


{-| Sets the [`inset-block`](https://css-tricks.com/almanac/properties/i/inset-block/) property.

`inset-block` sets the `inset-block-start` and `inset-block-end` properties.

    insetBlock (px 10) -- block start and block end are both 10px.

    insetBlock2 (pct 5) (pct 5) -- block start = 5%, block end = 5%

-}
insetBlock2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
insetBlock2 (Value valStart) (Value valEnd) =
    AppendProperty ("inset-block:" ++ valStart ++ " " ++ valEnd)


{-| Sets the [`inset-inline`](https://css-tricks.com/almanac/properties/i/inset-inline) property.

`inset-inline` sets the `inset-inline-start` and `inset-inline-end` properties.

    insetInline (px 10) -- inline start and inline end are both 10px.

    insetInline2 (pct 5) (pct 5) -- inline start = 5%, inline end = 5%

-}
insetInline :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetInline (Value val) =
    AppendProperty ("inset-inline:" ++ val)


{-| Sets the [`inset-inline`](https://css-tricks.com/almanac/properties/i/inset-inline) property.

`inset-inline` sets the `inset-inline-start` and `inset-inline-end` properties.

    insetInline (px 10) -- inline start and inline end are both 10px.

    insetInline2 (pct 5) (pct 5) -- inline start = 5%, inline end = 5%

-}
insetInline2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
insetInline2 (Value valStart) (Value valEnd) =
    AppendProperty ("inset-inline:" ++ valStart ++ " " ++ valEnd)


{-| Sets the [`inset-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-block-start) property.

    insetBlockStart (px 10)

    insetBlockStart (pct 50)

    insetBlockStart auto

    insetBlockStart zero

-}
insetBlockStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetBlockStart (Value val) =
    AppendProperty ("inset-block-start:" ++ val)


{-| Sets the [`inset-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-block-end) property.

    insetBlockEnd (px 10)

    insetBlockEnd (pct 50)

    insetBlockEnd auto

    insetBlockEnd zero

-}
insetBlockEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetBlockEnd (Value val) =
    AppendProperty ("inset-block-end:" ++ val)


{-| Sets the [`inset-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-inline-start) property.

    insetInlineStart (px 10)

    insetInlineStart (pct 50)

    insetInlineStart auto

    insetInlineStart zero

-}
insetInlineStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetInlineStart (Value val) =
    AppendProperty ("inset-inline-start:" ++ val)


{-| Sets the [`inset-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-inline-end) property.

    insetInlineEnd (px 10)

    insetInlineEnd (pct 50)

    insetInlineEnd auto

    insetInlineEnd zero

-}
insetInlineEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
insetInlineEnd (Value val) =
    AppendProperty ("inset-inline-end:" ++ val)


{-| An [`absolute` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#relative).

    position absolute

The default `position` value is [`static`](#static). See also [`position: sticky`](#sticky), and [the differences between absolute, relative, and fixed positioning](<https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/>

-}
absolute : Value { provides | absolute : Supported }
absolute =
    Value "absolute"


{-| A [`fixed` `position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values)
or [`fixed` `background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)
or [`fixed` `table-layout`](https://css-tricks.com/almanac/properties/t/table-layout/).

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
    BaseValue
        { int : Supported
        , auto : Supported
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
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
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
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
padding4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("padding:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top) property.

    paddingTop (px 4)

-}
paddingTop :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingTop (Value value) =
    AppendProperty ("padding-top:" ++ value)


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right) property.

    paddingRight (px 4)

-}
paddingRight :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingRight (Value value) =
    AppendProperty ("padding-right:" ++ value)


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom) property.

    paddingBottom (px 4)

-}
paddingBottom :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBottom (Value value) =
    AppendProperty ("padding-bottom:" ++ value)


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left) property.

    paddingLeft (px 4)

-}
paddingLeft :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingLeft (Value value) =
    AppendProperty ("padding-left:" ++ value)


{-| Sets [`padding-block`](https://css-tricks.com/almanac/properties/p/padding-block/) property.
The `padding-block` property is a shorthand property for setting `padding-block-start` and
`padding-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start is set to the first value and the block end is set to the second.

    paddingBlock (em 4) -- set both block start and block end to 4em

    paddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
paddingBlock :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBlock (Value value) =
    AppendProperty ("padding-block:" ++ value)


{-| Sets [`padding-block`](https://css-tricks.com/almanac/properties/p/padding-block/) property.

The `padding-block` property is a shorthand property for setting `padding-block-start` and
`padding-block-end` in a single declaration.

The block start value is set to the first value and the block end value is set to the second.

    paddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
paddingBlock2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
paddingBlock2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("padding-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start) property.

    paddingBlockStart (px 4)

-}
paddingBlockStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBlockStart (Value value) =
    AppendProperty ("padding-block-start:" ++ value)


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end) property.

    paddingBlockEnd (px 4)

-}
paddingBlockEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingBlockEnd (Value value) =
    AppendProperty ("padding-block-end:" ++ value)


{-| Sets [`padding-inline`](https://css-tricks.com/almanac/properties/p/padding-inline/) property.

The `padding-inline` property is a shorthand property for setting `padding-inline-start` and
`padding-inline-end` and in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start is set to the first value and the inline end is set to the second.

    paddingInline (em 4) -- set both inline start and inline end to 4em

    paddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
paddingInline :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingInline (Value value) =
    AppendProperty ("padding-inline:" ++ value)


{-| Sets [`padding-inline`](https://css-tricks.com/almanac/properties/p/padding-inline/) property.

The `padding-inline` property is a shorthand property for setting `padding-inline-start` and
`padding-inline-end` in a single declaration.

The inline start value is set to the first value and the inline end value is set to the second.

    paddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
paddingInline2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
paddingInline2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("padding-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start) property.

    paddingInlineStart (px 4)

-}
paddingInlineStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingInlineStart (Value value) =
    AppendProperty ("padding-inline-start:" ++ value)


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end) property.

    paddingInlineEnd (px 4)

-}
paddingInlineEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
paddingInlineEnd (Value value) =
    AppendProperty ("padding-inline-end:" ++ value)



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
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
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
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
margin4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("margin:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top) property.

    marginTop (px 4)

This article on [`margin-top` versus `margin-bottom`](https://css-tricks.com/margin-bottom-margin-top/) may be useful.

-}
marginTop :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginTop (Value value) =
    AppendProperty ("margin-top:" ++ value)


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right) property.

    marginRight (px 4)

-}
marginRight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginRight (Value value) =
    AppendProperty ("margin-right:" ++ value)


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom) property.

    marginBottom (px 4)

This article on [`margin-top` versus `margin-bottom`](https://css-tricks.com/margin-bottom-margin-top/) may be useful.

-}
marginBottom :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBottom (Value value) =
    AppendProperty ("margin-bottom:" ++ value)


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left) property.

    marginLeft (px 4)

-}
marginLeft :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginLeft (Value value) =
    AppendProperty ("margin-left:" ++ value)



-- BOX SIZING --


{-| Sets [`box-sizing`](https://css-tricks.com/almanac/properties/b/box-sizing/) property.

    boxSizing contentBox

    boxSizing borderBox

-}
boxSizing :
    BaseValue
        { contentBox : Supported
        , borderBox : Supported
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
    pseudoClass "active"


{-| A [`:checked`](https://developer.mozilla.org/en-US/docs/Web/CSS/:checked)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

This pseudo-class is for any checkbox, option or radio input that is checked or toggled on.

    checked
        [ backgroundColor (rgb 0 0 255)
        ]

-}
checked : List Style -> Style
checked =
    pseudoClass "checked"


{-| A [`:disabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    button [ disabled [ color (rgb 194 194 194) ] ]

-}
disabled : List Style -> Style
disabled =
    pseudoClass "disabled"


{-| An [`:empty`](https://developer.mozilla.org/en-US/docs/Web/CSS/:empty)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    empty
        [ backgroundColor (rgb 20 20 20)
        ]

-}
empty : List Style -> Style
empty =
    pseudoClass "empty"


{-| An [`:enabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/:enabled)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    enabled
        [ borderColor (rgba 150 150 0 0.5)
        ]

-}
enabled : List Style -> Style
enabled =
    pseudoClass "enabled"


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    firstChild
        [ fontWeight bold
        ]

-}
firstChild : List Style -> Style
firstChild =
    pseudoClass "first-child"


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    firstOfType
        [ color (rgb 255 0 0)
        ]

-}
firstOfType : List Style -> Style
firstOfType =
    pseudoClass "first-of-type"


{-| A [`:focus`](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    focus
        [ border3 (px 2) solid (rgb 0 0 0)
        ]

-}
focus : List Style -> Style
focus =
    pseudoClass "focus"


{-| A [`:fullscreen`](https://developer.mozilla.org/en-US/docs/Web/CSS/:fullscreen)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    fullscreen
        [ backgroundColor (rgb 0 0 0)
        ]

-}
fullscreen : List Style -> Style
fullscreen =
    pseudoClass "fullscreen"


{-| A [`:hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/:hover)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    hover
        [ fontWeight bold
        , color (rgb 255 50 0)
        ]

-}
hover : List Style -> Style
hover =
    pseudoClass "hover"


{-| An [`:in-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/:in-range)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    inRange
        [ backgroundColor (rgb 0 255 0)
        ]

-}
inRange : List Style -> Style
inRange =
    pseudoClass "in-range"


{-| An [`:indeterminate`](https://developer.mozilla.org/en-US/docs/Web/CSS/:indeterminate)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    indeterminate
        [ backgroundColor (rgb 100 100 100)
        ]

-}
indeterminate : List Style -> Style
indeterminate =
    pseudoClass "indeterminate"


{-| An [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    invalid
        [ color (rgb 255 0 0)
        , fontWeight bold
        ]

-}
invalid : List Style -> Style
invalid =
    pseudoClass "invalid"


{-| A [`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    lastChild
        [ backgroundColor (rgb 0 0 255)
        ]

-}
lastChild : List Style -> Style
lastChild =
    pseudoClass "last-child"


{-| A [`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    lastOfType
        [ color (rgb 100 100 100)
        ]

-}
lastOfType : List Style -> Style
lastOfType =
    pseudoClass "last-of-type"


{-| A [`:link`](https://developer.mozilla.org/en-US/docs/Web/CSS/:link)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    link
        [ color (rgb 0 0 255)
        ]

-}
link : List Style -> Style
link =
    pseudoClass "link"


{-| An [`:only-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-child)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    onlyChild
        [ backgroundColor (rgb 255 255 255)
        ]

-}
onlyChild : List Style -> Style
onlyChild =
    pseudoClass "only-child"


{-| An [`:only-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-of-type)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    onlyOfType
        [ color (rgb 255 0 0)
        , fontStyle italic
        ]

-}
onlyOfType : List Style -> Style
onlyOfType =
    pseudoClass "only-of-type"


{-| An [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    outOfRange
        [ color (rgb 255 0 0)
        ]

-}
outOfRange : List Style -> Style
outOfRange =
    pseudoClass "out-of-range"


{-| A [`:read-only`](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    readOnly
        [ color (rgb 50 50 50)
        ]

-}
readOnly : List Style -> Style
readOnly =
    pseudoClass "read-only"


{-| Sets [`margin-block`](https://css-tricks.com/almanac/properties/m/margin-block/) property.
The `margin-block` property is a shorthand property for setting `margin-block-start` and
`margin-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start margin is set to the first value and the block end margin
is set to the second.

    marginBlock (em 4) -- set both block margins to 4em

    marginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginBlock :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBlock (Value value) =
    AppendProperty ("margin-block:" ++ value)


{-| Sets [`margin-block`](https://css-tricks.com/almanac/properties/m/margin-block/) property.
The `margin-block` property is a shorthand property for setting `margin-block-start` and
`margin-block-end` in a single declaration.

The block start margin is set to the first value and the block end margin
is set to the second.

    marginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginBlock2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
marginBlock2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("margin-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start) property.

    marginBlockStart (px 4)

-}
marginBlockStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBlockStart (Value value) =
    AppendProperty ("margin-block-start:" ++ value)


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end) property.

    marginBlockEnd (px 4)

-}
marginBlockEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginBlockEnd (Value value) =
    AppendProperty ("margin-block-end:" ++ value)


{-| Sets [`margin-inline`](https://css-tricks.com/almanac/properties/m/margin-inline/) property.
The `margin-inline` property is a shorthand property for setting `margin-inline-start` and
`margin-inline-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start margin is set to the first value and the inline end margin
is set to the second.

    marginInline (em 4) -- set both inline margins to 4em

    marginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginInline :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginInline (Value value) =
    AppendProperty ("margin-inline:" ++ value)


{-| Sets [`margin-inline`](https://css-tricks.com/almanac/properties/m/margin-inline/) property.
The `margin-inline` property is a shorthand property for setting `margin-inline-start` and
`margin-inline-end` in a single declaration.

The inline start margin is set to the first value and the inline end margin
is set to the second.

    marginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

You may want to check out [this article on collapsing margins](https://css-tricks.com/good-ol-margin-collapsing/)!

-}
marginInline2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
marginInline2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("margin-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start) property.

    marginInlineStart (px 4)

-}
marginInlineStart :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginInlineStart (Value value) =
    AppendProperty ("margin-inline-start:" ++ value)


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end) property.

    marginInlineEnd (px 4)

-}
marginInlineEnd :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    -> Style
marginInlineEnd (Value value) =
    AppendProperty ("margin-inline-end:" ++ value)


{-| A [`:read-write`](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-write)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    readWrite
        [ backgroundColor (rgb 0 50 150)
        ]

-}
readWrite : List Style -> Style
readWrite =
    pseudoClass "read-write"


{-| A [`:required`](https://developer.mozilla.org/en-US/docs/Web/CSS/:required)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    required
        [ border (px 2) solid (rgb 100 100 100)
        ]

-}
required : List Style -> Style
required =
    pseudoClass "required"


{-| A [`:root`](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    root
        [ backgroundColor (rgb 0 200 200)
        ]

-}
root : List Style -> Style
root =
    pseudoClass "root"


{-| A [`:scope`](https://developer.mozilla.org/en-US/docs/Web/CSS/:scope)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    scope
        [ backgroundColor (rgb 0 200 200)
        ]

-}
scope : List Style -> Style
scope =
    pseudoClass "scope"


{-| A [`:target`](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    target
        [ fontWeight bold
        , border3 (px 2) dotted (rgb 255 0 0)
        ]

-}
target : List Style -> Style
target =
    pseudoClass "target"


{-| A [`:valid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:valid)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    valid
        [ border3 (px 1) solid (rgb 0 255 0)
        ]

-}
valid : List Style -> Style
valid =
    pseudoClass "valid"


{-| A [`:visited`](https://developer.mozilla.org/en-US/docs/Web/CSS/:visited)
[pseudo-class](https://css-tricks.com/pseudo-class-selectors/).

    visited
        [ color (rgb 150 0 255)
        ]

-}
visited : List Style -> Style
visited =
    pseudoClass "visited"



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

--TODO : Introduce a way to do [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/content) - lots of options there, not just text. Also it's overloaded with `flexBasis content`.

-}
after : List Style -> Style
after =
    pseudoElement "after"


{-| A [`::before`](https://css-tricks.com/almanac/selectors/a/after-and-before/)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    div [ before [ content "hi!" ] ]

--TODO : Introduce a way to do [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/content) - lots of options there, not just text. Also it's overloaded with `flexBasis content`.

-}
before : List Style -> Style
before =
    pseudoElement "before"


{-| A [`::backdrop`](https://developer.mozilla.org/en-US/docs/Web/CSS/::backdrop)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    backdrop
        [ background (rgba 255 0 0 0.25)
        ]

-}
backdrop : List Style -> Style
backdrop =
    pseudoElement "backdrop"


{-| A [`::cue`](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    cue
        [ color (rgba 255 255 0 1)
        , fontWeight (int 600)
        ]

-}
cue : List Style -> Style
cue =
    pseudoElement "cue"


{-| A [`::marker`](https://developer.mozilla.org/en-US/docs/Web/CSS/::marker)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    marker
        [ color (rgba 255 255 0 1)
        , fontWeight (int 600)
        ]

-}
marker : List Style -> Style
marker =
    pseudoElement "marker"


{-| A [`::placeholder`](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

Be careful when using placeholders as they can negatively impact accessibility.

    placeholder
        [ opacity (num 1) <| important
        , color (rgb 90 90 90)
        , fontWeight (int 400)
        ]

]

-}
placeholder : List Style -> Style
placeholder =
    pseudoElement "placeholder"


{-| A [`::selection`](https://developer.mozilla.org/en-US/docs/Web/CSS/::selection)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).

    selection
        [ backgroundColor (rgb 200 140 15)
        ]

-}
selection : List Style -> Style
selection =
    pseudoElement "selection"



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


{-| [`Q`](https://developer.mozilla.org/en-US/docs/Web/CSS/length) length units.

    borderWidth (q 2.5)

-}
q : Float -> Value { provides | q : Supported }
q value =
    Value (String.fromFloat value ++ "Q")


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
            (LengthSupported
                { pct : Supported
                }
            )
    , offsetY :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , blurRadius :
        Maybe
            (Value
                (LengthSupported
                    { pct : Supported
                    }
                )
            )
    , spreadRadius :
        Maybe
            (Value
                (LengthSupported
                    { pct : Supported
                    }
                )
            )
    , color :
        Maybe (Value Color)
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


{-| The [`box-shadow`](https://css-tricks.com/almanac/properties/b/box-shadow/) property.

    boxShadow initial

    boxShadow none

For defining shadows look at [`boxShadows`](#boxShadows).

-}
boxShadow : BaseValue { none : Supported } -> Style
boxShadow (Value val) =
    AppendProperty ("box-shadow:" ++ val)


{-| Sets [`box-shadow`](https://css-tricks.com/almanac/properties/b/box-shadow/).

    boxShadows [] -- "box-shadow: none"

    -- "box-shadow: 3px 5px #aabbcc"
    button
        [ css
            [ boxShadows
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
boxShadows : List BoxShadowConfig -> Style
boxShadows configs =
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
                    case config.spreadRadius of
                        Just _ ->
                            " 0"

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



-- TEXT SHADOW --


{-| Configuration for [`textShadow`](#textShadow).
-}
type alias TextShadowConfig =
    { offsetX :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , offsetY :
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    , blurRadius :
        Maybe
            (Value
                (LengthSupported
                    { pct : Supported
                    }
                )
            )
    , color : Maybe (Value Color)
    }


{-| Default [`textShadow`](#textShadow) configuration.

It is equivalent to the following CSS:

    text-shadow: 0 0;

-}
defaultTextShadow : TextShadowConfig
defaultTextShadow =
    { offsetX = zero
    , offsetY = zero
    , blurRadius = Nothing
    , color = Nothing
    }


{-| Sets [`text-shadow`](https://css-tricks.com/almanac/properties/t/text-shadow/).

    textShadow [] -- "text-shadow: none"

    -- "text-shadow: 3px 5px #aabbcc"
    span
        [ css
            [ textShadow
                [ { defaultTextShadow
                    | offsetX = px 3
                    , offsetY = px 5
                    , color = Just (hex "#aabbcc")
                  }
                ]
            ]
        ]
        [ text "Zap!" ]

-}
textShadow : List TextShadowConfig -> Style
textShadow configs =
    let
        values =
            case configs of
                [] ->
                    "none"

                _ ->
                    configs
                        |> List.map textShadowConfigToString
                        |> String.join ","
    in
    AppendProperty ("text-shadow:" ++ values)


textShadowConfigToString : TextShadowConfig -> String
textShadowConfigToString config =
    let
        offsetX =
            unpackValue config.offsetX

        offsetY =
            unpackValue config.offsetY

        blurRadius =
            config.blurRadius
                |> Maybe.map (unpackValue >> (++) " ")
                |> Maybe.withDefault ""

        colorSetting =
            config.color
                |> Maybe.map (unpackValue >> (++) " ")
                |> Maybe.withDefault ""
    in
    offsetX ++ " " ++ offsetY ++ blurRadius ++ colorSetting



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
        (LengthSupported
            { pct : Supported
            , num : Supported
            , int : Supported
            }
        )
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
        (LengthSupported
            { pct : Supported
            , num : Supported
            , int : Supported
            }
        )
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
        (LengthSupported
            { pct : Supported
            , num : Supported
            , int : Supported
            }
        )
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
    CalcOperation (" * " ++ getCalcExpression second)


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
    CalcOperation (" / " ++ getCalcExpression second)



-- DISPLAY --


{-| Sets [`display`](https://css-tricks.com/almanac/properties/d/display/).

    display block

**Note:** This function accepts `flex_` rather than `flex` because [`flex` is already a function](#flex).

-}
display :
    BaseValue
        { block : Supported
        , flex_ : Supported
        , flow : Supported
        , flowRoot : Supported
        , grid : Supported
        , listItem : Supported
        , inline : Supported
        , inlineBlock : Supported
        , inlineFlex : Supported
        , inlineGrid : Supported
        , inlineTable : Supported
        , none : Supported
        , contents : Supported
        , ruby : Supported
        , rubyBase : Supported
        , rubyBaseContainer : Supported
        , rubyText : Supported
        , rubyTextContainer : Supported
        , runIn : Supported
        , table : Supported
        , tableCaption : Supported
        , tableCell : Supported
        , tableColumn : Supported
        , tableColumnGroup : Supported
        , tableFooterGroup : Supported
        , tableHeaderGroup : Supported
        , tableRow : Supported
        , tableRowGroup : Supported
        }
    -> Style
display (Value val) =
    AppendProperty ("display:" ++ val)


{-| Sets [`display`](https://css-tricks.com/almanac/properties/d/display/).

    display2 block flex_

**Note:** This function accepts `flex_` rather than `flex` because [`flex` is already a function](#flex).
For `display: inline list-item` and similar property values that include `list-item`
look at [`displayListItem2`](#displayListItem2) and [`displayListItem3`](#displayListItem3).

-}
display2 :
    Value
        { block : Supported
        , inline : Supported
        , runIn : Supported
        }
    ->
        Value
            { flow : Supported
            , flowRoot : Supported
            , table : Supported
            , flex_ : Supported
            , grid : Supported
            , ruby : Supported
            }
    -> Style
display2 (Value displayOutside) (Value displayInside) =
    AppendProperty ("display:" ++ displayOutside ++ " " ++ displayInside)


{-| The [`display`](https://css-tricks.com/almanac/properties/d/display/) property.
This function is used to generate complex `display: list-item` properties
such as `display: block list-item`.

    displayListItem2 block

-}
displayListItem2 :
    Value
        { block : Supported
        , inline : Supported
        , runIn : Supported
        , flow : Supported
        , flowRoot : Supported
        }
    -> Style
displayListItem2 (Value val) =
    AppendProperty ("display:list-item " ++ val)


{-| The [`display`](https://css-tricks.com/almanac/properties/d/display/) property.
This function is used to generate complex `display: list-item` properties
such as `display: block flow-root list-item`.

    displayListItem3 block flowRoot

-}
displayListItem3 :
    Value
        { block : Supported
        , inline : Supported
        , runIn : Supported
        }
    ->
        Value
            { flow : Supported
            , flowRoot : Supported
            }
    -> Style
displayListItem3 (Value displayOutside) (Value displayFlow) =
    AppendProperty ("display:list-item " ++ displayOutside ++ " " ++ displayFlow)


{-| The `flex` value used by [`display`](#display).

    display flex_

The value is called `flex_` instead of `flex` because [`flex` is already a function](#flex).

-}
flex_ : Value { provides | flex_ : Supported }
flex_ =
    Value "flex"


{-| The `flow` value used by [`display`](#display).

    display flow

-}
flow : Value { provides | flow : Supported }
flow =
    Value "flow"


{-| The `flow-root` value used by [`display`](#display).

    display flowRoot

-}
flowRoot : Value { provides | flowRoot : Supported }
flowRoot =
    Value "flow-root"


{-| The `grid` value used by [`display`](#display).

    display grid

-}
grid : Value { provides | grid : Supported }
grid =
    Value "grid"


{-| The `contents` value used by [`display`](#display).

    display contents

-}
contents : Value { provides | contents : Supported }
contents =
    Value "contents"


{-| The `inline-block` value used by [`display`](#display).

    display inlineBlock

-}
inlineBlock : Value { provides | inlineBlock : Supported }
inlineBlock =
    Value "inline-block"


{-| The `inline-flex` value used by [`display`](#display).

    display inlineFlex

-}
inlineFlex : Value { provides | inlineFlex : Supported }
inlineFlex =
    Value "inline-flex"


{-| The `list-item` value used by [`display`](#display).

    display listItem

-}
listItem : Value { provides | listItem : Supported }
listItem =
    Value "list-item"


{-| The `inline-table` value used by [`display`](#display).

    display inlineTable

-}
inlineTable : Value { provides | inlineTable : Supported }
inlineTable =
    Value "inline-table"


{-| The `inline-grid` value used by [`display`](#display).

    display inlineGrid

-}
inlineGrid : Value { provides | inlineGrid : Supported }
inlineGrid =
    Value "inline-grid"


{-| The `ruby-base` value used by [`display`](#display).

    display rubyBase

-}
rubyBase : Value { provides | rubyBase : Supported }
rubyBase =
    Value "ruby-base"


{-| The `ruby-base-container` value used by [`display`](#display).

    display rubyBaseContainer

-}
rubyBaseContainer : Value { provides | rubyBaseContainer : Supported }
rubyBaseContainer =
    Value "ruby-base-container"


{-| The `ruby-text` value used by [`display`](#display).

    display rubyText

-}
rubyText : Value { provides | rubyText : Supported }
rubyText =
    Value "ruby-text"


{-| The `ruby-text-container` value used by [`display`](#display).

    display rubyTextContainer

-}
rubyTextContainer : Value { provides | rubyTextContainer : Supported }
rubyTextContainer =
    Value "ruby-text-container"


{-| The `run-in` value used by [`display`](#display).

    display runIn

-}
runIn : Value { provides | runIn : Supported }
runIn =
    Value "run-in"


{-| The `table` value used by [`display`](#display).

    display table

-}
table : Value { provides | table : Supported }
table =
    Value "table"


{-| The `table-caption` value used by [`display`](#display).

    display tableCaption

-}
tableCaption : Value { provides | tableCaption : Supported }
tableCaption =
    Value "table-caption"


{-| The `table-cell` value used by [`display`](#display).

    display tableCell

-}
tableCell : Value { provides | tableCell : Supported }
tableCell =
    Value "table-cell"


{-| The `table-column` value used by [`display`](#display).

    display tableColumn

-}
tableColumn : Value { provides | tableColumn : Supported }
tableColumn =
    Value "table-column"


{-| The `table-column-group` value used by [`display`](#display).

    display tableColumnGroup

-}
tableColumnGroup : Value { provides | tableColumnGroup : Supported }
tableColumnGroup =
    Value "table-column-group"


{-| The `table-footer-group` value used by [`display`](#display).

    display tableFooterGroup

-}
tableFooterGroup : Value { provides | tableFooterGroup : Supported }
tableFooterGroup =
    Value "table-footer-group"


{-| The `table-header-group` value used by [`display`](#display).

    display tableHeaderGroup

-}
tableHeaderGroup : Value { provides | tableHeaderGroup : Supported }
tableHeaderGroup =
    Value "table-header-group"


{-| The `table-row` value used by [`display`](#display).

    display tableRow

-}
tableRow : Value { provides | tableRow : Supported }
tableRow =
    Value "table-row"


{-| The `table-row-group` value used by [`display`](#display).

    display tableRowGroup

-}
tableRowGroup : Value { provides | tableRowGroup : Supported }
tableRowGroup =
    Value "table-row-group"



-- ALIGN-ITEMS VALUES --


{-| The `flex-start` value used by [`alignItems`](#alignItems),
[`justifyContent`](#justifyContent),
and [`alignContent`](#alignContent).

    alignItems flexStart

    justifyContent flexStart

    alignContent flexStart

-}
flexStart : Value { provides | flexStart : Supported }
flexStart =
    Value "flex-start"


{-| The `flex-end` value used by [`alignItems`](#alignItems),
[`justifyContent`](#justifyContent),
and [`alignContent`](#alignContent).

    alignItems flexEnd

    justifyContent flexEnd

    alignContent flexEnd

-}
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


{-| The `space-between` value used by [`justifyContent`](#justifyContent)
and [`alignContent`](#alignContent).

    justifyContent spaceBetween

    alignContent spaceBetween

-}
spaceBetween : Value { provides | spaceBetween : Supported }
spaceBetween =
    Value "space-between"


{-| The `space-around` value used by [`justifyContent`](#justifyContent)
and [`alignContent`](#alignContent).

    justifyContent spaceAround

    alignContent spaceAround

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


{-| The `first baseline` value used for properties such as [`alignContent`](#alignContent),
[`alignItems`](#alignItems),
and [`alignSelf`](#alignSelf).

    alignItems firstBaseline

-}
firstBaseline : Value { provides | firstBaseline : Supported }
firstBaseline =
    Value "first baseline"


{-| The `last baseline` value used for properties such as [`alignContent`](#alignContent),
[`alignItems`](#alignItems),
and [`alignSelf`](#alignSelf).

    alignItems lastBaseline

-}
lastBaseline : Value { provides | lastBaseline : Supported }
lastBaseline =
    Value "last baseline"


{-| The `safe` value used for properties such as [`alignContent2`](#alignContent2).

    alignContent2 safe center

-}
safe : Value { provides | safe : Supported }
safe =
    Value "safe"


{-| The `unsafe` value used for properties such as [`alignContent2`](#alignContent2).

    alignContent2 unsafe center

-}
unsafe : Value { provides | unsafe : Supported }
unsafe =
    Value "unsafe"


{-| The `legacy` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacy

-}
legacy : Value { provides | legacy : Supported }
legacy =
    Value "legacy"


{-| The `legacy left` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacyLeft

-}
legacyLeft : Value { provides | legacyLeft : Supported }
legacyLeft =
    Value "legacy left"


{-| The `legacy right` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacyRight

-}
legacyRight : Value { provides | legacyRight : Supported }
legacyRight =
    Value "legacy right"


{-| The `legacy center` value used for properties such as [`justifyItems`](#justifyItems).

    justifyItems legacyCenter

-}
legacyCenter : Value { provides | legacyCenter : Supported }
legacyCenter =
    Value "legacy center"



-- FLEXBOX --


{-| Sets [`align-content`](https://css-tricks.com/almanac/properties/a/align-content/).

    alignContent flexStart

**Note:** This property has no effect when the flexbox has only a single line.

-}
alignContent :
    BaseValue
        { normal : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        }
    -> Style
alignContent (Value val) =
    AppendProperty ("align-content:" ++ val)


{-| Sets [`align-content`](https://css-tricks.com/almanac/properties/a/align-content/).

    alignContent2 unsafe start

**Note:** This property has no effect when the flexbox has only a single line.

-}
alignContent2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            }
    -> Style
alignContent2 (Value overflowPosition) (Value contentPosition) =
    AppendProperty ("align-content:" ++ overflowPosition ++ " " ++ contentPosition)


{-| Sets [`align-items`](https://css-tricks.com/almanac/properties/a/align-items/).

    alignItems firstBaseline

-}
alignItems :
    BaseValue
        { normal : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        }
    -> Style
alignItems (Value val) =
    AppendProperty ("align-items:" ++ val)


{-| Sets [`align-items`](https://css-tricks.com/almanac/properties/a/align-items/).

    alignItems2 unsafe selfStart

-}
alignItems2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            }
    -> Style
alignItems2 (Value overflowPosition) (Value selfPosition) =
    AppendProperty ("align-items:" ++ overflowPosition ++ " " ++ selfPosition)


{-| Sets [`align-self`](https://css-tricks.com/almanac/properties/a/align-self/).

    alignSelf firstBaseline

-}
alignSelf :
    BaseValue
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        }
    -> Style
alignSelf (Value val) =
    AppendProperty ("align-self:" ++ val)


{-| Sets [`align-self`](https://css-tricks.com/almanac/properties/a/align-self/).

    alignSelf2 unsafe flexStart

-}
alignSelf2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            }
    -> Style
alignSelf2 (Value overflowPosition) (Value selfPosition) =
    AppendProperty ("align-self:" ++ overflowPosition ++ " " ++ selfPosition)


{-| Sets [`justify-content`](https://css-tricks.com/almanac/properties/j/justify-content/).

    justifyContent flexStart

**Note:** This function takes [`left_`](#left_) and [`right_`](#right_) values.

-}
justifyContent :
    BaseValue
        { normal : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
justifyContent (Value val) =
    AppendProperty ("justify-content:" ++ val)


{-| Sets [`justify-content`](https://css-tricks.com/almanac/properties/j/justify-content/).

    justifyContent2 safe flexStart

**Note:** This function takes [`left_`](#left_) and [`right_`](#right_) values.

-}
justifyContent2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
justifyContent2 (Value overflowPosition) (Value contentPosition) =
    AppendProperty ("justify-content:" ++ overflowPosition ++ " " ++ contentPosition)


{-| The [`justify-items`](https://css-tricks.com/almanac/properties/j/justify-items/) property.

    justifyItems center

-}
justifyItems :
    BaseValue
        { normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , left_ : Supported
        , right_ : Supported
        , legacy : Supported
        , legacyLeft : Supported
        , legacyRight : Supported
        , legacyCenter : Supported
        }
    -> Style
justifyItems (Value val) =
    AppendProperty ("justify-items:" ++ val)


{-| The [`justify-items`](https://css-tricks.com/almanac/properties/j/justify-items/) property.

    justifyItems2 unsafe right_

-}
justifyItems2 :
    Value
        { safe : Supported
        , unsafe : Supported
        }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
justifyItems2 (Value overflowPosition) (Value selfPosition) =
    AppendProperty ("justify-items:" ++ overflowPosition ++ " " ++ selfPosition)


{-| The [`justify-self`](https://css-tricks.com/almanac/properties/j/justify-self/) property.

    jusitfySelf left_

**Note:** This function takes [`left_`](#left_) and [`right_`](#right_) values.

-}
justifySelf :
    BaseValue
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
justifySelf (Value val) =
    AppendProperty ("justify-self:" ++ val)


{-| The [`justify-self`](https://css-tricks.com/almanac/properties/j/justify-self/) property.

    justifySelf2 unsafe left_

**Note:** This function takes [`left_`](#left_) and [`right_`](#right_) values.

-}
justifySelf2 :
    Value { safe : Supported, unsafe : Supported }
    ->
        Value
            { center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
justifySelf2 (Value overflowPosition) (Value contentPosition) =
    AppendProperty ("justify-self:" ++ overflowPosition ++ " " ++ contentPosition)


{-| The [`place-content`](https://css-tricks.com/almanac/properties/p/place-content) property.

`placeContent` is a shorthand for the [`alignContent`](#alignContent) and
[`justifyContent`](#justifyContent) properties in a single declaration.

This one-argument version only accepts global values.

    placeContent inherit

    placeContent2 flexStart flexEnd

-}
placeContent :
    BaseValue {}
    -> Style
placeContent (Value value) =
    AppendProperty ("place-content:" ++ value)


{-| The [`place-content`](https://css-tricks.com/almanac/properties/p/place-content) property.

`placeContent` is a shorthand for the [`alignContent`](#alignContent) and
[`justifyContent`](#justifyContent) properties in a single declaration.

This two-argumant version accepts `alignContent` and `justifyContent` values.

    placeContent inherit

    placeContent2 flexStart flexEnd

-}
placeContent2 :
    Value
        { normal : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , spaceBetween : Supported
        , spaceAround : Supported
        , spaceEvenly : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        }
    ->
        Value
            { normal : Supported
            , spaceBetween : Supported
            , spaceAround : Supported
            , spaceEvenly : Supported
            , stretch : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
placeContent2 (Value alignContentValue) (Value justifyContentValue) =
    AppendProperty ("place-content:" ++ alignContentValue ++ " " ++ justifyContentValue)


{-| The [`place-items`](https://css-tricks.com/almanac/properties/p/place-items) property.

`placeItems` is a shorthand for the [`alignItems`](#alignItems) and
[`justifyItems`](#justifyItems) properties in a single declaration.

This one-argument version only accepts global values.

    placeItems inherit

    placeItems2 center selfEnd

-}
placeItems :
    BaseValue {}
    -> Style
placeItems (Value value) =
    AppendProperty ("place-items:" ++ value)


{-| The [`place-items`](https://css-tricks.com/almanac/properties/p/place-items) property.

`placeItems` is a shorthand for the [`alignItems`](#alignItems) and
[`justifyItems`](#justifyItems) properties in a single declaration.

This one-argument version only accepts global values.

    placeItems inherit

    placeItems2 center selfEnd

-}
placeItems2 :
    Value
        { normal : Supported
        , stretch : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        }
    ->
        Value
            { normal : Supported
            , stretch : Supported
            , baseline : Supported
            , firstBaseline : Supported
            , lastBaseline : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            , legacy : Supported
            , legacyLeft : Supported
            , legacyRight : Supported
            , legacyCenter : Supported
            }
    -> Style
placeItems2 (Value alignItemsValue) (Value justifyItemsValue) =
    AppendProperty ("place-items:" ++ alignItemsValue ++ " " ++ justifyItemsValue)


{-| The [`place-self`](https://css-tricks.com/almanac/properties/p/place-self) property.

`placeSelf` is a shorthand for the [`alignSelf`](#alignSelf) and
[`justifySelf`](#justifySelf) properties in a single declaration.

This one-argument version only accepts global values.

    placeSelf inherit

    placeSelf2 flexStart flexEnd

-}
placeSelf :
    BaseValue {}
    -> Style
placeSelf (Value value) =
    AppendProperty ("place-self:" ++ value)


{-| The [`place-self`](https://css-tricks.com/almanac/properties/p/place-self) property.

`placeSelf` is a shorthand for the [`alignSelf`](#alignSelf) and
[`justifySelf`](#justifySelf) properties in a single declaration.

This one-argument version only accepts global values.

    placeSelf inherit

    placeSelf2 flexStart flexEnd

-}
placeSelf2 :
    Value
        { auto : Supported
        , normal : Supported
        , stretch : Supported
        , baseline : Supported
        , firstBaseline : Supported
        , lastBaseline : Supported
        , center : Supported
        , start : Supported
        , end : Supported
        , flexStart : Supported
        , flexEnd : Supported
        , selfStart : Supported
        , selfEnd : Supported
        }
    ->
        Value
            { auto : Supported
            , normal : Supported
            , stretch : Supported
            , baseline : Supported
            , firstBaseline : Supported
            , lastBaseline : Supported
            , center : Supported
            , start : Supported
            , end : Supported
            , flexStart : Supported
            , flexEnd : Supported
            , selfStart : Supported
            , selfEnd : Supported
            , left_ : Supported
            , right_ : Supported
            }
    -> Style
placeSelf2 (Value alignSelfValue) (Value justifySelfValue) =
    AppendProperty ("place-self:" ++ alignSelfValue ++ " " ++ justifySelfValue)


{-| Sets [`flex-basis`](https://css-tricks.com/almanac/properties/f/flex-basis/).

    flexBasis (em 10)

    flexBasis (px 3)

    flexBasis (pct 100)

    flexBasis auto

-}
flexBasis : BaseValue (WidthSupported { content : Supported }) -> Style
flexBasis (Value val) =
    AppendProperty ("flex-basis:" ++ val)


{-| Sets [`flex-grow`](https://css-tricks.com/almanac/properties/f/flex-grow/).

    flexGrow (num 3)

    flexGrow (num 0.6)

-}
flexGrow :
    BaseValue
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
flexGrow (Value val) =
    AppendProperty ("flex-grow:" ++ val)


{-| Sets [`flex-shrink`](https://css-tricks.com/almanac/properties/f/flex-shrink/).

    flexShrink (num 2)

    flexShrink (num 0.6)

-}
flexShrink :
    BaseValue
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
flexShrink (Value val) =
    AppendProperty ("flex-shrink:" ++ val)


{-| The [`flex`](https://css-tricks.com/almanac/properties/f/flex/) shorthand property.

    flex none

    flex auto

    flex (num 1)

-}
flex :
    BaseValue
        (WidthSupported
            { none : Supported
            , content : Supported
            , num : Supported
            }
        )
    -> Style
flex (Value growOrBasis) =
    AppendProperty ("flex:" ++ growOrBasis)


{-| The [`flex`](https://css-tricks.com/almanac/properties/f/flex/) shorthand property.

    flex2 zero auto

-}
flex2 :
    Value
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            (WidthSupported
                { content : Supported
                , num : Supported
                }
            )
    -> Style
flex2 (Value grow) (Value shrinkOrBasis) =
    AppendProperty ("flex:" ++ grow ++ " " ++ shrinkOrBasis)


{-| The [`flex`](https://css-tricks.com/almanac/properties/f/flex/) shorthand property.

    flex3 (num 1) zero (pct 50)

-}
flex3 :
    Value
        { num : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        Value
            { num : Supported
            , zero : Supported
            , calc : Supported
            }
    -> Value (WidthSupported { content : Supported })
    -> Style
flex3 (Value grow) (Value shrink) (Value basis) =
    AppendProperty ("flex:" ++ grow ++ " " ++ shrink ++ " " ++ basis)


{-| Sets [`flex-direction`](https://css-tricks.com/almanac/properties/f/flex-direction/).

    flexDirection column

-}
flexDirection :
    BaseValue
        { row : Supported
        , rowReverse : Supported
        , column : Supported
        , columnReverse : Supported
        }
    -> Style
flexDirection (Value val) =
    AppendProperty ("flex-direction:" ++ val)


{-| The `row` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection row

-}
row : Value { provides | row : Supported }
row =
    Value "row"


{-| The `row-reverse` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection rowReverse

-}
rowReverse : Value { provides | rowReverse : Supported }
rowReverse =
    Value "row-reverse"


{-| The `column` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection column

-}
column : Value { provides | column : Supported }
column =
    Value "column"


{-| The `column-reverse` [`flex-direction` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values).

    flexDirection columnReverse

-}
columnReverse : Value { provides | columnReverse : Supported }
columnReverse =
    Value "column-reverse"


{-| Sets [`flex-wrap`](https://css-tricks.com/almanac/properties/f/flex-wrap/).

    flexWrap wrap

    flexWrap wrapReverse

    flexWrap nowrap

-}
flexWrap :
    BaseValue
        { nowrap : Supported
        , wrap : Supported
        , wrapReverse : Supported
        }
    -> Style
flexWrap (Value val) =
    AppendProperty ("flex-wrap:" ++ val)


{-| The `wrap` [`flex-wrap` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values).

    flexWrap wrap

-}
wrap : Value { provides | wrap : Supported }
wrap =
    Value "wrap"


{-| The `wrap-reverse` [`flex-wrap` value](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values).

    flexWrap wrapReverse

-}
wrapReverse : Value { provides | wrapReverse : Supported }
wrapReverse =
    Value "wrap-reverse"


{-| The [`flex-flow`](https://css-tricks.com/almanac/properties/f/flex-flow/) shorthand property.

    flexFlow rowReverse

    flexFlow wrap

    flexFlow inherit

    flexFlow2 column wrapReverse

-}
flexFlow :
    BaseValue
        { row : Supported
        , rowReverse : Supported
        , column : Supported
        , columnReverse : Supported
        , nowrap : Supported
        , wrap : Supported
        , wrapReverse : Supported
        }
    -> Style
flexFlow (Value directionOrWrapping) =
    AppendProperty ("flex-flow:" ++ directionOrWrapping)


{-| The [`flex-flow`](https://css-tricks.com/almanac/properties/f/flex-flow/) shorthand property.

    flexFlow rowReverse

    flexFlow wrap

    flexFlow inherit

    flexFlow2 column wrapReverse

-}
flexFlow2 :
    Value
        { row : Supported
        , rowReverse : Supported
        , column : Supported
        , columnReverse : Supported
        }
    ->
        Value
            { nowrap : Supported
            , wrap : Supported
            , wrapReverse : Supported
            }
    -> Style
flexFlow2 (Value direction_) (Value wrapping) =
    AppendProperty ("flex-flow:" ++ direction_ ++ " " ++ wrapping)



-- FONT SIZE --


{-| Sets [`font-size`](https://css-tricks.com/almanac/properties/f/font-size/)

    fontSize xxSmall

    fontSize (px 12)

Check out [fluid typography](https://css-tricks.com/snippets/css/fluid-typography/) for some cool stuff you can do with this.

-}
fontSize :
    BaseValue
        (LengthSupported
            { xxSmall : Supported
            , xSmall : Supported
            , small : Supported
            , medium : Supported
            , large : Supported
            , xLarge : Supported
            , xxLarge : Supported
            , smaller : Supported
            , larger : Supported
            , pct : Supported
            }
        )
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
    BaseValue
        { serif : Supported
        , sansSerif : Supported
        , monospace : Supported
        , cursive : Supported
        , fantasy : Supported
        , systemUi : Supported
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
            enquoteString fontName


enquoteString : String -> String
enquoteString str =
    let
        escapeChars char rest =
            rest ++ escapeChar char

        escapeChar char =
            case char of
                '\n' ->
                    "\\A "

                '"' ->
                    "\\\""

                '\\' ->
                    "\\\\"

                _ ->
                    String.fromChar char
    in
    "\"" ++ String.foldl escapeChars "" str ++ "\""



-- FONT STYLES --


{-| Sets [`font-style`](https://css-tricks.com/almanac/properties/f/font-style/)

    fontStyle italic

-}
fontStyle :
    BaseValue
        { normal : Supported
        , italic : Supported
        , oblique : Supported
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



-- FONT FEATURE SETTINGS --


{-| Sets [`font-feature-settings`](https://css-tricks.com/almanac/properties/f/font-feature-settings/)

    fontFeatureSettings normal

    fontFeatureSettings (featureTag "liga")

    fontFeatureSettings (featureTag2 "swsh" 2)

-}
fontFeatureSettings :
    BaseValue
        { featureTag : Supported
        , normal : Supported
        }
    -> Style
fontFeatureSettings (Value val) =
    AppendProperty ("font-feature-settings:" ++ val)


{-| Sets [`font-feature-settings`](https://css-tricks.com/almanac/properties/f/font-feature-settings/)

    fontFeatureSettingsList featureTag "liga" [ featureTag2 "swsh" 2 ]

-}
fontFeatureSettingsList :
    Value { featureTag : Supported }
    -> List (Value { featureTag : Supported })
    -> Style
fontFeatureSettingsList head rest =
    AppendProperty ("font-feature-settings:" ++ hashListToString head rest)


{-| Creates a [feature-tag-value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#feature-tag-value)
for use with [`fontFeatureSettings`](#fontFeatureSettings)
and [`fontFeatureSettingsList`](#fontFeatureSettingsList)

    featureTag "smcp"

-}
featureTag : String -> Value { provides | featureTag : Supported }
featureTag =
    Value << enquoteString


{-| Creates a [feature-tag-value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#feature-tag-value)
with an specific value
for use with [`fontFeatureSettings`](#fontFeatureSettings)
and [`fontFeatureSettingsList`](#fontFeatureSettingsList)

    featureTag2 "swsh" 2

-}
featureTag2 : String -> Int -> Value { provides | featureTag : Supported }
featureTag2 tag value =
    Value (enquoteString tag ++ " " ++ String.fromInt value)



-- FONT WEIGHTS --


{-| Sets [`font-weight`](https://css-tricks.com/almanac/properties/f/font-weight/)

    fontWeight bold

    fontWeight (int 300)

-}
fontWeight :
    BaseValue
        { normal : Supported
        , bold : Supported
        , bolder : Supported
        , lighter : Supported
        , int : Supported
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
    BaseValue
        { normal : Supported
        , smallCaps : Supported
        , petiteCaps : Supported
        , allPetiteCaps : Supported
        , unicase : Supported
        , titlingCaps : Supported
        }
    -> Style
fontVariantCaps (Value str) =
    AppendProperty ("font-variant-caps:" ++ str)


{-| The `small-caps` value used in

  - [`fontVariantCaps`](#fontVariantCaps)
  - [`fontSynthesis`](#fontSynthesis)

```
fontVariantCaps smallCaps

fontSynthesis2 smallCaps style
```

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



-- FONT VARIANT EAST ASIAN --


{-| The [`font-variant-east-asian`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) property.

This property controls the use of alternative glyphs for East Asian scripts.

    fontVariantEastAsian normal

    fontVariantEastAsian2 ruby jis83

    fontVariantEastAsian3 ruby jis90 fullWidth

-}
fontVariantEastAsian :
    BaseValue
        { normal : Supported
        , ruby : Supported

        -- variant values
        , jis78 : Supported
        , jis83 : Supported
        , jis90 : Supported
        , jis04 : Supported
        , simplified : Supported
        , traditional : Supported

        -- width values
        , fullWidth : Supported
        , proportionalWidth : Supported
        }
    -> Style
fontVariantEastAsian (Value val) =
    AppendProperty ("font-variant-east-asian:" ++ val)


{-| The [`font-variant-east-asian`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) property.

This property controls the use of alternative glyphs for East Asian scripts.

    fontVariantEastAsian2 ruby jis83

-}
fontVariantEastAsian2 :
    Value
        { ruby : Supported
        , jis78 : Supported
        , jis83 : Supported
        , jis90 : Supported
        , jis04 : Supported
        , simplified : Supported
        , traditional : Supported
        , fullWidth : Supported
        , proportionalWidth : Supported
        }
    ->
        Value
            { ruby : Supported
            , jis78 : Supported
            , jis83 : Supported
            , jis90 : Supported
            , jis04 : Supported
            , simplified : Supported
            , traditional : Supported
            , fullWidth : Supported
            , proportionalWidth : Supported
            }
    -> Style
fontVariantEastAsian2 (Value val1) (Value val2) =
    AppendProperty ("font-variant-east-asian:" ++ val1 ++ " " ++ val2)


{-| The [`font-variant-east-asian`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) property.

This property controls the use of alternative glyphs for East Asian scripts.

    fontVariantEastAsian3 ruby jis90 fullWidth

-}
fontVariantEastAsian3 :
    Value
        { ruby : Supported
        }
    ->
        Value
            { jis78 : Supported
            , jis83 : Supported
            , jis90 : Supported
            , jis04 : Supported
            , simplified : Supported
            , traditional : Supported
            }
    ->
        Value
            { fullWidth : Supported
            , proportionalWidth : Supported
            }
    -> Style
fontVariantEastAsian3 (Value rubyVal) (Value variantVal) (Value widthVal) =
    AppendProperty ("font-variant-east-asian:" ++ rubyVal ++ " " ++ variantVal ++ " " ++ widthVal)


{-| Sets the [`jis78`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:1978 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis78

-}
jis78 : Value { provides | jis78 : Supported }
jis78 =
    Value "jis78"


{-| Sets the [`jis83`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:1983 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis83

-}
jis83 : Value { provides | jis83 : Supported }
jis83 =
    Value "jis83"


{-| Sets the [`jis90`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:1990 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis90

-}
jis90 : Value { provides | jis90 : Supported }
jis90 =
    Value "jis90"


{-| Sets the [`jis04`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that the JIS X 0208:2004 standard for East Asian logographic glyphs
should be used.

    fontVariantEastAsian jis04

-}
jis04 : Value { provides | jis04 : Supported }
jis04 =
    Value "jis04"


{-| Sets the [`simplified`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that no particular standard should be used for East Asian logographic glyphs
apart from them being simplified Chinese glyphs.

    fontVariantEastAsian simplified

-}
simplified : Value { provides | simplified : Supported }
simplified =
    Value "simplified"


{-| Sets the [`traditional`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This specifies that no particular standard should be used for East Asian logographic glyphs
apart from them being traditional Chinese glyphs.

    fontVariantEastAsian traditional

-}
traditional : Value { provides | traditional : Supported }
traditional =
    Value "traditional"


{-| Sets the [`proportional-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian#syntax) value for [`fontVariantEastAsian`](#fontVariantEastAsian).

This activates the East Asian characters that vary in width.

(As opposed to [`fullWidth`](#fullWidth), which specifies that they should roughly be the same width.)

    fontVariantEastAsian proportionalWidth

-}
proportionalWidth : Value { provides | proportionalWidth : Supported }
proportionalWidth =
    Value "proportional-width"



-- FONT VARIANT LIGATURES --


{-| Sets [`font-variant-ligatures`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures).

    fontVariantLigatures discretionaryLigatures

    fontVariantLigatures none

-}
fontVariantLigatures :
    BaseValue
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
    BaseValue
        { normal : Supported
        , ordinal : Supported
        , slashedZero : Supported
        , liningNums : Supported
        , oldstyleNums : Supported
        , proportionalNums : Supported
        , tabularNums : Supported
        , diagonalFractions : Supported
        , stackedFractions : Supported
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



-- FONT OPTICAL SIZING --


{-| The [`font-kerning`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning) property.

    fontKerning none

-}
fontKerning :
    BaseValue
        { none : Supported
        , auto : Supported
        , normal : Supported
        }
    -> Style
fontKerning (Value val) =
    AppendProperty ("font-kerning:" ++ val)


{-| The [`font-language-override`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-language-override) property.

    fontLanguageOverride normal

    fontLanguageOverride (string "ENG")

-}
fontLanguageOverride :
    BaseValue
        { normal : Supported
        , string : Supported
        }
    -> Style
fontLanguageOverride (Value val) =
    AppendProperty ("font-language-override:" ++ val)


{-| The [`font-synthesis`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis) property.

    fontSynthesis none

    fontSynthesis smallCaps

    fontSynthesis2 smallCaps weight

    fontSynthesis3 weight style smallCaps

-}
fontSynthesis :
    BaseValue
        { none : Supported
        , weight : Supported
        , style : Supported
        , smallCaps : Supported
        }
    -> Style
fontSynthesis (Value val) =
    AppendProperty ("font-synthesis:" ++ val)


{-| The [`font-synthesis`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis) property.

This is the two-argument variant, in which you can indicate
two different font properties to be synthesised by the browser.

    fontSynthesis2 smallCaps weight

-}
fontSynthesis2 :
    Value
        { weight : Supported
        , style : Supported
        , smallCaps : Supported
        }
    ->
        Value
            { weight : Supported
            , style : Supported
            , smallCaps : Supported
            }
    -> Style
fontSynthesis2 (Value val1) (Value val2) =
    AppendProperty ("font-synthesis:" ++ val1 ++ " " ++ val2)


{-| The [`font-synthesis`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis) property.

This is the three-argument variant, in which you can indicate
all three different font properties to be synthesised by the browser.

    fontSynthesis3 weight style smallCaps

-}
fontSynthesis3 :
    Value
        { weight : Supported
        , style : Supported
        , smallCaps : Supported
        }
    ->
        Value
            { weight : Supported
            , style : Supported
            , smallCaps : Supported
            }
    ->
        Value
            { weight : Supported
            , style : Supported
            , smallCaps : Supported
            }
    -> Style
fontSynthesis3 (Value val1) (Value val2) (Value val3) =
    AppendProperty ("font-synthesis:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| The `weight` value for the [`fontSynthesis`](#fontSynthesis) property.

    fontSynthesis weight

-}
weight : Value { provides | weight : Supported }
weight =
    Value "weight"


{-| The [`font-optical-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-optical-sizing) property.

    fontOpticalSizing none

-}
fontOpticalSizing :
    BaseValue
        { none : Supported
        , auto : Supported
        }
    -> Style
fontOpticalSizing (Value val) =
    AppendProperty ("font-optical-sizing:" ++ val)


{-| The [`font-variant-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-position) property.

    fontVariantPosition sub

    fontVariantPosition normal

-}
fontVariantPosition :
    BaseValue
        { normal : Supported
        , sub : Supported
        , super : Supported
        }
    -> Style
fontVariantPosition (Value val) =
    AppendProperty ("font-variant-position:" ++ val)



-- CURSOR --


{-| A type alias used for the various [`cursor`](#cursor) properties
-}
type alias CursorKeyword =
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
    }


{-| The [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.

    cursor notAllowed

-}
cursor : BaseValue CursorKeyword -> Style
cursor (Value val) =
    AppendProperty ("cursor:" ++ val)


{-| The [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.

    cursor2 (url "https://example.com") move

-}
cursor2 : Value { url : Supported } -> Value CursorKeyword -> Style
cursor2 (Value urlVal) (Value fallbackVal) =
    AppendProperty ("cursor:" ++ urlVal ++ "," ++ fallbackVal)


{-| The [`cursor`](https://css-tricks.com/almanac/properties/c/cursor/)
property.

    cursor4 (url "https://example.com") (num 34) zero move

-}
cursor4 :
    Value { url : Supported }
    ->
        Value
            { num : Supported
            , zero : Supported
            }
    ->
        Value
            { num : Supported
            , zero : Supported
            }
    -> Value CursorKeyword
    -> Style
cursor4 (Value urlVal) (Value xVal) (Value yVal) (Value fallbackVal) =
    AppendProperty
        ("cursor:"
            ++ urlVal
            ++ " "
            ++ xVal
            ++ " "
            ++ yVal
            ++ ","
            ++ fallbackVal
        )


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


{-| Sets [`background-attachment`](https://css-tricks.com/almanac/properties/b/background-attachment/).

    backgroundAttachment local

See [`backgroundAttachments`](#backgroundAttachments) to set more than one `background-attachment` value.

-}
backgroundAttachment :
    BaseValue
        { fixed : Supported
        , scroll : Supported
        , local : Supported
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
    AppendProperty ("background-attachment:" ++ hashListToString firstValue values)


{-| The `local` [`background-attachment` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)

    backgroundAttachment local

-}
local : Value { provides | local : Supported }
local =
    Value "local"


{-| Sets [`background-blend-mode`](https://css-tricks.com/almanac/properties/b/background-blend-mode/).
Note that this takes an argument of [`color_`](#color_), not [`color`](#color)!

    backgroundBlendMode color_

    backgroundBlendMode darken

    backgroundBlendMode colorBurn

See [`backgroundBlendModes`](#backgroundBlendModes) to set more than one `background-blend-mode` value.

-}
backgroundBlendMode :
    BaseValue
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
    AppendProperty ("background-blend-mode:" ++ hashListToString firstValue values)


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
Note that this takes an argument of [`text`](#text), not [`color`](#color)!

    backgroundClip text

    backgroundClip paddingBox

    backgroundClip contentBox

See [`backgroundClips`](#backgroundClips) to set more than one `background-clip` value.

-}
backgroundClip :
    BaseValue
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , text : Supported
        }
    -> Style
backgroundClip (Value str) =
    AppendProperty ("background-clip:" ++ str)


{-| Sets [`background-clip`](https://css-tricks.com/almanac/properties/b/background-clip/).
Note that this takes an argument of [`text`](#text), not [`color`](#color)!

    backgroundClips text [ borderBox, text ]

See [`backgroundClip`](#backgroundClip) to set a single `background-clip` value.

-}
backgroundClips :
    Value
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
        , text : Supported
        }
    ->
        List
            (Value
                { borderBox : Supported
                , paddingBox : Supported
                , contentBox : Supported
                , text : Supported
                }
            )
    -> Style
backgroundClips firstValue values =
    AppendProperty ("background-clip:" ++ hashListToString firstValue values)



-- BACKGROUND ORIGIN --


{-| Sets [`background-origin`](https://css-tricks.com/almanac/properties/b/background-origin/).

    backgroundOrigin paddingBox

    backgroundOrigin contentBox

See [`backgroundOrigins`](#backgroundOrigins) to set more than one `background-origin` value.

-}
backgroundOrigin :
    BaseValue
        { borderBox : Supported
        , paddingBox : Supported
        , contentBox : Supported
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
    AppendProperty ("background-origin:" ++ hashListToString firstValue values)


{-| Sets [`background-image`](https://css-tricks.com/almanac/properties/b/background-image/).

    backgroundImage (url "http://www.example.com/chicken.jpg")

    backgroundImage (linearGradient (stop red) (stop blue))

See also [`backgroundImages`](#backgroundImages) if you need multiple images.

-}
backgroundImage : BaseValue (ImageSupported { none : Supported }) -> Style
backgroundImage (Value value) =
    AppendProperty ("background-image:" ++ value)


{-| Sets [`background-image`](https://css-tricks.com/almanac/properties/b/background-image/) for multiple images.

    backgroundImages
        (linearGradient (stop red) (stop blue))
        [ url "http://www.example.com/chicken.jpg" ]

See also [`backgroundImage`](#backgroundImage) if you need only one.

-}
backgroundImages :
    Value Image
    -> List (Value Image)
    -> Style
backgroundImages head rest =
    AppendProperty ("background-image:" ++ hashListToString head rest)



-- BACKGROUND POSITION --


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition left_

    backgroundPosition (px 45)

`backgroundPosition` sets the horizontal direction. If you need the vertical
direction instead, use [`backgroundPosition2`](#backgroundPosition2) like this:

    backgroundPosition2 zero (px 45)

If you need to set the offsets from the right or bottom, use
[`backgroundPosition4`](#backgroundPosition4) like this:

    backgroundPosition4 right_ (px 20) bottom_ (pct 30)

-}
backgroundPosition :
    BaseValue
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , top_ : Supported
            , bottom_ : Supported
            , center : Supported
            }
        )
    -> Style
backgroundPosition (Value val) =
    AppendProperty ("background-position:" ++ val)


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition2 left_ top_

    backgroundPosition2 (px 45) (pct 50)

`backgroundPosition2` sets both the horizontal and vertical directions (in that
order, same as CSS.) If you need only the horizontal, you can use
[`backgroundPosition`](#backgroundPosition) instead:

    backgroundPosition left_

If you need to set the offsets from the right or bottom, use
[`backgroundPosition4`](#backgroundPosition4).

-}
backgroundPosition2 :
    Value
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , top_ : Supported
                , bottom_ : Supported
                , center : Supported
                }
            )
    -> Style
backgroundPosition2 (Value horiz) (Value vert) =
    AppendProperty ("background-position:" ++ horiz ++ " " ++ vert)


{-| Sets [`background-position`](https://css-tricks.com/almanac/properties/b/background-position/).

    backgroundPosition3 right_ (px 20) center

The three-argument form of background position sets one side to center and the
other to the specified offest. So the example above would position the background
image 20px from the right, and center it vertically.

-}
backgroundPosition3 :
    Value
        { left_ : Supported
        , right_ : Supported
        , top_ : Supported
        , bottom_ : Supported
        }
    -> Value (LengthSupported { pct : Supported })
    -> Value { center : Supported }
    -> Style
backgroundPosition3 (Value side) (Value amount) (Value centerVal) =
    AppendProperty
        ("background-position:"
            ++ side
            ++ " "
            ++ amount
            ++ " "
            ++ centerVal
        )


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
    -> Value (LengthSupported { pct : Supported })
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    -> Value (LengthSupported { pct : Supported })
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
    BaseValue
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round : Supported
        , noRepeat : Supported
        }
    -> Style
backgroundRepeat (Value repeatVal) =
    AppendProperty ("background-repeat:" ++ repeatVal)


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


{-| The `repeat` value for [background properties](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeat

    strokeRepeat repeat

-}
repeat : Value { provides | repeat : Supported }
repeat =
    Value "repeat"


{-| The `no-repeat` value for [background properties](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat noRepeat

    strokeRpeat noRepeat

-}
noRepeat : Value { provides | repeat : Supported }
noRepeat =
    Value "no-repeat"


{-| The `repeat-x` value for [repeating backgrounds](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeatX

    strokeRepeat repeatX

-}
repeatX : Value { provides | repeatX : Supported }
repeatX =
    Value "repeat-x"


{-| The `repeat-y` value for [repeating backgrounds](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat repeatY

    strokeRepeat repeatY

-}
repeatY : Value { provides | repeatY : Supported }
repeatY =
    Value "repeat-y"


{-| The `space` value for [repeating backgrounds](#backgroundRepeat)
and [`strokeRepeat`](#strokeRepeat).

    backgroundRepeat space

    strokeRepeat space

-}
space : Value { provides | space : Supported }
space =
    Value "space"


{-| The `round` value used for properties such as:

  - [repeating backgrounds](#backgroundRepeat)
  - [`strokeLinecap`](#strokeLinecap)
  - [`strokeRepeat`](#strokeRepeat)
  - [`strokeLinejoin`](#strokeLinejoin2)

```
    backgroundRepeat round

    strokeLineCap round

    strokeLinejoin2 miter round

    strokeRepeat round
```

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
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , cover : Supported
            , contain_ : Supported
            }
        )
    -> Style
backgroundSize (Value sizeVal) =
    AppendProperty ("background-size:" ++ sizeVal)


{-| Sets [`background-size`](https://css-tricks.com/almanac/properties/b/background-size/) for both width and height (in that order.)

    backgroundSize2 (px 300) (px 100)

    backgroundSize2 auto (px 400)

If you only want to set the width, use [`backgroundImage`](#backgroundImage) instead.

-}
backgroundSize2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
backgroundSize2 (Value widthVal) (Value heightVal) =
    AppendProperty ("background-size:" ++ widthVal ++ " " ++ heightVal)



{- GRADIENTS -}


{-| Produces [`linear-gradient()`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
values used by properties such as [`backgroundImage`](#backgroundImage),
and [`listStyleImage`](#listStyleImage)

    linearGradient (stop red) (stop blue) []

    linearGradient (stop red) (stop blue) [ stop green ]

-}
linearGradient :
    Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Value { provides | linearGradient : Supported }
linearGradient (Value firstStop) (Value secondStop) moreStops =
    let
        peeledStops =
            List.map unpackValue moreStops

        stops =
            String.join "," (firstStop :: secondStop :: peeledStops)
    in
    Value ("linear-gradient(" ++ stops ++ ")")


{-| Produces [`linear-gradient()`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient())
values used by properties such as [`backgroundImage`](#backgroundImage),
and [`listStyleImage`](#listStyleImage)

    linearGradient2 toTop (stop red) (stop blue) []

    linearGradient2 toTop (stop red) (stop blue) [ stop green ]

-}
linearGradient2 :
    Value
        (AngleSupported
            { toBottom : Supported
            , toBottomLeft : Supported
            , toBottomRight : Supported
            , toLeft : Supported
            , toRight : Supported
            , toTop : Supported
            , toTopLeft : Supported
            , toTopRight : Supported
            }
        )
    -> Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Value { provides | linearGradient : Supported }
linearGradient2 (Value angle) (Value firstStop) (Value secondStop) moreStops =
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
stop : Value Color -> Value { provides | colorStop : Supported }
stop (Value colorVal) =
    Value colorVal


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient toTop (stop2 red (px 20)) (stop blue) []

See also [`stop`](#stop) if you don't need to control the stop position.

-}
stop2 :
    Value Color
    -> Value (LengthSupported { pct : Supported })
    -> Value { provides | colorStop : Supported }
stop2 (Value colorVal) (Value positionVal) =
    Value (colorVal ++ " " ++ positionVal)


{-| Provides a stop for a [gradient](https://css-tricks.com/snippets/css/css-linear-gradient/).

    linearGradient (stop3 (hex "111") zero (pt 1)) (stop3 (hex "6454") (pt 2) (pct 45))

-}
stop3 :
    Value Color
    -> Value (LengthSupported { pct : Supported })
    -> Value (LengthSupported { pct : Supported })
    -> Value { provides | colorStop : Supported }
stop3 (Value colorVal) (Value positionStart) (Value positionEnd) =
    Value (colorVal ++ " " ++ positionStart ++ "," ++ positionEnd)


{-| Provides the [`to bottom` side angle](https://css-tricks.com/snippets/css/css-linear-gradient/) for gradients.

    linearGradient toBottom (stop red) (stop blue) []

If you want your gradient to go to a corner, use [`toBottomLeft`](#toBottomLeft) or [`toBottomRight`](#toBottomRight):

    linearGradient toBottomLeft (stop red) (stop blue) []

    linearGradient toBottomRight (stop red) (stop blue) []

-}
toBottom : Value { provides | toBottom : Supported }
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



-- LIST STYLE --


{-| A type alias used to accept a [list-style-type](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)
among other values.

**Note:** The [`symbols()`](https://developer.mozilla.org/en-US/docs/Web/CSS/symbols()) function is not supported.
Use [`property`](#property) instead.

-}
type alias ListStyleTypeSupported supported =
    { supported
        | customIdent : Supported
        , string : Supported
        , none : Supported
        , arabicIndic : Supported
        , armenian : Supported
        , bengali : Supported
        , cambodian : Supported
        , circle : Supported
        , cjkDecimal : Supported
        , cjkEarthlyBranch : Supported
        , cjkHeavenlyStem : Supported
        , cjkIdeographic : Supported
        , decimal : Supported
        , decimalLeadingZero : Supported
        , devanagari : Supported
        , disc : Supported
        , disclosureClosed : Supported
        , disclosureOpen : Supported
        , ethiopicNumeric : Supported
        , georgian : Supported
        , gujarati : Supported
        , gurmukhi : Supported
        , hebrew : Supported
        , hiragana : Supported
        , hiraganaIroha : Supported
        , japaneseFormal : Supported
        , japaneseInformal : Supported
        , kannada : Supported
        , katakana : Supported
        , katakanaIroha : Supported
        , khmer : Supported
        , koreanHangulFormal : Supported
        , koreanHanjaFormal : Supported
        , koreanHanjaInformal : Supported
        , lao : Supported
        , lowerAlpha : Supported
        , lowerArmenian : Supported
        , lowerGreek : Supported
        , lowerLatin : Supported
        , lowerRoman : Supported
        , malayalam : Supported
        , monogolian : Supported
        , myanmar : Supported
        , oriya : Supported
        , persian : Supported
        , simpChineseFormal : Supported
        , simpChineseInformal : Supported
        , square : Supported
        , tamil : Supported
        , telugu : Supported
        , thai : Supported
        , tibetan : Supported
        , tradChineseFormal : Supported
        , tradChineseInformal : Supported
        , upperAlpha : Supported
        , upperArmenian : Supported
        , upperLatin : Supported
        , upperRoman : Supported
    }


{-| A type alias used to accept a [list-style-type](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)
-}
type alias ListStyleType =
    ListStyleTypeSupported {}


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.

    listStyle lowerAlpha

    listStyle outside

    listStyle (url "https://example.com")

-}
listStyle :
    BaseValue
        (ListStyleTypeSupported
            (ImageSupported { inside : Supported, outside : Supported })
        )
    -> Style
listStyle (Value val) =
    AppendProperty ("list-style:" ++ val)


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.

    listStlye2 lowerAlpha inside

For other combinations of two values please use the dedicated functions:
[`listStyleType`](#listStyleType),
[`listStlyePosition`](#listStlyePosition),
and [`listStyleImage`](#listStyleImage)

-}
listStyle2 :
    Value ListStyleType
    -> Value { inside : Supported, outside : Supported }
    -> Style
listStyle2 (Value typeVal) (Value positionVal) =
    AppendProperty ("list-style:" ++ typeVal ++ " " ++ positionVal)


{-| The [`list-style`](https://css-tricks.com/almanac/properties/l/list-style/) shorthand property.

    listStyle3 arabic outside (url "https://example.com")

-}
listStyle3 :
    Value ListStyleType
    ->
        Value
            { inside : Supported
            , outside : Supported
            }
    -> Value (ImageSupported { none : Supported })
    -> Style
listStyle3 (Value typeVal) (Value positionVal) (Value imageVal) =
    AppendProperty ("list-style:" ++ typeVal ++ " " ++ positionVal ++ " " ++ imageVal)


{-| The [`list-style-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position) property

    listStylePosition inside

    listStylePosition outside

-}
listStylePosition :
    BaseValue
        { inside : Supported
        , outside : Supported
        }
    -> Style
listStylePosition (Value pos) =
    AppendProperty ("list-style-position:" ++ pos)


{-| The `inside` value used for properties such as [`list-style-position`](#listStylePosition),
and [`listStyle`](#listStyle).

    listStylePosition inside

-}
inside : Value { provides | inside : Supported }
inside =
    Value "inside"


{-| The `inside` value used for properties such as [`list-style-position`](#listStylePosition),
and [`listStyle`](#listStyle).

    listStylePosition outside

-}
outside : Value { provides | outside : Supported }
outside =
    Value "outside"


{-| The [`list-style-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type) property.

    listStyleType decimalLeadingZero

-}
listStyleType : BaseValue ListStyleType -> Style
listStyleType (Value val) =
    AppendProperty ("list-style-type:" ++ val)


{-| Produces an [`custom-ident`](https://developer.mozilla.org/en-US/docs/Web/CSS/custom-ident)
value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType (customIdent "hello-world")

**Note:** This method does not do any checking if the identifierer supplied is valid.

-}
customIdent : String -> Value { provides | customIdent : Supported }
customIdent =
    Value


{-| The [`list-style-image`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image) property.

    listStyleImage (url "https://example.com")

-}
listStyleImage : BaseValue (ImageSupported { none : Supported }) -> Style
listStyleImage (Value val) =
    AppendProperty ("list-style-image:" ++ val)



-- LIST STYLE TYPE --


{-| The `arabic-indic` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType arabicIndic

-}
arabicIndic : Value { provides | arabicIndic : Supported }
arabicIndic =
    Value "arabic-indic"


{-| The `armenian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType armenian

-}
armenian : Value { provides | armenian : Supported }
armenian =
    Value "armenian"


{-| The `bengali` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType bengali

-}
bengali : Value { provides | bengali : Supported }
bengali =
    Value "bengali"


{-| The `cambodian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cambodian

-}
cambodian : Value { provides | cambodian : Supported }
cambodian =
    Value "cambodian"


{-| The `circle` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType circle

-}
circle : Value { provides | circle : Supported }
circle =
    Value "circle"


{-| The `cjk-decimal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkDecimal

-}
cjkDecimal : Value { provides | cjkDecimal : Supported }
cjkDecimal =
    Value "cjk-decimal"


{-| The `cjk-earthly-branch` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkEarthlyBranch

-}
cjkEarthlyBranch : Value { provides | cjkEarthlyBranch : Supported }
cjkEarthlyBranch =
    Value "cjk-earthly-branch"


{-| The `cjk-heavenly-stem` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkHeavenlyStem

-}
cjkHeavenlyStem : Value { provides | cjkHeavenlyStem : Supported }
cjkHeavenlyStem =
    Value "cjk-heavenly-stem"


{-| The `cjk-ideographic` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType cjkIdeographic

-}
cjkIdeographic : Value { provides | cjkIdeographic : Supported }
cjkIdeographic =
    Value "cjk-ideographic"


{-| The `decimal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType decimal

-}
decimal : Value { provides | decimal : Supported }
decimal =
    Value "decimal"


{-| The `decimal-leading-zero` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType decimalLeadingZero

-}
decimalLeadingZero : Value { provides | decimalLeadingZero : Supported }
decimalLeadingZero =
    Value "decimal-leading-zero"


{-| The `devanagari` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType devanagari

-}
devanagari : Value { provides | devanagari : Supported }
devanagari =
    Value "devanagari"


{-| The `disc` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType disc

-}
disc : Value { provides | disc : Supported }
disc =
    Value "disc"


{-| The `disclosure-closed` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType disclosureClosed

-}
disclosureClosed : Value { provides | disclosureClosed : Supported }
disclosureClosed =
    Value "disclosure-closed"


{-| The `disclosure-open` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType disclosureOpen

-}
disclosureOpen : Value { provides | disclosureOpen : Supported }
disclosureOpen =
    Value "disclosure-open"


{-| The `ethiopic-numeric` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType ethiopicNumeric

-}
ethiopicNumeric : Value { provides | ethiopicNumeric : Supported }
ethiopicNumeric =
    Value "ethiopic-numeric"


{-| The `georgian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType georgian

-}
georgian : Value { provides | georgian : Supported }
georgian =
    Value "georgian"


{-| The `gujarati` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType gujarati

-}
gujarati : Value { provides | gujarati : Supported }
gujarati =
    Value "gujarati"


{-| The `gurmukhi` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType gurmukhi

-}
gurmukhi : Value { provides | gurmukhi : Supported }
gurmukhi =
    Value "gurmukhi"


{-| The `hebrew` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType hebrew

-}
hebrew : Value { provides | hebrew : Supported }
hebrew =
    Value "hebrew"


{-| The `hiragana` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType hiragana

-}
hiragana : Value { provides | hiragana : Supported }
hiragana =
    Value "hiragana"


{-| The `hiragana-iroha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType hiraganaIroha

-}
hiraganaIroha : Value { provides | hiraganaIroha : Supported }
hiraganaIroha =
    Value "hiragana-iroha"


{-| The `japanese-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType japaneseFormal

-}
japaneseFormal : Value { provides | japaneseFormal : Supported }
japaneseFormal =
    Value "japanese-formal"


{-| The `japanese-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType japaneseInformal

-}
japaneseInformal : Value { provides | japaneseInformal : Supported }
japaneseInformal =
    Value "japanese-informal"


{-| The `kannada` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType kannada

-}
kannada : Value { provides | kannada : Supported }
kannada =
    Value "kannada"


{-| The `katakana` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType katakana

-}
katakana : Value { provides | katakana : Supported }
katakana =
    Value "katakana"


{-| The `katakana-iroha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType katakanaIroha

-}
katakanaIroha : Value { provides | katakanaIroha : Supported }
katakanaIroha =
    Value "katakana-iroha"


{-| The `khmer` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType khmer

-}
khmer : Value { provides | khmer : Supported }
khmer =
    Value "khmer"


{-| The `korean-hangul-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType koreanHangulFormal

-}
koreanHangulFormal : Value { provides | koreanHangulFormal : Supported }
koreanHangulFormal =
    Value "korean-hangul-formal"


{-| The `korean-hanja-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType koreanHanjaFormal

-}
koreanHanjaFormal : Value { provides | koreanHanjaFormal : Supported }
koreanHanjaFormal =
    Value "korean-hanja-formal"


{-| The `korean-hanja-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType koreanHanjaInformal

-}
koreanHanjaInformal : Value { provides | koreanHanjaInformal : Supported }
koreanHanjaInformal =
    Value "korean-hanja-informal"


{-| The `lao` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lao

-}
lao : Value { provides | lao : Supported }
lao =
    Value "lao"


{-| The `lower-alpha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerAlpha

-}
lowerAlpha : Value { provides | lowerAlpha : Supported }
lowerAlpha =
    Value "lower-alpha"


{-| The `lower-armenian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerArmenian

-}
lowerArmenian : Value { provides | lowerArmenian : Supported }
lowerArmenian =
    Value "lower-armenian"


{-| The `lower-greek` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerGreek

-}
lowerGreek : Value { provides | lowerGreek : Supported }
lowerGreek =
    Value "lower-greek"


{-| The `lower-latin` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerLatin

-}
lowerLatin : Value { provides | lowerLatin : Supported }
lowerLatin =
    Value "lower-latin"


{-| The `lower-roman` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType lowerRoman

-}
lowerRoman : Value { provides | lowerRoman : Supported }
lowerRoman =
    Value "lower-roman"


{-| The `malayalam` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType malayalam

-}
malayalam : Value { provides | malayalam : Supported }
malayalam =
    Value "malayalam"


{-| The `monogolian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType monogolian

-}
monogolian : Value { provides | monogolian : Supported }
monogolian =
    Value "monogolian"


{-| The `myanmar` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType myanmar

-}
myanmar : Value { provides | myanmar : Supported }
myanmar =
    Value "myanmar"


{-| The `oriya` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType oriya

-}
oriya : Value { provides | oriya : Supported }
oriya =
    Value "oriya"


{-| The `persian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType persian

-}
persian : Value { provides | persian : Supported }
persian =
    Value "persian"


{-| The `simp-chinese-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType simpChineseFormal

-}
simpChineseFormal : Value { provides | simpChineseFormal : Supported }
simpChineseFormal =
    Value "simp-chinese-formal"


{-| The `simp-chinese-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType simpChineseInformal

-}
simpChineseInformal : Value { provides | simpChineseInformal : Supported }
simpChineseInformal =
    Value "simp-chinese-informal"


{-| The `tamil` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tamil

-}
tamil : Value { provides | tamil : Supported }
tamil =
    Value "tamil"


{-| The `telugu` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType telugu

-}
telugu : Value { provides | telugu : Supported }
telugu =
    Value "telugu"


{-| The `thai` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType thai

-}
thai : Value { provides | thai : Supported }
thai =
    Value "thai"


{-| The `tibetan` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tibetan

-}
tibetan : Value { provides | tibetan : Supported }
tibetan =
    Value "tibetan"


{-| The `trad-chinese-formal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tradChineseFormal

-}
tradChineseFormal : Value { provides | tradChineseFormal : Supported }
tradChineseFormal =
    Value "trad-chinese-formal"


{-| The `trad-chinese-informal` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType tradChineseInformal

-}
tradChineseInformal : Value { provides | tradChineseInformal : Supported }
tradChineseInformal =
    Value "trad-chinese-informal"


{-| The `upper-alpha` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperAlpha

-}
upperAlpha : Value { provides | upperAlpha : Supported }
upperAlpha =
    Value "upper-alpha"


{-| The `upper-armenian` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperArmenian

-}
upperArmenian : Value { provides | upperArmenian : Supported }
upperArmenian =
    Value "upper-armenian"


{-| The `upper-latin` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperLatin

-}
upperLatin : Value { provides | upperLatin : Supported }
upperLatin =
    Value "upper-latin"


{-| The `upper-roman` value used by properties such as [`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType)

    listStyleType upperRoman

-}
upperRoman : Value { provides | upperRoman : Supported }
upperRoman =
    Value "upper-roman"



-- BORDERS --


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border : BaseValue LineWidth -> Style
border (Value widthVal) =
    AppendProperty ("border:" ++ widthVal)


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border2 : Value LineWidth -> Value LineStyle -> Style
border2 (Value widthVal) (Value styleVal) =
    AppendProperty ("border:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border`](https://css-tricks.com/almanac/properties/b/border/) property.

    border (px 1)

    border2 (px 1) solid

    border3 (px 1) solid (hex "#f00")

-}
border3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
border3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty ("border:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop : BaseValue LineWidth -> Style
borderTop (Value widthVal) =
    AppendProperty ("border-top:" ++ widthVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop2 : Value LineWidth -> Value LineStyle -> Style
borderTop2 (Value widthVal) (Value styleVal) =
    AppendProperty ("border-top:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top) property.

    borderTop (px 1)

    borderTop2 (px 1) solid

    borderTop3 (px 1) solid (hex "#f00")

-}
borderTop3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderTop3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty ("border-top:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight : BaseValue LineWidth -> Style
borderRight (Value widthVal) =
    AppendProperty ("border-right:" ++ widthVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight2 : Value LineWidth -> Value LineStyle -> Style
borderRight2 (Value widthVal) (Value styleVal) =
    AppendProperty ("border-right:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right) property.

    borderRight (px 1)

    borderRight2 (px 1) solid

    borderRight3 (px 1) solid (hex "#f00")

-}
borderRight3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderRight3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty ("border-right:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom : BaseValue LineWidth -> Style
borderBottom (Value widthVal) =
    AppendProperty ("border-bottom:" ++ widthVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom2 : Value LineWidth -> Value LineStyle -> Style
borderBottom2 (Value widthVal) (Value styleVal) =
    AppendProperty ("border-bottom:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom) property.

    borderBottom (px 1)

    borderBottom2 (px 1) solid

    borderBottom3 (px 1) solid (hex "#f00")

-}
borderBottom3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBottom3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty ("border-bottom:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft : BaseValue LineWidth -> Style
borderLeft (Value widthVal) =
    AppendProperty ("border-left:" ++ widthVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft2 : Value LineWidth -> Value LineStyle -> Style
borderLeft2 (Value widthVal) (Value styleVal) =
    AppendProperty ("border-left:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left) property.

    borderLeft (px 1)

    borderLeft2 (px 1) solid

    borderLeft3 (px 1) solid (hex "#f00")

-}
borderLeft3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderLeft3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty ("border-left:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`border-block`](https://css-tricks.com/almanac/properties/b/border-block/) property.

    borderBlock (px 1)

    borderBlock2 (px 1) solid

    borderBlock3 (px 1) solid (hex "#f00")

-}
borderBlock : BaseValue LineWidth -> Style
borderBlock (Value widthVal) =
    AppendProperty ("border-block:" ++ widthVal)


{-| Sets [`border-block`](https://css-tricks.com/almanac/properties/b/border-block/) property.

    borderBlock (px 1)

    borderBlock2 (px 1) solid

    borderBlock3 (px 1) solid (hex "#f00")

-}
borderBlock2 : Value LineWidth -> Value LineStyle -> Style
borderBlock2 (Value widthVal) (Value style) =
    AppendProperty ("border-block:" ++ widthVal ++ " " ++ style)


{-| Sets [`border-block`](https://css-tricks.com/almanac/properties/b/border-block/) property.

    borderBlock (px 1)

    borderBlock2 (px 1) solid

    borderBlock3 (px 1) solid (hex "#f00")

-}
borderBlock3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBlock3 (Value widthVal) (Value style) (Value colorVal) =
    AppendProperty ("border-block:" ++ widthVal ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-block-start`](https://css-tricks.com/almanac/properties/b/border-block-start/) property.

    borderBlockStart (px 1)

    borderBlockStart2 (px 1) solid

    borderBlockStart3 (px 1) solid (hex "#f00")

-}
borderBlockStart : BaseValue LineWidth -> Style
borderBlockStart (Value widthVal) =
    AppendProperty ("border-block-start:" ++ widthVal)


{-| Sets [`border-block-start`](https://css-tricks.com/almanac/properties/b/border-block-start/) property.

    borderBlockStart (px 1)

    borderBlockStart2 (px 1) solid

    borderBlockStart3 (px 1) solid (hex "#f00")

-}
borderBlockStart2 : Value LineWidth -> Value LineStyle -> Style
borderBlockStart2 (Value widthVal) (Value style) =
    AppendProperty ("border-block-start:" ++ widthVal ++ " " ++ style)


{-| Sets [`border-block-start`](https://css-tricks.com/almanac/properties/b/border-block-start/) property.

    borderBlockStart (px 1)

    borderBlockStart2 (px 1) solid

    borderBlockStart3 (px 1) solid (hex "#f00")

-}
borderBlockStart3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBlockStart3 (Value widthVal) (Value style) (Value colorVal) =
    AppendProperty ("border-block-start:" ++ widthVal ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-block-end`](https://css-tricks.com/almanac/properties/b/border-block-end/) property.

    borderBlockEnd (px 1)

    borderBlockEnd2 (px 1) solid

    borderBlockEnd3 (px 1) solid (hex "#f00")

-}
borderBlockEnd : BaseValue LineWidth -> Style
borderBlockEnd (Value widthVal) =
    AppendProperty ("border-block-end:" ++ widthVal)


{-| Sets [`border-block-end`](https://css-tricks.com/almanac/properties/b/border-block-end/) property.

    borderBlockEnd (px 1)

    borderBlockEnd2 (px 1) solid

    borderBlockEnd3 (px 1) solid (hex "#f00")

-}
borderBlockEnd2 : Value LineWidth -> Value LineStyle -> Style
borderBlockEnd2 (Value widthVal) (Value style) =
    AppendProperty ("border-block-end:" ++ widthVal ++ " " ++ style)


{-| Sets [`border-block-end`](https://css-tricks.com/almanac/properties/b/border-block-end/) property.

    borderBlockEnd (px 1)

    borderBlockEnd2 (px 1) solid

    borderBlockEnd3 (px 1) solid (hex "#f00")

-}
borderBlockEnd3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderBlockEnd3 (Value widthVal) (Value style) (Value colorVal) =
    AppendProperty ("border-block-end:" ++ widthVal ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-inline`](https://css-tricks.com/almanac/properties/b/border-inline/) property.

    borderInline (px 1)

    borderInline2 (px 1) solid

    borderInline3 (px 1) solid (hex "#f00")

-}
borderInline : BaseValue LineWidth -> Style
borderInline (Value widthVal) =
    AppendProperty ("border-inline:" ++ widthVal)


{-| Sets [`border-inline`](https://css-tricks.com/almanac/properties/b/border-inline/) property.

    borderInline (px 1)

    borderInline2 (px 1) solid

    borderInline3 (px 1) solid (hex "#f00")

-}
borderInline2 : Value LineWidth -> Value LineStyle -> Style
borderInline2 (Value widthVal) (Value style) =
    AppendProperty ("border-inline:" ++ widthVal ++ " " ++ style)


{-| Sets [`border-inline`](https://css-tricks.com/almanac/properties/b/border-inline/) property.

    borderInline (px 1)

    borderInline2 (px 1) solid

    borderInline3 (px 1) solid (hex "#f00")

-}
borderInline3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderInline3 (Value widthVal) (Value style) (Value colorVal) =
    AppendProperty ("border-inline:" ++ widthVal ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-inline-start`](https://css-tricks.com/almanac/properties/b/border-inline-start/) property.

    borderInlineStart (px 1)

    borderInlineStart2 (px 1) solid

    borderInlineStart3 (px 1) solid (hex "#f00")

-}
borderInlineStart : BaseValue LineWidth -> Style
borderInlineStart (Value widthVal) =
    AppendProperty ("border-inline-start:" ++ widthVal)


{-| Sets [`border-inline-start`](https://css-tricks.com/almanac/properties/b/border-inline-start/) property.

    borderInlineStart (px 1)

    borderInlineStart2 (px 1) solid

    borderInlineStart3 (px 1) solid (hex "#f00")

-}
borderInlineStart2 : Value LineWidth -> Value LineStyle -> Style
borderInlineStart2 (Value widthVal) (Value style) =
    AppendProperty ("border-inline-start:" ++ widthVal ++ " " ++ style)


{-| Sets [`border-inline-start`](https://css-tricks.com/almanac/properties/b/border-inline-start/) property.

    borderInlineStart (px 1)

    borderInlineStart2 (px 1) solid

    borderInlineStart3 (px 1) solid (hex "#f00")

-}
borderInlineStart3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderInlineStart3 (Value widthVal) (Value style) (Value colorVal) =
    AppendProperty ("border-inline-start:" ++ widthVal ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-inline-end`](https://css-tricks.com/almanac/properties/b/border-inline-end/) property.

    borderInlineEnd (px 1)

    borderInlineEnd2 (px 1) solid

    borderInlineEnd3 (px 1) solid (hex "#f00")

-}
borderInlineEnd : BaseValue LineWidth -> Style
borderInlineEnd (Value widthVal) =
    AppendProperty ("border-inline-end:" ++ widthVal)


{-| Sets [`border-inline-end`](https://css-tricks.com/almanac/properties/b/border-inline-end/) property.

    borderInlineEnd (px 1)

    borderInlineEnd2 (px 1) solid

    borderInlineEnd3 (px 1) solid (hex "#f00")

-}
borderInlineEnd2 : Value LineWidth -> Value LineStyle -> Style
borderInlineEnd2 (Value widthVal) (Value style) =
    AppendProperty ("border-inline-end:" ++ widthVal ++ " " ++ style)


{-| Sets [`border-inline-end`](https://css-tricks.com/almanac/properties/b/border-inline-end/) property.

    borderInlineEnd (px 1)

    borderInlineEnd2 (px 1) solid

    borderInlineEnd3 (px 1) solid (hex "#f00")

-}
borderInlineEnd3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
borderInlineEnd3 (Value widthVal) (Value style) (Value colorVal) =
    AppendProperty ("border-inline-end:" ++ widthVal ++ " " ++ style ++ " " ++ colorVal)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth : BaseValue LineWidth -> Style
borderWidth (Value widthVal) =
    AppendProperty ("border-width:" ++ widthVal)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth2 : Value LineWidth -> Value LineWidth -> Style
borderWidth2 (Value widthTopBottom) (Value widthRightLeft) =
    AppendProperty ("border-width:" ++ widthTopBottom ++ " " ++ widthRightLeft)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth3 : Value LineWidth -> Value LineWidth -> Value LineWidth -> Style
borderWidth3 (Value widthTop) (Value widthRightLeft) (Value widthBottom) =
    AppendProperty ("border-width:" ++ widthTop ++ " " ++ widthRightLeft ++ " " ++ widthBottom)


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width) property.

    borderWidth (px 1)

    borderWidth2 (px 1) thin

    borderWidth3 (px 1) thin zero

    borderWidth4 (px 1) thin zero (em 1)

-}
borderWidth4 : Value LineWidth -> Value LineWidth -> Value LineWidth -> Value LineWidth -> Style
borderWidth4 (Value widthTop) (Value widthRight) (Value widthBottom) (Value widthLeft) =
    AppendProperty ("border-width:" ++ widthTop ++ " " ++ widthRight ++ " " ++ widthBottom ++ " " ++ widthLeft)


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width) property.

    borderTopWidth (px 1)

-}
borderTopWidth : BaseValue LineWidth -> Style
borderTopWidth (Value widthVal) =
    AppendProperty ("border-top-width:" ++ widthVal)


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width) property.

    borderRightWidth (px 1)

-}
borderRightWidth : BaseValue LineWidth -> Style
borderRightWidth (Value widthVal) =
    AppendProperty ("border-right-width:" ++ widthVal)


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width) property.

    borderBottomWidth (px 1)

-}
borderBottomWidth : BaseValue LineWidth -> Style
borderBottomWidth (Value widthVal) =
    AppendProperty ("border-bottom-width:" ++ widthVal)


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width) property.

    borderLeftWidth (px 1)

-}
borderLeftWidth : BaseValue LineWidth -> Style
borderLeftWidth (Value widthVal) =
    AppendProperty ("border-left-width:" ++ widthVal)


{-| Sets [`border-block-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-width) property.

    borderBlockWidth (px 1)

-}
borderBlockWidth : BaseValue LineWidth -> Style
borderBlockWidth (Value widthVal) =
    AppendProperty ("border-block-width:" ++ widthVal)


{-| Sets [`border-block-start-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-width) property.

    borderBlockStartWidth (px 1)

-}
borderBlockStartWidth : BaseValue LineWidth -> Style
borderBlockStartWidth (Value widthVal) =
    AppendProperty ("border-block-start-width:" ++ widthVal)


{-| Sets [`border-block-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-width) property.

    borderBlockEndWidth (px 1)

-}
borderBlockEndWidth : BaseValue LineWidth -> Style
borderBlockEndWidth (Value widthVal) =
    AppendProperty ("border-block-end-width:" ++ widthVal)


{-| Sets [`border-inline-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-width) property.

    borderTopWidth (px 1)

-}
borderInlineWidth : BaseValue LineWidth -> Style
borderInlineWidth (Value widthVal) =
    AppendProperty ("border-inline-width:" ++ widthVal)


{-| Sets [`border-inline-start-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-width) property.

    borderInlineStartWidth (px 1)

-}
borderInlineStartWidth : BaseValue LineWidth -> Style
borderInlineStartWidth (Value widthVal) =
    AppendProperty ("border-inline-start-width:" ++ widthVal)


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width) property.

    borderInlineEndWidth (px 1)

-}
borderInlineEndWidth : BaseValue LineWidth -> Style
borderInlineEndWidth (Value widthVal) =
    AppendProperty ("border-inline-end-width:" ++ widthVal)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

    borderStyle2 solid none

    borderStyle3 solid none dotted

    borderStyle4 solid none dotted groove

-}
borderStyle : BaseValue LineStyle -> Style
borderStyle (Value styleVal) =
    AppendProperty ("border-style:" ++ styleVal)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle solid

-}
borderStyle2 : Value LineStyle -> Value LineStyle -> Style
borderStyle2 (Value styleTopBottom) (Value styleRigthLeft) =
    AppendProperty ("border-style:" ++ styleTopBottom ++ " " ++ styleRigthLeft)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle2 solid none

-}
borderStyle3 : Value LineStyle -> Value LineStyle -> Value LineStyle -> Style
borderStyle3 (Value styleTop) (Value styleRigthLeft) (Value styleBottom) =
    AppendProperty ("border-style:" ++ styleTop ++ " " ++ styleRigthLeft ++ " " ++ styleBottom)


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style) property.

    borderStyle4 solid none dotted groove

-}
borderStyle4 : Value LineStyle -> Value LineStyle -> Value LineStyle -> Value LineStyle -> Style
borderStyle4 (Value styleTop) (Value styleRigt) (Value styleBottom) (Value styleLeft) =
    AppendProperty ("border-style:" ++ styleTop ++ " " ++ styleRigt ++ " " ++ styleBottom ++ " " ++ styleLeft)


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style) property.

    borderTopStyle solid

-}
borderTopStyle : BaseValue LineStyle -> Style
borderTopStyle (Value styleVal) =
    AppendProperty ("border-top-style:" ++ styleVal)


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style) property.

    borderRightStyle solid

-}
borderRightStyle : BaseValue LineStyle -> Style
borderRightStyle (Value styleVal) =
    AppendProperty ("border-right-style:" ++ styleVal)


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style) property.

    borderBottomStyle solid

-}
borderBottomStyle : BaseValue LineStyle -> Style
borderBottomStyle (Value styleVal) =
    AppendProperty ("border-bottom-style:" ++ styleVal)


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style) property.

    borderLeftStyle solid

-}
borderLeftStyle : BaseValue LineStyle -> Style
borderLeftStyle (Value styleVal) =
    AppendProperty ("border-left-style:" ++ styleVal)


{-| Sets [`border-block-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-style) property.

    borderBlockStyle solid

-}
borderBlockStyle : BaseValue LineStyle -> Style
borderBlockStyle (Value style) =
    AppendProperty ("border-block-style:" ++ style)


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style) property.

    borderBlockStartStyle solid

-}
borderBlockStartStyle : BaseValue LineStyle -> Style
borderBlockStartStyle (Value style) =
    AppendProperty ("border-block-start-style:" ++ style)


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style) property.

    borderBlockEndStyle solid

-}
borderBlockEndStyle : BaseValue LineStyle -> Style
borderBlockEndStyle (Value style) =
    AppendProperty ("border-block-end-style:" ++ style)


{-| Sets [`border-inline-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-style) property.

    borderInlineStyle solid

-}
borderInlineStyle : BaseValue LineStyle -> Style
borderInlineStyle (Value style) =
    AppendProperty ("border-inline-style:" ++ style)


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style) property.

    borderInlineStartStyle solid

-}
borderInlineStartStyle : BaseValue LineStyle -> Style
borderInlineStartStyle (Value style) =
    AppendProperty ("border-inline-start-style:" ++ style)


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style) property.

    borderInlineEndStyle solid

-}
borderInlineEndStyle : BaseValue LineStyle -> Style
borderInlineEndStyle (Value style) =
    AppendProperty ("border-inline-end-style:" ++ style)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor : BaseValue Color -> Style
borderColor (Value colorVal) =
    AppendProperty ("border-color:" ++ colorVal)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor2 : Value Color -> Value Color -> Style
borderColor2 (Value colorTopBottom) (Value colorRightLeft) =
    AppendProperty ("border-color:" ++ colorTopBottom ++ " " ++ colorRightLeft)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor3 : Value Color -> Value Color -> Value Color -> Style
borderColor3 (Value colorTop) (Value colorRightLeft) (Value colorBottom) =
    AppendProperty ("border-color:" ++ colorTop ++ " " ++ colorRightLeft ++ " " ++ colorBottom)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color) property.

    borderColor (rgb 0 0 0)

    borderColor2 (rgb 0 0 0) (hsl 10 10 10)

    borderColor3 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff")

    borderColor4 (rgb 0 0 0) (hsl 10 10 10) (hex "#fff") transparent

-}
borderColor4 : Value Color -> Value Color -> Value Color -> Value Color -> Style
borderColor4 (Value colorTop) (Value colorRight) (Value colorBottom) (Value colorLeft) =
    AppendProperty ("border-color:" ++ colorTop ++ " " ++ colorRight ++ " " ++ colorBottom ++ " " ++ colorLeft)


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color) property.

    borderTopColor (rgb 0 0 0)

-}
borderTopColor : BaseValue Color -> Style
borderTopColor (Value colorVal) =
    AppendProperty ("border-top-color:" ++ colorVal)


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color) property.

    borderRightColor (rgb 0 0 0)

-}
borderRightColor : BaseValue Color -> Style
borderRightColor (Value colorVal) =
    AppendProperty ("border-right-color:" ++ colorVal)


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color) property.

    borderBottomColor (rgb 0 0 0)

-}
borderBottomColor : BaseValue Color -> Style
borderBottomColor (Value colorVal) =
    AppendProperty ("border-bottom-color:" ++ colorVal)


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color) property.

    borderLeftColor (rgb 0 0 0)

-}
borderLeftColor : BaseValue Color -> Style
borderLeftColor (Value colorVal) =
    AppendProperty ("border-left-color:" ++ colorVal)


{-| Sets [`border-block-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-color) property.

    borderBlockColor (rgb 0 0 0)

-}
borderBlockColor : BaseValue Color -> Style
borderBlockColor (Value colorVal) =
    AppendProperty ("border-block-color:" ++ colorVal)


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color) property.

    borderBlockStartColor (rgb 0 0 0)

-}
borderBlockStartColor : BaseValue Color -> Style
borderBlockStartColor (Value colorVal) =
    AppendProperty ("border-block-start-color:" ++ colorVal)


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color) property.

    borderBlockEndColor (rgb 0 0 0)

-}
borderBlockEndColor : BaseValue Color -> Style
borderBlockEndColor (Value colorVal) =
    AppendProperty ("border-block-end-color:" ++ colorVal)


{-| Sets [`border-inline-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-color) property.

    borderInlineColor (rgb 0 0 0)

-}
borderInlineColor : BaseValue Color -> Style
borderInlineColor (Value colorVal) =
    AppendProperty ("border-inline-color:" ++ colorVal)


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color) property.

    borderInlineStartColor (rgb 0 0 0)

-}
borderInlineStartColor : BaseValue Color -> Style
borderInlineStartColor (Value colorVal) =
    AppendProperty ("border-inline-start-color:" ++ colorVal)


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color) property.

    borderInlineEndColor (rgb 0 0 0)

-}
borderInlineEndColor : BaseValue Color -> Style
borderInlineEndColor (Value colorVal) =
    AppendProperty ("border-inline-end-color:" ++ colorVal)



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

This is called `inset_` rather than `inset` because [`inset` is already a function](#inset).

    borderStyle inset_

    columnRuleStyle inset_

    textDecorationStyle inset_

Adds a split tone to the line that makes it appear slightly depressed.

Contrast with [`outset`](#outset)

-}
inset_ : Value { provides | inset_ : Supported }
inset_ =
    Value "inset"


{-| The `outset` value used by properties such as [`borderStyle`](#borderStyle),
[`columnRuleStyle`](#columnRuleStyle),
and [`textDecorationStyle`](#textDecorationStyle),
and [`strokeAlign`](#strokeAlign).

    borderStyle outset

    columnRuleStyle outset

    strokeAlign outset

    textDecorationStyle outset

Similar to [`inset_`](#inset_), but reverses the colors in a way that makes it appear slightly raised.

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
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
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
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderRadius4 (Value radiusTopLeft) (Value radiusTopRight) (Value radiusBottomRight) (Value radiusBottomLeft) =
    AppendProperty ("border-radius:" ++ radiusTopLeft ++ " " ++ radiusTopRight ++ " " ++ radiusBottomRight ++ " " ++ radiusBottomLeft)


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius) property.

    borderTopLeftRadius (em 4)

    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderTopLeftRadius (Value radius) =
    AppendProperty ("border-top-left-radius:" ++ radius)


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius) property.

    borderTopLeftRadius (em 4)

    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderTopLeftRadius2 (Value valHorizontal) (Value valVertical) =
    AppendProperty ("border-top-left-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius) property.

    borderTopRightRadius (em 4)

    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderTopRightRadius (Value radius) =
    AppendProperty ("border-top-right-radius:" ++ radius)


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius) property.

    borderTopRightRadius (em 4)

    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderTopRightRadius2 (Value valHorizontal) (Value valVertical) =
    AppendProperty ("border-top-right-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius) property.

    borderBottomRightRadius (em 4)

    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderBottomRightRadius (Value radius) =
    AppendProperty ("border-bottom-right-radius:" ++ radius)


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius) property.

    borderBottomRightRadius (em 4)

    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderBottomRightRadius2 (Value valHorizontal) (Value valVertical) =
    AppendProperty ("border-bottom-right-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius) property.

    borderBottomLeftRadius (em 4)

    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderBottomLeftRadius (Value radius) =
    AppendProperty ("border-bottom-left-radius:" ++ radius)


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius) property.

    borderBottomLeftRadius (em 4)

    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderBottomLeftRadius2 (Value valHorizontal) (Value valVertical) =
    AppendProperty ("border-bottom-left-radius:" ++ valHorizontal ++ " " ++ valVertical)


{-| Sets [`border-start-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-start-radius) property.

    borderStartStartRadius (em 4)

    borderStartStartRadius2 (em 4) (px 2)

-}
borderStartStartRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderStartStartRadius (Value radius) =
    AppendProperty ("border-start-start-radius:" ++ radius)


{-| Sets [`border-start-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-start-radius) property.

    borderStartStartRadius (em 4)

    borderStartStartRadius2 (em 4) (px 2)

-}
borderStartStartRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderStartStartRadius2 (Value horizontalValue) (Value verticalValue) =
    AppendProperty ("border-start-start-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-start-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-end-radius) property.

    borderStartEndRadius (em 4)

    borderStartEndRadius2 (em 4) (px 2)

-}
borderStartEndRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderStartEndRadius (Value radius) =
    AppendProperty ("border-start-end-radius:" ++ radius)


{-| Sets [`border-start-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-end-radius) property.

    borderStartEndRadius (em 4)

    borderStartEndRadius2 (em 4) (px 2)

-}
borderStartEndRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderStartEndRadius2 (Value horizontalValue) (Value verticalValue) =
    AppendProperty ("border-start-end-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-end-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-start-radius) property.

    borderEndStartRadius (em 4)

    borderEndStartRadius2 (em 4) (px 2)

-}
borderEndStartRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderEndStartRadius (Value radius) =
    AppendProperty ("border-end-start-radius:" ++ radius)


{-| Sets [`border-end-start-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-start-radius) property.

    borderEndStartRadius (em 4)

    borderEndStartRadius2 (em 4) (px 2)

-}
borderEndStartRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderEndStartRadius2 (Value horizontalValue) (Value verticalValue) =
    AppendProperty ("border-end-start-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-end-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-end-radius) property.

    borderEndEndRadius (em 4)

    borderEndEndRadius2 (em 4) (px 2)

-}
borderEndEndRadius :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
borderEndEndRadius (Value radius) =
    AppendProperty ("border-end-end-radius:" ++ radius)


{-| Sets [`border-end-end-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-end-radius) property.

    borderEndEndRadius (em 4)

    borderEndEndRadius2 (em 4) (px 2)

-}
borderEndEndRadius2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
borderEndEndRadius2 (Value horizontalValue) (Value verticalValue) =
    AppendProperty ("border-end-end-radius:" ++ horizontalValue ++ " " ++ verticalValue)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset :
    BaseValue
        (LengthSupported
            { num : Supported
            }
        )
    -> Style
borderImageOutset (Value widthVal) =
    AppendProperty ("border-image-outset:" ++ widthVal)


{-| Sets [`border-image-outset`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageOutset (rem 1)

    borderImageOutset2 (num 1) (num 1.2)

    borderImageOutset3 (px 30) (num 2) (px 45)

    borderImageOutset4 (px 7) (px 12) (px 14) (px 5)

Specifies the distance by which an element's border image is set out from its border box. Supports values specified as length units or unitless numbers. Negative values are invalid.

-}
borderImageOutset2 :
    Value
        (LengthSupported
            { num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
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
        (LengthSupported
            { num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
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
        (LengthSupported
            { num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { num : Supported
                }
            )
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
    BaseValue
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    -> Style
borderImageWidth (Value widthVal) =
    AppendProperty ("border-image-width:" ++ widthVal)


{-| Sets [`border-image-width`](https://css-tricks.com/almanac/properties/b/border-image/) property.

    borderImageWidth (rem 1)

    borderImageWidth2 (num 1) (num 1.2)

    borderImageWidth3 (pct 5) (pct 15) (pct 10)

    borderImageWidth4 (px 7) (px 12) (px 14) (px 5)

Specifies the width of an element's border image. Supports values specified as length units, percentages, unitless numbers or auto. Negative values are invalid.

-}
borderImageWidth2 :
    Value
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            , num : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
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
        (LengthSupported
            { pct : Supported
            , num : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , num : Supported
                , auto : Supported
                }
            )
    -> Style
borderImageWidth4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("border-image-width:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)



-- OUTLINE --


{-| Sets [`outline`](https://css-tricks.com/almanac/properties/o/outline/).

    outline zero

    outline none

-}
outline :
    BaseValue
        (LineWidthSupported
            (LineStyleSupported
                (ColorSupported
                    { auto : Supported
                    , invert : Supported
                    }
                )
            )
        )
    -> Style
outline (Value val) =
    AppendProperty ("outline:" ++ val)


{-| Sets [`outline`](https://css-tricks.com/almanac/properties/o/outline/).

    outline3 (em 0.25) auto (rgb 120 250 32)

-}
outline3 :
    Value LineWidth
    -> Value (LineStyleSupported { auto : Supported })
    -> Value (ColorSupported { invert : Supported })
    -> Style
outline3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty
        ("outline:"
            ++ widthVal
            ++ " "
            ++ styleVal
            ++ " "
            ++ colorVal
        )


{-| Sets [`outline-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-width).

    outlineWidth (px 2)

    outlineWidth thin

-}
outlineWidth : BaseValue LineWidth -> Style
outlineWidth (Value val) =
    AppendProperty ("outline-width:" ++ val)


{-| Sets [`outline-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color).

    outlineColor (hex "eee")

    outlineColor invert

-}
outlineColor : BaseValue (ColorSupported { invert : Supported }) -> Style
outlineColor (Value val) =
    AppendProperty ("outline-color:" ++ val)


{-| The `invert` value used by properties such as [`outlineColor`](#outlineColor)

    outlineColor invert

-}
invert : Value { provides | invert : Supported }
invert =
    Value "invert"


{-| Sets [`outline-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-style).

    outlineStyle auto

    outlineStyle dashed

-}
outlineStyle : BaseValue (LineStyleSupported { auto : Supported }) -> Style
outlineStyle (Value val) =
    AppendProperty ("outline-style:" ++ val)


{-| Sets [`outline-offset`](https://css-tricks.com/almanac/properties/o/outline-offset/).

    outlineOffset (px 2)

-}
outlineOffset : BaseValue Length -> Style
outlineOffset (Value val) =
    AppendProperty ("outline-offset:" ++ val)



-- TEXT ORIENTATION --


{-| Sets [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation).

    textOrientation sideways

    textOrientation upright

-}
textOrientation :
    BaseValue
        { mixed : Supported
        , sideways : Supported
        , upright : Supported
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
    BaseValue
        { auto : Supported
        , geometricPrecision : Supported
        , optimizeLegibility : Supported
        , optimizeSpeed : Supported
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
    BaseValue
        { capitalize : Supported
        , uppercase : Supported
        , lowercase : Supported
        , fullWidth : Supported
        , fullSizeKana : Supported
        , none : Supported
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


{-| The `full-size-kana` value used by [`textTransform`](#textTransform)

textTransform fullSizeKana

-}
fullSizeKana : Value { provedes | fullSizeKana : Supported }
fullSizeKana =
    Value "full-size-kana"



-- TEXT DECORATION --


{-| Sets [`text-decoration`][text-decoration] shorthand property.

    textDecoration underline

[text-decoration]: https://css-tricks.com/almanac/properties/t/text-decoration/

-}
textDecoration :
    BaseValue
        (ColorSupported
            { none : Supported
            , underline : Supported
            , overline : Supported
            , lineThrough : Supported
            , solid : Supported
            , double : Supported
            , dotted : Supported
            , dashed : Supported
            , wavy : Supported
            }
        )
    -> Style
textDecoration (Value line) =
    AppendProperty ("text-decoration:" ++ line)


{-| Sets [`text-decoration`][text-decoration] property.

    textDecoration2 underline dotted

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
textDecoration2 (Value line) (Value styleVal) =
    AppendProperty ("text-decoration:" ++ line ++ " " ++ styleVal)


{-| Sets [`text-decoration`][text-decoration] property.

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
    -> Value Color
    -> Style
textDecoration3 (Value line) (Value styleVal) (Value colorVal) =
    AppendProperty ("text-decoration:" ++ line ++ " " ++ styleVal ++ " " ++ colorVal)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine underline

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine :
    BaseValue
        { none : Supported
        , underline : Supported
        , overline : Supported
        , lineThrough : Supported
        }
    -> Style
textDecorationLine (Value line) =
    AppendProperty ("text-decoration-line:" ++ line)


{-| Sets [`text-decoration-line`][text-decoration-line] property.

    textDecorationLine2 underline overline

**Note:** The first and second argument **MUST NOT** be the same.

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

    textDecorationLine3 underline overline lineThrough

[text-decoration-line]: https://css-tricks.com/almanac/properties/t/text-decoration-line/

-}
textDecorationLine3 :
    Value { underline : Supported }
    -> Value { overline : Supported }
    -> Value { lineThrough : Supported }
    -> Style
textDecorationLine3 (Value line1) (Value line2) (Value line3) =
    AppendProperty ("text-decoration-line:" ++ line1 ++ " " ++ line2 ++ " " ++ line3)


{-| Sets [`text-decoration-style`][text-decoration-style] property.

    textDecorationStyle wavy

[text-decoration-style]: https://css-tricks.com/almanac/properties/t/text-decoration-style/

-}
textDecorationStyle :
    BaseValue
        { solid : Supported
        , double : Supported
        , dotted : Supported
        , dashed : Supported
        , wavy : Supported
        }
    -> Style
textDecorationStyle (Value styleVal) =
    AppendProperty ("text-decoration-style:" ++ styleVal)


{-| Sets [`text-decoration-color`][text-decoration-color] property.

    textDecorationColor (hex "#0cf")

[text-decoration-color]: https://css-tricks.com/almanac/properties/t/text-decoration-color/

-}
textDecorationColor : BaseValue Color -> Style
textDecorationColor (Value colorVal) =
    AppendProperty ("text-decoration-color:" ++ colorVal)


{-| Sets [`text-decoration-skip`][https://css-tricks.com/almanac/properties/t/text-decoration-skip/] property.

    textDecorationSkip objects

    textDecorationSkip none

    textDecorationSkip spaces

    textDecorationSkip ink

    textDecorationSkip edges

    textDecorationSkip boxDecoration

-}
textDecorationSkip :
    BaseValue
        { objects : Supported
        , none : Supported
        , spaces : Supported
        , ink : Supported
        , edges : Supported
        , boxDecoration : Supported
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
    BaseValue
        { collapse : Supported
        , separate : Supported
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
borderSpacing : BaseValue Length -> Style
borderSpacing (Value str) =
    AppendProperty ("border-spacing:" ++ str)


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing), defining horizontal and vertical spacing separately.

    borderSpacing2 (cm 1) (em 2)

-}
borderSpacing2 : Value Length -> Value Length -> Style
borderSpacing2 (Value valHorizontal) (Value valVertical) =
    AppendProperty ("border-spacing:" ++ valHorizontal ++ " " ++ valVertical)



-- CAPTION SIDE --


{-| Sets [`caption-side`](https://css-tricks.com/almanac/properties/c/caption-side/).

    captionSide top_

    captionSide bottom_

-}
captionSide :
    BaseValue
        { top_ : Supported
        , bottom_ : Supported
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
    BaseValue
        { show : Supported
        , hide : Supported
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
    BaseValue
        { auto : Supported
        , fixed : Supported
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
    BaseValue
        (LengthSupported
            { baseline : Supported
            , sub : Supported
            , super : Supported
            , textTop : Supported
            , textBottom : Supported
            , middle : Supported
            , top_ : Supported
            , bottom_ : Supported
            , pct : Supported
            }
        )
    -> Style
verticalAlign (Value str) =
    AppendProperty ("vertical-align:" ++ str)


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
    BaseValue
        { rtl : Supported
        , ltr : Supported
        }
    -> Style
direction (Value str) =
    AppendProperty ("direction:" ++ str)


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


{-| Sets [`text-align`](https://css-tricks.com/almanac/properties/t/text-align/)

    textAlign left_

    textAlign justfy

-}
textAlign :
    BaseValue
        { left_ : Supported
        , right_ : Supported
        , center : Supported
        , justify : Supported
        , start : Supported
        , end : Supported
        , matchParent : Supported
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
    BaseValue
        { interWord : Supported
        , interCharacter : Supported
        , auto : Supported
        , none : Supported
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

    textUnderlinePosition auto

    textUnderlinePosition under

    textUnderlinePosition left_

    textUnderlinePosition right_

-}
textUnderlinePosition :
    BaseValue
        { auto : Supported
        , under : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
textUnderlinePosition (Value val) =
    AppendProperty ("text-underline-position:" ++ val)


{-| Sets [`text-underline-position`](https://css-tricks.com/almanac/properties/t/text-underline-position/)

    textUnderlinePosition2 under left_

    textUnderlinePosition2 under right_

-}
textUnderlinePosition2 :
    Value { under : Supported }
    ->
        Value
            { left_ : Supported
            , right_ : Supported
            }
    -> Style
textUnderlinePosition2 (Value underVal) (Value val) =
    AppendProperty ("text-underline-position:" ++ underVal ++ " " ++ val)


{-| A `under` value for the [`textUnderlinePosition`](#textUnderlinePosition) property.

    textUnderlinePosition under

-}
under : Value { provides | under : Supported }
under =
    Value "under"



-- WHITE-SPACE --


{-| Sets [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/)

    whiteSpace pre

    whiteSpace nowrap

    whiteSpace preWrap

    whiteSpace preLine

-}
whiteSpace :
    BaseValue
        { normal : Supported
        , nowrap : Supported
        , pre : Supported
        , preWrap : Supported
        , preLine : Supported
        }
    -> Style
whiteSpace (Value str) =
    AppendProperty ("white-space:" ++ str)


{-| A `nowrap` value for the [`white-space`](https://css-tricks.com/almanac/properties/w/whitespace/)
and [`flex-wrap`](https://css-tricks.com/almanac/properties/f/flex-wrap/) properties.

    whiteSpace nowrap

    flexWrap nowrap

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
    BaseValue
        { normal : Supported
        , breakAll : Supported
        , keepAll : Supported
        , breakWord : Supported
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
    BaseValue
        { none : Supported
        , left_ : Supported
        , right_ : Supported
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
    BaseValue
        { visible : Supported
        , hidden : Supported
        , collapse : Supported
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
    BaseValue
        { int : Supported
        , zero : Supported
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
    BaseValue
        (ColorSupported
            { url : Supported
            }
        )
    -> Style
fill (Value val) =
    AppendProperty ("fill:" ++ val)



-- COLUMNS --


{-| Sets [`columns`](https://css-tricks.com/almanac/properties/c/columns/)

    columns (px 300)

    columns2 (px 300) (num 2)

-}
columns :
    BaseValue
        (LengthSupported
            { auto : Supported
            }
        )
    -> Style
columns (Value widthVal) =
    AppendProperty ("columns:" ++ widthVal)


{-| Sets [`columns`](https://css-tricks.com/almanac/properties/c/columns/)

    columns (px 300)

    columns2 (px 300) (num 2)

-}
columns2 :
    Value
        (LengthSupported
            { auto : Supported
            }
        )
    ->
        Value
            { auto : Supported
            , num : Supported
            }
    -> Style
columns2 (Value widthVal) (Value count) =
    AppendProperty ("columns:" ++ widthVal ++ " " ++ count)


{-| Sets [`column-width`](https://css-tricks.com/almanac/properties/c/column-width/)

    columnWidth auto

    columnWidth (px 200)

-}
columnWidth :
    BaseValue
        (LengthSupported
            { auto : Supported
            }
        )
    -> Style
columnWidth (Value widthVal) =
    AppendProperty ("column-width:" ++ widthVal)


{-| Sets [`column-count`](https://css-tricks.com/almanac/properties/c/column-count/)

    columnCount auto

    columnCount (num 3)

-}
columnCount :
    BaseValue
        { auto : Supported
        , int : Supported
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
    BaseValue
        { auto : Supported
        , balance : Supported
        , balanceAll : Supported
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
    BaseValue
        { none : Supported
        , all_ : Supported
        }
    -> Style
columnSpan (Value span) =
    AppendProperty ("column-span:" ++ span)


{-| Sets [`column-rule-width`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-width)

    columnRuleWidth thin

    columnRuleWidth (px 2)

-}
columnRuleWidth : BaseValue LineWidth -> Style
columnRuleWidth (Value widthVal) =
    AppendProperty ("column-rule-width:" ++ widthVal)


{-| Sets [`column-rule-style`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-style)

    columnRuleStyle solid

    columnRuleStyle dotted

    columnRuleStyle dashed

-}
columnRuleStyle : BaseValue LineStyle -> Style
columnRuleStyle (Value styleVal) =
    AppendProperty ("column-rule-style:" ++ styleVal)


{-| Sets [`column-rule-color`](https://www.w3.org/TR/css-multicol-1/#propdef-column-rule-color)

    columnRuleColor (rgb 0 0 0)

    columnRuleColor (hex "#fff")

-}
columnRuleColor : BaseValue Color -> Style
columnRuleColor (Value colorVal) =
    AppendProperty ("column-rule-color:" ++ colorVal)


{-| Sets the [`gap`](https://css-tricks.com/almanac/properties/g/gap/) property.

The `gap` property is a shorthand for setting `row-gap` and `column-gap`
in a single declaration.

`gap` specifies the size of spacing between items within grid, flex
and multi-column layouts.

    gap initial

    gap (px 20) -- 20px gap between all items.

    gap2 (px 20) (px 40) -- 20px row gap, 40px column gap.

-}
gap :
    BaseValue
        (LengthSupported
            { pct : Supported
            }
        )
    -> Style
gap (Value val) =
    AppendProperty ("gap:" ++ val)


{-| Sets the [`gap`](https://css-tricks.com/almanac/properties/g/gap/) property.

The `gap` property is a shorthand for setting `row-gap` and `column-gap`
in a single declaration.

`gap` specifies the size of spacing between items within grid, flex
and multi-column layouts.

    gap2 (px 20) (px 40) -- 20px row gap, 40px column gap.

-}
gap2 :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Style
gap2 (Value rowVal) (Value columnVal) =
    AppendProperty ("gap:" ++ rowVal ++ " " ++ columnVal)


{-| Sets the [`row-gap`](https://developer.mozilla.org/en-US/docs/Web/CSS/row-gap) property.

`row-gap` specifies the size of spacing between rows of items within grid, flex
and multi-column layouts.

    rowGap normal

    rowGap (px 20)

-}
rowGap :
    BaseValue
        (LengthSupported
            { normal : Supported
            , pct : Supported
            }
        )
    -> Style
rowGap (Value widthVal) =
    AppendProperty ("row-gap:" ++ widthVal)


{-| Sets the [`column-gap`](https://developer.mozilla.org/en-US/docs/Web/CSS/column-gap) property.

`column-gap` specifies the size of spacing between column of items within grid, flex
and multi-column layouts.

    columnGap normal

    columnGap (px 20)

-}
columnGap :
    BaseValue
        (LengthSupported
            { normal : Supported
            , pct : Supported
            }
        )
    -> Style
columnGap (Value widthVal) =
    AppendProperty ("column-gap:" ++ widthVal)



-- STROKE --


{-| Sets [`stroke-dasharray`](https://css-tricks.com/almanac/properties/s/stroke-dasharray/)

    strokeDasharray (num 2)

    strokeDasharray (num 2.5)

    strokeDasharray (em 2)

    strokeDasharray (pct 15)

-}
strokeDasharray :
    BaseValue
        (LengthSupported
            { num : Supported
            , pct : Supported
            }
        )
    -> Style
strokeDasharray (Value val) =
    AppendProperty ("stroke-dasharray:" ++ val)


{-| Sets [`stroke-dashoffset`](https://css-tricks.com/almanac/properties/s/stroke-dashoffset/)

    strokeDashoffset zero

    strokeDashoffset (num 100)

    strokeDashoffset (pct 25)

-}
strokeDashoffset :
    BaseValue
        { zero : Supported
        , calc : Supported
        , num : Supported
        , pct : Supported
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
    BaseValue
        { butt : Supported
        , square : Supported
        , round : Supported
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


{-| The `square` value used by properties such as [`strokeLinecap`](#strokeLinecap),
[`listStyle`](#listStyle),
and [`listStyleType`](#listStyleType).

    strokeLinecap square

    listStyleType square

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
    BaseValue
        (LengthSupported
            { num : Supported
            , pct : Supported
            }
        )
    -> Style
strokeWidth (Value val) =
    AppendProperty ("stroke-width:" ++ val)


{-| Sets [`stroke-align`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-align)

**Note:** This function accepts `inset_` rather than `inset` because
[`inset` is already a function](#inset).

      strokeAlign center
      strokeAlign inset_
      strokeAlign outset

-}
strokeAlign :
    BaseValue
        { center : Supported
        , inset_ : Supported
        , outset : Supported
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
    BaseValue
        { boundingBox : Supported
        , slice : Supported
        , clone : Supported
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


{-| A `slice` value for the [`strokeBreak`](#strokeBreak) and [`boxDecorationBreak`](#boxDecorationBreak) properties.

      strokeBreak slice

      boxDecorationbreak clone

-}
slice : Value { provides | slice : Supported }
slice =
    Value "slice"


{-| A `clone` value for the [`strokeBreak`](#strokeBreak) and [`boxDecorationBreak`](#boxDecorationBreak) properties.

      strokeBreak clone

      boxDecorationBreak clone

-}
clone : Value { provides | clone : Supported }
clone =
    Value "clone"


{-| Sets [`stroke-color`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-color)

    strokeColor (rgb 0 100 44)

    strokeColor (hex "#FF9E2C")

-}
strokeColor : BaseValue Color -> Style
strokeColor (Value val) =
    AppendProperty ("stroke-color:" ++ val)


{-| Sets [`stroke-image`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-image)

    strokeImage (url "#svg-pattern")

    strokeImage (url "http://www.example.com/chicken.jpg")

-}
strokeImage :
    BaseValue
        { url : Supported
        , none : Supported
        }
    -> Style
strokeImage (Value value) =
    AppendProperty ("stroke-image:" ++ value)


{-| Sets [`stroke-miterlimit`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-miterlimit)

    strokeMiterlimit (num 4)

-}
strokeMiterlimit :
    BaseValue
        { num : Supported
        }
    -> Style
strokeMiterlimit (Value val) =
    AppendProperty ("stroke-miterlimit:" ++ val)


{-| Sets [`stroke-opacity`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-opacity)

    strokeOpacity (num 0.5)

-}
strokeOpacity :
    BaseValue
        { num : Supported
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
    BaseValue
        { matchParent : Supported
        , fillBox : Supported
        , strokeBox : Supported
        , contentBox : Supported
        , paddingBox : Supported
        , borderBox : Supported
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
    BaseValue
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
        )
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
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , right_ : Supported
            , center : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , top_ : Supported
                , bottom_ : Supported
                , center : Supported
                }
            )
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
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
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
    BaseValue
        { repeat : Supported
        , repeatX : Supported
        , repeatY : Supported
        , space : Supported
        , round : Supported
        , noRepeat : Supported
        }
    -> Style
strokeRepeat (Value repeatVal) =
    AppendProperty ("stroke-repeat:" ++ repeatVal)


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
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , cover : Supported
            }
        )
    -> Style
strokeSize (Value sizeVal) =
    AppendProperty ("stroke-size:" ++ sizeVal)


{-| Sets [`stroke-size`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-size).

    strokeSize2 (px 300) (px 100)

    strokeSize2 auto (px 400)

If you only want to set the width, use [`strokeImage`](#strokeImage) instead.

-}
strokeSize2 :
    Value
        (LengthSupported
            { pct : Supported
            , auto : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , auto : Supported
                }
            )
    -> Style
strokeSize2 (Value widthVal) (Value heightVal) =
    AppendProperty ("stroke-size:" ++ widthVal ++ " " ++ heightVal)


{-| Sets [`stroke-dash-corner`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-dash-corner).

    strokeDashCorner none

    strokeDashCorner (px 10)

    strokeDashCorner (em 5)

-}
strokeDashCorner :
    BaseValue
        (LengthSupported
            { none : Supported
            , pct : Supported
            , auto : Supported
            , cover : Supported
            }
        )
    -> Style
strokeDashCorner (Value sizeVal) =
    AppendProperty ("stroke-dash-corner:" ++ sizeVal)


{-| Sets [`stroke-linejoin`](https://www.w3.org/TR/fill-stroke-3/#propdef-stroke-linejoin).

    strokeLinejoin crop

    strokeLinejoin arcs

    strokeLinejoin miter

**Note:** if you only want to specifiy the rendering of the cap of a corner you need to use [`strokeLinejoin2`](#strokeLinejoin2)
and set it's first value to `miter` like so: `strokeLinejoin2 miter bevel`.

-}
strokeLinejoin :
    BaseValue
        { crop : Supported
        , arcs : Supported
        , miter : Supported
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
    BaseValue
        { none : Supported
        , stretch : Supported
        , compress : Supported
        , dashes : Supported
        , gaps : Supported
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


{-| The [`paint-order`](https://css-tricks.com/almanac/properties/p/paint-order/) property.

This one-argument version indicates which parts of text and shape graphics are
painted first, followed by the other two in their relative default order.

    paintOrder normal -- normal paint order.

    paintOrder2 fill_ stroke -- fill, stroke, then markers.

    paintOrder3 markers stroke fill_ -- markers, stroke, then fill.

-}
paintOrder :
    BaseValue
        { normal : Supported
        , stroke : Supported
        , markers : Supported
        }
    -> Style
paintOrder (Value val) =
    AppendProperty ("paint-order:" ++ val)


{-| The [`paint-order`](https://css-tricks.com/almanac/properties/p/paint-order/) property.

This two-argument version indicates which parts of text and shape graphics are
painted first, followed by the other remaining one.

    paintOrder2 fill_ stroke -- fill, stroke, then markers.

-}
paintOrder2 :
    Value
        { fill_ : Supported
        , stroke : Supported
        , markers : Supported
        }
    ->
        Value
            { fill_ : Supported
            , stroke : Supported
            , markers : Supported
            }
    -> Style
paintOrder2 (Value val1) (Value val2) =
    AppendProperty ("paint-order:" ++ val1 ++ " " ++ val2)


{-| The [`paint-order`](https://css-tricks.com/almanac/properties/p/paint-order/) property.

This three-argument version explicitly indicates in which order should all the parts of text
and shape graphics be painted.

    paintOrder3 markers stroke fill_ -- markers, stroke, then fill.

-}
paintOrder3 :
    Value
        { fill_ : Supported
        , stroke : Supported
        , markers : Supported
        }
    ->
        Value
            { fill_ : Supported
            , stroke : Supported
            , markers : Supported
            }
    ->
        Value
            { fill_ : Supported
            , stroke : Supported
            , markers : Supported
            }
    -> Style
paintOrder3 (Value val1) (Value val2) (Value val3) =
    AppendProperty ("paint-order:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| Provides the `markers` value for [`paintOrder`](#paintOrder).

    paintOrder markers

-}
markers : Value { provides | markers : Supported }
markers =
    Value "markers"


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule : BaseValue LineWidth -> Style
columnRule (Value widthVal) =
    AppendProperty ("column-rule:" ++ widthVal)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule2 : Value LineWidth -> Value LineStyle -> Style
columnRule2 (Value widthVal) (Value styleVal) =
    AppendProperty ("column-rule:" ++ widthVal ++ " " ++ styleVal)


{-| Sets [`column-rule`](https://css-tricks.com/almanac/properties/c/column-rule/).
This is a shorthand for the [`columnRuleWidth`](#columnRuleWidth),
[`columnRuleStyle`](#columnRuleStyle), and [`columnRuleColor`](#columnRuleColor)
properties.

    columnRule thin

    columnRule2 thin solid

    columnRule3 thin solid (hex "#000000")

-}
columnRule3 : Value LineWidth -> Value LineStyle -> Value Color -> Style
columnRule3 (Value widthVal) (Value styleVal) (Value colorVal) =
    AppendProperty ("column-rule:" ++ widthVal ++ " " ++ styleVal ++ " " ++ colorVal)



-- TRANSFORM


{-| A type alias used to accept a [transform-function](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function)
among other values.
-}
type alias TransformFunctionSupported supported =
    { supported
        | matrix : Supported
        , matrix3d : Supported
        , translate : Supported
        , translate2 : Supported
        , translateX : Supported
        , translateY : Supported
        , translateZ : Supported
        , translate3d : Supported
        , scale_ : Supported
        , scale2_ : Supported
        , scaleX : Supported
        , scaleY : Supported
        , scaleZ : Supported
        , scale3d : Supported
        , skew : Supported
        , skew2 : Supported
        , skewX : Supported
        , skewY : Supported
        , rotate_ : Supported
        , rotateX : Supported
        , rotateY : Supported
        , rotateZ : Supported
        , rotate3d : Supported
        , perspective_ : Supported
    }


{-| A type alias used to accept a [transform-function](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function).
-}
type alias TransformFunction =
    TransformFunctionSupported {}


{-| The [`transform`](https://css-tricks.com/almanac/properties/t/transform/) property.

    transform none
    transform (matrix 1.0 2.0 3.0 4.0 5.0 6.0)
    transform (matrix3d 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1)
    transform (translate (px 12))
    transform (translate2 (px 12) (pct 50))
    transform (translateX (em 2))
    transform (translateY (in 3))
    transform (translateZ (px 2))
    transform (translate3d (px 12) (pct 50) (em 3))
    transform (scale_ 2)
    transform (scale2_ 2, 0.5)
    transform (scaleX 2)
    transform (scaleY 0.5)
    transform (scaleZ 0.3)
    transform (scale3d 2.5 1.2 0.3)
    transform (skew (deg 20))
    transform (skew2 (deg 30) (deg 20))
    transform (skewX (deg 30))
    transform (skewY (rad 1.07))
    transform (rotate_ (turn 0.5))
    transform (rotateX (deg 10))
    transform (rotateY (deg 10))
    transform (rotateZ (deg 10))
    transform (rotate3d 1 2.0 3.0 (deg 10))
    transform (perspective_ (px 17))

-}
transform : BaseValue (TransformFunctionSupported { none : Supported }) -> Style
transform (Value val) =
    AppendProperty ("transform:" ++ val)


{-| Sets [`transform`](https://css-tricks.com/almanac/properties/t/transform/)
with a series of transform-functions.

    transforms (translate (px 12)) [ scale_ 2, skew (deg 20) ]

-}
transforms :
    Value TransformFunction
    -> List (Value TransformFunction)
    -> Style
transforms head rest =
    AppendProperty ("transform:" ++ plusListToString head rest)


{-| Named after the plus symbol in the CSS specification [CSS-VALUES-3].
-}
plusListToString : Value a -> List (Value a) -> String
plusListToString head rest =
    (head :: rest)
        |> List.map unpackValue
        |> String.join " "



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
    -> Value { provides | matrix3d : Supported }
matrix3d a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 d3 a4 b4 c4 d4 =
    Value
        ("matrix3d("
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
    Value Length
    -> Value { provides | translate : Supported }
translate (Value valX) =
    Value ("translate(" ++ valX ++ ")")


{-| Sets `translate` value for usage with [`transform`](#transform).

    transform (translate (px 10) (px 20))

-}
translate2 :
    Value Length
    -> Value Length
    -> Value { provides | translate2 : Supported }
translate2 (Value valX) (Value valY) =
    Value ("translate(" ++ valX ++ "," ++ valY ++ ")")


{-| Sets `translateX` value for usage with [`transform`](#transform).

    transform (translateX (px 10))

-}
translateX :
    Value Length
    -> Value { provides | translateX : Supported }
translateX (Value valX) =
    Value ("translateX(" ++ valX ++ ")")


{-| Sets `translateY` value for usage with [`transform`](#transform).

    transform (translateY (px 10))

-}
translateY :
    Value Length
    -> Value { provides | translateY : Supported }
translateY (Value valY) =
    Value ("translateY(" ++ valY ++ ")")


{-| Sets `translateZ` value for usage with [`transform`](#transform).

    transform (translateZ (px 10))

-}
translateZ :
    Value Length
    -> Value { provides | translateZ : Supported }
translateZ (Value valZ) =
    Value ("translateZ(" ++ valZ ++ ")")


{-| Sets `translate3d` value for usage with [`transform`](#transform).

    transform (translate3d (px 12) (pct 50) (em 3))

-}
translate3d :
    Value
        (LengthSupported
            { pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
    -> Value Length
    -> Value { provides | translate3d : Supported }
translate3d (Value valX) (Value valY) (Value valZ) =
    Value ("translate3d(" ++ valX ++ "," ++ valY ++ "," ++ valZ ++ ")")



-- SCALING (resizing)


{-| The [`scale`](https://css-tricks.com/almanac/properties/s/scale) property.

This one-argument version lets you set a global value, `none` or
a `num` that will scale the element by both X and Y axes
(equivalent to [`scale_`](#scale_)).

    scale none

    scale (num 3)

    scale2 (num 1) (num 3)

    scale3 (num 1) (num 3) (num 4)

-}
scale :
    BaseValue
        { num : Supported
        , none : Supported
        }
    -> Style
scale (Value val) =
    AppendProperty ("scale:" ++ val)


{-| The [`scale`](https://css-tricks.com/almanac/properties/s/scale) property.

This two-argument version lets you specify scaling in X and Y axes
(equivalent to [`scale2_`](#scale2_)).

    scale2 (num 1) (num 3)

-}
scale2 :
    Value
        { num : Supported
        }
    ->
        Value
            { num : Supported
            }
    -> Style
scale2 (Value xVal) (Value yVal) =
    AppendProperty ("scale:" ++ xVal ++ " " ++ yVal)


{-| The [`scale`](https://css-tricks.com/almanac/properties/s/scale) property.

This three-argument version lets you specify scaling in X, Y and Z axes
(equivalent to [`scale3d`](#scale3d)).

    scale3 (num 1) (num 3) (num 4)

-}
scale3 :
    Value
        { num : Supported
        }
    ->
        Value
            { num : Supported
            }
    ->
        Value
            { num : Supported
            }
    -> Style
scale3 (Value xVal) (Value yVal) (Value zVal) =
    AppendProperty ("scale:" ++ xVal ++ " " ++ yVal ++ " " ++ zVal)


{-| Sets `scale` value for usage with [`transform`](#transform).

    transform (scale_ 0.7)

This is called `scale_` instead of `scale` because [`scale` is already a function](#scale).

-}
scale_ : Float -> Value { provides | scale_ : Supported }
scale_ val =
    Value ("scale(" ++ String.fromFloat val ++ ")")


{-| Sets `scale` value for usage with [`transform`](#transform).

    transform (scale2_ 0.7 0.7)

This is called `scale2_` instead of `scale2` because [`scale2` is already a function](#scale2).

-}
scale2_ : Float -> Float -> Value { provides | scale2_ : Supported }
scale2_ valX valY =
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
scaleZ valZ =
    Value ("scaleZ(" ++ String.fromFloat valZ ++ ")")


{-| Sets `scale3d` value for usage with [`transform`](#transform).

    transform (scale3d 2 0.7 0.2)

-}
scale3d :
    Float
    -> Float
    -> Float
    -> Value { provides | scale3d : Supported }
scale3d valX valY valZ =
    Value ("scale3d(" ++ String.fromFloat valX ++ "," ++ String.fromFloat valY ++ "," ++ String.fromFloat valZ ++ ")")



-- SKEWING (distortion)


{-| Sets `skew` value for usage with [`transform`](#transform).

    transform (skew (deg 30))

-}
skew :
    Value Angle
    -> Value { provides | skew : Supported }
skew (Value angle) =
    Value ("skew(" ++ angle ++ ")")


{-| Sets `skew` value for usage with [`transform`](#transform).

    transform (skew2 (deg 30) (deg 10))

-}
skew2 :
    Value Angle
    -> Value Angle
    -> Value { provides | skew2 : Supported }
skew2 (Value angle1) (Value angle2) =
    Value ("skew(" ++ angle1 ++ "," ++ angle2 ++ ")")


{-| Sets `skewX` value for usage with [`transform`](#transform).

    transform (skewX (deg 30))

-}
skewX :
    Value Angle
    -> Value { provides | skewX : Supported }
skewX (Value angle) =
    Value ("skewX(" ++ angle ++ ")")


{-| Sets `skewY` value for usage with [`transform`](#transform).

    transform (skewY (deg 30))

-}
skewY :
    Value Angle
    -> Value { provides | skewY : Supported }
skewY (Value angle) =
    Value ("skewY(" ++ angle ++ ")")



-- ROTATION


{-| The [`rotate`](https://css-tricks.com/almanac/properties/r/rotate/) property.

This one-argument version lets you set a global variable, `none`, or angle.

    rotate none

    rotate inherit

    rotate (deg 60)

    rotate2 x (deg 50)

    rotate2 y (deg 100)

    rotate2 (vec3 1 2 10) (deg 100)

-}
rotate :
    BaseValue
        (AngleSupported
            { none : Supported
            }
        )
    -> Style
rotate (Value value) =
    AppendProperty ("rotate:" ++ value)


{-| The [`rotate`](https://css-tricks.com/almanac/properties/r/rotate/) property.

This two-argument version lets you set an axis or a vector, then an angle value.

    rotate2 x (deg 50)

    rotate2 y (deg 100)

    rotate2 (vec3 1 2 10) (deg 100)

-}
rotate2 :
    Value
        { x : Supported
        , y : Supported
        , z : Supported
        , vec3 : Supported
        }
    -> Value Angle
    -> Style
rotate2 (Value axisOrVecVal) (Value angleVal) =
    AppendProperty ("rotate:" ++ axisOrVecVal ++ " " ++ angleVal)


{-| Sets `rotate` value for usage with [`transform`](#transform).

    transform (rotate_ (deg 30))

This is called `rotate_` instead of `rotate` because [`rotate` is already a function](#rotate).

-}
rotate_ :
    Value Angle
    -> Value { provides | rotate_ : Supported }
rotate_ (Value angle) =
    Value ("rotate(" ++ angle ++ ")")


{-| Sets `rotateX` value for usage with [`transform`](#transform).

    transform (rotateX (deg 30))

-}
rotateX :
    Value Angle
    -> Value { provides | rotateX : Supported }
rotateX (Value angle) =
    Value ("rotateX(" ++ angle ++ ")")


{-| Sets `rotateY` value for usage with [`transform`](#transform).

    transform (rotateY (deg 30))

-}
rotateY :
    Value Angle
    -> Value { provides | rotateY : Supported }
rotateY (Value angle) =
    Value ("rotateY(" ++ angle ++ ")")


{-| Sets `rotateZ` value for usage with [`transform`](#transform).

    transform (rotateZ (deg 30))

-}
rotateZ :
    Value Angle
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
    -> Value Angle
    -> Value { provides | rotate3d : Supported }
rotate3d valX valY valZ (Value angle) =
    Value
        ("rotate3d("
            ++ String.fromFloat valX
            ++ ","
            ++ String.fromFloat valY
            ++ ","
            ++ String.fromFloat valZ
            ++ ","
            ++ angle
            ++ ")"
        )


{-| A vector consisting of three values.

Sets the vector values in [`rotate2`](#rotate2).

    rotate2 (vec3 1 2 3) (deg 100)

-}
vec3 : Float -> Float -> Float -> Value { provides | vec3 : Supported }
vec3 vec1Val vec2Val vec3Val =
    Value
        (String.fromFloat vec1Val
            ++ " "
            ++ String.fromFloat vec2Val
            ++ " "
            ++ String.fromFloat vec3Val
        )


{-| Sets `z` value for usage with [`rotate2`](#rotate2).

    rotate z (deg 100)

-}
z : Value { provides | z : Supported }
z =
    Value "z"



-- PERSPECTIVE


{-| The [`perspective`](https://css-tricks.com/almanac/properties/p/perspective/) property.

Negative values are not supported and any value smaller than 1px is clamped to 1px.

    perspective none

    perspective (px 100)

    perspective (rem 50)

-}
perspective :
    BaseValue
        (LengthSupported
            { none : Supported
            }
        )
    -> Style
perspective (Value val) =
    AppendProperty ("perspective:" ++ val)


{-| The [`perspective-origin`](https://css-tricks.com/almanac/properties/p/perspective-origin/) property.

This one-argument version either supports a global value or the x-position.

    perspectiveOrigin inherit

    perspectiveOrigin left_

    perspectiveOrigin (pct 50)

    perspectiveOrigin2 left_ center

    perspectiveOrigin2 (rem 50) (pct 20)

-}
perspectiveOrigin :
    BaseValue
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , center : Supported
            , right_ : Supported
            }
        )
    -> Style
perspectiveOrigin (Value val) =
    AppendProperty ("perspective-origin:" ++ val)


{-| The [`perspective-origin`](https://css-tricks.com/almanac/properties/p/perspective-origin/) property.

This two-argument version takes an X position and then a Y position.

    pperspectiveOrigin2 left_ center

    perspectiveOrigin2 (rem 50) (pct 20)

-}
perspectiveOrigin2 :
    Value
        (LengthSupported
            { pct : Supported
            , left_ : Supported
            , center : Supported
            , right_ : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { pct : Supported
                , top_ : Supported
                , center : Supported
                , bottom_ : Supported
                }
            )
    -> Style
perspectiveOrigin2 (Value xVal) (Value yVal) =
    AppendProperty ("perspective-origin:" ++ xVal ++ " " ++ yVal)


{-| Sets `perspective` value for usage with [`transform`](#transform).

    transform (perspective_ (px 17))

The value is called `perspective_` instead of `perspective` because
[`perspective`](#perspective) is already a function.

-}
perspective_ :
    Value Length
    -> Value { provides | perspective_ : Supported }
perspective_ (Value length) =
    Value ("perspective(" ++ length ++ ")")



-- TIME UNITS --


{-| The [`s`](https://developer.mozilla.org/en-US/docs/Web/CSS/time) time unit.

    animationDuration (s 1)

-}
s : Float -> Value { provides | s : Supported }
s value =
    Value (String.fromFloat value ++ "s")


{-| The [`ms`](https://developer.mozilla.org/en-US/docs/Web/CSS/time) time unit.

    animationDuration (ms 120)

-}
ms : Float -> Value { provides | ms : Supported }
ms value =
    Value (String.fromFloat value ++ "ms")



-- ANIMATION --


{-| The [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name) property.

    animationName (customIdent "pulse") []

-}
animationName :
    BaseValue
        { none : Supported
        , string : Supported
        , customIdent : Supported
        }
    -> Style
animationName (Value val) =
    AppendProperty ("animation-name:" ++ val)


{-| The [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name) property.

    animationNames (customIdent "pulse") []

-}
animationNames :
    Value
        { none : Supported
        , string : Supported
        , customIdent : Supported
        }
    ->
        List
            (Value
                { none : Supported
                , string : Supported
                , customIdent : Supported
                }
            )
    -> Style
animationNames head rest =
    AppendProperty ("animation-name:" ++ hashListToString head rest)


{-| The [`animation-duration`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-duration) property.

    animationDuration (s 1)

-}
animationDuration : BaseValue Time -> Style
animationDuration (Value val) =
    AppendProperty ("animation-duration:" ++ val)


{-| The [`animation-duration`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-duration) property.

    animationDurations (s 1) [ ms 300, s 4.5 ]

-}
animationDurations : Value Time -> List (Value Time) -> Style
animationDurations head rest =
    AppendProperty ("animation-duration:" ++ hashListToString head rest)


{-| The [`animation-timing-function`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function) property.

    animationTimingFunction linear

-}
animationTimingFunction : BaseValue EasingFunction -> Style
animationTimingFunction (Value val) =
    AppendProperty ("animation-timing-function:" ++ val)


{-| The [`animation-timing-function`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function) property.

    animationTimingFunctions linear [ cubicBezier 0.42 0 0.38 1, stepEnd ]

-}
animationTimingFunctions : Value EasingFunction -> List (Value EasingFunction) -> Style
animationTimingFunctions head rest =
    AppendProperty ("animation-timing-function:" ++ hashListToString head rest)


{-| The [`animation-iteration-count`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count) property.

    animationIterationCount (num 3.5)

    animationIterationCount infinite

-}
animationIterationCount :
    BaseValue
        { infinite : Supported
        , num : Supported
        , zero : Supported
        , calc : Supported
        }
    -> Style
animationIterationCount (Value val) =
    AppendProperty ("animation-iteration-count:" ++ val)


{-| The [`animation-iteration-count`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count) property.

    animationIterationCounts (num 3.5) [ infinte, zero ]

-}
animationIterationCounts :
    Value
        { infinite : Supported
        , num : Supported
        , zero : Supported
        , calc : Supported
        }
    ->
        List
            (Value
                { infinite : Supported
                , num : Supported
                , zero : Supported
                , calc : Supported
                }
            )
    -> Style
animationIterationCounts head rest =
    AppendProperty ("animation-iteration-count:" ++ hashListToString head rest)


{-| The [`animation-direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-direction) property.

    animationDirection reverse

-}
animationDirection :
    BaseValue
        { normal : Supported
        , reverse : Supported
        , alternate : Supported
        , alternateReverse : Supported
        }
    -> Style
animationDirection (Value val) =
    AppendProperty ("animation-direction:" ++ val)


{-| The [`animation-direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-direction) property.

    animationDirection reverse [ normal, alternate, alternateReverse ]

-}
animationDirections :
    Value
        { normal : Supported
        , reverse : Supported
        , alternate : Supported
        , alternateReverse : Supported
        }
    ->
        List
            (Value
                { normal : Supported
                , reverse : Supported
                , alternate : Supported
                , alternateReverse : Supported
                }
            )
    -> Style
animationDirections head rest =
    AppendProperty ("animation-direction:" ++ hashListToString head rest)


{-| The [`animation-play-state`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state) property.

    animationPlayState running

-}
animationPlayState :
    BaseValue
        { running : Supported
        , paused : Supported
        }
    -> Style
animationPlayState (Value val) =
    AppendProperty ("animation-play-state:" ++ val)


{-| The [`animation-play-state`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state) property.

    animationPlayStates running [ paused ]

-}
animationPlayStates :
    Value
        { running : Supported
        , paused : Supported
        }
    ->
        List
            (Value
                { running : Supported
                , paused : Supported
                }
            )
    -> Style
animationPlayStates head rest =
    AppendProperty ("animation-play-state:" ++ hashListToString head rest)


{-| The [`animation-delay`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay) property.

    animationDelay (s 1)

-}
animationDelay : BaseValue Time -> Style
animationDelay (Value val) =
    AppendProperty ("animation-delay:" ++ val)


{-| The [`animation-delay`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay) property.

    animationDelays (s 1) [ ms 300, s 4.5 ]

-}
animationDelays : Value Time -> List (Value Time) -> Style
animationDelays head rest =
    AppendProperty ("animation-delay:" ++ hashListToString head rest)


{-| The [`animation-fill-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode) property.

    animationFillMode forwards

-}
animationFillMode :
    BaseValue
        { none : Supported
        , forwards : Supported
        , backwards : Supported
        , both : Supported
        }
    -> Style
animationFillMode (Value val) =
    AppendProperty ("animation-fill-mode:" ++ val)


{-| The [`animation-fill-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode) property.

    animationFillModes forwards [ none, both, backwards ]

-}
animationFillModes :
    Value
        { none : Supported
        , forwards : Supported
        , backwards : Supported
        , both : Supported
        }
    ->
        List
            (Value
                { none : Supported
                , forwards : Supported
                , backwards : Supported
                , both : Supported
                }
            )
    -> Style
animationFillModes head rest =
    AppendProperty ("animation-fill-mode:" ++ hashListToString head rest)



-- ANIMATION VALUES --


{-| A type alias used to accept an [easing-function](https://www.w3.org/TR/css-easing-1/#typedef-easing-function)
among other values.
-}
type alias EasingFunctionSupported supported =
    { supported
        | linear : Supported
        , ease : Supported
        , easeIn : Supported
        , easeOut : Supported
        , easeInOut : Supported
        , cubicBezier : Supported
        , stepStart : Supported
        , stepEnd : Supported
        , steps : Supported
    }


{-| A type alias used to accept an [easing-function](https://www.w3.org/TR/css-easing-1/#typedef-easing-function).
-}
type alias EasingFunction =
    EasingFunctionSupported {}


{-| The `linear` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction linear

-}
linear : Value { provides | linear : Supported }
linear =
    Value "linear"


{-| The `ease` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction ease

-}
ease : Value { provides | ease : Supported }
ease =
    Value "ease"


{-| The `ease-in` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction easeIn

-}
easeIn : Value { provides | easeIn : Supported }
easeIn =
    Value "ease-in"


{-| The `ease-out` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction easeOut

-}
easeOut : Value { provides | easeOut : Supported }
easeOut =
    Value "ease-out"


{-| The `ease-in-out` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction easeInOut

-}
easeInOut : Value { provides | easeInOut : Supported }
easeInOut =
    Value "ease-in-out"


{-| Produces the `cubic-bezier()` value used for properties such as [`animationTimingFunction`](#animationTimingFunction)

    animationTimingFunction (cubicBezier 0.2 0 0.5 1)

-}
cubicBezier : Float -> Float -> Float -> Float -> Value { provides | cubicBezier : Supported }
cubicBezier x1 y1 x2 y2 =
    Value
        ("cubic-bezier("
            ++ String.fromFloat x1
            ++ ","
            ++ String.fromFloat y1
            ++ ","
            ++ String.fromFloat x2
            ++ ","
            ++ String.fromFloat y2
            ++ ")"
        )


{-| The `step-start` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction stepStart

-}
stepStart : Value { provides | stepStart : Supported }
stepStart =
    Value "step-start"


{-| The `step-end` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction stepEnd

-}
stepEnd : Value { provides | stepEnd : Supported }
stepEnd =
    Value "step-end"


{-| Produces the `steps()` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction (steps 3)

-}
steps : Int -> Value { provides | steps : Supported }
steps value =
    Value ("steps(" ++ String.fromInt value ++ ")")


{-| Produces the `steps()` value used for properties such as [`animationTimingFunction`](#animationTimingFunction).

    animationTimingFunction (steps2 3 jumpStart)

-}
steps2 :
    Int
    ->
        Value
            { jumpStart : Supported
            , jumpEnd : Supported
            , jumpNone : Supported
            , jumpBoth : Supported
            , start : Supported
            , end : Supported
            }
    -> Value { provides | steps : Supported }
steps2 value (Value stepPosition) =
    Value ("steps(" ++ String.fromInt value ++ "," ++ stepPosition ++ ")")


{-| The `jump-start` value used for functions like [`step2`](#step2)

    steps2 3 jumpStart

-}
jumpStart : Value { provides | jumpStart : Supported }
jumpStart =
    Value "jump-start"


{-| The `jump-end` value used for functions like [`step2`](#step2)

    steps2 3 jumpEnd

-}
jumpEnd : Value { provides | jumpEnd : Supported }
jumpEnd =
    Value "jump-end"


{-| The `jump-none` value used for functions like [`step2`](#step2)

    steps2 3 jumpNone

-}
jumpNone : Value { provides | jumpNone : Supported }
jumpNone =
    Value "jump-none"


{-| The `jump-both` value used for functions like [`step2`](#step2)

    steps2 3 jumpBoth

-}
jumpBoth : Value { provides | jumpBoth : Supported }
jumpBoth =
    Value "jump-both"


{-| The `infinite` value used for functions like [`animationIterationCount`](#animationIterationCount)

    animationIterationCount infinite

-}
infinite : Value { provides | infinite : Supported }
infinite =
    Value "infinite"


{-| The `reverse` value used for functions like [`animationDirection`](#animationDirection)

    animationDirection reverse

-}
reverse : Value { provides | reverse : Supported }
reverse =
    Value "reverse"


{-| The `alternate` value used for functions like [`animationDirection`](#animationDirection)

    animationDirection alternate

-}
alternate : Value { provides | alternate : Supported }
alternate =
    Value "alternate"


{-| The `alternate-reverse` value used for functions like [`animationDirection`](#animationDirection)

    animationDirection alternateReverse

-}
alternateReverse : Value { provides | alternateReverse : Supported }
alternateReverse =
    Value "alternate-reverse"


{-| The `running` value used for functions like [`animationPlayState`](#animationPlayState)

    animationPlayState running

-}
running : Value { provides | running : Supported }
running =
    Value "running"


{-| The `paused` value used for functions like [`animationPlayState`](#animationPlayState)

    animationPlayState paused

-}
paused : Value { provides | paused : Supported }
paused =
    Value "paused"


{-| The `forwards` value used for functions like [`animationFillMode`](#animationFillMode)

    animationFillMode forwards

-}
forwards : Value { provides | forwards : Supported }
forwards =
    Value "forwards"


{-| The `backwards` value used for functions like [`animationFillMode`](#animationFillMode)

    animationFillMode backwards

-}
backwards : Value { provides | backwards : Supported }
backwards =
    Value "backwards"


{-| Named after the hash mark in the CSS specification [CSS-VALUES-3].
-}
hashListToString : Value a -> List (Value a) -> String
hashListToString head rest =
    (head :: rest)
        |> List.map unpackValue
        |> String.join ","


{-| Sets [`clear`](https://css-tricks.com/almanac/properties/c/clear/) property.

    clear none

    clear both

    clear left_

    clear right_

    clear inlineStart

    clear inlineEnd

-}
clear :
    BaseValue
        { none : Supported
        , left_ : Supported
        , right_ : Supported
        , both : Supported
        , inlineStart : Supported
        , inlineEnd : Supported
        }
    -> Style
clear (Value val) =
    AppendProperty ("clear:" ++ val)


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
    BaseValue
        { num : Supported
        , zero : Supported
        , calc : Supported
        , pct : Supported
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
    BaseValue
        { pct : Supported
        , zero : Supported
        , num : Supported
        , normal : Supported
        , calc : Supported
        , auto : Supported
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
    BaseValue
        (LengthSupported
            { pct : Supported
            , normal : Supported
            , num : Supported
            }
        )
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
    BaseValue
        (LengthSupported
            { normal : Supported
            }
        )
    -> Style
letterSpacing (Value val) =
    AppendProperty ("letter-spacing:" ++ val)


{-| The [`width`](https://css-tricks.com/almanac/properties/w/width/) property.

    width (px 150)

    width (em 1.5)

    width auto

    width minContent

-}
width :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
width (Value sizeVal) =
    AppendProperty ("width:" ++ sizeVal)


{-| The [`min-width`](https://css-tricks.com/almanac/properties/m/min-width/) property.

    minWidth (px 150)

    minWidth (em 1.5)

    minWidth auto

-}
minWidth :
    BaseValue
        (LengthSupported
            { auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , pct : Supported
            }
        )
    -> Style
minWidth (Value sizeVal) =
    AppendProperty ("min-width:" ++ sizeVal)


{-| The [`max-width`](https://css-tricks.com/almanac/properties/m/max-width/) property.

    maxWidth (px 150)

    maxWidth (em 1.5)

    maxWidth auto

-}
maxWidth :
    BaseValue
        (LengthSupported
            { maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            , none : Supported
            , pct : Supported
            }
        )
    -> Style
maxWidth (Value sizeVal) =
    AppendProperty ("max-width:" ++ sizeVal)


{-| The [`height`](https://css-tricks.com/almanac/properties/h/height/) property.

    height (px 34)

-}
height :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
height (Value val) =
    AppendProperty ("height:" ++ val)


{-| The [`min-height`](https://css-tricks.com/almanac/properties/m/min-height/) property.

    minHeight (px 20)

-}
minHeight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , auto : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
minHeight (Value val) =
    AppendProperty ("min-height:" ++ val)


{-| The [`max-height`](https://css-tricks.com/almanac/properties/m/min-height/) property.

    maxHeight (px 20)

-}
maxHeight :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
maxHeight (Value val) =
    AppendProperty ("max-height:" ++ val)


{-| The [`block-size`](https://css-tricks.com/almanac/properties/b/block-size/) property.

    blockSize (px 20)

-}
blockSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
blockSize (Value val) =
    AppendProperty ("block-size:" ++ val)


{-| The [`min-block-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-block-size) property.

    minBlockSize (px 20)

-}
minBlockSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
minBlockSize (Value val) =
    AppendProperty ("min-block-size:" ++ val)


{-| The [`max-block-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-block-size) property.

    maxBlockSize (px 20)

-}
maxBlockSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
maxBlockSize (Value val) =
    AppendProperty ("max-block-size:" ++ val)


{-| The [`inline-size`](https://css-tricks.com/almanac/properties/i/inline-size/) property.

    inlineSize (px 20)

-}
inlineSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
inlineSize (Value val) =
    AppendProperty ("inline-size:" ++ val)


{-| The [`min-inline-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-inline-size) property.

    minInlineSize (px 20)

-}
minInlineSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
minInlineSize (Value val) =
    AppendProperty ("min-inline-size:" ++ val)


{-| The [`max-inline-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-inline-size) property.

    maxInlineSize (px 20)

-}
maxInlineSize :
    BaseValue
        (LengthSupported
            { pct : Supported
            , none : Supported
            , maxContent : Supported
            , minContent : Supported
            , fitContent : Supported
            }
        )
    -> Style
maxInlineSize (Value val) =
    AppendProperty ("max-inline-size:" ++ val)


{-| The `min-content` value used for properties such as:

  - sizing (eg. [`width`](#width), [`height`](#height), [`inlineSize`](#inlineSize))

  - min/max sizing (eg. [`minWidth`](#minWidth), [`maxBlockWidth`](#maxBlockWidth))

  - [`flexBasis`](#flexBasis)

```
width minContent
```

-}
minContent : Value { provides | minContent : Supported }
minContent =
    Value "min-content"


{-| The `max-content` value used for properties such as:

  - sizing (eg. [`width`](#width), [`height`](#height), [`inlineSize`](#inlineSize))

  - min/max sizing (eg. [`minWidth`](#minWidth), [`maxBlockWidth`](#maxBlockWidth))

  - [`flexBasis`](#flexBasis)

```
width maxContent
```

-}
maxContent : Value { provides | maxContent : Supported }
maxContent =
    Value "max-content"


{-| The `fit-content` value used for properties such as:

  - sizing (eg. [`width`](#width), [`height`](#height), [`inlineSize`](#inlineSize))

  - min/max sizing (eg. [`minWidth`](#minWidth), [`maxBlockWidth`](#maxBlockWidth))

  - [`flexBasis`](#flexBasis)

```
width fitContent
```

-}
fitContent : Value { provides | fitContent : Supported }
fitContent =
    Value "fit-content"


{-| Sets [`backface-visibility`](https://css-tricks.com/almanac/properties/b/backface-visibility/)

    backfaceVisibility visible

    backfaceVisibility hidden

-}
backfaceVisibility :
    BaseValue
        { visible : Supported
        , hidden : Supported
        }
    -> Style
backfaceVisibility (Value val) =
    AppendProperty ("backface-visibility" ++ val)


{-| Sets [`bleed`](https://css-tricks.com/almanac/properties/b/bleed/)

    bleed auto

    bleed (pt 10)

-}
bleed :
    BaseValue
        (LengthSupported
            { auto : Supported
            }
        )
    -> Style
bleed (Value val) =
    AppendProperty ("bleed:" ++ val)


{-| Sets [`caret-color`](https://css-tricks.com/almanac/properties/c/caret-color/)

    caretColor (hex "#60b5cc")

    caretColor (rgb 96 181 204)

    caretColor (rgba 96 181 204 0.5)

-}
caretColor :
    BaseValue
        (ColorSupported
            { auto : Supported
            }
        )
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
    BaseValue
        { auto : Supported
        , avoid : Supported
        , avoidPage : Supported
        , avoidColumn : Supported
        , avoidRegion : Supported
        }
    -> Style
breakInside (Value val) =
    AppendProperty ("break-inside:" ++ val)


{-| Sets [`box-decoration-break`](https://css-tricks.com/almanac/properties/b/box-decoration-break/)

    boxDecorationBreak slice

    boxDecorationBreak clone

-}
boxDecorationBreak :
    BaseValue
        { slice : Supported
        , clone : Supported
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
    BaseValue
        { auto : Supported
        , block : Supported
        , swap : Supported
        , fallback : Supported
        , optional : Supported
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
    BaseValue
        { none : Supported
        , zero : Supported
        , num : Supported
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
    BaseValue
        { ultraCondensed : Supported
        , extraCondensed : Supported
        , condensed : Supported
        , semiCondensed : Supported
        , normal : Supported
        , semiExpanded : Supported
        , expanded : Supported
        , extraExpanded : Supported
        , ultraExpanded : Supported
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

    hangingPunctuation2 first forceEnd

    hangingPunctuation3 first allowEnd last

-}
hangingPunctuation :
    BaseValue
        { none : Supported
        , first : Supported
        , forceEnd : Supported
        , allowEnd : Supported
        , last : Supported
        }
    -> Style
hangingPunctuation (Value val) =
    AppendProperty ("hanging-punctuation:" ++ val)


{-| Sets [`hanging-punctuation`](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)

    hangingPunctuation2 first forceEnd

-}
hangingPunctuation2 :
    Value
        { first : Supported
        , last : Supported
        }
    ->
        Value
            { first : Supported
            , forceEnd : Supported
            , allowEnd : Supported
            , last : Supported
            }
    -> Style
hangingPunctuation2 (Value val1) (Value val2) =
    AppendProperty ("hanging-punctuation:" ++ val1 ++ " " ++ val2)


{-| Sets [`hanging-punctuation`](https://css-tricks.com/almanac/properties/h/hanging-punctuation/)

    hangingPunctuation3 first allowEnd last

-}
hangingPunctuation3 :
    Value
        { first : Supported
        , last : Supported
        }
    ->
        Value
            { forceEnd : Supported
            , allowEnd : Supported
            }
    ->
        Value
            { first : Supported
            , last : Supported
            }
    -> Style
hangingPunctuation3 (Value val1) (Value val2) (Value val3) =
    AppendProperty ("hanging-punctuation:" ++ val1 ++ " " ++ val2 ++ " " ++ val3)


{-| Sets [`hyphens`](https://css-tricks.com/almanac/properties/h/hyphens/)

    hyphens none

    hyphens manual

    hyphens auto

-}
hyphens :
    BaseValue
        { none : Supported
        , manual : Supported
        , auto : Supported
        }
    -> Style
hyphens (Value val) =
    AppendProperty ("hyphens:" ++ val)


{-| Sets the [`quotes`](https://css-tricks.com/almanac/properties/q/quotes/) property.

This one-argument version can only use keyword or global values.

    quotes none

    quotes inherit

    quotes2 (string "\"") (string "\"")

    quotes4 (string "\"") (string "\"") (string "'") (string "'")

-}
quotes :
    BaseValue
        { none : Supported
        , auto : Supported
        }
    -> Style
quotes (Value val) =
    AppendProperty ("quotes:" ++ val)


{-| Sets the [`quotes`](https://css-tricks.com/almanac/properties/q/quotes/) property.

This 2-argument version sets the starting and closing quotation marks for
a top-level quote (a quote that is not nested within another quote). It only accepts
string values.

    quotes auto

    quotes2 (string "\"") (string "\"") -- "Hey, this is a first-level quote."

    quotes2 (string "'") (string "'") -- 'Hey, this is a first-level quote.'

    quotes2 (string "«") (string "»") -- «Hey, this is a first-level quote.»

-}
quotes2 :
    Value
        { string : Supported
        }
    ->
        Value
            { string : Supported
            }
    -> Style
quotes2 (Value lv1StartQuote) (Value lv1EndQuote) =
    AppendProperty ("quotes:" ++ lv1StartQuote ++ " " ++ lv1EndQuote)


{-| Sets the [`quotes`](https://css-tricks.com/almanac/properties/q/quotes/) property.

This 4-argument version sets the starting and closing quotation marks for both
a top-level quote and a nested quote. It only accepts
string values.

    quotes auto

    quotes2 (string "\"") (string "\"")

    -- "Hey, this is a first-level quote."


    quotes4 (string "\"") (string "\"") (string "\'") (string "\'")

    {- "Hey, this is a first-level quote.
    'And this is someone else I made up for
    a second-level quote!' Yeah, I did that!"
    -}

    quotes4 (string "«") (string "»") (string "👏") (string "🤔")

    {- «Hey, this is a first-level quote.
    👏And this is someone else I made up for
    a second-level quote!🤔 Yeah, I did that!»
    -}

-}
quotes4 :
    Value
        { string : Supported
        }
    ->
        Value
            { string : Supported
            }
    ->
        Value
            { string : Supported
            }
    ->
        Value
            { string : Supported
            }
    -> Style
quotes4 (Value lv1StartQuote) (Value lv1EndQuote) (Value lv2StartQuote) (Value lv2EndQuote) =
    AppendProperty ("quotes:" ++ lv1StartQuote ++ " " ++ lv1EndQuote ++ " " ++ lv2StartQuote ++ " " ++ lv2EndQuote)


{-| Sets the [`text-overflow`](https://css-tricks.com/almanac/properties/t/text-overflow/) property.

`text-overflow` describes how text that gets cut off is signalled to users.

When the one-argument version is used, it sets the end of text (right end for LTR users) that is cut off.

    textOverflow ellipsis

When the two-argument version is used, it specifies how the
text cut-off is displayed at the start (left in LTR) and
the end (right in LTR) of the text.

    textOverflow2 ellipsis ellipsis

-}
textOverflow :
    BaseValue
        { clip : Supported
        , ellipsis : Supported
        }
    -> Style
textOverflow (Value value) =
    AppendProperty ("text-overflow:" ++ value)


{-| Sets the [`text-overflow`](https://css-tricks.com/almanac/properties/t/text-overflow/) property.

`text-overflow` describes how text that gets cut off is signalled to users.

This version specifies how the text cut-off is displayed at the start
(left in LTR) and at the end (right in LTR) of the text.

    textOverflow2 ellipsis ellipsis

-}
textOverflow2 :
    Value
        { clip : Supported
        , ellipsis : Supported
        }
    ->
        Value
            { clip : Supported
            , ellipsis : Supported
            }
    -> Style
textOverflow2 (Value startValue) (Value endValue) =
    AppendProperty ("text-overflow:" ++ startValue ++ " " ++ endValue)


{-| Sets the [`lineBreak`](https://css-tricks.com/almanac/properties/l/line-break/) property.

    lineBreak auto

    lineBreak strict

-}
lineBreak :
    BaseValue
        { auto : Supported
        , loose : Supported
        , normal : Supported
        , strict : Supported
        , anywhere : Supported
        }
    -> Style
lineBreak (Value value) =
    AppendProperty ("line-break:" ++ "value")


{-| Sets `manual` value for usage with [`hyphens`](#hyphens).

    hyphens manual

-}
manual : Value { provides | manual : Supported }
manual =
    Value "manual"


{-| Sets `ellipsis` value for usage with [`textOverflow`](#textOverflow).

    textOverflow ellipsis

-}
ellipsis : Value { provides | ellipsis : Supported }
ellipsis =
    Value "ellipsis"


{-| Sets `loose` value for usage with [`lineBreak`](#lineBreak).

    lineBreak loose

-}
loose : Value { provides | loose : Supported }
loose =
    Value "loose"


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
    BaseValue
        { auto : Supported
        , crispEdges : Supported
        , pixelated : Supported
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
    BaseValue
        { auto : Supported
        , isolate : Supported
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
    BaseValue
        { none : Supported
        , zero : Supported
        , int : Supported
        }
    -> Style
lineClamp (Value val) =
    AppendProperty ("line-clamp:" ++ val)


{-| Sets [`mix-blend-mode`](https://css-tricks.com/almanac/properties/m/mix-blend-mode/)

    mixBlendMode multiply

    mixBlendMode saturation

-}
mixBlendMode :
    BaseValue
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
    -> Style
mixBlendMode (Value val) =
    AppendProperty ("mix-blend-mode:" ++ val)


{-| Sets `scale-down` value for usage with [`objectFit`](#objectFit).

    objectFit scaleDown

-}
scaleDown : Value { provides | scaleDown : Supported }
scaleDown =
    Value "scale-down"


{-| Sets [`object-fit`](https://css-tricks.com/almanac/properties/o/object-fit/)

    objectFit fill_

    objectFit contain_

    objectFit cover

    objectFit scaleDown

    objectFit none

-}
objectFit :
    BaseValue
        { fill_ : Supported
        , contain_ : Supported
        , cover : Supported
        , none : Supported
        , scaleDown : Supported
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
    BaseValue
        (LengthSupported
            { left_ : Supported
            , right_ : Supported
            , center : Supported
            , pct : Supported
            }
        )
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
        (LengthSupported
            { left_ : Supported
            , right_ : Supported
            , center : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { top_ : Supported
                , bottom_ : Supported
                , center : Supported
                , pct : Supported
                }
            )
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
            (LengthSupported
                { pct : Supported
                }
            )
    ->
        Value
            { top_ : Supported
            , bottom_ : Supported
            }
    ->
        Value
            (LengthSupported
                { pct : Supported
                }
            )
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
    BaseValue
        { int : Supported
        }
    -> Style
orphans (Value val) =
    AppendProperty ("orphans:" ++ val)


{-| Sets [`overflow-anchor`](https://css-tricks.com/almanac/properties/o/overflow-anchor/)

    overflowAnchor auto

    overflowAnchor none

-}
overflowAnchor :
    BaseValue
        { auto : Supported
        , none : Supported
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
    BaseValue
        { auto : Supported
        , always : Supported
        , avoid : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
pageBreakBefore (Value val) =
    AppendProperty ("page-break-before:" ++ val)


{-| Sets [`page-break-inside`](https://css-tricks.com/almanac/properties/p/page-break/)

    pageBreakInside auto

    pageBreakInside avoid

-}
pageBreakInside :
    BaseValue
        { auto : Supported
        , avoid : Supported
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
    BaseValue
        { auto : Supported
        , always : Supported
        , avoid : Supported
        , left_ : Supported
        , right_ : Supported
        }
    -> Style
pageBreakAfter (Value val) =
    AppendProperty ("page-break-after:" ++ val)


{-| Sets [`pointer-events`](https://css-tricks.com/almanac/properties/b/pointer-events/)

    pointerEvents none

    pointerEvents auto

-}
pointerEvents :
    BaseValue
        { auto : Supported
        , none : Supported
        , visiblePainted : Supported
        , visibleFill : Supported
        , visibleStroke : Supported
        , visible : Supported
        , painted : Supported
        , fill_ : Supported
        , stroke : Supported
        , all_ : Supported
        }
    -> Style
pointerEvents (Value val) =
    AppendProperty ("pointer-events:" ++ val)


{-| The `visiblePainted` value used by [`pointerEvents`](#pointerEvents)

    pointerEvents visiblePainted

-}
visiblePainted : Value { provides | visiblePainted : Supported }
visiblePainted =
    Value "visiblePainted"


{-| The `visibleFill` value used by [`pointerEvents`](#pointerEvents)

    pointerEvents visibleFill

-}
visibleFill : Value { provides | visibleFill : Supported }
visibleFill =
    Value "visibleFill"


{-| The `visibleStroke` value used by [`pointerEvents`](#pointerEvents)

    pointerEvents visibleStroke

-}
visibleStroke : Value { provides | visibleStroke : Supported }
visibleStroke =
    Value "visibleStroke"


{-| The `painted` value used by [`pointerEvents`](#pointerEvents)

    pointerEvents painted

-}
painted : Value { provides | painted : Supported }
painted =
    Value "painted"



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
    BaseValue
        { auto : Supported
        , smooth : Supported
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
    BaseValue
        Length
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
        Length
    ->
        Value
            Length
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
        Length
    ->
        Value
            Length
    ->
        Value
            Length
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
        Length
    ->
        Value
            Length
    ->
        Value
            Length
    ->
        Value
            Length
    -> Style
scrollMargin4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("scroll-margin:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`scroll-margin-top`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginTop (px 4)

-}
scrollMarginTop :
    BaseValue
        Length
    -> Style
scrollMarginTop (Value value) =
    AppendProperty ("scroll-margin-top:" ++ value)


{-| Sets [`scroll-margin-right`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginRight (px 4)

-}
scrollMarginRight :
    BaseValue
        Length
    -> Style
scrollMarginRight (Value value) =
    AppendProperty ("scroll-margin-right:" ++ value)


{-| Sets [`scroll-margin-bottom`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginBottom (px 4)

-}
scrollMarginBottom :
    BaseValue
        Length
    -> Style
scrollMarginBottom (Value value) =
    AppendProperty ("scroll-margin-bottom:" ++ value)


{-| Sets [`scroll-margin-left`](https://css-tricks.com/almanac/properties/s/scroll-margin/) property.

    scrollMarginLeft (px 4)

-}
scrollMarginLeft :
    BaseValue
        Length
    -> Style
scrollMarginLeft (Value value) =
    AppendProperty ("scroll-margin-left:" ++ value)


{-| Sets [`scroll-margin-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block) property.
The `scrollMarginBlock` property is a shorthand property for setting
`scroll-margin-block-start` and `scroll-margin-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start margin is set to the first value and the block end margin is
set to the second.

    scrollMarginBlock (em 4) -- set both block margins to 4em

    scrollMarginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollMarginBlock :
    BaseValue
        Length
    -> Style
scrollMarginBlock (Value value) =
    AppendProperty ("scroll-margin-block:" ++ value)


{-| Sets [`scroll-margin-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block) property.
The `scrollMarginBlock2` property is a shorthand property for setting
`scroll-margin-block-start` and `scroll-margin-block-end` in a single declaration.

The block start margin is set to the first value and the block end margin is
set to the second.

    scrollMarginBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollMarginBlock2 :
    Value
        Length
    ->
        Value
            Length
    -> Style
scrollMarginBlock2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("scroll-margin-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-margin-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline) property.
The `scrollMarginInline` property is a shorthand property for setting
`scroll-margin-inline-start` and `scroll-margin-inline-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start margin is set to the first value and the inline end margin is
set to the second.

    scrollMarginInline (em 4) -- set both inline margins to 4em

    scrollMarginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollMarginInline :
    BaseValue
        Length
    -> Style
scrollMarginInline (Value value) =
    AppendProperty ("scroll-margin-inline:" ++ value)


{-| Sets [`scroll-margin-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline) property.
The `scrollMarginInline2` property is a shorthand property for setting
`scroll-margin-inline-start` and `scroll-margin-inline-end` in a single declaration.

The inline start margin is set to the first value and the inline end margin is
set to the second.

    scrollMarginInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollMarginInline2 :
    Value
        Length
    ->
        Value
            Length
    -> Style
scrollMarginInline2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("scroll-margin-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block-start) property.

    scrollMarginBlockStart (px 4)

-}
scrollMarginBlockStart :
    BaseValue
        Length
    -> Style
scrollMarginBlockStart (Value value) =
    AppendProperty ("scroll-margin-block-start:" ++ value)


{-| Sets [`scroll-margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-block-end) property.

    scrollMarginBlockEnd (px 4)

-}
scrollMarginBlockEnd :
    BaseValue
        Length
    -> Style
scrollMarginBlockEnd (Value value) =
    AppendProperty ("scroll-margin-block-end:" ++ value)


{-| Sets [`scroll-margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline-start) property.

    scrollMarginInlineStart (px 4)

-}
scrollMarginInlineStart :
    BaseValue
        Length
    -> Style
scrollMarginInlineStart (Value value) =
    AppendProperty ("scroll-margin-inline-start:" ++ value)


{-| Sets [`scroll-margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-margin-inline-end) property.

    scrollMarginInlineEnd (px 4)

-}
scrollMarginInlineEnd :
    BaseValue
        Length
    -> Style
scrollMarginInlineEnd (Value value) =
    AppendProperty ("scroll-margin-inline-end:" ++ value)


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

    scrollPadding (em 4) -- set all paddings to 4em

    scrollPadding2 (em 4) (px 2) -- top & bottom = 4em, right & left = 2px

    scrollPadding3 (em 4) (px 2) (pct 5) -- top = 4em, right = 2px, bottom = 5%, left = 2px

    scrollPadding4 (em 4) (px 2) (pct 5) (px 3) -- top = 4em, right = 2px, bottom = 5%, left = 3px

-}
scrollPadding :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
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
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
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
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
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
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPadding4 (Value valueTop) (Value valueRight) (Value valueBottom) (Value valueLeft) =
    AppendProperty ("scroll-padding:" ++ valueTop ++ " " ++ valueRight ++ " " ++ valueBottom ++ " " ++ valueLeft)


{-| Sets [`scroll-padding-top`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingTop (px 4)

-}
scrollPaddingTop :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingTop (Value value) =
    AppendProperty ("scroll-padding-top:" ++ value)


{-| Sets [`scroll-padding-right`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingRight (px 4)

-}
scrollPaddingRight :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingRight (Value value) =
    AppendProperty ("scroll-padding-right:" ++ value)


{-| Sets [`scroll-padding-bottom`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingBottom (px 4)

-}
scrollPaddingBottom :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBottom (Value value) =
    AppendProperty ("scroll-padding-bottom:" ++ value)


{-| Sets [`scroll-padding-left`](https://css-tricks.com/almanac/properties/s/scroll-padding/) property.

    scrollPaddingLeft (px 4)

-}
scrollPaddingLeft :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingLeft (Value value) =
    AppendProperty ("scroll-padding-left:" ++ value)


{-| Sets [`scroll-padding-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block) property.
The `scroll-padding-block` property is a shorthand property for setting
`scroll-padding-block-start` and `scroll-padding-block-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the block start padding is set to the first value and the block end padding
is set to the second.

    scrollPaddingBlock (em 4) -- set both block paddings to 4em

    scrollPaddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollPaddingBlock :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBlock (Value value) =
    AppendProperty ("scroll-padding-block:" ++ value)


{-| Sets [`scroll-padding-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block) property.
The `scroll-padding-block` property is a shorthand property for setting
`scroll-padding-block-start` and `scroll-padding-block-end` in a single declaration.

The block start padding is set to the first value and the block end padding
is set to the second.

    scrollPaddingBlock2 (em 4) (px 2) -- block start = 4em, block end = 2px

-}
scrollPaddingBlock2 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPaddingBlock2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("scroll-padding-block:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-padding-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline) property.
The `scroll-padding-inline` property is a shorthand property for setting
`scroll-padding-inline-start` and `scroll-padding-inline-end` in a single declaration.

If there is only one argument value, it applies to both sides. If there are two
values, the inline start padding is set to the first value and the inline end padding
is set to the second.

    scrollPaddingInline (em 4) -- set both inline paddings to 4em

    scrollPaddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollPaddingInline :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingInline (Value value) =
    AppendProperty ("scroll-padding-inline:" ++ value)


{-| Sets [`scroll-padding-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline) property.
The `scroll-padding-inline` property is a shorthand property for setting
`scroll-padding-inline-start` and `scroll-padding-inline-end` in a single declaration.

The inline start padding is set to the first value and the inline end padding
is set to the second.

    scrollPaddingInline2 (em 4) (px 2) -- inline start = 4em, inline end = 2px

-}
scrollPaddingInline2 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    ->
        Value
            (LengthSupported
                { auto : Supported
                , pct : Supported
                }
            )
    -> Style
scrollPaddingInline2 (Value valueStart) (Value valueEnd) =
    AppendProperty ("scroll-padding-inline:" ++ valueStart ++ " " ++ valueEnd)


{-| Sets [`scroll-padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block-start) property.

    scrollPaddingBlockStart (px 4)

-}
scrollPaddingBlockStart :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBlockStart (Value value) =
    AppendProperty ("scroll-padding-block-start:" ++ value)


{-| Sets [`scroll-padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-block-end) property.

    scrollPaddingBlockEnd (px 4)

-}
scrollPaddingBlockEnd :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingBlockEnd (Value value) =
    AppendProperty ("scroll-padding-block-end:" ++ value)


{-| Sets [`scroll-padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline-start) property.

    scrollPaddingInlineStart (px 4)

-}
scrollPaddingInlineStart :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingInlineStart (Value value) =
    AppendProperty ("scroll-padding-inline-start:" ++ value)


{-| Sets [`scroll-padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-padding-inline-end) property.

    scrollPaddingInlineEnd (px 4)

-}
scrollPaddingInlineEnd :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
scrollPaddingInlineEnd (Value value) =
    AppendProperty ("scroll-padding-inline-end:" ++ value)


{-| Sets the [`overscroll-behavior`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

This property is a shorthand for setting both `overscroll-behavior-x` and `overscroll-behavior-y`.

    overscrollBehavior auto -- sets both X and Y to auto

    overscrollBehavior2 auto contain -- X = auto, Y = contain.

-}
overscrollBehavior :
    BaseValue
        { auto : Supported
        , contain : Supported
        , none : Supported
        }
    -> Style
overscrollBehavior (Value value) =
    AppendProperty ("overscroll-behavior:" ++ value)


{-| Sets the [`overscroll-behavior`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

This property is a shorthand for setting both `overscroll-behavior-x` and `overscroll-behavior-y`.

    overscrollBehavior2 auto contain -- X = auto, Y = contain.

-}
overscrollBehavior2 :
    Value
        { auto : Supported
        , contain : Supported
        , none : Supported
        }
    ->
        Value
            { auto : Supported
            , contain : Supported
            , none : Supported
            }
    -> Style
overscrollBehavior2 (Value xValue) (Value yValue) =
    AppendProperty ("overscroll-behavior:" ++ xValue ++ " " ++ yValue)


{-| Sets the [`overscroll-behavior-x`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

    overscrollBehaviorX auto

    overscrollBehaviorX contain

-}
overscrollBehaviorX :
    BaseValue
        { auto : Supported
        , contain : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorX (Value value) =
    AppendProperty ("overscroll-behavior-x:" ++ value)


{-| Sets the [`overscroll-behavior-y`](https://css-tricks.com/almanac/properties/o/overscroll-behavior/) property.

    overscrollBehaviorY auto

    overscrollBehaviorY contain

-}
overscrollBehaviorY :
    BaseValue
        { auto : Supported
        , contain : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorY (Value value) =
    AppendProperty ("overscroll-behavior-y:" ++ value)


{-| Sets the [`overscroll-behavior-block`](https://developer.mozilla.org/en-US/docs/Web/CSS/overscroll-behavior-block) property.

    overscrollBehaviorBlock auto

    overscrollBehaviorBlock contain

-}
overscrollBehaviorBlock :
    BaseValue
        { auto : Supported
        , contain : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorBlock (Value value) =
    AppendProperty ("overscroll-behavior-block:" ++ value)


{-| Sets the [`overscroll-behavior-inline`](https://developer.mozilla.org/en-US/docs/Web/CSS/overscroll-behavior-inline) property.

    overscrollBehaviorInline auto

    overscrollBehaviorInline contain

-}
overscrollBehaviorInline :
    BaseValue
        { auto : Supported
        , contain : Supported
        , none : Supported
        }
    -> Style
overscrollBehaviorInline (Value value) =
    AppendProperty ("overscroll-behavior-inline:" ++ value)


{-| Sets [`scroll-snap-align`](https://css-tricks.com/almanac/properties/s/scroll-snap-align/)

    scrollSnapAlign none

    scrollSnapAlign start

    scrollSnapAlign center

    scrollSnapAlign end

-}
scrollSnapAlign :
    BaseValue
        { none : Supported
        , start : Supported
        , center : Supported
        , end : Supported
        }
    -> Style
scrollSnapAlign (Value val) =
    AppendProperty ("scroll-snap-align:" ++ val)


{-| Sets [`scroll-snap-stop`](https://css-tricks.com/almanac/properties/s/scroll-snap-stop/)

    scrollSnapStop normal

    scrollSnapStop always

-}
scrollSnapStop :
    BaseValue
        { normal : Supported
        , always : Supported
        }
    -> Style
scrollSnapStop (Value val) =
    AppendProperty ("scroll-snap-stop:" ++ val)


{-| Sets [`scroll-snap-type`](https://css-tricks.com/almanac/properties/s/scroll-snap-type/)

    scrollSnapType none

-}
scrollSnapType :
    BaseValue
        { none : Supported
        , x : Supported
        , y : Supported
        , block : Supported
        , inline : Supported
        , both : Supported
        }
    -> Style
scrollSnapType (Value val) =
    AppendProperty ("scroll-snap-type:" ++ val)


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
    BaseValue
        { none : Supported
        , normal : Supported
        , spellOut : Supported
        }
    -> Style
speak (Value val) =
    AppendProperty ("speak:" ++ val)


{-| Sets [`tab-size`](https://css-tricks.com/almanac/properties/t/tab-size/)
**Note:** only positive integer values are allowed.

    tabSize (int 4)

-}
tabSize :
    BaseValue
        (LengthSupported
            { auto : Supported
            , int : Supported
            }
        )
    -> Style
tabSize (Value val) =
    AppendProperty ("tab-size:" ++ val)



--- Text stroke ---


{-| Sets [`text-stroke`](https://css-tricks.com/almanac/properties/t/text-stroke/)
This is a shorthand for [`text-stroke-width`](#textStrokeWidth) and [`text-stroke-color`](#textStrokeColor).

    tabStroke (px 2)

-}
textStroke :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
textStroke (Value val) =
    AppendProperty ("text-stroke:" ++ val)


{-| Sets [`text-stroke`](https://css-tricks.com/almanac/properties/t/text-stroke/)

    tabStroke2 (px 2) (hex "#60b5cc")

-}
textStroke2 :
    Value
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Value Color
    -> Style
textStroke2 (Value val1) (Value val2) =
    AppendProperty ("text-stroke:" ++ val1 ++ " " ++ val2)


{-| Sets [`text-stroke-width`](https://css-tricks.com/almanac/properties/t/text-stroke/)

    tabStrokeWidth (px 2)

-}
textStrokeWidth :
    BaseValue
        (LengthSupported
            { auto : Supported
            , pct : Supported
            }
        )
    -> Style
textStrokeWidth (Value val) =
    AppendProperty ("text-stroke-width:" ++ val)


{-| Sets [`text-stroke-color`](https://css-tricks.com/almanac/properties/t/text-stroke/)

    tabStrokeColor (hex "#60b5cc")

-}
textStrokeColor : BaseValue Color -> Style
textStrokeColor (Value val) =
    AppendProperty ("text-stroke-color:" ++ val)


{-| The [`text-indent`](https://css-tricks.com/almanac/properties/t/text-indent/) property.

    textIndent (em 1.5)

-}
textIndent : BaseValue (LengthSupported { pct : Supported }) -> Style
textIndent (Value val) =
    AppendProperty ("text-indent:" ++ val)


{-| The [`text-indent`](https://css-tricks.com/almanac/properties/t/text-indent/) property.

    textIndent2 (em 1.5) hanging

-}
textIndent2 :
    Value (LengthSupported { pct : Supported })
    ->
        Value
            { hanging : Supported
            , eachLine : Supported
            }
    -> Style
textIndent2 (Value lengthVal) (Value optionVal) =
    AppendProperty ("text-indent:" ++ lengthVal ++ " " ++ optionVal)


{-| The [`text-indent`](https://css-tricks.com/almanac/properties/t/text-indent/) property.

    textIndent3 (em 1.5) hanging eachLine

-}
textIndent3 :
    Value (LengthSupported { pct : Supported })
    -> Value { hanging : Supported }
    -> Value { eachLine : Supported }
    -> Style
textIndent3 (Value lengthVal) (Value hangingVal) (Value eachLineVal) =
    AppendProperty
        ("text-indent:"
            ++ lengthVal
            ++ " "
            ++ hangingVal
            ++ " "
            ++ eachLineVal
        )


{-| The `hanging` value used for properties such as [`textIdent2`](#textIdent2).

    textIdent2 (px 20) hanging

-}
hanging : Value { provides | hanging : Supported }
hanging =
    Value "hanging"


{-| The `each-line` value used for properties such as [`textIdent2`](#textIdent2).

    textIdent2 (px 20) eachLine

-}
eachLine : Value { provides | eachLine : Supported }
eachLine =
    Value "each-line"


{-| Sets [`transform-origin`](https://css-tricks.com/almanac/properties/t/transform-origin/).

    transformOrigin top_

    transformOrigin center

    transformOrigin bottom

    transformOrigin (pct 50)

-}
transformOrigin :
    BaseValue
        { top_ : Supported
        , center : Supported
        , bottom_ : Supported
        , pct : Supported
        , calc : Supported
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
        , calc : Supported
        }
    ->
        Value
            { left_ : Supported
            , center : Supported
            , right_ : Supported
            , pct : Supported
            , calc : Supported
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
    BaseValue
        { normal : Supported
        , embed : Supported
        , isolate : Supported
        , bidiOverride : Supported
        , isolateOverride : Supported
        , plaintext : Supported
        }
    -> Style
unicodeBidi (Value val) =
    AppendProperty ("unicode-bidi:" ++ val)


{-| Sets [`user-select`](https://css-tricks.com/almanac/properties/u/user-select/)

    userSelect none

    userSelect auto

    userSelect text

    userSelect contain_

    userSelect all_

-}
userSelect :
    BaseValue
        { none : Supported
        , auto : Supported
        , text : Supported
        , contain_ : Supported
        , all_ : Supported
        }
    -> Style
userSelect (Value val) =
    AppendProperty ("user-select:" ++ val)


{-| Sets [`widows`](https://css-tricks.com/almanac/properties/w/widows/)
**Note:** This function accepts only positive integers.

    widows (int 2)

-}
widows :
    BaseValue
        { int : Supported
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
    BaseValue
        (LengthSupported
            { normal : Supported
            , pct : Supported
            }
        )
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
    BaseValue
        { horizontalTb : Supported
        , verticalRl : Supported
        , verticalLr : Supported
        }
    -> Style
writingMode (Value str) =
    AppendProperty ("writing-mode:" ++ str)


{-| The [`resize`](https://css-tricks.com/almanac/properties/r/resize/) property.

    resize none

    resize both

    resize inline

-}
resize :
    BaseValue
        { none : Supported
        , both : Supported
        , horizontal : Supported
        , vertical : Supported
        , block : Supported
        , inline : Supported
        }
    -> Style
resize (Value value) =
    AppendProperty ("resize:" ++ value)


{-| The `horizontal` value used by [`resize`](#resize).

    resize horizontal

-}
horizontal : Value { provides | horizontal : Supported }
horizontal =
    Value "horizontal"


{-| The `vertical` value used by [`resize`](#resize).

    resize vertical

-}
vertical : Value { provides | vertical : Supported }
vertical =
    Value "vertical"


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

    contain none

    contain content

    contain2 size layout

    contain3 size layout style

    contain4 -- all multiple choice values in use, no value entry needed

-}
contain :
    BaseValue
        { none : Supported
        , strict : Supported
        , content : Supported
        , size : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    -> Style
contain (Value value) =
    AppendProperty ("contain:" ++ value)


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

This two-argument version lets you use 2 of the 4 multiple choice values you
can use for this property.

    contain2 size layout

-}
contain2 :
    Value
        { size : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    ->
        Value
            { size : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    -> Style
contain2 (Value value1) (Value value2) =
    AppendProperty ("contain:" ++ value1 ++ " " ++ value2)


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

This two-argument version lets you use 3 of the 4 multiple choice values you
can use for this property.

    contain3 size layout style

-}
contain3 :
    Value
        { size : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    ->
        Value
            { size : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    ->
        Value
            { size : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    -> Style
contain3 (Value value1) (Value value2) (Value value3) =
    AppendProperty ("contain:" ++ value1 ++ " " ++ value2 ++ " " ++ value3)


{-| The [`contain`](https://css-tricks.com/almanac/properties/c/contain/) property.

This two-argument version lets you use all 4 multiple choice values you
can use for this property.

    contain4 size layout style paint

**Note: The `style` value is considered at-risk from being depreciated.**

-}
contain4 :
    Value
        { size : Supported
        , layout : Supported
        , style : Supported
        , paint : Supported
        }
    ->
        Value
            { size : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    ->
        Value
            { size : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    ->
        Value
            { size : Supported
            , layout : Supported
            , style : Supported
            , paint : Supported
            }
    -> Style
contain4 (Value value1) (Value value2) (Value value3) (Value value4) =
    AppendProperty ("contain:" ++ value1 ++ " " ++ value2 ++ " " ++ value3 ++ " " ++ value4)


{-| Sets the `size` value for [`contain`](#contain).

This indicates that the element can be sized without
needing to look at the size of its descendants.

    contain size

-}
size : Value { provides | size : Supported }
size =
    Value "size"


{-| Sets the `layout` value for [`contain`](#contain).

This indicates that nothing outside the element
may affect its internal layout and vice versa.

    contain layout

-}
layout : Value { provides | layout : Supported }
layout =
    Value "layout"


{-| Sets the `paint` value for [`contain`](#contain).

Indicates that descendants of the element will not
display outside its bounds and will not be painted
by the browser if the containing box is offscreen.

    contain paint

-}
paint : Value { provides | paint : Supported }
paint =
    Value "paint"
