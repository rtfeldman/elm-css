module Css
    exposing
        ( (|*|)
        , (|+|)
        , (|-|)
        , (|/|)
        , Ch
        , Cm
        , Color
        , Compatible
        , Em
        , Ex
        , In
        , Integer
        , Length
        , MediaQuery
        , Mm
        , Number
        , Pc
        , Pct
        , Pt
        , Px
        , Rem
        , Snippet
        , Style
        , Stylesheet
        , Value
        , Vh
        , Vmax
        , Vmin
        , Vw
        , absolute
        , active
        , adjacentSiblings
        , after
        , alignItems
        , alignSelf
        , all
        , allPetiteCaps
        , allScroll
        , allSmallCaps
        , any
        , arabicIndic
        , armenian
        , asPairs
        , auto
        , backgroundAttachment
        , backgroundBlendMode
        , backgroundClip
        , backgroundColor
        , backgroundImage
        , backgroundOrigin
        , backgroundPosition
        , backgroundPosition2
        , backgroundRepeat
        , backgroundRepeat2
        , backgroundSize
        , backgroundSize2
        , baseline
        , batch
        , before
        , bengali
        , blink
        , block
        , bold
        , bolder
        , border
        , border2
        , border3
        , borderBlockEnd
        , borderBlockEnd2
        , borderBlockEnd3
        , borderBlockEndColor
        , borderBlockEndStyle
        , borderBlockStart
        , borderBlockStart2
        , borderBlockStart3
        , borderBlockStartColor
        , borderBlockStartStyle
        , borderBottom
        , borderBottom2
        , borderBottom3
        , borderBottomColor
        , borderBottomLeftRadius
        , borderBottomLeftRadius2
        , borderBottomRightRadius
        , borderBottomRightRadius2
        , borderBottomStyle
        , borderBottomWidth
        , borderBox
        , borderCollapse
        , borderColor
        , borderColor2
        , borderColor3
        , borderColor4
        , borderImageOutset
        , borderImageOutset2
        , borderImageOutset3
        , borderImageOutset4
        , borderImageWidth
        , borderImageWidth2
        , borderImageWidth3
        , borderImageWidth4
        , borderInlineEnd
        , borderInlineEnd2
        , borderInlineEnd3
        , borderInlineEndColor
        , borderInlineEndStyle
        , borderInlineEndWidth
        , borderInlineStart
        , borderInlineStart2
        , borderInlineStart3
        , borderInlineStartColor
        , borderInlineStartStyle
        , borderLeft
        , borderLeft2
        , borderLeft3
        , borderLeftColor
        , borderLeftStyle
        , borderLeftWidth
        , borderRadius
        , borderRadius2
        , borderRadius3
        , borderRadius4
        , borderRight
        , borderRight2
        , borderRight3
        , borderRightColor
        , borderRightStyle
        , borderRightWidth
        , borderStyle
        , borderTop
        , borderTop2
        , borderTop3
        , borderTopColor
        , borderTopLeftRadius
        , borderTopLeftRadius2
        , borderTopRightRadius
        , borderTopRightRadius2
        , borderTopStyle
        , borderTopWidth
        , borderWidth
        , borderWidth2
        , borderWidth3
        , borderWidth4
        , both
        , bottom
        , boxShadow
        , boxShadow2
        , boxShadow3
        , boxShadow4
        , boxShadow5
        , boxShadow6
        , boxSizing
        , breakWord
        , calc
        , capitalize
        , cell
        , center
        , ch
        , checked
        , children
        , circle
        , cjkEarthlyBranch
        , cjkHeavenlyStem
        , class
        , clip
        , cm
        , colResize
        , collapse
        , color
        , colorBurn
        , colorDodge
        , column
        , columnReverse
        , commonLigatures
        , compile
        , contain
        , content
        , contentBox
        , contextMenu
        , contextual
        , copy
        , cover
        , crosshair
        , currentColor
        , cursive
        , cursor
        , cursorAlias
        , darken
        , dashed
        , decimal
        , decimalLeadingZero
        , default
        , deg
        , descendants
        , devanagari
        , diagonalFractions
        , difference
        , dir
        , disabled
        , disc
        , discretionaryLigatures
        , display
        , displayFlex
        , dotted
        , double
        , eResize
        , each
        , eachLine
        , ellipsis
        , em
        , empty
        , enabled
        , end
        , everything
        , ewResize
        , ex
        , exclusion
        , fantasy
        , featureOff
        , featureOn
        , featureTag
        , featureTag2
        , fill
        , fillAvailable
        , fillBox
        , first
        , firstChild
        , firstLetter
        , firstLine
        , firstOfType
        , fitContent
        , fixed
        , flat
        , flex
        , flex2
        , flex3
        , flexBasis
        , flexDirection
        , flexEnd
        , flexFlow1
        , flexFlow2
        , flexGrow
        , flexShrink
        , flexStart
        , flexWrap
        , float
        , focus
        , fontFace
        , fontFamilies
        , fontFamily
        , fontFeatureSettings
        , fontFeatureSettingsList
        , fontSize
        , fontStyle
        , fontVariant
        , fontVariant2
        , fontVariant3
        , fontVariantCaps
        , fontVariantLigatures
        , fontVariantNumeric
        , fontVariantNumeric2
        , fontVariantNumeric3
        , fontVariantNumerics
        , fontWeight
        , fullWidth
        , fullscreen
        , generalSiblings
        , geometricPrecision
        , georgian
        , grab
        , grabbing
        , grad
        , groove
        , gujarati
        , gurmukhi
        , hanging
        , hardLight
        , height
        , help
        , hex
        , hidden
        , historicalLigatures
        , horizontal
        , hover
        , hsl
        , hsla
        , hue
        , id
        , important
        , inches
        , indeterminate
        , inherit
        , initial
        , inline
        , inlineBlock
        , inlineFlex
        , inlineListItem
        , inlineTable
        , inset
        , inside
        , int
        , invalid
        , italic
        , justifyAll
        , justifyContent
        , kannada
        , khmer
        , lang
        , lao
        , large
        , larger
        , lastChild
        , lastOfType
        , left
        , letterSpacing
        , lighten
        , lighter
        , lineHeight
        , lineThrough
        , linearGradient
        , linearGradient2
        , liningNums
        , link
        , listItem
        , listStyle
        , listStyle2
        , listStyle3
        , listStylePosition
        , listStyleType
        , local
        , lowerAlpha
        , lowerGreek
        , lowerLatin
        , lowerRoman
        , lowercase
        , luminosity
        , malayalam
        , margin
        , margin2
        , margin3
        , margin4
        , marginBlockEnd
        , marginBlockStart
        , marginBottom
        , marginInlineEnd
        , marginInlineStart
        , marginLeft
        , marginRight
        , marginTop
        , matchParent
        , matrix
        , matrix3d
        , maxContent
        , maxHeight
        , maxWidth
        , media
        , mediaQuery
        , medium
        , middle
        , minContent
        , minHeight
        , minWidth
        , minus
        , mm
        , monospace
        , move
        , multiply
        , myanmar
        , nResize
        , neResize
        , neswResize
        , noCommonLigatures
        , noContextual
        , noDiscretionaryLigatures
        , noDrop
        , noHistoricalLigatures
        , noRepeat
        , noWrap
        , none
        , normal
        , notAllowed
        , nsResize
        , nthChild
        , nthLastChild
        , nthLastOfType
        , nthOfType
        , num
        , nwResize
        , nwseResize
        , oblique
        , oldstyleNums
        , onlyChild
        , onlyOfType
        , opacity
        , optimizeLegibility
        , optimizeSpeed
        , optional
        , order
        , ordinal
        , oriya
        , outOfRange
        , outline
        , outline3
        , outlineColor
        , outlineOffset
        , outlineStyle
        , outlineWidth
        , outset
        , outside
        , overflow
        , overflowWrap
        , overflowX
        , overflowY
        , overlay
        , overline
        , padding
        , padding2
        , padding3
        , padding4
        , paddingBlockEnd
        , paddingBlockStart
        , paddingBottom
        , paddingBox
        , paddingInlineEnd
        , paddingInlineStart
        , paddingLeft
        , paddingRight
        , paddingTop
        , pc
        , pct
        , perspective
        , petiteCaps
        , plus
        , pointer
        , position
        , preserve3d
        , print
        , progress
        , projection
        , property
        , proportionalNums
        , pseudoClass
        , pseudoElement
        , pt
        , px
        , qt
        , rad
        , readWrite
        , relative
        , rem
        , repeat
        , repeatX
        , repeatY
        , required
        , resize
        , rgb
        , rgba
        , ridge
        , right
        , root
        , rotate
        , rotate3d
        , rotateX
        , rotateY
        , rotateZ
        , round
        , row
        , rowResize
        , rowReverse
        , sResize
        , sansSerif
        , saturation
        , scale
        , scale2
        , scale3d
        , scaleX
        , scaleY
        , scope
        , screen
        , screenBlendMode
        , scroll
        , seResize
        , selection
        , selector
        , separate
        , serif
        , skew
        , skew2
        , skewX
        , skewY
        , slashedZero
        , small
        , smallCaps
        , smaller
        , softLight
        , solid
        , space
        , spaceAround
        , spaceBetween
        , square
        , src
        , stackedFractions
        , start
        , static
        , sticky
        , stop
        , stop2
        , stretch
        , stylesheet
        , sub
        , super
        , swResize
        , table
        , tableCaption
        , tableCell
        , tableColumn
        , tableColumnGroup
        , tableFooterGroup
        , tableHeaderGroup
        , tableRow
        , tableRowGroup
        , tabularNums
        , target
        , telugu
        , text
        , textAlign
        , textAlignLast
        , textBottom
        , textDecoration
        , textDecoration2
        , textDecoration3
        , textDecorationLine
        , textDecorationLines
        , textDecorationStyle
        , textDecorations
        , textDecorations2
        , textDecorations3
        , textEmphasisColor
        , textIndent
        , textIndent2
        , textIndent3
        , textJustify
        , textOrientation
        , textOverflow
        , textRendering
        , textShadow
        , textShadow2
        , textShadow3
        , textShadow4
        , textTop
        , textTransform
        , thai
        , thick
        , thin
        , titlingCaps
        , toBottom
        , toBottomLeft
        , toBottomRight
        , toColor
        , toLeft
        , toRight
        , toTop
        , toTopLeft
        , toTopRight
        , top
        , transform
        , transformBox
        , transformStyle
        , transforms
        , translate
        , translate2
        , translate3d
        , translateX
        , translateY
        , translateZ
        , transparent
        , true
        , turn
        , tv
        , underline
        , unicase
        , unset
        , upperAlpha
        , upperLatin
        , upperRoman
        , uppercase
        , url
        , valid
        , vertical
        , verticalAlign
        , verticalText
        , vh
        , viewBox
        , visible
        , visited
        , vmax
        , vmin
        , vw
        , wResize
        , wait
        , wavy
        , whiteSpace
        , width
        , withClass
        , withMedia
        , wrap
        , wrapReverse
        , xLarge
        , xSmall
        , xxLarge
        , xxSmall
        , zIndex
        , zero
        , zoomIn
        , zoomOut
        )

{-| Functions for building stylesheets.


# Misc

@docs Compatible, Stylesheet, asPairs, absolute, all, allPetiteCaps, allSmallCaps, withClass, auto, baseline, block, bold, bolder, border, border2, border3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockEndColor, borderBlockEndStyle, borderBlockStart, borderBlockStart2, borderBlockStart3, borderBlockStartColor, borderBlockStartStyle, borderBottom, borderBottom2, borderBottom3, borderBottomColor, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderBottomStyle, borderWidth, borderWidth2, borderWidth3, borderWidth4, borderBottomWidth, borderBox, borderColor, borderColor2, borderColor3, borderColor4, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineEndColor, borderInlineEndStyle, borderInlineEndWidth, borderInlineStart, borderInlineStart2, borderInlineStart3, borderInlineStartColor, borderInlineStartStyle, borderLeft, borderLeft2, borderLeft3, borderLeftColor, borderLeftStyle, borderLeftWidth, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderRight, borderRight2, borderRight3, borderRightColor, borderRightStyle, borderRightWidth, borderStyle, borderCollapse, borderTop, borderTop2, borderTop3, borderTopColor, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderTopStyle, borderTopWidth, bottom, column, columnReverse, commonLigatures, content, contentBox, contextual, cursive, dashed, diagonalFractions, discretionaryLigatures, dotted, double, fantasy, fillBox, fixed, flat, displayFlex, flexEnd, flexStart, groove, hex, hidden, historicalLigatures, hsl, hsla, important, inherit, initial, inline, inlineBlock, inlineFlex, table, inlineTable, tableCell, tableRow, tableColumn, tableCaption, tableRowGroup, tableColumnGroup, tableHeaderGroup, tableFooterGroup, inlineListItem, inset, italic, large, larger, lighter, liningNums, listItem, matrix, matrix3d, middle, monospace, noCommonLigatures, noContextual, noDiscretionaryLigatures, noHistoricalLigatures, noWrap, none, normal, oblique, oldstyleNums, ordinal, outset, perspective, petiteCaps, position, float, preserve3d, proportionalNums, relative, rgb, rgba, ridge, rotate, rotate3d, rotateX, rotateY, rotateZ, row, rowReverse, sansSerif, scale, scale2, scale3d, scaleX, scaleY, scroll, serif, skew, skew2, skewX, skewY, slashedZero, small, smallCaps, smaller, solid, stackedFractions, static, sticky, stretch, sub, super, tabularNums, textBottom, textTop, titlingCaps, top, translate, translate2, translate3d, translateX, translateY, translateZ, transparent, unicase, unset, viewBox, visible, wavy, wrap, wrapReverse, xLarge, xSmall, xxLarge, xxSmall, backgroundRepeat, backgroundRepeat2, repeatX, repeatY, repeat, space, round, noRepeat, backgroundAttachment, local, backgroundBlendMode, multiply, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, luminosity, screenBlendMode, backgroundClip, paddingBox, backgroundImage, url, backgroundPosition, backgroundPosition2, backgroundOrigin, backgroundSize, backgroundSize2, cover, contain, both, horizontal, vertical, breakWord, spaceAround, spaceBetween, separate, collapse
@docs listStyleType, disc, circle, square, decimal, decimalLeadingZero, lowerRoman, upperRoman, lowerGreek, lowerAlpha, lowerLatin, upperAlpha, upperLatin, arabicIndic, armenian, bengali, cjkEarthlyBranch, cjkHeavenlyStem, devanagari, georgian, gujarati, gurmukhi, kannada, khmer, lao, malayalam, myanmar, oriya, telugu, thai
@docs listStylePosition, inside, outside
@docs listStyle, listStyle2, listStyle3
@docs linearGradient, linearGradient2, stop, stop2, toBottom, toBottomLeft, toBottomRight, toLeft, toRight, toTop, toTopLeft, toTopRight


# Style

@docs Snippet, Style, batch, stylesheet, compile


# Statements

@docs class, id, selector, everything


# Combinators

@docs children, descendants, adjacentSiblings, generalSiblings


# Media Queries

@docs screen, tv, projection, print


# Properties

@docs property, flex, flex2, flex3, medium, alignSelf, alignItems, justifyContent, order, flexDirection, flexFlow1, flexFlow2, flexWrap, flexBasis, flexGrow, flexShrink, transformStyle, transformBox, transform, transforms, currentColor, underline, overline, lineThrough, textOrientation, textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, textEmphasisColor, capitalize, uppercase, lowercase, fullWidth, hanging, eachLine, textIndent, textIndent2, textIndent3, clip, ellipsis, textOverflow, optimizeSpeed, optimizeLegibility, geometricPrecision, textRendering, textTransform, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, minContent, maxContent, fitContent, fillAvailable, width, minWidth, maxWidth, height, minHeight, maxHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflow, overflowX, overflowY, overflowWrap, whiteSpace, backgroundColor, color, withMedia, each, media, mediaQuery, textShadow, textShadow2, textShadow3, textShadow4, boxShadow, boxShadow2, boxShadow3, boxShadow4, boxShadow5, boxShadow6, lineHeight, letterSpacing, fontFace, fontFamily, fontSize, fontStyle, fontWeight, fontVariant, fontVariant2, fontVariant3, fontVariantLigatures, fontVariantCaps, fontVariantNumeric, fontVariantNumeric2, fontVariantNumeric3, fontFamilies, fontVariantNumerics, fontFeatureSettings, fontFeatureSettingsList, cursor, outline, outline3, outlineColor, outlineWidth, outlineStyle, outlineOffset, zIndex, spaceAround, spaceBetween, resize, fill


# Values

@docs Value


## Color values

@docs Color, all, important, solid, transparent, rgb, rgba, hsl, hsla, hex, toColor


## Font values

@docs featureTag, featureTag2, featureOn, featureOff


## Other values

@docs borderCollapse, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderWidth, borderWidth2, borderWidth3, borderWidth4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, contentBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, scroll, visible, block, inlineBlock, inlineFlex, inline, none, auto, inherit, unset, initial, noWrap, top, static, fixed, sticky, relative, absolute, position, float, bottom, middle, baseline, sub, super, textTop, textBottom, hidden, wavy, dotted, dashed, solid, double, groove, ridge, inset, outset, matrix, matrix3d, perspective, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scale3d, scaleX, scaleY, skew, skew2, skewX, skewY, translate, translate2, translate3d, translateX, translateY, translateZ, rotate, fillBox, viewBox, flat, preserve3d, content, wrapReverse, wrap, flexStart, flexEnd, stretch, row, rowReverse, column, columnReverse, serif, sansSerif, monospace, cursive, fantasy, xxSmall, xSmall, small, large, xLarge, xxLarge, smaller, larger, normal, italic, oblique, bold, lighter, bolder, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions, ordinal, slashedZero, default, pointer, crosshair, contextMenu, help, progress, wait, cell, text, verticalText, cursorAlias, copy, move, noDrop, notAllowed, eResize, nResize, neResize, nwResize, sResize, seResize, swResize, wResize, ewResize, nsResize, neswResize, nwseResize, colResize, rowResize, allScroll, zoomIn, zoomOut, grab, grabbing


# Length

@docs Length, pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, int, num, zero, (|+|), (|-|), (|*|), (|/|), calc, plus, minus


# Length Units

@docs Number, Integer, Px, Em, Rem, Pct, Ex, Ch, Vh, Vw, Vmin, Vmax, Mm, Cm, In, Pt, Pc


# Angle

@docs deg, rad, grad, turn


# Pseudo-Classes

@docs pseudoClass, active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, visited, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid


# Pseudo-Elements

@docs pseudoElement, after, before, firstLetter, firstLine, selection


# Media Queries

@docs MediaQuery, screen, print, tv, projection


# Source

@docs src


# Quoting

@docs qt


# Intentionally Unsupported

These are features you might expect to be in elm-css (because they are in the
CSS specification) but which have been omitted because their use is either
deprecated or discouraged.

@docs thin, medium, thick, blink

-}

import Color
import Css.Helpers exposing (identifierToString, toCssIdentifier)
import Css.Internal as Internal
    exposing
        ( CalcOperation
        , ColorDescriptor(HexColor, HslColor, HslaColor, InvalidColor, RgbColor, RgbaColor)
        , EmittedValue
            ( EmittedCalc
            , EmittedColor
            , EmittedNumber
            , EmittedString
            , InvalidValue
            )
        , cssFunction
        , numberToString
        , valueToString
        )
import Css.Preprocess as Preprocess exposing (Style, unwrapSnippet)
import Css.Preprocess.Resolve as Resolve
import Css.Structure as Structure
import Hex
import String
import Tuple


{-| -}
type alias MediaQuery =
    Structure.MediaQuery


{-| -}
type alias Stylesheet =
    Preprocess.Stylesheet


{-| -}
type alias Snippet =
    Preprocess.Snippet


{-| -}
type alias Style =
    Preprocess.Style


{-| -}
type Compatible
    = Compatible


type PseudoClass
    = PseudoClass String (List Style)


type PseudoElement
    = PseudoElement String (List Style)


{-| -}
screen : MediaQuery
screen =
    Structure.MediaQuery "screen"


{-| -}
print : MediaQuery
print =
    Structure.MediaQuery "print"


{-| -}
projection : MediaQuery
projection =
    Structure.MediaQuery "projection"


{-| -}
tv : MediaQuery
tv =
    Structure.MediaQuery "tv"



{- Length -}


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
getOverloadedProperty : String -> String -> Style -> Style
getOverloadedProperty functionName desiredKey style =
    case style of
        Preprocess.AppendProperty { key } ->
            -- Use the given style's Key as the resulting property's value.
            property desiredKey key

        Preprocess.ExtendSelector selector _ ->
            propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable Style for selector " ++ toString selector ] desiredKey ""

        Preprocess.NestSnippet combinator _ ->
            propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable Style for combinator " ++ toString combinator ] desiredKey ""

        Preprocess.WithPseudoElement pseudoElement _ ->
            propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable Style for pseudo-element setter " ++ toString pseudoElement ] desiredKey ""

        Preprocess.WithMedia mediaQuery _ ->
            propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable Style for media query " ++ toString mediaQuery ] desiredKey ""

        Preprocess.ApplyStyles [] ->
            propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with empty Style. " ] desiredKey ""

        Preprocess.ApplyStyles (only :: []) ->
            getOverloadedProperty functionName desiredKey only

        Preprocess.ApplyStyles (first :: rest) ->
            getOverloadedProperty functionName desiredKey (Preprocess.ApplyStyles rest)


{-| A property value.
-}
type alias Value a =
    Internal.Value a



{- FONTS -}


colorValueForOverloadedProperty : Internal.Value { color : Compatible }
colorValueForOverloadedProperty =
    transparent


{-| -}
type alias Color =
    Internal.Value { color : Compatible }


{-| <https://developer.mozilla.org/en-US/docs/Web/CSS/length>
-}
type alias Length compatible units =
    Internal.Value units
        { compatible
            | length : Compatible
            , lengthOrAuto : Compatible
            , lengthOrNumber : Compatible
            , lengthOrNone : Compatible
            , lengthOrMinMaxDimension : Compatible
            , lengthOrNoneOrMinMaxDimension : Compatible
        }


{-| The css [calc](https://developer.mozilla.org/en/docs/Web/CSS/calc) function.

    almostPct100 =
        calc (pct 100) minus (px 2)


    -- calc(100vh - (2px + 2rem))

    screenMinusBorderAndFooter =
        calc (vh 100) minus (calc (px 2) plus (rem 2))

    myWidth =
        width almostPct100

    myHeight =
        height screenMinusBorderAndFooter

Using * and / with calc isn't supported. Use arithmetics from elm instead.

-}
calc :
    Internal.Value compatible
    -> CalcOperation
    -> Internal.Value compatible1
    ->
        Internal.Value
            { calc : Compatible
            , flexBasis : Compatible
            , fontSize : Compatible
            , length : Compatible
            , lengthOrAuto : Compatible
            , lengthOrAutoOrCoverOrContain : Compatible
            , lengthOrMinMaxDimension : Compatible
            , lengthOrNone : Compatible
            , lengthOrNoneOrMinMaxDimension : Compatible
            , lengthOrNumber : Compatible
            , lengthOrNumberOrAutoOrNoneOrContent : Compatible
            , textIndent : Compatible
            }
calc first calcOperation second =
    let
        validate emittedValue =
            case emittedValue of
                EmittedNumber _ _ ->
                    Ok emittedValue

                EmittedCalc _ _ _ ->
                    Ok emittedValue

                _ ->
                    Err (toString emittedValue)

        firstEmitted =
            Internal.emittedValue first

        secondEmitted =
            Internal.emittedValue second

        newEmittedValue =
            case ( validate firstEmitted, validate secondEmitted ) of
                ( Ok _, Ok _ ) ->
                    EmittedCalc firstEmitted calcOperation secondEmitted

                _ ->
                    [ "invalid calc value", toString first, toString calcOperation, toString second ]
                        |> String.join " "
                        |> InvalidValue
    in
    Internal.value []
        newEmittedValue
        { length = Compatible
        , lengthOrAuto = Compatible
        , lengthOrNumber = Compatible
        , lengthOrNone = Compatible
        , lengthOrMinMaxDimension = Compatible
        , lengthOrNoneOrMinMaxDimension = Compatible
        , textIndent = Compatible
        , flexBasis = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        , fontSize = Compatible
        , lengthOrAutoOrCoverOrContain = Compatible
        , calc = Compatible
        }


{-| Use with calc to add lengths together

    >>> calc (pct 100) plus (px 2)
    calc (100% + 2px)

-}
plus : CalcOperation
plus =
    Internal.Plus


{-| Use with calc to subtract lengths from eachother

    >>> calc (pct 100) minus (px 2)
    calc (100% - 2px)

-}
minus : CalcOperation
minus =
    Internal.Minus


{-| Add two lengths.

    >>> em 2 |+| em 3
    em 5

-}
(|+|) :
    Internal.Value compatibility
    -> Internal.Value compatibility
    -> Internal.Value compatibility
(|+|) =
    combineLengths (+)


{-| Subtract two lengths.

    >>> em 7 |-| em 3
    em 4

-}
(|-|) :
    Internal.Value compatibility
    -> Internal.Value compatibility
    -> Internal.Value compatibility
(|-|) =
    combineLengths (-)


{-| Divide two lengths.

    >>> em 9 |/| em 2
    em 4.5

-}
(|/|) :
    Internal.Value compatibility
    -> Internal.Value compatibility
    -> Internal.Value compatibility
(|/|) =
    combineLengths (/)


{-| Multiply two lengths.

    >>> em 3 |*| em 6
    em 18

-}
(|*|) :
    Internal.Value compatibility
    -> Internal.Value compatibility
    -> Internal.Value compatibility
(|*|) =
    combineLengths (*)


combineLengths :
    (Float -> Float -> Float)
    -> Internal.Value compatibility
    -> Internal.Value compatibility
    -> Internal.Value compatibility
combineLengths operation first second =
    let
        emittedValue =
            case ( Internal.emittedValue first, Internal.emittedValue second ) of
                ( EmittedNumber firstNum firstLabel, EmittedNumber secondNum _ ) ->
                    EmittedNumber (operation firstNum secondNum) firstLabel

                ( firstValue, _ ) ->
                    -- TODO this should never happen; emit a warning?
                    firstValue
    in
    Internal.value [] emittedValue (Internal.compatible first)



-- Properties --


{-| An [`all`](https://developer.mozilla.org/en-US/docs/Web/CSS/all) property.
-}
all : Internal.Value a -> Style
all =
    prop1 "all"


{-| Transforms the given property by adding !important to the end of its
declaration.
-}
important : Style -> Style
important =
    Preprocess.mapLastProperty (\property -> { property | important = True })


{-| A [`ColorValue`](#ColorValue) that does not have `red`, `green`, or `blue`
values.
-}
type alias NonMixable =
    {}


{-| A [`transparent`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent_keyword) color.
-}
transparent : Internal.Value { color : Compatible }
transparent =
    Internal.value []
        (EmittedString "transparent")
        { color = Compatible }


{-| The [`currentColor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword)
value.
-}
currentColor : Internal.Value { color : Compatible }
currentColor =
    Internal.value []
        (EmittedString "currentColor")
        { color = Compatible }


{-| The `visible` value for the [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) property.
-}
visible : Internal.Value { overflow : Compatible }
visible =
    Internal.value []
        (EmittedString "visible")
        { overflow = Compatible }


{-| The `scroll` [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) value.
This can also represent a `scroll` [`background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment) value.
-}
scroll : Internal.Value { backgroundAttachment : Compatible, overflow : Compatible }
scroll =
    Internal.value []
        (EmittedString "scroll")
        { overflow = Compatible
        , backgroundAttachment = Compatible
        }


{-| The `break-word` value for the [`overflow-wrap`](https://developer.mozilla.org/en/docs/Web/CSS/overflow-wrap#Values) property.
-}
breakWord : Internal.Value { overflowWrap : Compatible }
breakWord =
    Internal.value []
        (EmittedString "break-word")
        { overflowWrap = Compatible }


{-| The `both` value for the [`resize`](https://developer.mozilla.org/en/docs/Web/CSS/resize#Values) property.
-}
both : Internal.Value { resize : Compatible }
both =
    Internal.value []
        (EmittedString "both")
        { resize = Compatible }


{-| The `horizontal` value for the [`resize`](https://developer.mozilla.org/en/docs/Web/CSS/resize#Values) property.
-}
horizontal : Internal.Value { resize : Compatible }
horizontal =
    Internal.value []
        (EmittedString "horizontal")
        { resize = Compatible }


{-| The `vertical` value for the [`resize`](https://developer.mozilla.org/en/docs/Web/CSS/resize#Values) property.
-}
vertical : Internal.Value { resize : Compatible }
vertical =
    Internal.value []
        (EmittedString "vertical")
        { resize = Compatible }


{-| The `multiply` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#multiply).
-}
multiply : Internal.Value a -> Style
multiply =
    prop1 "multiply"


{-| The `screen` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#screen).
-}
screenBlendMode : Internal.Value a -> Style
screenBlendMode =
    prop1 "screen"


{-| The `overlay` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#overlay).
-}
overlay : Internal.Value a -> Style
overlay =
    prop1 "overlay"


{-| The `darken` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#darken).
-}
darken : Internal.Value a -> Style
darken =
    prop1 "darken"


{-| The `lighten` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#lighten).
-}
lighten : Internal.Value a -> Style
lighten =
    prop1 "lighten"


{-| The `color-dodge` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#color-dodge).
-}
colorDodge : Internal.Value a -> Style
colorDodge =
    prop1 "color-dodge"


{-| The `color-burn` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#color-burn).
-}
colorBurn : Internal.Value a -> Style
colorBurn =
    prop1 "color-burn"


{-| The `hard-light` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#hard-light).
-}
hardLight : Internal.Value a -> Style
hardLight =
    prop1 "hard-light"


{-| The `soft-light` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#soft-light).
-}
softLight : Internal.Value a -> Style
softLight =
    prop1 "soft-light"


{-| The `difference` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#difference).
-}
difference : Internal.Value a -> Style
difference =
    prop1 "difference"


{-| The `exclusion` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#exclusion).
-}
exclusion : Internal.Value a -> Style
exclusion =
    prop1 "exclusion"


{-| The `hue` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#hue).
-}
hue : Internal.Value a -> Style
hue =
    prop1 "hue"


{-| The `saturation` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#saturation).
-}
saturation : Internal.Value a -> Style
saturation =
    prop1 "saturation"


{-| The `luminosity` [`blend-mode`](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode#luminosity).
-}
luminosity : Internal.Value a -> Style
luminosity =
    prop1 "luminosity"


{-| The `padding-box` [`background-clip`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip) value.
-}
paddingBox : Internal.Value { backgroundClip : Compatible }
paddingBox =
    Internal.value []
        (EmittedString "padding-box")
        { backgroundClip = Compatible }


{-| The `url` [`background-image`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-image) value.
-}
url : String -> Internal.Value { backgroundImage : Compatible }
url urlValue =
    Internal.value []
        (EmittedString ("url(" ++ urlValue ++ ")"))
        { backgroundImage = Compatible }


{-| The `cover` [`background-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size) value.
-}
cover : Internal.Value { lengthOrAutoOrCoverOrContain : Compatible }
cover =
    Internal.value []
        (EmittedString "cover")
        { lengthOrAutoOrCoverOrContain = Compatible }


{-| The `contain` [`background-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size) value.
-}
contain : Internal.Value { lengthOrAutoOrCoverOrContain : Compatible }
contain =
    Internal.value []
        (EmittedString "contain")
        { lengthOrAutoOrCoverOrContain = Compatible }


{-| `hidden` [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) value.

This can also represent a `hidden` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).

-}
hidden : Internal.Value { borderStyle : Compatible, overflow : Compatible }
hidden =
    Internal.value []
        (EmittedString "hidden")
        { overflow = Compatible
        , borderStyle = Compatible
        }


{-| The [`unset`](https://developer.mozilla.org/en-US/docs/Web/CSS/unset) value.
Any CSS property can be set to this value.
-}
unset :
    Internal.Value
        { alignItems : Compatible
        , all : Compatible
        , backgroundAttachment : Compatible
        , backgroundBlendMode : Compatible
        , backgroundImage : Compatible
        , backgroundOrigin : Compatible
        , backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        , borderStyle : Compatible
        , boxSizing : Compatible
        , color : Compatible
        , cursor : Compatible
        , display : Compatible
        , flexBasis : Compatible
        , flexDirection : Compatible
        , flexDirectionOrWrap : Compatible
        , flexWrap : Compatible
        , fontFamily : Compatible
        , fontSize : Compatible
        , fontStyle : Compatible
        , fontVariant : Compatible
        , fontWeight : Compatible
        , intOrAuto : Compatible
        , justifyContent : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , listStylePosition : Compatible
        , listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        , none : Compatible
        , number : Compatible
        , outline : Compatible
        , overflow : Compatible
        , textDecorationLine : Compatible
        , textDecorationStyle : Compatible
        , textIndent : Compatible
        , textRendering : Compatible
        , textTransform : Compatible
        , units : IncompatibleUnits
        }
unset =
    Internal.value [] (EmittedString "unset") initialVal


{-| The [`inherit`](https://developer.mozilla.org/en-US/docs/Web/CSS/inherit) value.
Any CSS property can be set to this value.
-}
inherit :
    Internal.Value
        { alignItems : Compatible
        , all : Compatible
        , backgroundAttachment : Compatible
        , backgroundBlendMode : Compatible
        , backgroundImage : Compatible
        , backgroundOrigin : Compatible
        , backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        , borderStyle : Compatible
        , boxSizing : Compatible
        , color : Compatible
        , cursor : Compatible
        , display : Compatible
        , flexBasis : Compatible
        , flexDirection : Compatible
        , flexDirectionOrWrap : Compatible
        , flexWrap : Compatible
        , fontFamily : Compatible
        , fontSize : Compatible
        , fontStyle : Compatible
        , fontVariant : Compatible
        , fontWeight : Compatible
        , intOrAuto : Compatible
        , justifyContent : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , listStylePosition : Compatible
        , listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        , none : Compatible
        , number : Compatible
        , outline : Compatible
        , overflow : Compatible
        , textDecorationLine : Compatible
        , textDecorationStyle : Compatible
        , textIndent : Compatible
        , textRendering : Compatible
        , textTransform : Compatible
        , units : IncompatibleUnits
        }
inherit =
    Internal.value [] (EmittedString "inherit") initialVal


{-| The [`initial`](https://developer.mozilla.org/en-US/docs/Web/CSS/initial) value.
Any CSS property can be set to this value.
-}
initial :
    Internal.Value
        { alignItems : Compatible
        , all : Compatible
        , backgroundAttachment : Compatible
        , backgroundBlendMode : Compatible
        , backgroundImage : Compatible
        , backgroundOrigin : Compatible
        , backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        , borderStyle : Compatible
        , boxSizing : Compatible
        , color : Compatible
        , cursor : Compatible
        , display : Compatible
        , flexBasis : Compatible
        , flexDirection : Compatible
        , flexDirectionOrWrap : Compatible
        , flexWrap : Compatible
        , fontFamily : Compatible
        , fontSize : Compatible
        , fontStyle : Compatible
        , fontVariant : Compatible
        , fontWeight : Compatible
        , intOrAuto : Compatible
        , justifyContent : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , listStylePosition : Compatible
        , listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        , none : Compatible
        , number : Compatible
        , outline : Compatible
        , overflow : Compatible
        , textDecorationLine : Compatible
        , textDecorationStyle : Compatible
        , textIndent : Compatible
        , textRendering : Compatible
        , textTransform : Compatible
        , units : IncompatibleUnits
        }
initial =
    Internal.value [] (EmittedString "initial") initialVal


initialVal :
    { alignItems : Compatible
    , all : Compatible
    , backgroundAttachment : Compatible
    , backgroundBlendMode : Compatible
    , backgroundImage : Compatible
    , backgroundOrigin : Compatible
    , backgroundRepeat : Compatible
    , backgroundRepeatShorthand : Compatible
    , borderStyle : Compatible
    , boxSizing : Compatible
    , color : Compatible
    , cursor : Compatible
    , display : Compatible
    , flexBasis : Compatible
    , flexDirection : Compatible
    , flexDirectionOrWrap : Compatible
    , flexWrap : Compatible
    , fontFamily : Compatible
    , fontSize : Compatible
    , fontStyle : Compatible
    , fontVariant : Compatible
    , fontWeight : Compatible
    , intOrAuto : Compatible
    , justifyContent : Compatible
    , length : Compatible
    , lengthOrAuto : Compatible
    , lengthOrAutoOrCoverOrContain : Compatible
    , lengthOrMinMaxDimension : Compatible
    , lengthOrNone : Compatible
    , lengthOrNoneOrMinMaxDimension : Compatible
    , lengthOrNumber : Compatible
    , lengthOrNumberOrAutoOrNoneOrContent : Compatible
    , listStylePosition : Compatible
    , listStyleType : Compatible
    , listStyleTypeOrPositionOrImage : Compatible
    , none : Compatible
    , number : Compatible
    , outline : Compatible
    , overflow : Compatible
    , textDecorationLine : Compatible
    , textDecorationStyle : Compatible
    , textIndent : Compatible
    , textRendering : Compatible
    , textTransform : Compatible
    , units : IncompatibleUnits
    }
initialVal =
    { overflow = Compatible
    , none = Compatible
    , number = Compatible
    , textDecorationLine = Compatible
    , textRendering = Compatible
    , textIndent = Compatible
    , textDecorationStyle = Compatible
    , textTransform = Compatible
    , borderStyle = Compatible
    , boxSizing = Compatible
    , color = Compatible
    , cursor = Compatible
    , display = Compatible
    , all = Compatible
    , alignItems = Compatible
    , justifyContent = Compatible
    , length = Compatible
    , lengthOrAuto = Compatible
    , lengthOrNone = Compatible
    , lengthOrNumber = Compatible
    , lengthOrMinMaxDimension = Compatible
    , lengthOrNoneOrMinMaxDimension = Compatible
    , listStyleType = Compatible
    , listStylePosition = Compatible
    , listStyleTypeOrPositionOrImage = Compatible
    , flexBasis = Compatible
    , flexWrap = Compatible
    , flexDirection = Compatible
    , flexDirectionOrWrap = Compatible
    , lengthOrNumberOrAutoOrNoneOrContent = Compatible
    , fontFamily = Compatible
    , fontSize = Compatible
    , fontStyle = Compatible
    , fontWeight = Compatible
    , fontVariant = Compatible
    , outline = Compatible
    , units = IncompatibleUnits
    , backgroundRepeat = Compatible
    , backgroundRepeatShorthand = Compatible
    , backgroundAttachment = Compatible
    , backgroundBlendMode = Compatible
    , backgroundOrigin = Compatible
    , backgroundImage = Compatible
    , lengthOrAutoOrCoverOrContain = Compatible
    , intOrAuto = Compatible
    }


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in functional notation.
-}
rgb : Int -> Int -> Int -> Internal.Value { color : Compatible }
rgb red green blue =
    let
        warnings =
            if
                (red < 0)
                    || (red > 255)
                    || (green < 0)
                    || (green > 255)
                    || (blue < 0)
                    || (blue > 255)
            then
                [ "RGB color values must be between 0 and 255. rgb("
                    ++ toString red
                    ++ ", "
                    ++ toString green
                    ++ ", "
                    ++ toString blue
                    ++ ") is not valid."
                ]
            else
                []
    in
    Internal.value warnings
        (EmittedColor (RgbColor red green blue))
        { color = Compatible }


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : Int -> Int -> Int -> Float -> Internal.Value { color : Compatible }
rgba red green blue alpha =
    let
        warnings =
            if
                (red < 0)
                    || (red > 255)
                    || (green < 0)
                    || (green > 255)
                    || (blue < 0)
                    || (blue > 255)
                    || (alpha < 0)
                    || (alpha > 1)
            then
                [ "RGB color values must be between 0 and 255, and the alpha in RGBA must be between 0 and 1. rgba("
                    ++ toString red
                    ++ ", "
                    ++ toString green
                    ++ ", "
                    ++ toString blue
                    ++ ", "
                    ++ toString alpha
                    ++ ") is not valid."
                ]
            else
                []
    in
    Internal.value warnings
        (EmittedColor (RgbaColor red green blue alpha))
        { color = Compatible }


{-| [HSL color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsl())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsl : Float -> Float -> Float -> Internal.Value { color : Compatible }
hsl hue saturation lightness =
    let
        warnings =
            if
                (hue > 360)
                    || (hue < 0)
                    || (saturation > 1)
                    || (saturation < 0)
                    || (lightness > 1)
                    || (lightness < 0)
            then
                [ "HSL color values must have an H value between 0 and 360 (as in degrees) and S and L values between 0 and 1. hsl(" ++ numberToString hue ++ ", " ++ numberToString saturation ++ ", " ++ numberToString lightness ++ ") is not valid." ]
            else
                []
    in
    Internal.value warnings
        (EmittedColor (HslColor hue saturation lightness))
        { color = Compatible }


{-| [HSLA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsla())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsla : Float -> Float -> Float -> Float -> Value { color : Compatible }
hsla hue saturation lightness alpha =
    let
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
                [ "HSLA color values must have an H value between 0 and 360 (as in degrees) and S, L, and A values between 0 and 1. hsla(" ++ numberToString hue ++ ", " ++ numberToString saturation ++ ", " ++ numberToString lightness ++ ", " ++ numberToString alpha ++ ") is not valid." ]
            else
                []
    in
    Internal.value warnings
        (EmittedColor (HslaColor hue saturation lightness alpha))
        { color = Compatible }


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in hexadecimal notation. You can optionally include `#` as the first character,
for benefits like syntax highlighting in editors, ease of copy/pasting from
tools which express these as e.g. `#abcdef0`, etc.
-}
hex : String -> Internal.Value { color : Compatible }
hex str =
    let
        warnings =
            case hexToColor str of
                Ok _ ->
                    []

                Err error ->
                    [ error ]
    in
    Internal.value warnings (EmittedColor (HexColor str)) { color = Compatible }


{-| Not to be confused with Thelonious Monk or Hieronymus Bosch.
-}
erroneousHex : String -> Internal.Value { color : Compatible }
erroneousHex str =
    Internal.value
        ([ "Hex color strings must contain exactly 3, 4, 6, or 8 hexadecimal digits, optionally preceded by \"#\"."
         , toString str
         , "is an invalid hex color string."
         , "Please see: https://drafts.csswg.org/css-color/#hex-notation"
         ]
            |> String.join " "
            |> List.singleton
        )
        (EmittedColor (InvalidColor str))
        { color = Compatible }


{-| Convert to a Color.Color
-}
toColor : Internal.Value { r | color : Compatible } -> Result String Color.Color
toColor original =
    case Internal.emittedValue original of
        EmittedColor (RgbColor red green blue) ->
            Ok (Color.rgb red green blue)

        EmittedColor (RgbaColor red green blue alpha) ->
            Ok (Color.rgb red green blue)

        EmittedColor (HslaColor hue saturation lightness alpha) ->
            Ok (Color.hsla hue saturation lightness alpha)

        EmittedColor (HslColor hue saturation lightness) ->
            Ok (Color.hsl hue saturation lightness)

        EmittedColor (InvalidColor str) ->
            Err str

        EmittedColor (HexColor str) ->
            hexToColor str

        _ ->
            Err (toString original ++ " is not a color.")


hexToColor : String -> Result String Color.Color
hexToColor str =
    let
        withoutHash =
            if String.startsWith "#" str then
                String.dropLeft 1 str
            else
                str

        toInt =
            String.fromList >> String.toLower >> Hex.fromString

        error =
            [ "Hex color strings must contain exactly 3, 4, 6, or 8 hexadecimal digits, optionally preceded by \"#\"."
            , toString str
            , "is an invalid hex color string."
            , "Please see: https://drafts.csswg.org/css-color/#hex-notation"
            ]
                |> String.join " "
                |> Err
    in
    case String.toList withoutHash of
        [ r, g, b ] ->
            case ( toInt [ r, r ], toInt [ g, g ], toInt [ b, b ] ) of
                ( Ok red, Ok green, Ok blue ) ->
                    Ok (Color.rgb red green blue)

                _ ->
                    error

        [ r, g, b, a ] ->
            case ( toInt [ r, r ], toInt [ g, g ], toInt [ b, b ], toInt [ a, a ] ) of
                ( Ok red, Ok green, Ok blue, Ok alpha ) ->
                    Ok (Color.rgba red green blue (toFloat alpha / 255))

                _ ->
                    error

        [ r1, r2, g1, g2, b1, b2 ] ->
            case ( toInt [ r1, r2 ], toInt [ g1, g2 ], toInt [ b1, b2 ] ) of
                ( Ok red, Ok green, Ok blue ) ->
                    Ok (Color.rgb red green blue)

                _ ->
                    error

        [ r1, r2, g1, g2, b1, b2, a1, a2 ] ->
            case ( toInt [ r1, r2 ], toInt [ g1, g2 ], toInt [ b1, b2 ], toInt [ a1, a2 ] ) of
                ( Ok red, Ok green, Ok blue, Ok alpha ) ->
                    Ok (Color.rgba red green blue (toFloat alpha / 255))

                _ ->
                    error

        _ ->
            error



{- TEXT-RENDERING -}


{-| `optimizeSpeed` [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values) value
-}
optimizeSpeed : Internal.Value { textRendering : Compatible }
optimizeSpeed =
    Internal.value []
        (EmittedString "optimizeSpeed")
        { textRendering = Compatible }


{-| `optimizeLegibility` [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values) value
-}
optimizeLegibility : Internal.Value { textRendering : Compatible }
optimizeLegibility =
    Internal.value []
        (EmittedString "optimizeLegibility")
        { textRendering = Compatible }


{-| `geometricPrecision` [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values) value
-}
geometricPrecision : Internal.Value { textRendering : Compatible }
geometricPrecision =
    Internal.value []
        (EmittedString "geometricPrecision")
        { textRendering = Compatible }



{- TEXT-INDENT -}


{-| `hanging` [`hanging`](https://developer.mozilla.org/en-US/docs/Web/CSS/hanging#Values) value
-}
hanging : Internal.Value { textIndent : Compatible }
hanging =
    Internal.value []
        (EmittedString "hanging")
        { textIndent = Compatible }


{-| `each-line` [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent#Values) value
-}
eachLine : Internal.Value { textIndent : Compatible }
eachLine =
    Internal.value []
        (EmittedString "each-line")
        { textIndent = Compatible }



{- TEXT-ORIENTATION -}


{-| `mixed` [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation#Values) value
-}
mixed : Internal.Value { textOrientation : Compatible }
mixed =
    Internal.value []
        (EmittedString "mixed")
        { textOrientation = Compatible }


{-| `upright` [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation#Values) value
-}
upright : Internal.Value { textOrientation : Compatible }
upright =
    Internal.value []
        (EmittedString "upright")
        { textOrientation = Compatible }


{-| `sideways` [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientationEValues) value
-}
sideways : Internal.Value { textOrientation : Compatible }
sideways =
    Internal.value []
        (EmittedString "sideways")
        { textOrientation = Compatible }



{- TEXT-TRANSFORM -}


{-| `capitalize` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
capitalize : Internal.Value { textTransform : Compatible }
capitalize =
    Internal.value []
        (EmittedString "capitalize")
        { textTransform = Compatible }


{-| `uppercase` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
uppercase : Internal.Value { textTransform : Compatible }
uppercase =
    Internal.value []
        (EmittedString "uppercase")
        { textTransform = Compatible }


{-| `lowercase` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
lowercase : Internal.Value { textTransform : Compatible }
lowercase =
    Internal.value []
        (EmittedString "lowercase")
        { textTransform = Compatible }


{-| `full-width` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
fullWidth : Internal.Value { textTransform : Compatible }
fullWidth =
    Internal.value []
        (EmittedString "full-width")
        { textTransform = Compatible }


{-| `ellipsis` [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow#Values) value
-}
ellipsis : Internal.Value { textOverflow : Compatible }
ellipsis =
    Internal.value []
        (EmittedString "ellipsis")
        { textOverflow = Compatible }


{-| `clip` [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow#Values) value
-}
clip : Internal.Value { textOverflow : Compatible }
clip =
    Internal.value []
        (EmittedString "clip")
        { textOverflow = Compatible }



{- BORDER STYLE -}


{-| A `wavy` [text decoration style](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style#Values).
-}
wavy : Internal.Value { textDecorationStyle : Compatible }
wavy =
    Internal.value []
        (EmittedString "wavy")
        { textDecorationStyle = Compatible }


{-| A `dotted` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dotted : Internal.Value { borderStyle : Compatible, textDecorationStyle : Compatible }
dotted =
    Internal.value []
        (EmittedString "dotted")
        { borderStyle = Compatible
        , textDecorationStyle = Compatible
        }


{-| A `dashed` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dashed : Internal.Value { borderStyle : Compatible, textDecorationStyle : Compatible }
dashed =
    Internal.value []
        (EmittedString "dashed")
        { borderStyle = Compatible
        , textDecorationStyle = Compatible
        }


{-| A `solid` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
solid : Internal.Value { borderStyle : Compatible, textDecorationStyle : Compatible }
solid =
    Internal.value []
        (EmittedString "solid")
        { borderStyle = Compatible
        , textDecorationStyle = Compatible
        }


{-| A `double` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
double : Internal.Value { borderStyle : Compatible, textDecorationStyle : Compatible }
double =
    Internal.value []
        (EmittedString "double")
        { borderStyle = Compatible
        , textDecorationStyle = Compatible
        }


{-| A `groove` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
groove : Internal.Value { borderStyle : Compatible }
groove =
    Internal.value []
        (EmittedString "groove")
        { borderStyle = Compatible }


{-| A `ridge` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
ridge : Internal.Value { borderStyle : Compatible }
ridge =
    Internal.value []
        (EmittedString "ridge")
        { borderStyle = Compatible }


{-| An `inset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
inset : Internal.Value { borderStyle : Compatible }
inset =
    Internal.value []
        (EmittedString "inset")
        { borderStyle = Compatible }


{-| An `outset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
outset : Internal.Value { borderStyle : Compatible }
outset =
    Internal.value []
        (EmittedString "outset")
        { borderStyle = Compatible }



{- BORDER COLLAPSE -}


{-| A `separate` [border-collapse](https://developer.mozilla.org/en-US/docs/Web/CSS/border-collapse#Values).
-}
separate : Internal.Value { borderCollapse : Compatible }
separate =
    Internal.value []
        (EmittedString "separate")
        { borderCollapse = Compatible }


{-| A `collapse` [border-collapse](https://developer.mozilla.org/en-US/docs/Web/CSS/border-collapse#Values).
-}
collapse : Internal.Value { borderCollapse : Compatible }
collapse =
    Internal.value []
        (EmittedString "collapse")
        { borderCollapse = Compatible }



{- ALIGNMENTS -}


{-| `center` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
Can also be used with flex-box's align-items and justify-content properties to apply the value of center
-}
center : Internal.Value a -> Style
center =
    prop1 "center"


{-| `text-justify` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textJustify : Internal.Value a -> Style
textJustify =
    prop1 "text-justify"


{-| `justify-all` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
justifyAll : Internal.Value a -> Style
justifyAll =
    prop1 "justify-all"


{-| `start` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
start : Internal.Value a -> Style
start =
    prop1 "start"


{-| `end` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
end : Internal.Value a -> Style
end =
    prop1 "end"


{-| `match-parent` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
matchParent : Internal.Value a -> Style
matchParent =
    prop1 "match-parent"


{-| `true` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
true : Internal.Value a -> Style
true =
    prop1 "true"



{- LENGTHS -}


lengthConverter :
    a
    -> String
    -> Float
    ->
        Internal.Value
            { calc : Compatible
            , flexBasis : Compatible
            , fontSize : Compatible
            , length : Compatible
            , lengthOrAuto : Compatible
            , lengthOrAutoOrCoverOrContain : Compatible
            , lengthOrMinMaxDimension : Compatible
            , lengthOrNone : Compatible
            , lengthOrNoneOrMinMaxDimension : Compatible
            , lengthOrNumber : Compatible
            , lengthOrNumberOrAutoOrNoneOrContent : Compatible
            , textIndent : Compatible
            , units : a
            }
lengthConverter units unitLabel numericValue =
    Internal.value []
        (EmittedNumber numericValue unitLabel)
        { units = units
        , length = Compatible
        , lengthOrAuto = Compatible
        , lengthOrNumber = Compatible
        , lengthOrNone = Compatible
        , lengthOrMinMaxDimension = Compatible
        , lengthOrNoneOrMinMaxDimension = Compatible
        , textIndent = Compatible
        , flexBasis = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        , fontSize = Compatible
        , lengthOrAutoOrCoverOrContain = Compatible
        , calc = Compatible
        }


{-| Convenience length value that compiles to 0 with no units.

    stylesheet
      [ ul
          [ padding zero ]
      ]

...compiles to:

    ul {
        padding: 0;
    }

-}
zero :
    Internal.Value
        { length : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNone : Compatible
        , lengthOrAuto : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , number : Compatible
        , outline : Compatible
        , units : UnitlessInteger
        , lengthOrAutoOrCoverOrContain : Compatible
        }
zero =
    Internal.value []
        (EmittedNumber 0 "")
        { length = Compatible
        , lengthOrNumber = Compatible
        , lengthOrNone = Compatible
        , lengthOrAuto = Compatible
        , lengthOrMinMaxDimension = Compatible
        , lengthOrNoneOrMinMaxDimension = Compatible
        , number = Compatible
        , outline = Compatible
        , units = UnitlessInteger
        , lengthOrAutoOrCoverOrContain = Compatible
        }


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
type alias Pct =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : PercentageUnits
        }


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : Float -> Pct
pct =
    lengthConverter PercentageUnits "%"


type PercentageUnits
    = PercentageUnits


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
type alias Em =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : EmUnits
        }


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
em : Float -> Em
em =
    lengthConverter EmUnits "em"


type EmUnits
    = EmUnits


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
type alias Ex =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : ExUnits
        }


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
ex : Float -> Ex
ex =
    lengthConverter ExUnits "ex"


type ExUnits
    = ExUnits


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
type alias Ch =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : ChUnits
        }


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
ch : Float -> Ch
ch =
    lengthConverter ChUnits "ch"


type ChUnits
    = ChUnits


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
type alias Rem =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : RemUnits
        }


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
rem : Float -> Rem
rem =
    lengthConverter RemUnits "rem"


type RemUnits
    = RemUnits


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
type alias Vh =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : VhUnits
        }


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
vh : Float -> Vh
vh =
    lengthConverter VhUnits "vh"


type VhUnits
    = VhUnits


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
type alias Vw =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : VwUnits
        }


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
vw : Float -> Vw
vw =
    lengthConverter VwUnits "vw"


type VwUnits
    = VwUnits


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
type alias Vmin =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : VMinUnits
        }


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
vmin : Float -> Vmin
vmin =
    lengthConverter VMinUnits "vmin"


type VMinUnits
    = VMinUnits


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
type alias Vmax =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : VMaxUnits
        }


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
vmax : Float -> Vmax
vmax =
    lengthConverter VMaxUnits "vmax"


type VMaxUnits
    = VMaxUnits


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
type alias Px =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : PxUnits
        }


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : Float -> Px
px =
    lengthConverter PxUnits "px"


type PxUnits
    = PxUnits


{-| [``](<https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm>) units.
-}
type alias Mm =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : MMUnits
        }


{-| [``](<https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm>) units.
-}
mm : Float -> Mm
mm =
    lengthConverter MMUnits "mm"


type MMUnits
    = MMUnits


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
type alias Cm =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : CMUnits
        }


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
cm : Float -> Cm
cm =
    lengthConverter CMUnits "cm"


type CMUnits
    = CMUnits


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.
-}
type alias In =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : InchUnits
        }


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)

-}
inches : Float -> In
inches =
    lengthConverter InchUnits "in"


type InchUnits
    = InchUnits


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
type alias Pt =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : PtUnits
        }


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
pt : Float -> Pt
pt =
    lengthConverter PtUnits "pt"


type PtUnits
    = PtUnits


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
type alias Pc =
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : PcUnits
        }


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
pc : Float -> Pc
pc =
    lengthConverter PcUnits "pc"


type PcUnits
    = PcUnits


{-| -}
type alias Integer =
    Internal.Value
        { lengthOrNumber : Compatible
        , number : Compatible
        , fontWeight : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , intOrAuto : Compatible
        , units : UnitlessInteger
        }


{-| A unitless integer. Useful with properties like [`borderImageOutset`](#borderImageOutset)
which accept either length units or unitless numbers for some properties.
-}
int : Int -> Integer
int val =
    Internal.value []
        (EmittedNumber (toFloat val) "")
        { lengthOrNumber = Compatible
        , number = Compatible
        , fontWeight = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        , intOrAuto = Compatible
        , units = UnitlessInteger
        }


type UnitlessInteger
    = UnitlessInteger


{-| -}
type alias Number =
    Internal.Value
        { lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , number : Compatible
        , units : UnitlessFloat
        }


{-| A unitless decimal number. Useful with properties like [`flexGrow`](#flexGrow)
which accept unitless numbers.
-}
num : Float -> Number
num val =
    Internal.value []
        (EmittedNumber val "")
        { lengthOrNumber = Compatible
        , number = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        , units = UnitlessFloat
        }


type UnitlessFloat
    = UnitlessFloat


lengthForOverloadedProperty :
    Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
lengthForOverloadedProperty =
    lengthConverter IncompatibleUnits "" 0


type IncompatibleUnits
    = IncompatibleUnits



{- ANGLES -}


angleConverter :
    String
    -> number
    -> Internal.Value { angle : Compatible, angleOrDirection : Compatible }
angleConverter suffix num =
    Internal.value []
        (EmittedString (numberToString num ++ suffix))
        { angle = Compatible
        , angleOrDirection = Compatible
        }


{-| [`deg`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#deg) units.
-}
deg : number -> Internal.Value { angle : Compatible, angleOrDirection : Compatible }
deg =
    angleConverter "deg"


{-| [`grad`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#grad) units.
-}
grad : number -> Internal.Value { angle : Compatible, angleOrDirection : Compatible }
grad =
    angleConverter "grad"


{-| [`rad`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#rad) units.
-}
rad : number -> Internal.Value { angle : Compatible, angleOrDirection : Compatible }
rad =
    angleConverter "rad"


{-| [`turn`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#tr) units.
-}
turn : number -> Internal.Value { angle : Compatible, angleOrDirection : Compatible }
turn =
    angleConverter "turn"



{- TRANSFORMS -}


{-| The [`matrix()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#matrix()) transform-function.

    transform (matrix 0.5 1 1.5 2 2.5 3)

-}
matrix :
    number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> Internal.Value { transform : Compatible }
matrix a b c d tx ty =
    Internal.value []
        (EmittedString (cssFunction "matrix" (List.map numberToString [ a, b, c, d, tx, ty ])))
        { transform = Compatible }


{-| The [`matrix3d()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#matrix3d()) transform-function.

    transform (matrix3d 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3)

-}
matrix3d :
    number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> number
    -> Internal.Value { transform : Compatible }
matrix3d a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4 =
    Internal.value []
        (EmittedString (cssFunction "matrix3d" (List.map numberToString [ a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4 ])))
        { transform = Compatible }


{-| The [`perspective()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#perspective()) transform-function.

     transform (perspective 0.5)

-}
perspective : number -> Internal.Value { transform : Compatible }
perspective l =
    Internal.value []
        (EmittedString (cssFunction "perspective" [ numberToString l ]))
        { transform = Compatible }


{-| The [`rotate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotate()) transform-function.

     transform (rotate (deg 90))

-}
rotate : Internal.Value compatible -> Internal.Value { transform : Compatible }
rotate val =
    Internal.value []
        (EmittedString (cssFunction "rotate" [ valueToString val ]))
        { transform = Compatible }


{-| The [`rotateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateX()) transform-function.

     transform (rotateX (deg 90))

-}
rotateX : Internal.Value compatible -> Internal.Value { transform : Compatible }
rotateX value =
    Internal.value []
        (EmittedString (cssFunction "rotateX" [ valueToString value ]))
        { transform = Compatible }


{-| The [`rotateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateY()) transform-function.

     transform (rotateY (deg 90))

-}
rotateY : Internal.Value compatible -> Internal.Value { transform : Compatible }
rotateY value =
    Internal.value []
        (EmittedString (cssFunction "rotateY" [ valueToString value ]))
        { transform = Compatible }


{-| The [`rotateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateZ()) transform-function.

     transform (rotateZ (deg 90))

-}
rotateZ : Internal.Value compatible -> Internal.Value { transform : Compatible }
rotateZ val =
    Internal.value []
        (EmittedString (cssFunction "rotateZ" [ valueToString val ]))
        { transform = Compatible }


{-| The [`rotate3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotate3d()) transform-function.

     transform (rotate3d 1 1 1 (deg 90))

-}
rotate3d :
    number
    -> number
    -> number
    -> Internal.Value compatible
    -> Internal.Value { transform : Compatible }
rotate3d x y z val =
    let
        coordsAsStrings =
            List.map numberToString [ x, y, z ]
    in
    Internal.value []
        (EmittedString (cssFunction "rotate3d" (coordsAsStrings ++ [ valueToString val ])))
        { transform = Compatible }


{-| The [`scale`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale()) transform-function.

     transform (scale 0.5)
     transform (scale2 0.5 0.7)

-}
scale : number -> Internal.Value { transform : Compatible }
scale x =
    Internal.value []
        (EmittedString (cssFunction "scale" [ numberToString x ]))
        { transform = Compatible }


{-| The [`scale`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale()) transform-function.

     transform (scale 0.5)
     transform (scale2 0.5 0.7)

-}
scale2 : number -> number -> Internal.Value { transform : Compatible }
scale2 x y =
    Internal.value []
        (EmittedString (cssFunction "scale" (List.map numberToString [ x, y ])))
        { transform = Compatible }


{-| The [`scaleX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scaleX()) transform-function.

     transform (scaleX 0.5)

-}
scaleX : number -> Internal.Value { transform : Compatible }
scaleX x =
    Internal.value []
        (EmittedString (cssFunction "scaleX" [ numberToString x ]))
        { transform = Compatible }


{-| The [`scaleY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scaleY()) transform-function.

     transform (scaleY 0.5)

-}
scaleY : number -> Internal.Value { transform : Compatible }
scaleY y =
    Internal.value []
        (EmittedString (cssFunction "scaleY" [ numberToString y ]))
        { transform = Compatible }


{-| The [`scale3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale3d()) transform-function.

     transform (scale3d 0.5 0.5 1)

-}
scale3d :
    number
    -> number
    -> number
    -> Internal.Value { transform : Compatible }
scale3d x y z =
    Internal.value []
        (EmittedString (cssFunction "scale3d" (List.map numberToString [ x, y, z ])))
        { transform = Compatible }


{-| The [`skew`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skew()) transform-function.

     transform (skew (deg 90))
     transform (skew2 (deg 90) (deg 45))

-}
skew : Internal.Value compatible -> Internal.Value { transform : Compatible }
skew val =
    Internal.value []
        (EmittedString (cssFunction "skew" [ valueToString val ]))
        { transform = Compatible }


{-| The [`skew`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skew()) transform-function.

     transform (skew (deg 90))
     transform (skew2 (deg 90) (deg 45))

-}
skew2 :
    Internal.Value compatible
    -> Internal.Value compatible1
    -> Internal.Value { transform : Compatible }
skew2 ax ay =
    Internal.value []
        (EmittedString (cssFunction "skew" [ valueToString ax, valueToString ay ]))
        { transform = Compatible }


{-| The [`skewX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skewX()) transform-function.

     transform (skewX (deg 90))

-}
skewX : Internal.Value compatible -> Internal.Value { transform : Compatible }
skewX val =
    Internal.value []
        (EmittedString (cssFunction "skewX" [ valueToString val ]))
        { transform = Compatible }


{-| The [`skewY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skewY()) transform-function.

    transform (skewY (deg 90))

-}
skewY : Internal.Value compatible -> Internal.Value { transform : Compatible }
skewY val =
    Internal.value []
        (EmittedString (cssFunction "skewY" [ valueToString val ]))
        { transform = Compatible }


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))

-}
translate :
    Internal.Value compatible
    -> Internal.Value { transform : Compatible }
translate val =
    Internal.value []
        (EmittedString (cssFunction "translate" [ valueToString val ]))
        { transform = Compatible }


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))

-}
translate2 :
    Internal.Value compatible
    -> Internal.Value compatible1
    -> Internal.Value { transform : Compatible }
translate2 tx ty =
    Internal.value []
        (EmittedString (cssFunction "translate" [ valueToString tx, valueToString ty ]))
        { transform = Compatible }


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translateX (px 100))

-}
translateX :
    Internal.Value compatible
    -> Internal.Value { transform : Compatible }
translateX val =
    Internal.value []
        (EmittedString (cssFunction "translateX" [ valueToString val ]))
        { transform = Compatible }


{-| The [`translateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateY()) transform-function.

    transform (translateY (px 100))

-}
translateY :
    Internal.Value compatible
    -> Internal.Value { transform : Compatible }
translateY val =
    Internal.value []
        (EmittedString (cssFunction "translateY" [ valueToString val ]))
        { transform = Compatible }


{-| The [`translateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateZ()) transform-function.

    transform (translateZ (px 100))

-}
translateZ :
    Internal.Value compatible
    -> Internal.Value { transform : Compatible }
translateZ val =
    Internal.value []
        (EmittedString (cssFunction "translateZ" [ valueToString val ]))
        { transform = Compatible }


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translate3d (px 100) (px 100) (px 100))

-}
translate3d :
    Internal.Value compatible
    -> Internal.Value compatible1
    -> Internal.Value compatible2
    -> Internal.Value { transform : Compatible }
translate3d tx ty tz =
    Internal.value []
        (EmittedString (cssFunction "translate3d" [ valueToString tx, valueToString ty, valueToString tz ]))
        { transform = Compatible }


{-| Sets [`transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
with a series of transform-functions. If an empty list is provided, the CSS
output will be `none`, as if to state directly that the set of transforms
applied to the current selector is empty:

    transforms [] -- transform: none;

In the case that only one transform is needed, the `transform` function may be
used instead for convenience. `transform` expects exactly one transform-function
and cannot be passed `none`:

    transform (matrix 1 2 3 4 5 6) -- transform: matrix(1, 2, 3, 4, 5, 6);

If a collection of transforms is needed, use the `transforms` function with a
populated list:

    transforms [ perspective 1, scale2 1 1.4 ]

-}
transforms : List (Internal.Value compatible) -> Style
transforms =
    prop1 "transform" << valuesOrNone


{-| Sets [`transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
with a single explicit transform value. If you need to set the transform
property to `none`, use the `transforms` function with an empty list. See
`transforms` for more details.

    transform (scaleX 1.4)

-}
transform : Internal.Value compatible -> Style
transform only =
    transforms [ only ]


{-| The `fill-box` value for the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
fillBox : Internal.Value { transformBox : Compatible }
fillBox =
    Internal.value []
        (EmittedString "fill-box")
        { transformBox = Compatible }


{-| The `content-box` value for the [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing) property.
Can also be used as `content-box` value for the [`background-clip`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip) property.
-}
contentBox : Internal.Value { backgroundClip : Compatible, boxSizing : Compatible }
contentBox =
    Internal.value []
        (EmittedString "content-box")
        { boxSizing = Compatible
        , backgroundClip = Compatible
        }


{-| The `border-box` value for the [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing) property.
Can also be used as `border-box` value for the [`background-clip`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip) property.
-}
borderBox : Internal.Value { backgroundClip : Compatible, boxSizing : Compatible }
borderBox =
    Internal.value []
        (EmittedString "border-box")
        { boxSizing = Compatible
        , backgroundClip = Compatible
        }


{-| The `view-box` value for the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
viewBox : Internal.Value { transformBox : Compatible }
viewBox =
    Internal.value []
        (EmittedString "view-box")
        { transformBox = Compatible }


{-| The [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
transformBox : Internal.Value a -> Style
transformBox =
    prop1 "transform-box"


{-| Sets [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing)

    boxSizing borderBox

-}
boxSizing : Internal.Value a -> Style
boxSizing =
    prop1 "box-sizing"


{-| The `preserve-3d` value for the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
preserve3d : Internal.Value { transformStyle : Compatible }
preserve3d =
    Internal.value []
        (EmittedString "preserve-3d")
        { transformStyle = Compatible }


{-| The `flat` value for the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
flat : Internal.Value { transformStyle : Compatible }
flat =
    Internal.value []
        (EmittedString "flat")
        { transformStyle = Compatible }


{-| The [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
transformStyle : Internal.Value a -> Style
transformStyle =
    prop1 "transform-style"



{- LIST STYLE POSITION -}


{-| The [`list-style-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position) property.
-}
listStylePosition : Internal.Value a -> Style
listStylePosition =
    prop1 "list-style-position"


{-| -}
inside :
    Internal.Value
        { listStylePosition : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
inside =
    Internal.value []
        (EmittedString "inside")
        { listStylePosition = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
outside :
    Internal.Value
        { listStylePosition : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
outside =
    Internal.value []
        (EmittedString "outside")
        { listStylePosition = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }



{- LIST STYLE TYPE -}


{-| The [`list-style-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type) property.
-}
listStyleType : Internal.Value a -> Style
listStyleType =
    prop1 "list-style-type"


{-| -}
disc :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
disc =
    Internal.value []
        (EmittedString "disc")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
circle :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
circle =
    Internal.value []
        (EmittedString "circle")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
square :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
square =
    Internal.value []
        (EmittedString "square")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
decimal :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
decimal =
    Internal.value []
        (EmittedString "decimal")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
decimalLeadingZero :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
decimalLeadingZero =
    Internal.value []
        (EmittedString "decimal-leading-zero")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
lowerRoman :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
lowerRoman =
    Internal.value []
        (EmittedString "lower-roman")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
upperRoman :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
upperRoman =
    Internal.value []
        (EmittedString "upper-roman")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
lowerGreek :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
lowerGreek =
    Internal.value []
        (EmittedString "lower-greek")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
upperGreek :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
upperGreek =
    Internal.value []
        (EmittedString "upper-greek")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
lowerAlpha :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
lowerAlpha =
    Internal.value []
        (EmittedString "lower-alpha")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
upperAlpha :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
upperAlpha =
    Internal.value []
        (EmittedString "upper-alpha")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
lowerLatin :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
lowerLatin =
    Internal.value []
        (EmittedString "lower-latin")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
upperLatin :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
upperLatin =
    Internal.value []
        (EmittedString "upper-latin")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
arabicIndic :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
arabicIndic =
    Internal.value []
        (EmittedString "arabic-indic")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
armenian :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
armenian =
    Internal.value []
        (EmittedString "armenian")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
bengali :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
bengali =
    Internal.value []
        (EmittedString "bengali")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
cjkEarthlyBranch :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
cjkEarthlyBranch =
    Internal.value []
        (EmittedString "cjk-earthly-branch")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
cjkHeavenlyStem :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
cjkHeavenlyStem =
    Internal.value []
        (EmittedString "cjk-heavenly-stem")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
devanagari :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
devanagari =
    Internal.value []
        (EmittedString "devanagari")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
georgian :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
georgian =
    Internal.value []
        (EmittedString "georgian")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
gujarati :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
gujarati =
    Internal.value []
        (EmittedString "gujarati")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
gurmukhi :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
gurmukhi =
    Internal.value []
        (EmittedString "gurmukhi")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
kannada :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
kannada =
    Internal.value []
        (EmittedString "kannada")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
khmer :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
khmer =
    Internal.value []
        (EmittedString "khmer")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
lao :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
lao =
    Internal.value []
        (EmittedString "lao")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
malayalam :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
malayalam =
    Internal.value []
        (EmittedString "malayalam")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
myanmar :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
myanmar =
    Internal.value []
        (EmittedString "myanmar")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
oriya :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
oriya =
    Internal.value []
        (EmittedString "oriya")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
telugu :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
telugu =
    Internal.value []
        (EmittedString "telugu")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| -}
thai :
    Internal.Value
        { listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        }
thai =
    Internal.value []
        (EmittedString "thai")
        { listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }



{- LIST STYLE SHORTHAND -}


{-| The [`list-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style) shorthand property.
-}
listStyle : Internal.Value a -> Style
listStyle =
    prop1 "list-style"


{-| The [`list-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style) shorthand property.
-}
listStyle2 : Internal.Value a -> Internal.Value b -> Style
listStyle2 =
    prop2 "list-style"


{-| The [`list-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style) shorthand property.
-}
listStyle3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
listStyle3 =
    prop3 "list-style"



{- FLEX BOX -}


{-| Sets [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) property.

flex (none | content | auto | (int 1) | (px 10))
flex2 (int 1) ((int 1) | (px 10 ))
flex3 (int 1) (int 1) ((int 1) | (px 10))

-}
flex : Internal.Value a -> Style
flex =
    prop1 "flex"


{-| Sets [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) property.

flex (none | content | auto | (int 1) | (px 10))
flex2 (int 1) ((int 1) | (px 10 ))
flex3 (int 1) (int 1) ((int 1) | (px 10))

-}
flex2 : Internal.Value a -> Internal.Value b -> Style
flex2 =
    prop2 "flex"


{-| Sets [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) property.

flex (none | content | auto | (int 1) | (px 10))
flex2 (int 1) ((int 1) | (px 10 ))
flex3 (int 1) (int 1) ((int 1) | (px 10))

-}
flex3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
flex3 =
    prop3 "flex"


{-| Sets [`flex-basis`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis) property.

flex (none | content | auto | (int 1) | (px 10))
flex2 (int 1) ((int 1) | (px 10 ))
flex3 (int 1) (int 1) ((int 1) | (px 10))

-}
flexBasis : Internal.Value a -> Style
flexBasis =
    prop1 "flex-basis"


{-| Sets [`flex-grow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow) property.
-}
flexGrow : Internal.Value a -> Style
flexGrow =
    prop1 "flex-grow"


{-| Sets [`flex-shrink`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink) property.
-}
flexShrink : Internal.Value a -> Style
flexShrink =
    prop1 "flex-shrink"


{-| Sets [`flex-wrap`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap) property.
-}
flexWrap : Internal.Value a -> Style
flexWrap =
    prop1 "flex-wrap"


{-| Sets [`flex-direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction) property.
-}
flexDirection : Internal.Value a -> Style
flexDirection =
    prop1 "flex-direction"


{-| Sets [`flex-flow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow) property.

flexFlow1 (wrap | wrapReverse | noWrap)
flexFlow2 (wrap | wrapReverse | noWrap) (row | column | rowReverse | columnReverse)

Or vice versa, order is not important for flex-flow

-}
flexFlow1 : Internal.Value a -> Style
flexFlow1 =
    prop1 "flex-flow"


{-| Sets [`flex-flow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow) property.

flexFlow1 (wrap | wrapReverse | noWrap)
flexFlow2 (wrap | wrapReverse | noWrap) (row | column | rowReverse | columnReverse)

Or vice versa, order is not important for flex-flow

-}
flexFlow2 : Internal.Value a -> Internal.Value b -> Style
flexFlow2 =
    prop2 "flex-flow"


{-| Sets [`align-items`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items).

**Note:** `auto` is not currently supported here. If you need to set this property to `auto`,
use this workaround:

property "align-items" "auto"

If this is annoying, please file an issue, so adding support for "auto"
can be prioritized!

-}
alignItems :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
alignItems fn =
    getOverloadedProperty "alignItems" "align-items" (fn lengthForOverloadedProperty)


{-| Sets [`align-self`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-self).

**Note:** `auto` is not currently supported here. If you need to set this property to `auto`,
use this workaround:

property "align-self" "auto"

If this is annoying, please file an issue, so adding support for "auto"
can be prioritized!

-}
alignSelf :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
alignSelf fn =
    getOverloadedProperty "alignSelf" "align-self" (fn lengthForOverloadedProperty)


{-| Sets [`justify-content`](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content).
-}
justifyContent :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
justifyContent fn =
    getOverloadedProperty "justifyContent" "justify-content" (fn lengthForOverloadedProperty)


{-| Sets [`order`](https://developer.mozilla.org/en-US/docs/Web/CSS/order) property.
-}
order : Internal.Value a -> Style
order =
    prop1 "order"


{-| The [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis#Values) value for the
flex-basis property.
-}
content :
    Internal.Value
        { flexBasis : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        }
content =
    Internal.value []
        (EmittedString "content")
        { flexBasis = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        }


{-| The[`wrap`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values) value for the
flex-wrap property.
-}
wrap : Internal.Value { flexDirectionOrWrap : Compatible, flexWrap : Compatible }
wrap =
    Internal.value []
        (EmittedString "wrap")
        { flexWrap = Compatible
        , flexDirectionOrWrap = Compatible
        }


{-| The[`wrap-reverse`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values) value for the
flex-wrap property.
-}
wrapReverse : Internal.Value { flexDirectionOrWrap : Compatible, flexWrap : Compatible }
wrapReverse =
    Internal.value []
        (EmittedString "wrap-reverse")
        { flexWrap = Compatible
        , flexDirectionOrWrap = Compatible
        }


{-| The[`flex-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values) value for the
align-items property.
Can also be used with flex-box's justify-content property to apply the value of flex-start.
-}
flexStart : Internal.Value a -> Style
flexStart =
    prop1 "flex-start"


{-| The[`flex-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values) value for the
align-items property.
Can also be used with flex-box's justify-content property to apply the value of flex-end.
-}
flexEnd : Internal.Value a -> Style
flexEnd =
    prop1 "flex-end"


{-| The[`space-around`](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content#Values) value for the
justify-content property.
-}
spaceAround : Internal.Value a -> Style
spaceAround =
    prop1 "space-around"


{-| The[`space-between`](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content#Values) value for the
justify-content property.
-}
spaceBetween : Internal.Value a -> Style
spaceBetween =
    prop1 "space-between"


{-| The[`stretch`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values) value for the
align-items property.
-}
stretch : Internal.Value a -> Style
stretch =
    prop1 "stretch"


{-| The[`row`](<https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction> #Values) value for the
flex-direction property.
-}
row : Internal.Value { flexDirection : Compatible, flexDirectionOrWrap : Compatible }
row =
    Internal.value []
        (EmittedString "row")
        flexCompatibility


flexCompatibility : { flexDirection : Compatible, flexDirectionOrWrap : Compatible }
flexCompatibility =
    { flexDirection = Compatible
    , flexDirectionOrWrap = Compatible
    }


{-| The[`row-reverse`](<https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction> #Values) value for the
flex-direction property.
-}
rowReverse : Internal.Value { flexDirection : Compatible, flexDirectionOrWrap : Compatible }
rowReverse =
    Internal.value [] (EmittedString "row-reverse") flexCompatibility


{-| The[`column`](<https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction> #Values) value for the
flex-direction property.
-}
column : Internal.Value { flexDirection : Compatible, flexDirectionOrWrap : Compatible }
column =
    Internal.value [] (EmittedString "column") flexCompatibility


{-| The[`column-reverse`](<https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction> #Values) value for the
flex-direction property.
-}
columnReverse : Internal.Value { flexDirection : Compatible, flexDirectionOrWrap : Compatible }
columnReverse =
    Internal.value [] (EmittedString "column-reverse") flexCompatibility



{- TEXT DECORATION LINES -}


{-| An [`underline`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Internal.Value)
text decoration line.
-}
underline : Internal.Value { textDecorationLine : Compatible }
underline =
    Internal.value []
        (EmittedString "underline")
        { textDecorationLine = Compatible }


{-| An [`overline`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Internal.Value)
text decoration line.
-}
overline : Internal.Value { textDecorationLine : Compatible }
overline =
    Internal.value []
        (EmittedString "overline")
        { textDecorationLine = Compatible }


{-| A [`line-through`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Internal.Value)
text decoration line.
-}
lineThrough : Internal.Value { textDecorationLine : Compatible }
lineThrough =
    Internal.value []
        (EmittedString "line-through")
        { textDecorationLine = Compatible }



{- BACKGROUND -}


{-| The `repeat-x` [`background-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat) value.
-}
repeatX : Internal.Value { backgroundRepeatShorthand : Compatible }
repeatX =
    Internal.value []
        (EmittedString "repeat-x")
        { backgroundRepeatShorthand = Compatible }


{-| The `repeat-y` [`background-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat) value.
-}
repeatY : Internal.Value { backgroundRepeatShorthand : Compatible }
repeatY =
    Internal.value []
        (EmittedString "repeat-y")
        { backgroundRepeatShorthand = Compatible }


{-| The `repeat` [`background-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat) value.
-}
repeat :
    Internal.Value
        { backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        }
repeat =
    Internal.value []
        (EmittedString "repeat")
        { backgroundRepeat = Compatible
        , backgroundRepeatShorthand = Compatible
        }


{-| The `space` [`background-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat) value.
-}
space :
    Internal.Value
        { backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        }
space =
    Internal.value []
        (EmittedString "space")
        { backgroundRepeat = Compatible
        , backgroundRepeatShorthand = Compatible
        }


{-| The `round` [`background-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat) value.
-}
round :
    Internal.Value
        { backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        }
round =
    Internal.value []
        (EmittedString "round")
        { backgroundRepeat = Compatible
        , backgroundRepeatShorthand = Compatible
        }


{-| The `no-repeat` [`background-repeat`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat) value.
-}
noRepeat :
    Internal.Value
        { backgroundRepeat : Compatible
        , backgroundRepeatShorthand : Compatible
        }
noRepeat =
    Internal.value []
        (EmittedString "no-repeat")
        { backgroundRepeat = Compatible
        , backgroundRepeatShorthand = Compatible
        }


{-| The `local` [`background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment) value.
-}
local : Internal.Value { backgroundAttachment : Compatible }
local =
    Internal.value []
        (EmittedString "local")
        { backgroundAttachment = Compatible }



{- LINEAR GRADIENT -}


{-| Sets [`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient)

    linearGradient  (stop2 red <| pct 75%) (stop <| hex "222") []
    linearGradient  (stop red) (stop <| hex "222") [ stop green, stop blue ]

-}
linearGradient :
    ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    -> ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    -> List ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    ->
        Internal.Value
            { backgroundImage : Compatible
            , listStyleTypeOrPositionOrImage : Compatible
            }
linearGradient stop1 stop2 stops =
    let
        val =
            ([ stop1, stop2 ] ++ stops)
                |> collectStops
                |> cssFunction "linear-gradient"
    in
    Internal.value []
        (EmittedString val)
        { backgroundImage = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


{-| Sets [`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient)

    linearGradient  toBottomLeft (stop2 red <| pct 75%) (stop <| hex "222") []
    linearGradient  toTop (stop red) (stop <| hex "222") [ stop green, stop blue ]

-}
linearGradient2 :
    Internal.Value compatible
    -> ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    -> ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    -> List ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    ->
        Internal.Value
            { backgroundImage : Compatible
            , listStyleTypeOrPositionOrImage : Compatible
            }
linearGradient2 dir stop1 stop2 stops =
    let
        val =
            ([ stop1, stop2 ] ++ stops)
                |> collectStops
                |> (::) ("to " ++ valueToString dir)
                |> cssFunction "linear-gradient"
    in
    Internal.value []
        (EmittedString val)
        { backgroundImage = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        }


collectStops :
    List ( Internal.Value compatibility, Maybe (Internal.Value compatibility1) )
    -> List String
collectStops =
    List.map <|
        \( c, len ) ->
            len
                |> Maybe.map (String.cons ' ' << valueToString)
                |> Maybe.withDefault ""
                |> String.append (valueToString c)


{-| [`ColorStop`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
stop : b -> ( b, Maybe a )
stop c =
    ( c, Nothing )


{-| [`ColorStop`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
stop2 : a -> b -> ( a, Maybe b )
stop2 c len =
    ( c, Just len )


{-| Sets the direction to [`top`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toTop : Internal.Value { angleOrDirection : Compatible }
toTop =
    Internal.value []
        (EmittedString "top")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`top right`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toTopRight : Internal.Value { angleOrDirection : Compatible }
toTopRight =
    Internal.value []
        (EmittedString "top right")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`right`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toRight : Internal.Value { angleOrDirection : Compatible }
toRight =
    Internal.value []
        (EmittedString "right")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`bottom right`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toBottomRight : Internal.Value { angleOrDirection : Compatible }
toBottomRight =
    Internal.value []
        (EmittedString "bottom right")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toBottom : Internal.Value { angleOrDirection : Compatible }
toBottom =
    Internal.value []
        (EmittedString "bottom")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`bottom left`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toBottomLeft : Internal.Value { angleOrDirection : Compatible }
toBottomLeft =
    Internal.value []
        (EmittedString "bottom left")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`left`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toLeft : Internal.Value { angleOrDirection : Compatible }
toLeft =
    Internal.value []
        (EmittedString "left")
        { angleOrDirection = Compatible }


{-| Sets the direction to [`top left`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient#Values)
-}
toTopLeft : Internal.Value { angleOrDirection : Compatible }
toTopLeft =
    Internal.value []
        (EmittedString "top left")
        { angleOrDirection = Compatible }



{- BORDERS -}


{-| -}
block : Internal.Value { display : Compatible }
block =
    Internal.value []
        (EmittedString "block")
        { display = Compatible }


{-| -}
inlineBlock : Internal.Value { display : Compatible }
inlineBlock =
    Internal.value []
        (EmittedString "inline-block")
        { display = Compatible }


{-| Sets the display style to [`inline-flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
inlineFlex : Internal.Value { display : Compatible }
inlineFlex =
    Internal.value []
        (EmittedString "inline-flex")
        { display = Compatible }


{-| -}
inline : Internal.Value { display : Compatible }
inline =
    Internal.value []
        (EmittedString "inline")
        { display = Compatible }


{-| Sets the display style to [`table`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
table : Internal.Value { display : Compatible }
table =
    Internal.value []
        (EmittedString "table")
        { display = Compatible }


{-| Sets the display style to [`inline-table`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
inlineTable : Internal.Value { display : Compatible }
inlineTable =
    Internal.value []
        (EmittedString "inline-table")
        { display = Compatible }


{-| Sets the display style to [`table-row`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableRow : Internal.Value { display : Compatible }
tableRow =
    Internal.value []
        (EmittedString "table-row")
        { display = Compatible }


{-| Sets the display style to [`table-cell`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableCell : Internal.Value { display : Compatible }
tableCell =
    Internal.value []
        (EmittedString "table-cell")
        { display = Compatible }


{-| Sets the display style to [`table-column`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableColumn : Internal.Value { display : Compatible }
tableColumn =
    Internal.value []
        (EmittedString "table-column")
        { display = Compatible }


{-| Sets the display style to [`table-caption`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableCaption : Internal.Value { display : Compatible }
tableCaption =
    Internal.value []
        (EmittedString "table-caption")
        { display = Compatible }


{-| Sets the display style to [`table-row-group`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableRowGroup : Internal.Value { display : Compatible }
tableRowGroup =
    Internal.value []
        (EmittedString "table-row-group")
        { display = Compatible }


{-| Sets the display style to [`table-column-group`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableColumnGroup : Internal.Value { display : Compatible }
tableColumnGroup =
    Internal.value []
        (EmittedString "table-column-group")
        { display = Compatible }


{-| Sets the display style to [`table-header-group`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableHeaderGroup : Internal.Value { display : Compatible }
tableHeaderGroup =
    Internal.value []
        (EmittedString "table-header-group")
        { display = Compatible }


{-| Sets the display style to [`table-footer-group`](https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values)
-}
tableFooterGroup : Internal.Value { display : Compatible }
tableFooterGroup =
    Internal.value []
        (EmittedString "table-footer-group")
        { display = Compatible }


{-| -}
listItem : Internal.Value { display : Compatible }
listItem =
    Internal.value []
        (EmittedString "list-item")
        { display = Compatible }


{-| -}
inlineListItem : Internal.Value { display : Compatible }
inlineListItem =
    Internal.value []
        (EmittedString "inline-list-item")
        { display = Compatible }


{-| -}
none :
    Internal.Value
        { borderStyle : Compatible
        , cursor : Compatible
        , display : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , none : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , listStyleType : Compatible
        , listStyleTypeOrPositionOrImage : Compatible
        , outline : Compatible
        , resize : Compatible
        , textDecorationLine : Compatible
        , transform : Compatible
        , backgroundImage : Compatible
        , textTransform : Compatible
        }
none =
    Internal.value []
        (EmittedString "none")
        { cursor = Compatible
        , none = Compatible
        , lengthOrNone = Compatible
        , lengthOrNoneOrMinMaxDimension = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        , textDecorationLine = Compatible
        , listStyleType = Compatible
        , listStyleTypeOrPositionOrImage = Compatible
        , display = Compatible
        , outline = Compatible
        , resize = Compatible
        , transform = Compatible
        , borderStyle = Compatible
        , backgroundImage = Compatible
        , textTransform = Compatible
        }


{-| -}
auto :
    Internal.Value
        { lengthOrAuto : Compatible
        , overflow : Compatible
        , textRendering : Compatible
        , flexBasis : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , alignItemsOrAuto : Compatible
        , justifyContentOrAuto : Compatible
        , cursor : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , intOrAuto : Compatible
        }
auto =
    Internal.value []
        (EmittedString "auto")
        { cursor = Compatible
        , flexBasis = Compatible
        , overflow = Compatible
        , textRendering = Compatible
        , lengthOrAuto = Compatible
        , lengthOrNumberOrAutoOrNoneOrContent = Compatible
        , alignItemsOrAuto = Compatible
        , lengthOrAutoOrCoverOrContain = Compatible
        , justifyContentOrAuto = Compatible
        , intOrAuto = Compatible
        }


{-| -}
noWrap :
    Internal.Value
        { flexDirectionOrWrap : Compatible
        , flexWrap : Compatible
        , whiteSpace : Compatible
        }
noWrap =
    Internal.value []
        (EmittedString "nowrap")
        { whiteSpace = Compatible
        , flexWrap = Compatible
        , flexDirectionOrWrap = Compatible
        }



{- VERTICAL-ALIGN -}


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    verticalAlign middle

-}
middle : Internal.Value a -> Style
middle =
    prop1 "middle"


{-| The `baseline` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    verticalAlign baseline

-}
baseline : Internal.Value a -> Style
baseline =
    prop1 "baseline"


{-| The `sub` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    verticalAlign sub

-}
sub : Internal.Value a -> Style
sub =
    prop1 "sub"


{-| The `super` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    verticalAlign super

-}
super : Internal.Value a -> Style
super =
    prop1 "super"


{-| The `text-top` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    verticalAlign textTop

-}
textTop : Internal.Value a -> Style
textTop =
    prop1 "text-top"


{-| The `text-bottom` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    verticalAlign textBottom

-}
textBottom : Internal.Value a -> Style
textBottom =
    prop1 "text-bottom"


{-| The [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) property.
-}
position : Internal.Value a -> Style
position =
    prop1 "position"



{- Properties -}


prop1 : String -> Internal.Value a -> Style
prop1 key arg =
    property key (valueToString arg)


prop2 : String -> Internal.Value a -> Internal.Value b -> Style
prop2 key argA argB =
    property key (String.join " " [ valueToString argA, valueToString argB ])


prop3 : String -> Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
prop3 key argA argB argC =
    property key (String.join " " [ valueToString argA, valueToString argB, valueToString argC ])


prop4 : String -> Internal.Value a -> Internal.Value b -> Internal.Value c -> Internal.Value d -> Style
prop4 key argA argB argC argD =
    property key (String.join " " [ valueToString argA, valueToString argB, valueToString argC, valueToString argD ])


prop5 : String -> Internal.Value a -> Internal.Value b -> Internal.Value c -> Internal.Value d -> Internal.Value e -> Style
prop5 key argA argB argC argD argE =
    property key (String.join " " [ valueToString argA, valueToString argB, valueToString argC, valueToString argD, valueToString argE ])


prop6 : String -> Internal.Value a -> Internal.Value b -> Internal.Value c -> Internal.Value d -> Internal.Value e -> Internal.Value f -> Style
prop6 key argA argB argC argD argE argF =
    property key (String.join " " [ valueToString argA, valueToString argB, valueToString argC, valueToString argD, valueToString argE, valueToString argF ])


{-| Sets ['float'](https://developer.mozilla.org/en-US/docs/Web/CSS/float)
float : Float compatible -> Style

    float right

-}
float :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
float fn =
    getOverloadedProperty "float" "float" (fn lengthForOverloadedProperty)


{-| Sets [`text-decoration-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color)

    textDecorationColor (rgb 12 11 10)

-}
textDecorationColor : Internal.Value compatibility -> Style
textDecorationColor val =
    propertyWithWarnings (Internal.warnings val) "text-decoration-color" (valueToString val)


{-| Sets ['text-emphasis-color'](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-color)

     textEmphasisColor (rgb 100 100 100)

-}
textEmphasisColor : Internal.Value compatibility -> Style
textEmphasisColor val =
    propertyWithWarnings (Internal.warnings val) "text-emphasis-color" (valueToString val)


{-| Sets [`text-align-last`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align-last).
**Note:** `auto` is not currently supported here. If you need to set this property to `auto`,
use this workaround:

    property "text-align-last" "auto"

    If this is annoying, please file an issue, so adding support for "auto"
    can be prioritized!

-}
textAlignLast :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
textAlignLast fn =
    getOverloadedProperty "textAlignLast" "text-align-last" (fn lengthForOverloadedProperty)


{-| Sets [`text-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textAlign :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
textAlign fn =
    getOverloadedProperty "textAlign" "text-align" (fn lengthForOverloadedProperty)


{-| Sets [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering).
-}
textRendering : Internal.Value a -> Style
textRendering =
    prop1 "text-rendering"


{-| Sets [`text-orientation`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation).

    text-orientation mixed

-}
textOrientation : Internal.Value a -> Style
textOrientation =
    prop1 "text-orientation"


{-| Sets [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow).

    textOverflow ellipsis

-}
textOverflow : Internal.Value a -> Style
textOverflow =
    prop1 "text-overflow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    textShadow  none
    textShadow2 (px 1) (px 2)
    textShadow3 (px 1) (px 2) (rgb 211 121 112)
    textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow : Internal.Value a -> Style
textShadow =
    prop1 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    textShadow  none
    textShadow2 (px 1) (px 2)
    textShadow3 (px 1) (px 2) (rgb 211 121 112)
    textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow2 : Internal.Value a -> Internal.Value b -> Style
textShadow2 =
    prop2 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    textShadow  none
    textShadow2 (px 1) (px 2)
    textShadow3 (px 1) (px 2) (rgb 211 121 112)
    textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
textShadow3 =
    prop3 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    textShadow  none
    textShadow2 (px 1) (px 2)
    textShadow3 (px 1) (px 2) (rgb 211 121 112)
    textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow4 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Style
textShadow4 =
    prop4 "text-shadow"


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  none
    boxShadow2 (px 1) (px 2)
    boxShadow3 (px 1) (px 2) (rgb 211 121 112)
    boxShadow3 (px 1) (px 2) (px 3)
    boxShadow3 inset (px 2) (px 3)
    boxShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 inset (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 (px 1) (px 2) (px 3) (px 4)
    boxShadow4 inset (px 2) (px 3) (px 4)
    boxShadow5 (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow5 inset (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)

-}
boxShadow : Internal.Value a -> Style
boxShadow =
    prop1 "box-shadow"


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  none
    boxShadow2 (px 1) (px 2)
    boxShadow3 (px 1) (px 2) (rgb 211 121 112)
    boxShadow3 (px 1) (px 2) (px 3)
    boxShadow3 inset (px 2) (px 3)
    boxShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 inset (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 (px 1) (px 2) (px 3) (px 4)
    boxShadow4 inset (px 2) (px 3) (px 4)
    boxShadow5 (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow5 inset (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)

-}
boxShadow2 : Internal.Value a -> Internal.Value b -> Style
boxShadow2 =
    prop2 "box-shadow"


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  none
    boxShadow2 (px 1) (px 2)
    boxShadow3 (px 1) (px 2) (rgb 211 121 112)
    boxShadow3 (px 1) (px 2) (px 3)
    boxShadow3 inset (px 2) (px 3)
    boxShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 inset (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 (px 1) (px 2) (px 3) (px 4)
    boxShadow4 inset (px 2) (px 3) (px 4)
    boxShadow5 (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow5 inset (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)

-}
boxShadow3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
boxShadow3 =
    prop3 "box-shadow"


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  none
    boxShadow2 (px 1) (px 2)
    boxShadow3 (px 1) (px 2) (rgb 211 121 112)
    boxShadow3 (px 1) (px 2) (px 3)
    boxShadow3 inset (px 2) (px 3)
    boxShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 inset (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 (px 1) (px 2) (px 3) (px 4)
    boxShadow4 inset (px 2) (px 3) (px 4)
    boxShadow5 (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow5 inset (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)

-}
boxShadow4 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Style
boxShadow4 =
    prop4 "box-shadow"


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  none
    boxShadow2 (px 1) (px 2)
    boxShadow3 (px 1) (px 2) (rgb 211 121 112)
    boxShadow3 (px 1) (px 2) (px 3)
    boxShadow3 inset (px 2) (px 3)
    boxShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 inset (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 (px 1) (px 2) (px 3) (px 4)
    boxShadow4 inset (px 2) (px 3) (px 4)
    boxShadow5 (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow5 inset (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)

-}
boxShadow5 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Internal.Value e
    -> Style
boxShadow5 =
    prop5 "box-shadow"


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  none
    boxShadow2 (px 1) (px 2)
    boxShadow3 (px 1) (px 2) (rgb 211 121 112)
    boxShadow3 (px 1) (px 2) (px 3)
    boxShadow3 inset (px 2) (px 3)
    boxShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 inset (px 2) (px 3) (rgb 211 121 112)
    boxShadow4 (px 1) (px 2) (px 3) (px 4)
    boxShadow4 inset (px 2) (px 3) (px 4)
    boxShadow5 (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow5 inset (px 2) (px 3) (px 4) (rgb 211 121 112)
    boxShadow6 inset (px 1) (px 2) (px 3) (px 4) (rgb 211 121 112)

-}
boxShadow6 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Internal.Value e
    -> Internal.Value f
    -> Style
boxShadow6 =
    prop6 "box-shadow"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    textIndent  (px 40)
    textIndent2 (px 40) hanging
    textIndent3 (px 40) hanging eachLine

-}
textIndent : Internal.Value a -> Style
textIndent =
    prop1 "text-indent"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    textIndent  (px 40)
    textIndent2 (px 40) hanging
    textIndent3 (px 40) hanging eachLine

-}
textIndent2 : Internal.Value a -> Internal.Value b -> Style
textIndent2 =
    prop2 "text-indent"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    textIndent  (px 40)
    textIndent2 (px 40) hanging
    textIndent3 (px 40) hanging eachLine

-}
textIndent3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
textIndent3 =
    prop3 "text-indent"


{-| Sets [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform).
-}
textTransform : Internal.Value a -> Style
textTransform =
    prop1 "text-transform"


{-| Sets [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align).
-}
verticalAlign :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
verticalAlign fn =
    getOverloadedProperty "verticalAlign" "vertical-align" (fn lengthForOverloadedProperty)


{-| For `display: flex`, use [`displayFlex`](#displayFlex).
-}
display : Value { c | display : Compatible } -> Style
display =
    prop1 "display"


{-| `display: flex`. This works around the fact that
[`flex` is already taken](#flex).
-}
displayFlex : Style
displayFlex =
    property "display" "flex"


{-| -}
opacity : Internal.Value a -> Style
opacity =
    prop1 "opacity"


{-| Sets [`width`](https://developer.mozilla.org/en-US/docs/Web/CSS/width)

    width (px 960)

-}
width : Internal.Value a -> Style
width =
    prop1 "width"


{-| Sets [`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width)

    maxWidth (px 960)

-}
maxWidth : Internal.Value a -> Style
maxWidth =
    prop1 "max-width"


{-| Sets [`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width)

    minWidth (px 100)

-}
minWidth : Internal.Value a -> Style
minWidth =
    prop1 "min-width"


{-| Sets [`height`](https://developer.mozilla.org/en-US/docs/Web/CSS/height)

    height (px 800)

-}
height : Internal.Value a -> Style
height =
    prop1 "height"


{-| Sets [`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height)

    minHeight (px 100)

-}
minHeight : Internal.Value a -> Style
minHeight =
    prop1 "min-height"


{-| Sets [`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height)

    maxHeight (px 1024)

-}
maxHeight : Internal.Value a -> Style
maxHeight =
    prop1 "max-height"



{- PADDING PROPERTIES -}


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)

-}
padding : Internal.Value a -> Style
padding =
    prop1 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)

-}
padding2 : Internal.Value a -> Internal.Value b -> Style
padding2 =
    prop2 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)

-}
padding3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
padding3 =
    prop3 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)

-}
padding4 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Style
padding4 =
    prop4 "padding"


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start)

    paddingBlockStart (px 10)

-}
paddingBlockStart : Internal.Value a -> Style
paddingBlockStart =
    prop1 "padding-block-start"


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end)

    paddingBlockEnd (px 10)

-}
paddingBlockEnd : Internal.Value a -> Style
paddingBlockEnd =
    prop1 "padding-block-end"


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start)

    paddingInlineStart (px 10)

-}
paddingInlineStart : Internal.Value a -> Style
paddingInlineStart =
    prop1 "padding-inline-start"


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end)

    paddingInlineEnd (px 10)

-}
paddingInlineEnd : Internal.Value a -> Style
paddingInlineEnd =
    prop1 "padding-inline-end"


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top)

    paddingTop (px 10)

-}
paddingTop : Internal.Value a -> Style
paddingTop =
    prop1 "padding-top"


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom)

    paddingBottom (px 10)

-}
paddingBottom : Internal.Value a -> Style
paddingBottom =
    prop1 "padding-bottom"


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right)

    paddingRight (px 10)

-}
paddingRight : Internal.Value a -> Style
paddingRight =
    prop1 "padding-right"


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left)

    paddingLeft (px 10)

-}
paddingLeft : Internal.Value a -> Style
paddingLeft =
    prop1 "padding-left"



{- MARGIN PROPERTIES -}


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)

-}
margin : Internal.Value a -> Style
margin =
    prop1 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)

-}
margin2 : Internal.Value a -> Internal.Value b -> Style
margin2 =
    prop2 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)

-}
margin3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
margin3 =
    prop3 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)

-}
margin4 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Style
margin4 =
    prop4 "margin"


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top)

    marginTop (px 10)

-}
marginTop : Internal.Value a -> Style
marginTop =
    prop1 "margin-top"


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom)

    marginBottom (px 10)

-}
marginBottom : Internal.Value a -> Style
marginBottom =
    prop1 "margin-bottom"


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right)

    marginRight (px 10)

-}
marginRight : Internal.Value a -> Style
marginRight =
    prop1 "margin-right"


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left)

    marginLeft (px 10)

-}
marginLeft : Internal.Value a -> Style
marginLeft =
    prop1 "margin-left"


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start)

    marginBlockStart (px 10)

-}
marginBlockStart : Internal.Value a -> Style
marginBlockStart =
    prop1 "margin-block-start"


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end)

    marginBlockEnd (px 10)

-}
marginBlockEnd : Internal.Value a -> Style
marginBlockEnd =
    prop1 "margin-block-end"


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start)

    marginInlineStart (px 10)

-}
marginInlineStart : Internal.Value a -> Style
marginInlineStart =
    prop1 "margin-inline-start"


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end)

    marginInlineEnd (px 10)

-}
marginInlineEnd : Internal.Value a -> Style
marginInlineEnd =
    prop1 "margin-inline-end"


{-| The [`top`](https://developer.mozilla.org/en-US/docs/Web/CSS/top) property.

    position absolute
    top (px 5)

This can also be used as a `top` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    verticalAlign top

-}
top : Internal.Value a -> Style
top =
    prop1 "top"


{-| The [`bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/bottom) property.

    position absolute
    bottom (px 5)

This can also be used as a `bottom` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    verticalAlign bottom

-}
bottom : Internal.Value a -> Style
bottom =
    prop1 "bottom"


{-| The [`left`](https://developer.mozilla.org/en-US/docs/Web/CSS/left) property.

    position absolute
    left (px 5)

This can also be used as a `left` [text alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    textAlign left

It can also be used as a `left` [float](https://developer.mozilla.org/en-US/docs/Web/CSS/float) value :

    float left

-}
left : Internal.Value a -> Style
left =
    prop1 "left"


{-| Sets [`right`](https://developer.mozilla.org/en-US/docs/Web/CSS/right).

    position absolute
    right (px 5)

This can also be used as a `right` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    textAlign right

It can also be used as a `right` [float](https://developer.mozilla.org/en-US/docs/Web/CSS/float) value :

    float right

-}
right : Internal.Value a -> Style
right =
    prop1 "right"



{- MIN-MAX DIMENSIONS -}


{-| The `max-content` value for
[`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
maxContent :
    Internal.Value
        { lengthOrMinMaxDimension : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , minMaxDimension : Compatible
        }
maxContent =
    Internal.value [] (EmittedString "max-content") dimensionsCompatibility


{-| The `min-content` value for
[`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
minContent :
    Internal.Value
        { lengthOrMinMaxDimension : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , minMaxDimension : Compatible
        }
minContent =
    Internal.value [] (EmittedString "min-content") dimensionsCompatibility


{-| The `fit-content` value for
[`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
fitContent :
    Internal.Value
        { lengthOrMinMaxDimension : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , minMaxDimension : Compatible
        }
fitContent =
    Internal.value [] (EmittedString "fit-content") dimensionsCompatibility


{-| The `fill-available` value for
[`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
fillAvailable :
    Internal.Value
        { lengthOrMinMaxDimension : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , minMaxDimension : Compatible
        }
fillAvailable =
    Internal.value []
        (EmittedString "fill-available")
        dimensionsCompatibility


dimensionsCompatibility :
    { lengthOrMinMaxDimension : Compatible
    , lengthOrNoneOrMinMaxDimension : Compatible
    , minMaxDimension : Compatible
    }
dimensionsCompatibility =
    { minMaxDimension = Compatible
    , lengthOrMinMaxDimension = Compatible
    , lengthOrNoneOrMinMaxDimension = Compatible
    }



{- POSITIONING -}


{-| A `static` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    position static

-}
static : Internal.Value { position : Compatible }
static =
    Internal.value []
        (EmittedString "static")
        { position = Compatible }


{-| A `fixed` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.
This can also represent a `fixed` [`background-attachment`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment) value.

    position fixed

-}
fixed : Internal.Value { backgroundAttachment : Compatible, position : Compatible }
fixed =
    Internal.value []
        (EmittedString "fixed")
        { position = Compatible
        , backgroundAttachment = Compatible
        }


{-| A `sticky` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    position sticky

-}
sticky : Internal.Value { position : Compatible }
sticky =
    Internal.value []
        (EmittedString "sticky")
        { position = Compatible }


{-| A `relative` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    position relative

-}
relative : Internal.Value { position : Compatible }
relative =
    Internal.value []
        (EmittedString "relative")
        { position = Compatible }


{-| An `absolute` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    position absolute

-}
absolute : Internal.Value { position : Compatible }
absolute =
    Internal.value []
        (EmittedString "absolute")
        { position = Compatible }



{- FONT VALUES -}
-- Families --


{-| -}
serif : Internal.Value { fontFamily : Compatible }
serif =
    Internal.value [] (EmittedString "serif") { fontFamily = Compatible }


{-| -}
sansSerif : Internal.Value { fontFamily : Compatible }
sansSerif =
    Internal.value [] (EmittedString "sans-serif") { fontFamily = Compatible }


{-| -}
monospace : Internal.Value { fontFamily : Compatible }
monospace =
    Internal.value [] (EmittedString "monospace") { fontFamily = Compatible }


{-| -}
cursive : Internal.Value { fontFamily : Compatible }
cursive =
    Internal.value [] (EmittedString "cursive") { fontFamily = Compatible }


{-| -}
fantasy : Internal.Value { fontFamily : Compatible }
fantasy =
    Internal.value [] (EmittedString "fantasy") { fontFamily = Compatible }



-- Size --


{-| -}
xxSmall : Internal.Value { fontSize : Compatible }
xxSmall =
    Internal.value [] (EmittedString "xx-small") { fontSize = Compatible }


{-| -}
xSmall : Internal.Value { fontSize : Compatible }
xSmall =
    Internal.value [] (EmittedString "x-small") { fontSize = Compatible }


{-| -}
small : Internal.Value { fontSize : Compatible }
small =
    Internal.value [] (EmittedString "small") { fontSize = Compatible }


{-| -}
medium : Internal.Value { fontSize : Compatible }
medium =
    Internal.value [] (EmittedString "medium") { fontSize = Compatible }


{-| -}
large : Internal.Value { fontSize : Compatible }
large =
    Internal.value [] (EmittedString "large") { fontSize = Compatible }


{-| -}
xLarge : Internal.Value { fontSize : Compatible }
xLarge =
    Internal.value [] (EmittedString "x-large") { fontSize = Compatible }


{-| -}
xxLarge : Internal.Value { fontSize : Compatible }
xxLarge =
    Internal.value [] (EmittedString "xx-large") { fontSize = Compatible }


{-| -}
smaller : Internal.Value { fontSize : Compatible }
smaller =
    Internal.value [] (EmittedString "smaller") { fontSize = Compatible }


{-| -}
larger : Internal.Value { fontSize : Compatible }
larger =
    Internal.value [] (EmittedString "larger") { fontSize = Compatible }



-- Styles --


{-| -}
normal :
    Internal.Value
        { featureTagValue : Compatible
        , fontStyle : Compatible
        , fontWeight : Compatible
        , overflowWrap : Compatible
        }
normal =
    Internal.value []
        (EmittedString "normal")
        { fontStyle = Compatible
        , fontWeight = Compatible
        , featureTagValue = Compatible
        , overflowWrap = Compatible
        }


{-| -}
italic : Internal.Value { fontStyle : Compatible }
italic =
    Internal.value [] (EmittedString "italic") { fontStyle = Compatible }


{-| -}
oblique : Internal.Value { fontStyle : Compatible }
oblique =
    Internal.value [] (EmittedString "oblique") { fontStyle = Compatible }



-- Weights --


{-| -}
bold : Internal.Value { fontWeight : Compatible }
bold =
    Internal.value []
        (EmittedString "bold")
        { fontWeight = Compatible }


{-| -}
lighter : Internal.Value { fontWeight : Compatible }
lighter =
    Internal.value []
        (EmittedString "lighter")
        { fontWeight = Compatible }


{-| -}
bolder : Internal.Value { fontWeight : Compatible }
bolder =
    Internal.value []
        (EmittedString "bolder")
        { fontWeight = Compatible }



-- VARIANTS --
-- CAPS --


{-| -}
smallCaps : Internal.Value { fontVariant : Compatible, fontVariantCaps : Compatible }
smallCaps =
    Internal.value [] (EmittedString "small-caps") { fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
allSmallCaps : Internal.Value { fontVariant : Compatible, fontVariantCaps : Compatible }
allSmallCaps =
    Internal.value [] (EmittedString "all-small-caps") { fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
petiteCaps : Internal.Value { fontVariant : Compatible, fontVariantCaps : Compatible }
petiteCaps =
    Internal.value [] (EmittedString "petite-caps") { fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
allPetiteCaps : Internal.Value { fontVariant : Compatible, fontVariantCaps : Compatible }
allPetiteCaps =
    Internal.value [] (EmittedString "all-petite-caps") { fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
unicase : Internal.Value { fontVariant : Compatible, fontVariantCaps : Compatible }
unicase =
    Internal.value [] (EmittedString "unicase") { fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
titlingCaps : Internal.Value { fontVariant : Compatible, fontVariantCaps : Compatible }
titlingCaps =
    Internal.value [] (EmittedString "titling-caps") { fontVariant = Compatible, fontVariantCaps = Compatible }



-- LIGATURES --


{-| -}
commonLigatures : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
commonLigatures =
    Internal.value []
        (EmittedString "common-ligatures")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
noCommonLigatures : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
noCommonLigatures =
    Internal.value []
        (EmittedString "no-common-ligatures")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
discretionaryLigatures : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
discretionaryLigatures =
    Internal.value []
        (EmittedString "discretionary-ligatures")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
noDiscretionaryLigatures : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
noDiscretionaryLigatures =
    Internal.value []
        (EmittedString "no-discretionary-ligatures")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
historicalLigatures : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
historicalLigatures =
    Internal.value []
        (EmittedString "historical-ligatures")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
noHistoricalLigatures : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
noHistoricalLigatures =
    Internal.value []
        (EmittedString "no-historical-ligatures")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
contextual : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
contextual =
    Internal.value []
        (EmittedString "context")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }


{-| -}
noContextual : Internal.Value { fontVariant : Compatible, fontVariantLigatures : Compatible }
noContextual =
    Internal.value []
        (EmittedString "no-contextual")
        { fontVariant = Compatible
        , fontVariantLigatures = Compatible
        }



-- NUMERIC --


{-| -}
liningNums : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
liningNums =
    Internal.value []
        (EmittedString "lining-nums")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
oldstyleNums : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
oldstyleNums =
    Internal.value []
        (EmittedString "oldstyle-nums")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
proportionalNums : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
proportionalNums =
    Internal.value []
        (EmittedString "proportional-nums")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
tabularNums : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
tabularNums =
    Internal.value []
        (EmittedString "tabular-nums")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
diagonalFractions : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
diagonalFractions =
    Internal.value []
        (EmittedString "diagonal-fractions")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
stackedFractions : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
stackedFractions =
    Internal.value []
        (EmittedString "stacked-fractions")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
ordinal : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
ordinal =
    Internal.value []
        (EmittedString "ordinal")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }


{-| -}
slashedZero : Internal.Value { fontVariant : Compatible, fontVariantNumeric : Compatible }
slashedZero =
    Internal.value []
        (EmittedString "slashed-zero")
        { fontVariant = Compatible
        , fontVariantNumeric = Compatible
        }



{- FEATURE TAG VALUES -}


{-| Alias for `on` value of [`font-feature-settings`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#Formal_syntax)
-}
featureOn : Int
featureOn =
    1


{-| Alias for `off` value of [`font-feature-settings`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#Formal_syntax)
-}
featureOff : Int
featureOff =
    0


{-| Creates a [`feature-tag-value`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#feature-tag-value)
with the default value of `1`

    fontFeatureSettings (featureTag "hist")

-}
featureTag : String -> Internal.Value { featureTagValue : Compatible }
featureTag tag =
    featureTag2 tag 1


{-| Creates a [`feature-tag-value`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#feature-tag-value)
with a particular integer value

    fontFeatureSettings (featureTag2 "smcp" on)
    fontFeatureSettings (featureTag2 "swsh" 2)

-}
featureTag2 : String -> Int -> Internal.Value { featureTagValue : Compatible }
featureTag2 tag value =
    let
        potentialWarnings =
            [ ( String.length tag /= 4, "Feature tags must be exactly 4 characters long. " ++ tag ++ " is invalid." )
            , ( value < 0, "Feature values cannot be negative. " ++ toString value ++ " is invalid." )
            ]

        warnings =
            potentialWarnings
                |> List.filter Tuple.first
                |> List.map Tuple.second
    in
    Internal.value warnings
        (EmittedString (toString tag ++ " " ++ toString value))
        { featureTagValue = Compatible }



{- BORDER PROPERTIES -}


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border : Internal.Value { r | length : Compatible } -> Style
border =
    prop1 "border"


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
border2 =
    prop2 "border"


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border3 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Internal.Value c -> Style
border3 =
    prop3 "border"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop : Internal.Value { r | length : Compatible } -> Style
borderTop =
    prop1 "border-top"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderTop2 =
    prop2 "border-top"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop3 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Internal.Value c -> Style
borderTop3 =
    prop3 "border-top"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom : Internal.Value { r | length : Compatible } -> Style
borderBottom =
    prop1 "border-bottom"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderBottom2 =
    prop2 "border-bottom"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom3 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value b
    -> Internal.Value c
    -> Style
borderBottom3 =
    prop3 "border-bottom"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft : Internal.Value { r | length : Compatible } -> Style
borderLeft =
    prop1 "border-left"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderLeft2 =
    prop2 "border-left"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft3 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Internal.Value c -> Style
borderLeft3 =
    prop3 "border-left"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight : Internal.Value { r | length : Compatible } -> Style
borderRight =
    prop1 "border-right"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderRight2 =
    prop2 "border-right"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight3 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Internal.Value c -> Style
borderRight3 =
    prop3 "border-right"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart : Internal.Value { r | length : Compatible } -> Style
borderBlockStart =
    prop1 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderBlockStart2 =
    prop2 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart3 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value b
    -> Internal.Value c
    -> Style
borderBlockStart3 =
    prop3 "border-block-start"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd : Internal.Value { r | length : Compatible } -> Style
borderBlockEnd =
    prop1 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderBlockEnd2 =
    prop2 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd3 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value b
    -> Internal.Value c
    -> Style
borderBlockEnd3 =
    prop3 "border-block-end"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart : Internal.Value { r | length : Compatible } -> Style
borderInlineStart =
    prop1 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderInlineStart2 =
    prop2 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart3 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value b
    -> Internal.Value c
    -> Style
borderInlineStart3 =
    prop3 "border-block-start"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd : Internal.Value { r | length : Compatible } -> Style
borderInlineEnd =
    prop1 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd2 : Internal.Value { r | length : Compatible } -> Internal.Value b -> Style
borderInlineEnd2 =
    prop2 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd3 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value b
    -> Internal.Value c
    -> Style
borderInlineEnd3 =
    prop3 "border-block-end"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (int 2)
    borderImageOutset2 (int 2) (px 15)
    borderImageOutset3 (int 2) (px 15) (int 1.5)
    borderImageOutset4 (int 2) (px 15) (int 14) (em 3)

-}
borderImageOutset : Internal.Value { r | lengthOrNumber : Compatible } -> Style
borderImageOutset =
    prop1 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (int 2)
    borderImageOutset2 (int 2) (px 15)
    borderImageOutset3 (int 2) (px 15) (int 1.5)
    borderImageOutset4 (int 2) (px 15) (int 14) (em 3)

-}
borderImageOutset2 :
    Internal.Value { r1 | lengthOrNumber : Compatible }
    -> Internal.Value { r2 | lengthOrNumber : Compatible }
    -> Style
borderImageOutset2 =
    prop2 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (int 2)
    borderImageOutset2 (int 2) (px 15)
    borderImageOutset3 (int 2) (px 15) (int 1.5)
    borderImageOutset4 (int 2) (px 15) (int 14) (em 3)

-}
borderImageOutset3 :
    Internal.Value { r1 | lengthOrNumber : Compatible }
    -> Internal.Value { r2 | lengthOrNumber : Compatible }
    -> Internal.Value { r3 | lengthOrNumber : Compatible }
    -> Style
borderImageOutset3 =
    prop3 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (int 2)
    borderImageOutset2 (int 2) (px 15)
    borderImageOutset3 (int 2) (px 15) (int 1.5)
    borderImageOutset4 (int 2) (px 15) (int 14) (em 3)

-}
borderImageOutset4 :
    Internal.Value { r1 | lengthOrNumber : Compatible }
    -> Internal.Value { r2 | lengthOrNumber : Compatible }
    -> Internal.Value { r3 | lengthOrNumber : Compatible }
    -> Internal.Value { r4 | lengthOrNumber : Compatible }
    -> Style
borderImageOutset4 =
    prop4 "border-image-outset"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (int 3)
    borderImageWidth2 (int 3) (px 15)
    borderImageWidth3 (int 3) (px 15) auto
    borderImageWidth4 (int 3) (px 15) auto (int 2)

-}
borderImageWidth : Internal.Value { r | length : Compatible } -> Style
borderImageWidth =
    prop1 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (int 3)
    borderImageWidth2 (int 3) (px 15)
    borderImageWidth3 (int 3) (px 15) auto
    borderImageWidth4 (int 3) (px 15) auto (int 2)

-}
borderImageWidth2 : Internal.Value { r | length : Compatible } -> Internal.Value { r | length : Compatible } -> Style
borderImageWidth2 =
    prop2 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (int 3)
    borderImageWidth2 (int 3) (px 15)
    borderImageWidth3 (int 3) (px 15) auto
    borderImageWidth4 (int 3) (px 15) auto (int 2)

-}
borderImageWidth3 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value { r | length : Compatible }
    -> Internal.Value { r | length : Compatible }
    -> Style
borderImageWidth3 =
    prop3 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (int 3)
    borderImageWidth2 (int 3) (px 15)
    borderImageWidth3 (int 3) (px 15) auto
    borderImageWidth4 (int 3) (px 15) auto (int 2)

-}
borderImageWidth4 :
    Internal.Value { r | length : Compatible }
    -> Internal.Value { r | length : Compatible }
    -> Internal.Value { r | length : Compatible }
    -> Internal.Value { r | length : Compatible }
    -> Style
borderImageWidth4 =
    prop4 "border-image-width"


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color)

    borderBlockStartColor (rgb 101 202 0)

-}
borderBlockStartColor : Internal.Value compatibility -> Style
borderBlockStartColor val =
    propertyWithWarnings (Internal.warnings val) "border-block-start-color" (valueToString val)


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color)

    borderBottomColor (rgb 101 202 0)

-}
borderBottomColor : Internal.Value compatibility -> Style
borderBottomColor val =
    propertyWithWarnings (Internal.warnings val) "border-bottom-color" (valueToString val)


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color)

    borderInlineStartColor (rgb 101 202 0)

-}
borderInlineStartColor : Internal.Value compatibility -> Style
borderInlineStartColor val =
    propertyWithWarnings (Internal.warnings val) "border-inline-start-color" (valueToString val)


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color)

    borderInlineEndColor (rgb 101 202 0)

-}
borderInlineEndColor : Internal.Value compatibility -> Style
borderInlineEndColor val =
    propertyWithWarnings (Internal.warnings val) "border-inline-end-color" (valueToString val)


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color)

    borderLeftColor (rgb 101 202 0)

-}
borderLeftColor : Internal.Value compatibility -> Style
borderLeftColor val =
    propertyWithWarnings (Internal.warnings val) "border-left-color" (valueToString val)


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color)

    borderRightColor (rgb 101 202 0)

-}
borderRightColor : Internal.Value compatibility -> Style
borderRightColor val =
    propertyWithWarnings (Internal.warnings val) "border-right-color" (valueToString val)


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color)

    borderTopColor (rgb 101 202 0)

-}
borderTopColor : Internal.Value compatibility -> Style
borderTopColor val =
    propertyWithWarnings (Internal.warnings val) "border-top-color" (valueToString val)


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color)

    borderBlockEndColor (rgb 101 202 0)

-}
borderBlockEndColor : Internal.Value compatibility -> Style
borderBlockEndColor val =
    propertyWithWarnings (Internal.warnings val) "border-block-end-color" (valueToString val)


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style)

    borderBlockEndStyle dashed

-}
borderBlockEndStyle : Internal.Value a -> Style
borderBlockEndStyle =
    prop1 "border-block-end-style"


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style)

    borderBlockStartStyle dashed

-}
borderBlockStartStyle : Internal.Value a -> Style
borderBlockStartStyle =
    prop1 "border-block-start-style"


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style)

    borderInlineEndStyle dashed

-}
borderInlineEndStyle : Internal.Value a -> Style
borderInlineEndStyle =
    prop1 "border-inline-end-style"


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style)

    borderBottomStyle dashed

-}
borderBottomStyle : Internal.Value a -> Style
borderBottomStyle =
    prop1 "border-bottom-style"


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style)

    borderInlineStartStyle dashed

-}
borderInlineStartStyle : Internal.Value a -> Style
borderInlineStartStyle =
    prop1 "border-inline-start-style"


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style)

    borderLeftStyle dashed

-}
borderLeftStyle : Internal.Value a -> Style
borderLeftStyle =
    prop1 "border-left-style"


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style)

    borderRightStyle dashed

-}
borderRightStyle : Internal.Value a -> Style
borderRightStyle =
    prop1 "border-right-style"


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style)

    borderTopStyle dashed

-}
borderTopStyle : Internal.Value a -> Style
borderTopStyle =
    prop1 "border-top-style"


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style)

    borderStyle dashed

-}
borderStyle : Internal.Value a -> Style
borderStyle =
    prop1 "border-style"


{-| Sets [`border-collapse`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-collapse)

    borderCollapse collapse

-}
borderCollapse : Internal.Value a -> Style
borderCollapse =
    prop1 "border-collapse"


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)

    borderWidth  (em 4)
    borderWidth2 (em 4) (px 2)
    borderWidth3 (em 4) (px 2) (pct 5)
    borderWidth4 (em 4) (px 2) (pct 5) (px 3)

-}
borderWidth : Internal.Value a -> Style
borderWidth =
    prop1 "border-width"


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)

    borderWidth  (em 4)
    borderWidth2 (em 4) (px 2)
    borderWidth3 (em 4) (px 2) (pct 5)
    borderWidth4 (em 4) (px 2) (pct 5) (px 3)

-}
borderWidth2 : Internal.Value a -> Internal.Value b -> Style
borderWidth2 =
    prop2 "border-width"


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)

    borderWidth  (em 4)
    borderWidth2 (em 4) (px 2)
    borderWidth3 (em 4) (px 2) (pct 5)
    borderWidth4 (em 4) (px 2) (pct 5) (px 3)

-}
borderWidth3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
borderWidth3 =
    prop3 "border-width"


{-| Sets [`border-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)

    borderWidth  (em 4)
    borderWidth2 (em 4) (px 2)
    borderWidth3 (em 4) (px 2) (pct 5)
    borderWidth4 (em 4) (px 2) (pct 5) (px 3)

-}
borderWidth4 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Style
borderWidth4 =
    prop4 "border-width"


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width)

    borderBottomWidth (em 4)

-}
borderBottomWidth : Internal.Value a -> Style
borderBottomWidth =
    prop1 "border-bottom-width"


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width)

    borderInlineEndWidth (em 4)

-}
borderInlineEndWidth : Internal.Value a -> Style
borderInlineEndWidth =
    prop1 "border-inline-end-width"


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width)

    borderLeftWidth (em 4)

-}
borderLeftWidth : Internal.Value a -> Style
borderLeftWidth =
    prop1 "border-left-width"


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width)

    borderRightWidth (em 4)

-}
borderRightWidth : Internal.Value a -> Style
borderRightWidth =
    prop1 "border-right-width"


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)

-}
borderTopWidth : Internal.Value a -> Style
borderTopWidth =
    prop1 "border-top-width"


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)

-}
borderTopWidth2 : Internal.Value a -> Internal.Value b -> Style
borderTopWidth2 =
    prop2 "border-top-width"


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius : Internal.Value a -> Style
borderBottomLeftRadius =
    prop1 "border-bottom-left-radius"


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)

-}
borderBottomLeftRadius2 : Internal.Value a -> Internal.Value b -> Style
borderBottomLeftRadius2 =
    prop2 "border-bottom-left-radius"


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius : Internal.Value a -> Style
borderBottomRightRadius =
    prop1 "border-bottom-right-radius"


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)

-}
borderBottomRightRadius2 : Internal.Value a -> Internal.Value b -> Style
borderBottomRightRadius2 =
    prop2 "border-bottom-right-radius"


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius : Internal.Value a -> Style
borderTopLeftRadius =
    prop1 "border-top-left-radius"


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)

-}
borderTopLeftRadius2 : Internal.Value a -> Internal.Value b -> Style
borderTopLeftRadius2 =
    prop2 "border-top-left-radius"


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius : Internal.Value a -> Style
borderTopRightRadius =
    prop1 "border-top-right-radius"


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)

-}
borderTopRightRadius2 : Internal.Value a -> Internal.Value b -> Style
borderTopRightRadius2 =
    prop2 "border-top-right-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius : Internal.Value a -> Style
borderRadius =
    prop1 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius2 : Internal.Value a -> Internal.Value b -> Style
borderRadius2 =
    prop2 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius3 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Style
borderRadius3 =
    prop3 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)

-}
borderRadius4 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Internal.Value d
    -> Style
borderRadius4 =
    prop4 "border-radius"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)

-}
borderSpacing : Internal.Value a -> Style
borderSpacing =
    prop1 "border-spacing"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)

-}
borderSpacing2 : Internal.Value a -> Internal.Value b -> Style
borderSpacing2 =
    prop2 "border-spacing"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)

-}
borderColor : Internal.Value { r | color : Compatible } -> Style
borderColor val =
    propertyWithWarnings (Internal.warnings val) "border-color" (valueToString val)


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)

-}
borderColor2 :
    Internal.Value { r | color : Compatible }
    -> Internal.Value { r | color : Compatible }
    -> Style
borderColor2 c1 c2 =
    let
        warnings =
            Internal.warnings c1 ++ Internal.warnings c2

        value =
            String.join " " [ valueToString c1, valueToString c2 ]
    in
    propertyWithWarnings warnings "border-color" value


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)

-}
borderColor3 :
    Internal.Value { r | color : Compatible }
    -> Internal.Value { r | color : Compatible }
    -> Internal.Value { r | color : Compatible }
    -> Style
borderColor3 c1 c2 c3 =
    let
        warnings =
            Internal.warnings c1 ++ Internal.warnings c2 ++ Internal.warnings c3

        value =
            String.join " " [ valueToString c1, valueToString c2, valueToString c3 ]
    in
    propertyWithWarnings warnings "border-color" value


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)

-}
borderColor4 :
    Internal.Value { r | color : Compatible }
    -> Internal.Value { r | color : Compatible }
    -> Internal.Value { r | color : Compatible }
    -> Internal.Value { r | color : Compatible }
    -> Style
borderColor4 c1 c2 c3 c4 =
    let
        warnings =
            Internal.warnings c1 ++ Internal.warnings c2 ++ Internal.warnings c3 ++ Internal.warnings c4

        value =
            String.join " " [ valueToString c1, valueToString c2, valueToString c3, valueToString c4 ]
    in
    propertyWithWarnings warnings "border-color" value


{-| Sets [`outline`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline)

    outline  zero
    outline  initial
    outline3 (px 10) dashed (rgb 11 14 17)

-}
outline : Internal.Value a -> Style
outline =
    prop1 "outline"


{-| Sets [`outline`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline)

    outline  zero
    outline  initial
    outline3 (px 10) dashed (rgb 11 14 17)

-}
outline3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
outline3 =
    prop3 "outline"


{-| Sets [`outline-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color)

    outlineColor (rgb 11 14 17)
    outlineColor (hex "#ffffff")
    outlineColor (hsla 120 0.5 0.5 0.5)

-}
outlineColor : Internal.Value compatibility -> Style
outlineColor val =
    propertyWithWarnings (Internal.warnings val) "outline-color" (valueToString val)


{-| Sets [`outline-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-width)

    outlineWidth (px 10)
    outlineWidth (em 1.4)
    outlineWidth none

-}
outlineWidth : Internal.Value a -> Style
outlineWidth =
    prop1 "outline-width"


{-| Sets [`outline-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-style)

    outlineStyle dashed
    outlineStyle solid
    outlineStyle outset

-}
outlineStyle : Internal.Value a -> Style
outlineStyle =
    prop1 "outline-style"


{-| Sets [`outline-offset`](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-offset)

    outlineOffset (px 10)
    outlineOffset (em 1.4)
    outlineOffset (pct 50)

-}
outlineOffset : Internal.Value a -> Style
outlineOffset =
    prop1 "outline-offset"


{-| -}
resize : Internal.Value a -> Style
resize =
    prop1 "resize"


{-| -}
fill : Internal.Value a -> Style
fill =
    prop1 "fill"


{-| -}
overflow : Internal.Value a -> Style
overflow =
    prop1 "overflow"


{-| -}
overflowX : Internal.Value a -> Style
overflowX =
    prop1 "overflow-x"


{-| -}
overflowY : Internal.Value a -> Style
overflowY =
    prop1 "overflow-y"


{-| -}
overflowWrap : Internal.Value a -> Style
overflowWrap =
    prop1 "overflow-wrap"


{-| -}
whiteSpace : Internal.Value a -> Style
whiteSpace =
    prop1 "white-space"


{-| -}
backgroundColor : Internal.Value compatibility -> Style
backgroundColor val =
    propertyWithWarnings (Internal.warnings val) "background-color" (valueToString val)


{-| Sets ['background-repeat'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat)

    backgroundRepeat repeatX

-}
backgroundRepeat : Internal.Value a -> Style
backgroundRepeat =
    prop1 "background-repeat"


{-| Sets ['background-repeat'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat)

    backgroundRepeat2 repeat noRepeat

-}
backgroundRepeat2 : Internal.Value a -> Internal.Value b -> Style
backgroundRepeat2 =
    prop2 "background-repeat"


{-| Sets ['background-attachment'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment)

    backgroundAttachment fixed

-}
backgroundAttachment : Internal.Value a -> Style
backgroundAttachment =
    prop1 "background-attachment"


{-| Sets ['background-position'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position)

    backgroundPosition top

Only supports keywords values like "top" or "center". If you want to pass a single length, use `backgroundPosition2`:

    backgroundPosition2 (px 10) zero

-}
backgroundPosition :
    (Internal.Value
        { calc : Compatible
        , flexBasis : Compatible
        , fontSize : Compatible
        , length : Compatible
        , lengthOrAuto : Compatible
        , lengthOrAutoOrCoverOrContain : Compatible
        , lengthOrMinMaxDimension : Compatible
        , lengthOrNone : Compatible
        , lengthOrNoneOrMinMaxDimension : Compatible
        , lengthOrNumber : Compatible
        , lengthOrNumberOrAutoOrNoneOrContent : Compatible
        , textIndent : Compatible
        , units : IncompatibleUnits
        }
     -> Style
    )
    -> Style
backgroundPosition fn =
    getOverloadedProperty "backgroundPosition" "background-position" (fn lengthForOverloadedProperty)


{-| Sets ['background-position'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position)

    backgroundPosition2 (px 10) zero

-}
backgroundPosition2 : Internal.Value a -> Internal.Value b -> Style
backgroundPosition2 =
    prop2 "background-position"


{-| Sets ['background-blend-mode'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-blend-mode)

    backgroundBlendMode darken

-}
backgroundBlendMode :
    (Internal.Value { color : Compatible } -> Style)
    -> Style
backgroundBlendMode fn =
    getOverloadedProperty "backgroundBlendMode" "background-blend-mode" (fn colorValueForOverloadedProperty)


{-| Sets ['background-clip'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip)

    backgroundClip borderBox

-}
backgroundClip : Internal.Value a -> Style
backgroundClip =
    prop1 "background-clip"


{-| Sets ['background-origin'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin)

    backgroundOrigin borderBox

-}
backgroundOrigin : Internal.Value a -> Style
backgroundOrigin =
    prop1 "background-origin"


{-| Sets ['background-image'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-image)

    backgroundImage (url "http://www.example.com/chicken.jpg")

-}
backgroundImage : Internal.Value a -> Style
backgroundImage =
    prop1 "background-image"


{-| Sets ['background-size'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size)

    backgroundSize cover

-}
backgroundSize : Internal.Value a -> Style
backgroundSize =
    prop1 "background-size"


{-| Sets ['background-size'](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size)

    backgroundSize2 50% auto

-}
backgroundSize2 : Internal.Value a -> Internal.Value b -> Style
backgroundSize2 =
    prop2 "background-size"


{-| -}
color : Internal.Value compatibility -> Style
color val =
    propertyWithWarnings (Internal.warnings val) "color" (valueToString val)


{-| -}
mediaQuery : String -> List Snippet -> Snippet
mediaQuery queryString snippets =
    media [ Structure.MediaQuery queryString ] snippets


{-| -}
media : List Structure.MediaQuery -> List Snippet -> Snippet
media mediaQueries snippets =
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
                    Preprocess.MediaRule (mediaQueries ++ nestedMediaQueries) styleBlocks
                        :: nestedMediaRules rest

                first :: rest ->
                    first :: nestedMediaRules rest
    in
    Preprocess.Snippet (mediaRuleFromStyleBlocks :: nestedMediaRules snippetDeclarations)


{-| -}
withMedia : List Structure.MediaQuery -> List Style -> Style
withMedia =
    Preprocess.WithMedia



{- FONT PROPERTIES -}


{-| Sets [`line-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/line-height)

    lineHeight (px 10)

-}
lineHeight : Internal.Value a -> Style
lineHeight =
    prop1 "line-height"


{-| Sets [`letter-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/letter-spacing)

    letterSpacing (px 10)

-}
letterSpacing : Internal.Value a -> Style
letterSpacing =
    prop1 "letter-spacing"


{-| -}
src : Internal.Value compatible -> String
src =
    Internal.valueToString


{-| -}
fontFace : String -> String
fontFace value =
    "font-face " ++ value


{-| For use with [`font-family`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family)

    fontFamily    serif
    fontFamilies  [(qt "Gill Sans Extrabold"), "Helvetica", .value sansSerif]

-}
qt : String -> String
qt str =
    toString str


{-| For when your font is one of [`serif`](#serif), [`sansSerif`](#sansSerif), [`monospace`](#monospace), [`cursive`](#cursive) or [`fantasy`](#fantasy).
If you want to refer to a font by its name (like Helvetica or Arial), use [`fontFamilies`](#fontFamilies) instead.
-}
fontFamily : Internal.Value a -> Style
fontFamily =
    prop1 "font-family"


{-| For multiple font families:

    fontFamilies  ["Verdana", "Arial"]
    fontFamilies  [(qt "Gill Sans Extrabold"), "Helvetica", .value sansSerif]

-}
fontFamilies : List String -> Style
fontFamilies =
    prop1 "font-family" << stringsToValue


{-| Sets [`font-feature-settings`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings)

    fontFeatureSettings (featureTag "hist")
    fontFeatureSettings (featureTag2 "smcp" on)
    fontFeatureSettings (featureTag2 "swsh" 2)

-}
fontFeatureSettings : Internal.Value compatibility -> Style
fontFeatureSettings val =
    propertyWithWarnings (Internal.warnings val) "font-feature-settings" (valueToString val)


{-| Sets [`font-feature-settings`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings)

    fontFeatureSettingsList [featureTag "c2sc", featureTag "smcp"]

-}
fontFeatureSettingsList :
    List (Internal.Value compatibility)
    -> Style
fontFeatureSettingsList featureTagValues =
    let
        value =
            featureTagValues |> List.map valueToString |> String.join ", "

        warnings =
            featureTagValues |> List.map Internal.warnings |> List.concat
    in
    propertyWithWarnings warnings "font-feature-settings" value


{-| Sets [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size)

    fontSize  xxSmall
    fontSize  (px 12)

-}
fontSize : Internal.Value a -> Style
fontSize =
    prop1 "font-size"


{-| Sets [`font-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style)

    fontStyle  italic

-}
fontStyle : Internal.Value a -> Style
fontStyle =
    prop1 "font-style"


{-| Sets [`font-weight`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight)

    fontWeight  bold
    fontWeight  (int 300)

-}
fontWeight : Internal.Value compatible -> Style
fontWeight val =
    let
        warnings =
            case Internal.emittedValue val of
                EmittedString _ ->
                    -- This means it was one of the string keywords, e.g. "bold"
                    []

                EmittedNumber weight _ ->
                    let
                        isValid =
                            List.range 1 9
                                |> List.map ((*) 100)
                                |> List.member (floor weight)
                    in
                    if isValid then
                        []
                    else
                        [ "fontWeight " ++ toString weight ++ " is invalid. Valid weights are: 100, 200, 300, 400, 500, 600, 700, 800, 900. Please see https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#Values" ]

                EmittedColor _ ->
                    [ "fontWeight" ++ Internal.valueToString val ++ " is invalid." ]

                EmittedCalc _ _ _ ->
                    []

                InvalidValue _ ->
                    []
    in
    propertyWithWarnings warnings "font-weight" (Internal.valueToString val)


{-| Sets [`font-variant`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)

    fontVariant   smallCaps
    fontVariant2  commonLigatures smallCaps
    fontVariant3  commonLigatures smallCaps slashedZero
    fontVariants  [ oldstyleNums tabularNums stackedFractions ordinal slashedZero ]

-}
fontVariant : Internal.Value a -> Style
fontVariant =
    prop1 "font-variant"


{-| -}
fontVariant2 : Internal.Value a -> Internal.Value b -> Style
fontVariant2 =
    prop2 "font-variant"


{-| -}
fontVariant3 : Internal.Value a -> Internal.Value b -> Internal.Value c -> Style
fontVariant3 =
    prop3 "font-variant"


{-| -}
fontVariantLigatures : Internal.Value a -> Style
fontVariantLigatures =
    prop1 "font-variant-ligatures"


{-| -}
fontVariantCaps : Internal.Value a -> Style
fontVariantCaps =
    prop1 "font-variant-caps"


{-| -}
fontVariantNumeric : Internal.Value a -> Style
fontVariantNumeric =
    prop1 "font-variant-numeric"


{-| -}
fontVariantNumeric2 : Internal.Value a -> Internal.Value b -> Style
fontVariantNumeric2 =
    prop2 "font-variant-numeric"


{-| -}
fontVariantNumeric3 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Style
fontVariantNumeric3 =
    prop3 "font-variant-numeric"


{-| -}
fontVariantNumerics : List (Internal.Value compatible) -> Style
fontVariantNumerics =
    prop1 "font-variant-numeric" << valuesOrNone



{- CURSOR PROPERTIES -}


{-| A [`cursor`](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor#Values)
specifies the mouse cursor displayed when mouse pointer is over an element.
-}
cursor : Internal.Value a -> Style
cursor =
    prop1 "cursor"



{- CURSOR VALUES -}


{-| -}
default : Internal.Value Compatible
default =
    Internal.value [] (EmittedString "default") { cursor = Compatible }


{-| -}
crosshair : Internal.Value Compatible
crosshair =
    Internal.value [] (EmittedString "crosshair") { cursor = Compatible }


{-| -}
contextMenu : Internal.Value Compatible
contextMenu =
    Internal.value [] (EmittedString "context-menu") { cursor = Compatible }


{-| -}
help : Internal.Value Compatible
help =
    Internal.value [] (EmittedString "help") { cursor = Compatible }


{-| -}
pointer : Internal.Value Compatible
pointer =
    Internal.value [] (EmittedString "pointer") { cursor = Compatible }


{-| -}
progress : Internal.Value Compatible
progress =
    Internal.value [] (EmittedString "progress") { cursor = Compatible }


{-| -}
wait : Internal.Value Compatible
wait =
    Internal.value [] (EmittedString "wait") { cursor = Compatible }


{-| -}
cell : Internal.Value Compatible
cell =
    Internal.value [] (EmittedString "cell") { cursor = Compatible }


{-| -}
text : Internal.Value Compatible
text =
    Internal.value [] (EmittedString "text") { cursor = Compatible }


{-| -}
verticalText : Internal.Value Compatible
verticalText =
    Internal.value [] (EmittedString "vertical-text") { cursor = Compatible }


{-| -}
cursorAlias : Internal.Value Compatible
cursorAlias =
    Internal.value [] (EmittedString "alias") { cursor = Compatible }


{-| -}
copy : Internal.Value Compatible
copy =
    Internal.value [] (EmittedString "copy") { cursor = Compatible }


{-| -}
move : Internal.Value Compatible
move =
    Internal.value [] (EmittedString "move") { cursor = Compatible }


{-| -}
noDrop : Internal.Value Compatible
noDrop =
    Internal.value [] (EmittedString "no-drop") { cursor = Compatible }


{-| -}
notAllowed : Internal.Value Compatible
notAllowed =
    Internal.value [] (EmittedString "not-allowed") { cursor = Compatible }


{-| -}
eResize : Internal.Value Compatible
eResize =
    Internal.value [] (EmittedString "e-resize") { cursor = Compatible }


{-| -}
nResize : Internal.Value Compatible
nResize =
    Internal.value [] (EmittedString "n-resize") { cursor = Compatible }


{-| -}
neResize : Internal.Value Compatible
neResize =
    Internal.value [] (EmittedString "ne-resize") { cursor = Compatible }


{-| -}
nwResize : Internal.Value Compatible
nwResize =
    Internal.value [] (EmittedString "nw-resize") { cursor = Compatible }


{-| -}
sResize : Internal.Value Compatible
sResize =
    Internal.value [] (EmittedString "s-resize") { cursor = Compatible }


{-| -}
seResize : Internal.Value Compatible
seResize =
    Internal.value [] (EmittedString "se-resize") { cursor = Compatible }


{-| -}
swResize : Internal.Value Compatible
swResize =
    Internal.value [] (EmittedString "sw-resize") { cursor = Compatible }


{-| -}
wResize : Internal.Value Compatible
wResize =
    Internal.value [] (EmittedString "w-resize") { cursor = Compatible }


{-| -}
ewResize : Internal.Value Compatible
ewResize =
    Internal.value [] (EmittedString "ew-resize") { cursor = Compatible }


{-| -}
nsResize : Internal.Value Compatible
nsResize =
    Internal.value [] (EmittedString "ns-resize") { cursor = Compatible }


{-| -}
neswResize : Internal.Value Compatible
neswResize =
    Internal.value [] (EmittedString "nesw-resize") { cursor = Compatible }


{-| -}
nwseResize : Internal.Value Compatible
nwseResize =
    Internal.value [] (EmittedString "nwse-resize") { cursor = Compatible }


{-| -}
colResize : Internal.Value Compatible
colResize =
    Internal.value [] (EmittedString "col-resize") { cursor = Compatible }


{-| -}
rowResize : Internal.Value Compatible
rowResize =
    Internal.value [] (EmittedString "row-resize") { cursor = Compatible }


{-| -}
allScroll : Internal.Value Compatible
allScroll =
    Internal.value [] (EmittedString "all-scroll") { cursor = Compatible }


{-| -}
zoomIn : Internal.Value Compatible
zoomIn =
    Internal.value [] (EmittedString "zoom-in") { cursor = Compatible }


{-| -}
zoomOut : Internal.Value Compatible
zoomOut =
    Internal.value [] (EmittedString "zoom-out") { cursor = Compatible }


{-| -}
grab : Internal.Value Compatible
grab =
    Internal.value [] (EmittedString "grab") { cursor = Compatible }


{-| -}
grabbing : Internal.Value Compatible
grabbing =
    Internal.value [] (EmittedString "grabbing") { cursor = Compatible }



{- TEXT DECORATION PROPERTIES -}


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    textDecoration  underline
    textDecoration2 underline wavy
    textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    textDecorations  [ underline, overline ]
    textDecorations2 [ underline, overline ] wavy
    textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)

-}
textDecoration : Internal.Value a -> Style
textDecoration =
    prop1 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    textDecoration  underline
    textDecoration2 underline wavy
    textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    textDecorations  [ underline, overline ]
    textDecorations2 [ underline, overline ] wavy
    textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)

-}
textDecoration2 : Internal.Value a -> Internal.Value b -> Style
textDecoration2 =
    prop2 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    textDecoration  underline
    textDecoration2 underline wavy
    textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    textDecorations  [ underline, overline ]
    textDecorations2 [ underline, overline ] wavy
    textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)

-}
textDecoration3 :
    Internal.Value a
    -> Internal.Value b
    -> Internal.Value c
    -> Style
textDecoration3 =
    prop3 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    textDecorations  [ underline, overline ]
    textDecorations2 [ underline, overline ] wavy
    textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)

-}
textDecorations : List (Internal.Value compatible) -> Style
textDecorations =
    prop1 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    textDecorations  [ underline, overline ]
    textDecorations2 [ underline, overline ] wavy
    textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)

-}
textDecorations2 : List (Internal.Value compatible) -> Internal.Value b -> Style
textDecorations2 =
    prop2 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    textDecorations  [ underline, overline ]
    textDecorations2 [ underline, overline ] wavy
    textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)

-}
textDecorations3 :
    List (Internal.Value compatible)
    -> Internal.Value b
    -> Internal.Value c
    -> Style
textDecorations3 =
    prop3 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    textDecorationLine underline

You can specify multiple line decorations with `textDecorationLines`.

    textDecorationLines  [ underline, overline ]

-}
textDecorationLine : Internal.Value a -> Style
textDecorationLine =
    prop1 "text-decoration-line"


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    textDecorationLines  [ underline, overline ]

-}
textDecorationLines : List (Internal.Value compatible) -> Style
textDecorationLines =
    prop1 "text-decoration-line" << valuesOrNone


{-| Sets [`text-decoration-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style)

    textDecorationStyle dotted

-}
textDecorationStyle : Internal.Value a -> Style
textDecorationStyle =
    prop1 "text-decoration-style"


{-| Sets [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)

    animationName  Foo

You can also use [`animationNames`](#animationNames) to set multiple animation
names, or to set `animation-name: none;`

    animationNames [ Foo, Bar ]
    animationNames [] -- outputs "animation-name: none;"

-}
animationName : animation -> Style
animationName identifier =
    animationNames [ identifier ]


{-| Sets [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)

    animationNames [ Foo, Bar ]

Pass `[]` to set `animation-name: none;`

    animationNames [] -- outputs "animation-name: none;"

-}
animationNames : List animation -> Style
animationNames identifiers =
    let
        value =
            identifiers
                |> List.map (identifierToString "")
                |> String.join ", "
    in
    property "animation-name" value


{-| A stylesheet.

    stylesheet
        [ body
            [ width (px 960)
            , color (rgb 7 7 7)
            ]
        ]

-}
stylesheet : List Snippet -> Stylesheet
stylesheet =
    Preprocess.stylesheet


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


{-| An [id selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors).

    stylesheet
        [ id NavBar
            [ width 960 px
            , backgroundColor (rgb 123 42 208)
            ]
        ]

-}
id : id -> List Style -> Snippet
id identifier styles =
    [ Structure.IdSelector (identifierToString "" identifier) ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles


makeSnippet : List Style -> Structure.SimpleSelectorSequence -> Snippet
makeSnippet styles sequence =
    let
        selector =
            Structure.Selector sequence [] Nothing
    in
    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock selector [] styles) ]
        |> Preprocess.Snippet


{-| A [class selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors).

    stylesheet
        [ class LoginFormButton
            [ fontWeight normal
            , color (rgb 128 64 32)
            ]
        ]

-}
class : class -> List Style -> Snippet
class class styles =
    [ Structure.ClassSelector (identifierToString "" class) ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles



-- {-| A Style that adds the [Clearfix for Modern Browsers](http://www.cssmojo.com/latest_new_clearfix_so_far/#clearfix-for-modern-browsers)
-- implementation of [clearfix](http://www.cssmojo.com/clearfix_block-formatting-context_and_hasLayout/).
--
-- This works with Internet Explorer 8 and later; if you need
-- to support older browsers, consider using the legacy [Micro Clearfix from 2011](http://nicolasgallagher.com/micro-clearfix-hack/)
-- instead.
-- -}
--clearfix : Style
--clearfix =
--  styles
--    [ after
--        [ content ""
--        , display table
--        , clear both
--        ]
--    ]


{-| A custom selector. Use this for things like
[attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
and [universal selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    stylesheet "homepage"
        [ selector "* [lang^=en]"
            [ textDecoration underline
            , color (rgb 7 7 7)
            ]
        ]

-}
selector : String -> List Style -> Snippet
selector selectorStr styles =
    Structure.CustomSelector selectorStr []
        |> makeSnippet styles


{-| A [`*` selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    class Foo
      [ children
          [ everything
              [ color (rgb 14 15 16)
              , borderRadius (px 5)
              ]
          ]
      ]

...compiles to:

    .Foo > * {
      color: rgb(14, 15, 16);
      border-radius: 5px;
    }

-}
everything : List Style -> Snippet
everything styles =
    Structure.UniversalSelectorSequence []
        |> makeSnippet styles


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
property =
    propertyWithWarnings []


propertyWithWarnings : List String -> String -> String -> Style
propertyWithWarnings warnings key value =
    { key = key, value = value, important = False, warnings = warnings }
        |> Preprocess.AppendProperty



-- Pseudo-Classes --


type Directionality
    = Ltr
    | Rtl


directionalityToString : Directionality -> String
directionalityToString directionality =
    case directionality of
        Ltr ->
            "ltr"

        Rtl ->
            "rtl"


{-| Define a custom pseudo-class.

This can be useful for deprecated pseudo-classes such as `-moz-any-link`, which
[has been deprecated and removed](https://www.fxsitecompat.com/en-CA/docs/2016/any-link-css-pseudo-class-has-been-unprefixed/)
in modern browsers.

    stylesheet
      [ body
          [ pseudoClass "-moz-any-link" [ color (hex "f00") ] ]
      ]

...outputs

    body:-moz-any-link {
        color: #f00;
    }

-}
pseudoClass : String -> List Style -> Style
pseudoClass class =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector class)


{-| An [`:active`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aactive)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
active : List Style -> Style
active =
    pseudoClass "active"


{-| An [`:any`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aany)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
any : String -> List Style -> Style
any str =
    pseudoClass ("any(" ++ str ++ ")")


{-| A [`:checked`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Achecked)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
checked : List Style -> Style
checked =
    pseudoClass "checked"


{-| A [`:dir`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Adir)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
dir : Directionality -> List Style -> Style
dir directionality =
    pseudoClass ("dir(" ++ directionalityToString directionality ++ ")")


{-| A [`:disabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Adisabled)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
disabled : List Style -> Style
disabled =
    pseudoClass "disabled"


{-| An [`:empty`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aempty)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
empty : List Style -> Style
empty =
    pseudoClass "empty"


{-| An [`:enabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aenabled)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
enabled : List Style -> Style
enabled =
    pseudoClass "enabled"


{-| A [`:first`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
first : List Style -> Style
first =
    pseudoClass "first"


{-| A [`:first-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
firstChild : List Style -> Style
firstChild =
    pseudoClass "first-child"


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
firstOfType : List Style -> Style
firstOfType =
    pseudoClass "first-of-type"


{-| A [`:fullscreen`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afullscreen)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
fullscreen : List Style -> Style
fullscreen =
    pseudoClass "fullscreen"


{-| A [`:focus`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afocus)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
focus : List Style -> Style
focus =
    pseudoClass "focus"


{-| An [`:hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ahover)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
hover : List Style -> Style
hover =
    pseudoClass "hover"


{-| An [`:visited`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Avisited)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
visited : List Style -> Style
visited =
    pseudoClass "visited"


{-| An [`:indeterminate`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aindeterminate)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
indeterminate : List Style -> Style
indeterminate =
    pseudoClass "indeterminate"


{-| An [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ainvalid)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
invalid : List Style -> Style
invalid =
    pseudoClass "invalid"


{-| A [`:lang`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alang)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lang : String -> List Style -> Style
lang str =
    pseudoClass ("lang(" ++ str ++ ")")


{-| A [`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alast-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lastChild : List Style -> Style
lastChild =
    pseudoClass "last-child"


{-| A [`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alast-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lastOfType : List Style -> Style
lastOfType =
    pseudoClass "last-of-type"


{-| A [`:link`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alink)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
link : List Style -> Style
link =
    pseudoClass "link"


{-| An [`:nth-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthChild : String -> List Style -> Style
nthChild str =
    pseudoClass ("nth-child(" ++ str ++ ")")


{-| An [`:nth-last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-last-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthLastChild : String -> List Style -> Style
nthLastChild str =
    pseudoClass ("nth-last-child(" ++ str ++ ")")


{-| An [`:nth-last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-last-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthLastOfType : String -> List Style -> Style
nthLastOfType str =
    pseudoClass ("nth-last-of-type(" ++ str ++ ")")


{-| An [`:nth`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthOfType : String -> List Style -> Style
nthOfType str =
    pseudoClass ("nth-of-type(" ++ str ++ ")")


{-| An [`:only-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aonly-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
onlyChild : List Style -> Style
onlyChild =
    pseudoClass "only-child"


{-| An [`:only-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aonly-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
onlyOfType : List Style -> Style
onlyOfType =
    pseudoClass "only-of-type"


{-| An [`:optional`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aoptional)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
optional : List Style -> Style
optional =
    pseudoClass "optional"


{-| An [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aout-of-range)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
outOfRange : List Style -> Style
outOfRange =
    pseudoClass "out-of-range"


{-| A [`:read-write`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aread-write)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
readWrite : List Style -> Style
readWrite =
    pseudoClass "read-write"


{-| A [`:required`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Arequired)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
required : List Style -> Style
required =
    pseudoClass "required"


{-| A [`:root`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aroot)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
root : List Style -> Style
root =
    pseudoClass "root"


{-| A [`:scope`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ascope)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
scope : List Style -> Style
scope =
    pseudoClass "scope"


{-| A [`:target`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Atarget)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
target : List Style -> Style
target =
    pseudoClass "target"


{-| A [`:valid`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Avalid)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
valid : List Style -> Style
valid =
    pseudoClass "valid"



-- Pseudo-Elements --


{-| Define a custom pseudo-element.

    stylesheet
      [ body
          [ pseudoElement "-webkit-scrollbar" [ display none ] ]
      ]

...outputs

    body::-webkit-scrollbar {
        display: none;
    }

-}
pseudoElement : String -> List Style -> Style
pseudoElement element =
    Preprocess.WithPseudoElement (Structure.PseudoElement element)


{-| An [`::after`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aafter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
after : List Style -> Style
after =
    pseudoElement "after"


{-| A [`::before`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Abefore)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
before : List Style -> Style
before =
    pseudoElement "before"


{-| A [`::first-letter`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Afirst-letter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
firstLetter : List Style -> Style
firstLetter =
    pseudoElement "first-letter"


{-| A [`::first-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Afirst-line)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
firstLine : List Style -> Style
firstLine =
    pseudoElement "first-line"


{-| A [`::selection`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aselection)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
selection : List Style -> Style
selection =
    pseudoElement "selection"



-- Intentionally Unsupported --


type IntentionallyUnsupportedPleaseSeeDocs
    = IntentionallyUnsupportedPleaseSeeDocs


{-| The
[border width values](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)
of `thin`, `medium`, and `thick` have unspecified behavior according to the
CSS specification, and as such are intentionally unsupported.

Using them is a bad idea, but if the fate of the world depends on it, you can
fall back on something like this:

    stylesheet
        [ button
            [ property "border-left" "thin" ]
        ]

-}
thin : IntentionallyUnsupportedPleaseSeeDocs
thin =
    IntentionallyUnsupportedPleaseSeeDocs


{-| The
[border width values](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)
of `thin`, `medium`, and `thick` have unspecified behavior according to the
CSS specification, and as such are intentionally unsupported.

Using them is a bad idea, but if the fate of the world depends on it, you can
fall back on something like this:

    stylesheet
        [ button
            [ property "border-left" "thick" ]
        ]

-}
thick : IntentionallyUnsupportedPleaseSeeDocs
thick =
    IntentionallyUnsupportedPleaseSeeDocs


{-| [`blink`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Internal.Value)
is ~~totally rad~~ deprecated, and as such has been ~~reluctantly~~ omitted
from elm-css.
-}
blink : IntentionallyUnsupportedPleaseSeeDocs
blink =
    IntentionallyUnsupportedPleaseSeeDocs


{-| -}
children : List Snippet -> Style
children =
    Preprocess.NestSnippet Structure.Child


{-| -}
withClass : class -> List Style -> Style
withClass class =
    Preprocess.ExtendSelector (Structure.ClassSelector (identifierToString "" class))


{-| -}
descendants : List Snippet -> Style
descendants =
    Preprocess.NestSnippet Structure.Descendant


{-| -}
adjacentSiblings : List Snippet -> Style
adjacentSiblings =
    Preprocess.NestSnippet Structure.AdjacentSibling


{-| -}
generalSiblings : List Snippet -> Style
generalSiblings =
    Preprocess.NestSnippet Structure.GeneralSibling


{-| -}
each : List (List Style -> Snippet) -> List Style -> Snippet
each snippetCreators styles =
    let
        selectorsToSnippet selectors =
            case selectors of
                [] ->
                    Preprocess.Snippet []

                first :: rest ->
                    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock first rest styles) ]
                        |> Preprocess.Snippet
    in
    List.map ((|>) []) snippetCreators
        |> List.concatMap unwrapSnippet
        |> collectSelectors
        |> selectorsToSnippet


stringToInt : String -> Int
stringToInt str =
    Result.withDefault 0 <| String.toInt str


valuesOrNone : List (Internal.Value compatible) -> Internal.Value {}
valuesOrNone list =
    let
        val =
            if List.isEmpty list then
                "none"
            else
                String.join " " (List.map valueToString list)
    in
    Internal.value [] (EmittedString val) {}


stringsToValue : List String -> Internal.Value {}
stringsToValue list =
    let
        val =
            if List.isEmpty list then
                "none"
            else
                String.join ", " list
    in
    Internal.value [] (EmittedString val) {}


{-| Compile the given stylesheets to a CSS string, or to an error
message if it could not be compiled.
-}
compile : List Stylesheet -> { css : String, warnings : List String }
compile =
    Resolve.compile


collectSelectors : List Preprocess.SnippetDeclaration -> List Structure.Selector
collectSelectors declarations =
    case declarations of
        [] ->
            []

        (Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock firstSelector otherSelectors _)) :: rest ->
            (firstSelector :: otherSelectors) ++ collectSelectors rest

        _ :: rest ->
            collectSelectors rest


{-| Take a list of styles and return a list of key-value pairs that
can then be passed to a `style` attribute.

    styled = asPairs >> Html.Attributes.style

    button
      [ styled [ position absolute, left (px 5) ] ]
      [ text "Whee!" ]

-}
asPairs : List Style -> List ( String, String )
asPairs =
    Preprocess.toPropertyPairs


{-| Sets [`z-index`](https://developer.mozilla.org/en-US/docs/Web/CSS/z-index)

    zIndex (int 2)

See <http://package.elm-lang.org/packages/rtfeldman/count/latest> for a useful library
to manage z-index values.

-}
zIndex : Internal.Value a -> Style
zIndex =
    prop1 "z-index"
