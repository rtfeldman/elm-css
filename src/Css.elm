module Css (compile, Stylesheet, Snippet, Mixin, Color, stylesheet, each, media, withMedia, withClass, everything, children, descendants, adjacentSiblings, generalSiblings, mixin, all, property, selector, important, (#), (.), (|*|), (|+|), (|-|), (|/|), transformStyle, eachLine, transformBox, transform, transforms, currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, capitalize, uppercase, lowercase, fullWidth, hanging, textIndent, textIndent2, textIndent3, ellipsis, clip, textOverflow, optimizeSpeed, optimizeLegibility, geometricPrecision, textRendering, textTransform, textShadow, textShadow2, textShadow3, textShadow4, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, minContent, maxContent, fitContent, fillAvailable, width, minWidth, maxWidth, height, minHeight, maxHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflow, overflowX, overflowY, whiteSpace, backgroundColor, color, solid, transparent, rgb, rgba, hsl, hsla, hex, zero, pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, int, float, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, contentBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, scroll, visible, block, inlineBlock, inline, none, auto, inherit, initial, unset, noWrap, static, fixed, sticky, relative, absolute, position, top, bottom, middle, baseline, sub, super, textTop, textBottom, after, before, firstLetter, firstLine, selection, active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid, hidden, wavy, dotted, dashed, double, groove, ridge, inset, outset, blink, thin, medium, thick, matrix, matrix3d, perspective, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scale3d, scaleX, scaleY, skew, skew2, skewX, skewY, translate, translate2, translate3d, translateX, translateY, translateZ, rotate, fillBox, viewBox, flat, preserve3d, deg, rad, grad, turn, flex, flex2, flex3, flexBasis, flexDirection, flexFlow1, flexFlow2, flexGrow, flexShrink, flexWrap, order, alignItems, alignSelf, content, wrapReverse, wrap, flexStart, flexEnd, stretch, row, rowReverse, column, columnReverse, lineHeight, fontFace, fontFamily, fontSize, fontStyle, fontWeight, fontVariant, fontVariant2, fontVariant3, fontVariantLigatures, fontVariantCaps, fontVariantNumeric, fontVariantNumeric2, fontVariantNumeric3, serif, sansSerif, monospace, cursive, fantasy, xxSmall, xSmall, small, large, xLarge, xxLarge, smaller, larger, normal, italic, oblique, bold, lighter, bolder, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions, ordinal, slashedZero, screen, print, projection, tv, src, qt, fontFamilies, fontVariantNumerics, dflex) where

{-| Functions for building stylesheets.

# Misc
@docs Stylesheet, absolute, all, allPetiteCaps, allSmallCaps, withClass, auto, baseline, block, bold, bolder, border, border2, border3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockEndColor, borderBlockEndStyle, borderBlockStart, borderBlockStart2, borderBlockStart3, borderBlockStartColor, borderBlockStartStyle, borderBottom, borderBottom2, borderBottom3, borderBottomColor, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderBottomStyle, borderBottomWidth, borderBox, borderColor, borderColor2, borderColor3, borderColor4, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineEndColor, borderInlineEndStyle, borderInlineEndWidth, borderInlineStart, borderInlineStart2, borderInlineStart3, borderInlineStartColor, borderInlineStartStyle, borderLeft, borderLeft2, borderLeft3, borderLeftColor, borderLeftStyle, borderLeftWidth, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderRight, borderRight2, borderRight3, borderRightColor, borderRightStyle, borderRightWidth, borderStyle, borderTop, borderTop2, borderTop3, borderTopColor, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderTopStyle, borderTopWidth, bottom, column, columnReverse, commonLigatures, content, contentBox, contextual, cursive, dashed, diagonalFractions, discretionaryLigatures, dotted, double, fantasy, fillBox, fixed, flat, flexEnd, flexStart, groove, hex, hidden, historicalLigatures, hsl, hsla, important, inherit, initial, inline, inlineBlock, inset, italic, large, larger, lighter, liningNums, matrix, matrix3d, middle, monospace, noCommonLigatures, noContextual, noDiscretionaryLigatures, noHistoricalLigatures, noWrap, none, normal, oblique, oldstyleNums, ordinal, outset, perspective, petiteCaps, position, preserve3d, proportionalNums, relative, rgb, rgba, ridge, rotate, rotate3d, rotateX, rotateY, rotateZ, row, rowReverse, sansSerif, scale, scale2, scale3d, scaleX, scaleY, scroll, serif, skew, skew2, skewX, skewY, slashedZero, small, smallCaps, smaller, solid, stackedFractions, static, sticky, stretch, sub, super, tabularNums, textBottom, textTop, titlingCaps, top, translate, translate2, translate3d, translateX, translateY, translateZ, transparent, unicase, unset, viewBox, visible, wavy, wrap, wrapReverse, xLarge, xSmall, xxLarge, xxSmall

# Style
@docs Snippet, Mixin, mixin, stylesheet, compile

# Statements
@docs (#), (.), selector, everything

# Combinators
@docs children, descendants, adjacentSiblings, generalSiblings

# Media Queries
@docs screen, tv, projection, print

# Properties
@docs property, flex, flex2, flex3, medium, alignSelf, alignItems, order, flexDirection, flexFlow1, flexFlow2, flexWrap, flexBasis, flexGrow, flexShrink, transformStyle, transformBox, transform, transforms, currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, capitalize, uppercase, lowercase, fullWidth, hanging, eachLine, textIndent, textIndent2, textIndent3, clip, ellipsis, textOverflow, optimizeSpeed, optimizeLegibility, geometricPrecision, textRendering, textTransform, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, minContent, maxContent, fitContent, fillAvailable, width, minWidth, maxWidth, height, minHeight, maxHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflow, overflowX, overflowY, whiteSpace, backgroundColor, color, withMedia, each, media, textShadow, textShadow2, textShadow3, textShadow4, lineHeight, fontFace, fontFamily, fontSize, fontStyle, fontWeight, fontVariant, fontVariant2, fontVariant3, fontVariantLigatures, fontVariantCaps, fontVariantNumeric, fontVariantNumeric2, fontVariantNumeric3, fontFamilies, fontVariantNumerics


# Values
@docs Color all, important, custom, solid, transparent, rgb, rgba, hsl, hsla, hex, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, contentBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, scroll, visible, block, inlineBlock, inline, none, auto, inherit, unset, initial, noWrap, top, static, fixed, sticky, relative, absolute, position, bottom, middle, baseline, sub, super, textTop, textBottom, hidden, wavy, dotted, dashed, solid, double, groove, ridge, inset, outset, matrix, matrix3d, perspective, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scale3d, scaleX, scaleY, skew, skew2, skewX, skewY, translate, translate2, translate3d, translateX, translateY, translateZ, rotate, fillBox, viewBox, flat, preserve3d, content, wrapReverse, wrap, flexStart, flexEnd, stretch, row, rowReverse, column, columnReverse, serif, sansSerif, monospace, cursive, fantasy, xxSmall, xSmall, small, large, xLarge, xxLarge, smaller, larger, normal, italic, oblique, bold, lighter, bolder, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps, commonLigatures, noCommonLigatures, discretionaryLigatures, noDiscretionaryLigatures, historicalLigatures, noHistoricalLigatures, contextual, noContextual, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions, ordinal, slashedZero

# Length
@docs pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, int, float, zero, (|+|), (|-|), (|*|), (|/|)

# Angle
@docs deg, rad, grad, turn

# Pseudo-Classes
@docs active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid

# Pseudo-Elements
@docs after, before, firstLetter, firstLine, selection

# Media Queries
@docs screen, print, tv, projection

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

import Css.Helpers exposing (toCssIdentifier, identifierToString)
import Css.Preprocess.Resolve as Resolve
import Css.Preprocess as Preprocess exposing (Mixin, unwrapSnippet)
import Css.Structure as Structure exposing (MediaQuery(MediaQuery))
import String


{-| -}
type alias Stylesheet =
  Preprocess.Stylesheet


{-| -}
type alias Snippet =
  Preprocess.Snippet


{-| -}
type alias Mixin =
  Preprocess.Mixin


type Compatible
  = Compatible


type PseudoClass
  = PseudoClass String (List Mixin)


type PseudoElement
  = PseudoElement String (List Mixin)


{-| -}
screen : MediaQuery
screen =
  MediaQuery "screen"


{-| -}
print : MediaQuery
print =
  MediaQuery "print"


{-| -}
projection : MediaQuery
projection =
  MediaQuery "projection"


{-| -}
tv : MediaQuery
tv =
  MediaQuery "tv"



{- Length -}


cssFunction : String -> List String -> String
cssFunction funcName args =
  funcName
    ++ "("
    ++ (String.join ", " args)
    ++ ")"


{-| Caution: trickery ahead!

This is for use with overloaded CSS properties like `left` that need to be keys
in some places and values in othes. You give it a Mixin that evaluates to the
relevant key, and then use that key as your value.

For example, `left` is a Mixin that takes a Length and adds a property like
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
getOverloadedProperty : String -> String -> Mixin -> Mixin
getOverloadedProperty functionName desiredKey mixin =
  case mixin of
    Preprocess.AppendProperty { key } ->
      -- Use the given mixin's Key as the resulting property's value.
      property desiredKey key

    Preprocess.ExtendSelector selector _ ->
      propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable mixin for selector " ++ toString selector ] desiredKey ""

    Preprocess.NestSnippet combinator _ ->
      propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable mixin for combinator " ++ toString combinator ] desiredKey ""

    Preprocess.WithPseudoElement pseudoElement _ ->
      propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable mixin for pseudo-element setter " ++ toString pseudoElement ] desiredKey ""

    Preprocess.WithMedia mediaQuery _ ->
      propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with inapplicable mixin for media query " ++ toString mediaQuery ] desiredKey ""

    Preprocess.ApplyMixins [] ->
      propertyWithWarnings [ "Cannot apply " ++ functionName ++ " with empty mixin. " ] desiredKey ""

    Preprocess.ApplyMixins (only :: []) ->
      getOverloadedProperty functionName desiredKey only

    Preprocess.ApplyMixins (first :: rest) ->
      getOverloadedProperty functionName desiredKey (Preprocess.ApplyMixins rest)


type alias Value compatible =
  { compatible | value : String }


type alias All compatible =
  { compatible | value : String, all : Compatible }


type alias Number compatible =
  { compatible | value : String, number : Compatible }


type alias None compatible =
  { compatible | value : String, none : Compatible }


type alias MinMaxDimension compatible =
  { compatible
    | value : String
    , minMaxDimension : Compatible
    , lengthOrMinMaxDimension : Compatible
    , lengthOrNoneOrMinMaxDimension : Compatible
  }



{- FONTS -}


type alias ImportType compatible =
  { compatible | value : String, import' : Compatible }


type alias FontFace compatible =
  { compatible | value : String, fontFace : Compatible }


type alias FontFamily compatible =
  { compatible | value : String, fontFamily : Compatible }


type alias FontSize compatible =
  { compatible | value : String, fontSize : Compatible }


type alias FontStyle compatible =
  { compatible | value : String, fontStyle : Compatible }



-- type alias FontWeight compatible =
--     { compatible
--       | value : String
--       , lengthOrNumber : Compatible
--       , fontWeight : Compatible }


type alias NumberedWeight =
  { value : String, fontWeight : Compatible }


type alias FontVariant compatible =
  { compatible | value : String, fontVariant : Compatible }


type alias FontVariantLigatures compatible =
  { compatible
    | value : String
    , fontVariant : Compatible
    , fontVariantLigatures : Compatible
  }


type alias FontVariantCaps compatible =
  { compatible
    | value : String
    , fontVariant : Compatible
    , fontVariantCaps : Compatible
  }


type alias FontVariantNumeric compatible =
  { compatible
    | value : String
    , fontVariant : Compatible
    , fontVariantNumeric : Compatible
  }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Values
-}
type alias TextDecorationLine compatible =
  { compatible | value : String, textDecorationLine : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing#Values
-}
type alias BoxSizing compatible =
  { compatible | value : String, boxSizing : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values
-}
type alias Overflow compatible =
  { compatible | value : String, overflow : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/flex#Values
-}
type alias LengthOrNumberOrAutoOrNoneOrContent compatible =
  { compatible | value : String, lengthOrNumberOrAutoOrNoneOrContent : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis#Values
-}
type alias FlexBasis compatible =
  { compatible | value : String, flexBasis : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values
-}
type alias FlexWrap compatible =
  { compatible | value : String, flexWrap : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction#Values
-}
type alias FlexDirection compatible =
  { compatible | value : String, flexDirection : Compatible }


type alias FlexDirectionOrWrap compatible =
  { compatible | value : String, flexDirectionOrWrap : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values
-}
type alias AlignItems a b =
  Length a b -> Mixin


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/align-self#Values
-}
type alias AlignSelf a b =
  Length a b -> Mixin


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/display#Values
-}
type alias Display compatible =
  { compatible | value : String, display : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/white-space#Values
-}
type alias WhiteSpace compatible =
  { compatible | value : String, whiteSpace : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/color#Values
-}
type alias ColorValue compatible =
  { compatible | value : String, color : Compatible, warnings : List String }


{-| -}
type alias Color =
  ColorValue { red : Int, green : Int, blue : Int, alpha : Float }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias Length compatible units =
  { compatible
    | value : String
    , length : Compatible
    , numericValue : Float
    , units : units
    , unitLabel : String
  }


{-| -}
(|+|) : Length compatible units -> Length compatible units -> Length compatible units
(|+|) =
  combineLengths (+)


{-| -}
(|-|) : Length compatible units -> Length compatible units -> Length compatible units
(|-|) =
  combineLengths (-)


{-| -}
(|/|) : Length compatible units -> Length compatible units -> Length compatible units
(|/|) =
  combineLengths (/)


{-| -}
(|*|) : Length compatible units -> Length compatible units -> Length compatible units
(|*|) =
  combineLengths (*)


combineLengths : (a -> b -> c) -> { e | numericValue : a, unitLabel : String, value : d } -> { f | numericValue : b } -> { e | numericValue : a, unitLabel : String, value : String }
combineLengths operation first second =
  let
    value =
      [ toString (operation first.numericValue second.numericValue)
      , first.unitLabel
      ]
        |> List.filter (not << String.isEmpty)
        |> String.join " "
  in
    { first | value = value }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias LengthOrAuto compatible =
  { compatible | value : String, lengthOrAuto : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias LengthOrNoneOrMinMaxDimension compatible =
  { compatible | value : String, lengthOrNoneOrMinMaxDimension : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias LengthOrMinMaxDimension compatible =
  { compatible | value : String, lengthOrMinMaxDimension : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias LengthOrNone compatible =
  { compatible | value : String, lengthOrNone : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias LengthOrNumber compatible =
  { compatible | value : String, lengthOrNumber : Compatible }


type alias ExplicitLength units =
  { value : String
  , numericValue : Float
  , units : units
  , unitLabel : String
  , length : Compatible
  , lengthOrAuto : Compatible
  , lengthOrNumber : Compatible
  , lengthOrNone : Compatible
  , lengthOrMinMaxDimension : Compatible
  , lengthOrNoneOrMinMaxDimension : Compatible
  , textIndent : Compatible
  , flexBasis : Compatible
  , lengthOrNumberOrAutoOrNoneOrContent : Compatible
  , fontSize : Compatible
  }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/transform#Values
-}
type alias Transform compatible =
  { compatible | value : String, transform : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/angle
-}
type alias Angle compatible =
  { compatible | value : String, angle : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style#Values
-}
type alias TextDecorationStyle compatible =
  { compatible | value : String, textDecorationStyle : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/position#Values
-}
type alias Position compatible =
  { compatible | value : String, position : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values
-}
type alias BorderStyle compatible =
  { compatible | value : String, borderStyle : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box#Values
-}
type alias TransformBox compatible =
  { compatible | value : String, transformBox : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style#Values
-}
type alias TransformStyle compatible =
  { compatible | value : String, transformStyle : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent#Values
-}
type alias TextIndent compatible =
  { compatible | value : String, textIndent : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow#Values
-}
type alias TextOverflow compatible =
  { compatible | value : String, textOverflow : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values
-}
type alias TextTransform compatible =
  { compatible | value : String, textTransform : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values
-}
type alias TextRendering compatible =
  { compatible | value : String, textRendering : Compatible }


{-| Because `left` and `right` are both common properties and common values
in CSS (e.g. `left: 5px` with `position: absolute` and `text-align: left`),
we implement it as a property (for the `left: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String as its key, and use that as our value.
(See `getOverloadedProperty`. Note that `VerticalAlign` follows a similar pattern.)
-}
type alias TextAlign a b =
  Length a b -> Mixin


{-| Because `top` and `bottom` are both common properties and common values
in CSS (e.g. `top: 5px` with `position: absolute` and `vertical-align: top`),
we implement it as a property (for the `top: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String as its key, and use that as our value.
(See `getOverloadedProperty`. Note that `TextAlign` follows a similar pattern.)
-}
type alias VerticalAlign a b =
  Length a b -> Mixin



-- Properties --


{-| An [`all`](https://developer.mozilla.org/en-US/docs/Web/CSS/all) property.
-}
all : All compatible -> Mixin
all =
  prop1 "all"


{-| Transforms the given property by adding !important to the end of its
declaration.
-}
important : Mixin -> Mixin
important =
  Preprocess.mapLastProperty (\property -> { property | important = True })


{-| A [`ColorValue`](#ColorValue) that does not have `red`, `green`, or `blue`
values.
-}
type alias NonMixable =
  {}


{-| A [`transparent`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent_keyword) color.
-}
transparent : ColorValue NonMixable
transparent =
  { value = "transparent"
  , color = Compatible
  , warnings = []
  }


{-| The [`currentColor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword)
    value.
-}
currentColor : ColorValue NonMixable
currentColor =
  { value = "currentColor"
  , color = Compatible
  , warnings = []
  }


{-| The `visible` value for the [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) property.
-}
visible : Overflow {}
visible =
  { value = "visible"
  , overflow = Compatible
  }


{-| The `scroll` [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) value.
-}
scroll : Overflow {}
scroll =
  { value = "scroll"
  , overflow = Compatible
  }


{-| `hidden` [`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow#Values) value.

This can also represent a `hidden` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
hidden : Overflow (BorderStyle {})
hidden =
  { value = "hidden"
  , overflow = Compatible
  , borderStyle = Compatible
  }


type alias BasicProperty =
  { value : String
  , all : Compatible
  , alignItems : Compatible
  , boxSizing : Compatible
  , display : Compatible
  , flexBasis : Compatible
  , flexWrap : Compatible
  , flexDirection : Compatible
  , flexDirectionOrWrap : Compatible
  , none : Compatible
  , number : Compatible
  , overflow : Compatible
  , textDecorationLine : Compatible
  , textRendering : Compatible
  , textIndent : Compatible
  , textDecorationStyle : Compatible
  , length : Compatible
  , lengthOrAuto : Compatible
  , lengthOrNone : Compatible
  , lengthOrNumber : Compatible
  , lengthOrMinMaxDimension : Compatible
  , lengthOrNoneOrMinMaxDimension : Compatible
  , lengthOrNumberOrAutoOrNoneOrContent : Compatible
  , fontFamily : Compatible
  , fontSize : Compatible
  , fontStyle : Compatible
  , fontWeight : Compatible
  , fontVariant : Compatible
  , units : IncompatibleUnits
  , numericValue : Float
  , unitLabel : String
  }


{-| The [`unset`](https://developer.mozilla.org/en-US/docs/Web/CSS/unset) value.
Any CSS property can be set to this value.
-}
unset : BasicProperty
unset =
  { initial | value = "unset" }


{-| The [`inherit`](https://developer.mozilla.org/en-US/docs/Web/CSS/inherit) value.
Any CSS property can be set to this value.
-}
inherit : BasicProperty
inherit =
  { initial | value = "inherit" }


{-| The [`initial`](https://developer.mozilla.org/en-US/docs/Web/CSS/initial) value.
Any CSS property can be set to this value.
-}
initial : BasicProperty
initial =
  { value = "initial"
  , overflow = Compatible
  , none = Compatible
  , number = Compatible
  , textDecorationLine = Compatible
  , textRendering = Compatible
  , textIndent = Compatible
  , textDecorationStyle = Compatible
  , boxSizing = Compatible
  , display = Compatible
  , all = Compatible
  , alignItems = Compatible
  , length = Compatible
  , lengthOrAuto = Compatible
  , lengthOrNone = Compatible
  , lengthOrNumber = Compatible
  , lengthOrMinMaxDimension = Compatible
  , lengthOrNoneOrMinMaxDimension = Compatible
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
  , units = IncompatibleUnits
  , numericValue = 0
  , unitLabel = ""
  }


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
    in functional notation.
-}
rgb : Int -> Int -> Int -> Color
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
            ++ (toString red)
            ++ ", "
            ++ (toString green)
            ++ ", "
            ++ (toString blue)
            ++ ") is not valid."
        ]
      else
        []
  in
    { value = cssFunction "rgb" (List.map numberToString [ red, green, blue ])
    , color = Compatible
    , warnings = warnings
    , red = red
    , green = green
    , blue = blue
    , alpha = 1
    }


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : Int -> Int -> Int -> Float -> Color
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
            ++ (toString red)
            ++ ", "
            ++ (toString green)
            ++ ", "
            ++ (toString blue)
            ++ ", "
            ++ (toString alpha)
            ++ ") is not valid."
        ]
      else
        []
  in
    { value = cssFunction "rgba" (List.map numberToString [ red, green, blue, alpha ])
    , color = Compatible
    , warnings = warnings
    , red = red
    , green = green
    , blue = blue
    , alpha = 1
    }


{-| [HSL color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsl())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsl : number -> number -> number -> Color
hsl hue saturation lightness =
  let
    valuesList =
      [ numberToString hue
      , numericalPercentageToString saturation
      , numericalPercentageToString lightness
      ]

    value =
      cssFunction "hsl" valuesList

    warnings =
      if
        (hue > 360)
          || (hue < 0)
          || (saturation > 1)
          || (saturation < 0)
          || (lightness > 1)
          || (lightness < 0)
      then
        [ "HSL color values must have an H value between 0 and 360 (as in degrees) and S and L values between 0 and 1. " ++ value ++ " is not valid." ]
      else
        []
  in
    hslaToRgba value warnings hue saturation lightness 1


{-| [HSLA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsla())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsla : number -> number -> number -> number -> Color
hsla hue saturation lightness alpha =
  let
    valuesList =
      [ numberToString hue
      , numericalPercentageToString saturation
      , numericalPercentageToString lightness
      , numberToString alpha
      ]

    value =
      cssFunction "hsla" valuesList

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
        [ "HSLA color values must have an H value between 0 and 360 (as in degrees) and S, L, and A values between 0 and 1. " ++ value ++ " is not valid." ]
      else
        []
  in
    hslaToRgba value warnings hue saturation lightness alpha


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
    in hexadecimal notation.
-}
hex : String -> Color
hex str =
  -- TODO
  { value = "#" ++ str
  , color = Compatible
  , red = 0
  , green = 0
  , blue = 0
  , alpha = 1
  , warnings = []
  }


hslaToRgba : String -> List String -> Float -> Float -> Float -> Float -> Color
hslaToRgba value warnings hue saturation lightness alpha =
  let
    red =
      0

    green =
      0

    blue =
      0
  in
    { value = value
    , color = Compatible
    , red = red
    , green = green
    , blue = blue
    , alpha = alpha
    , warnings = warnings
    }



{- TEXT-RENDERING -}


{-| `optimizeSpeed` [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values) value
-}
optimizeSpeed : TextRendering {}
optimizeSpeed =
  { value = "optimizeSpeed"
  , textRendering = Compatible
  }


{-| `optimizeLegibility` [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values) value
-}
optimizeLegibility : TextRendering {}
optimizeLegibility =
  { value = "optimizeLegibility"
  , textRendering = Compatible
  }


{-| `geometricPrecision` [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering#Values) value
-}
geometricPrecision : TextRendering {}
geometricPrecision =
  { value = "geometricPrecision"
  , textRendering = Compatible
  }



{- TEXT-INDENT -}


{-| `hanging` [`hanging`](https://developer.mozilla.org/en-US/docs/Web/CSS/hanging#Values) value
-}
hanging : TextIndent {}
hanging =
  { value = "hanging"
  , textIndent = Compatible
  }


{-| `each-line` [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent#Values) value
-}
eachLine : TextIndent {}
eachLine =
  { value = "each-line"
  , textIndent = Compatible
  }



{- TEXT-TRANSFORM -}


{-| `capitalize` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
capitalize : TextTransform {}
capitalize =
  { value = "capitalize"
  , textTransform = Compatible
  }


{-| `uppercase` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
uppercase : TextTransform {}
uppercase =
  { value = "uppercase"
  , textTransform = Compatible
  }


{-| `lowercase` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
lowercase : TextTransform {}
lowercase =
  { value = "lowercase"
  , textTransform = Compatible
  }


{-| `full-width` [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform#Values) value
-}
fullWidth : TextTransform {}
fullWidth =
  { value = "full-width"
  , textTransform = Compatible
  }


{-| `ellipsis` [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow#Values) value
-}
ellipsis : TextOverflow {}
ellipsis =
  { value = "ellipsis"
  , textOverflow = Compatible
  }


{-| `clip` [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow#Values) value
-}
clip : TextOverflow {}
clip =
  { value = "clip"
  , textOverflow = Compatible
  }



{- BORDER STYLE -}


{-| A `wavy` [text decoration style](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style#Values).
-}
wavy : TextDecorationStyle {}
wavy =
  { value = "wavy"
  , textDecorationStyle = Compatible
  }


{-| A `dotted` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dotted : BorderStyle (TextDecorationStyle {})
dotted =
  { value = "dotted"
  , borderStyle = Compatible
  , textDecorationStyle = Compatible
  }


{-| A `dashed` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dashed : BorderStyle (TextDecorationStyle {})
dashed =
  { value = "dashed"
  , borderStyle = Compatible
  , textDecorationStyle = Compatible
  }


{-| A `solid` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
solid : BorderStyle (TextDecorationStyle {})
solid =
  { value = "solid"
  , borderStyle = Compatible
  , textDecorationStyle = Compatible
  }


{-| A `double` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
double : BorderStyle (TextDecorationStyle {})
double =
  { value = "double"
  , borderStyle = Compatible
  , textDecorationStyle = Compatible
  }


{-| A `groove` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
groove : BorderStyle {}
groove =
  { value = "groove"
  , borderStyle = Compatible
  }


{-| A `ridge` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
ridge : BorderStyle {}
ridge =
  { value = "ridge"
  , borderStyle = Compatible
  }


{-| An `inset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
inset : BorderStyle {}
inset =
  { value = "inset"
  , borderStyle = Compatible
  }


{-| An `outset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
outset : BorderStyle {}
outset =
  { value = "outset"
  , borderStyle = Compatible
  }



{- ALIGNMENTS -}


{-| `center` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
Can also be used with flex-box's align-items property to apply the value of center
-}
center : TextAlign a b
center =
  prop1 "center"


{-| `text-justify` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textJustify : TextAlign a b
textJustify =
  prop1 "text-justify"


{-| `justify-all` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
justifyAll : TextAlign a b
justifyAll =
  prop1 "justify-all"


{-| `start` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
start : TextAlign a b
start =
  prop1 "start"


{-| `end` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
end : TextAlign a b
end =
  prop1 "end"


{-| `match-parent` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
matchParent : TextAlign a b
matchParent =
  prop1 "match-parent"


{-| `true` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
true : TextAlign a b
true =
  prop1 "true"



{- LENGTHS -}


lengthConverter : units -> String -> Float -> ExplicitLength units
lengthConverter units unitLabel num =
  { value = (numberToString num) ++ unitLabel
  , numericValue = num
  , units = units
  , unitLabel = unitLabel
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
  }


{-| Convenience length value that compiles to 0 with no units.

    $ ul
        ~ padding zero

...compiles to:

    ul {
        padding: 0;
    }
-}
zero :
  { value : String
  , length : Compatible
  , lengthOrNumber : Compatible
  , lengthOrNone : Compatible
  , lengthOrAuto : Compatible
  , lengthOrMinMaxDimension : Compatible
  , lengthOrNoneOrMinMaxDimension : Compatible
  , number : Compatible
  , units : UnitlessInteger
  , unitLabel : String
  , numericValue : Float
  }
zero =
  { value = "0"
  , length = Compatible
  , lengthOrNumber = Compatible
  , lengthOrNone = Compatible
  , lengthOrAuto = Compatible
  , lengthOrMinMaxDimension = Compatible
  , lengthOrNoneOrMinMaxDimension = Compatible
  , number = Compatible
  , units = UnitlessInteger
  , unitLabel = ""
  , numericValue = 0
  }


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : Float -> ExplicitLength PercentageUnits
pct =
  lengthConverter PercentageUnits "%"


type PercentageUnits
  = PercentageUnits


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
em : Float -> ExplicitLength EmUnits
em =
  lengthConverter EmUnits "em"


type EmUnits
  = EmUnits


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
ex : Float -> ExplicitLength ExUnits
ex =
  lengthConverter ExUnits "ex"


type ExUnits
  = ExUnits


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
ch : Float -> ExplicitLength ChUnits
ch =
  lengthConverter ChUnits "ch"


type ChUnits
  = ChUnits


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
rem : Float -> ExplicitLength RemUnits
rem =
  lengthConverter RemUnits "rem"


type RemUnits
  = RemUnits


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
vh : Float -> ExplicitLength VhUnits
vh =
  lengthConverter VhUnits "vh"


type VhUnits
  = VhUnits


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
vw : Float -> ExplicitLength VwUnits
vw =
  lengthConverter VwUnits "vw"


type VwUnits
  = VwUnits


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
vmin : Float -> ExplicitLength VMinUnits
vmin =
  lengthConverter VMinUnits "vmin"


type VMinUnits
  = VMinUnits


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
vmax : Float -> ExplicitLength VMaxUnits
vmax =
  lengthConverter VMaxUnits "vmax"


type VMaxUnits
  = VMaxUnits


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : Float -> ExplicitLength PxUnits
px =
  lengthConverter PxUnits "px"


type PxUnits
  = PxUnits


{-| [``](https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm) units.
-}
mm : Float -> ExplicitLength MMUnits
mm =
  lengthConverter MMUnits "mm"


type MMUnits
  = MMUnits


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
cm : Float -> ExplicitLength CMUnits
cm =
  lengthConverter CMUnits "cm"


type CMUnits
  = CMUnits


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)
-}
inches : Float -> ExplicitLength InchUnits
inches =
  lengthConverter InchUnits "in"


type InchUnits
  = InchUnits


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
pt : Float -> ExplicitLength PtUnits
pt =
  lengthConverter PtUnits "pt"


type PtUnits
  = PtUnits


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
pc : Float -> ExplicitLength PcUnits
pc =
  lengthConverter PcUnits "pc"


type PcUnits
  = PcUnits


{-| A unitless integer. Useful with properties like [`borderImageOutset`](#borderImageOutset)
which accept either length units or unitless numbers for some properties.
-}
int : Int -> LengthOrNumberOrAutoOrNoneOrContent (LengthOrNumber (Number { numericValue : Float, unitLabel : String, units : UnitlessInteger }))
int val =
  { value = numberToString val
  , lengthOrNumber = Compatible
  , number = Compatible
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  , numericValue = toFloat val
  , unitLabel = ""
  , units = UnitlessInteger
  }


type UnitlessInteger
  = UnitlessInteger


{-| A unitless number. Useful with properties like [`flexGrow`](#flexGrow)
which accept unitless numbers.
-}
float : Float -> LengthOrNumberOrAutoOrNoneOrContent (LengthOrNumber (Number { numericValue : Float, unitLabel : String, units : UnitlessFloat }))
float val =
  { value = numberToString val
  , lengthOrNumber = Compatible
  , number = Compatible
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  , numericValue = val
  , unitLabel = ""
  , units = UnitlessFloat
  }


type UnitlessFloat
  = UnitlessFloat


lengthForOverloadedProperty : ExplicitLength IncompatibleUnits
lengthForOverloadedProperty =
  lengthConverter IncompatibleUnits "" 0


type IncompatibleUnits
  = IncompatibleUnits



{- ANGLES -}


angleConverter : String -> number -> Angle {}
angleConverter suffix num =
  { value = (numberToString num) ++ suffix
  , angle = Compatible
  }


{-| [`deg`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#deg) units.
-}
deg : number -> Angle {}
deg =
  angleConverter "deg"


{-| [`grad`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#grad) units.
-}
grad : number -> Angle {}
grad =
  angleConverter "grad"


{-| [`rad`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#rad) units.
-}
rad : number -> Angle {}
rad =
  angleConverter "rad"


{-| [`turn`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#tr) units.
-}
turn : number -> Angle {}
turn =
  angleConverter "turn"



{- TRANSFORMS -}


{-| The [`matrix()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#matrix()) transform-function.

    ~ transform (matrix 0.5 1 1.5 2 2.5 3)
-}
matrix : number -> number -> number -> number -> number -> number -> Transform {}
matrix a b c d tx ty =
  { value = cssFunction "matrix" (List.map numberToString [ a, b, c, d, tx, ty ])
  , transform = Compatible
  }


{-| The [`matrix3d()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#matrix3d()) transform-function.

    ~ transform (matrix3d 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3)
-}
matrix3d : number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> Transform {}
matrix3d a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4 =
  { value = cssFunction "matrix3d" (List.map numberToString [ a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4 ])
  , transform = Compatible
  }


{-| The [`perspective()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#perspective()) transform-function.

     transform (perspective 0.5)
-}
perspective : number -> Transform {}
perspective l =
  { value = cssFunction "perspective" [ numberToString l ]
  , transform = Compatible
  }


{-| The [`rotate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotate()) transform-function.

     transform (rotate (deg 90))
-}
rotate : Angle compatible -> Transform {}
rotate { value } =
  { value = cssFunction "rotate" [ value ]
  , transform = Compatible
  }


{-| The [`rotateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateX()) transform-function.

     transform (rotateX (deg 90))
-}
rotateX : Angle compatible -> Transform {}
rotateX { value } =
  { value = cssFunction "rotateX" [ value ]
  , transform = Compatible
  }


{-| The [`rotateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateY()) transform-function.

     transform (rotateY (deg 90))
-}
rotateY : Angle compatible -> Transform {}
rotateY { value } =
  { value = cssFunction "rotateY" [ value ]
  , transform = Compatible
  }


{-| The [`rotateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateZ()) transform-function.

     transform (rotateZ (deg 90))
-}
rotateZ : Angle compatible -> Transform {}
rotateZ { value } =
  { value = cssFunction "rotateZ" [ value ]
  , transform = Compatible
  }


{-| The [`rotate3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotate3d()) transform-function.

     transform (rotate3d 1 1 1 (deg 90))
-}
rotate3d : number -> number -> number -> Angle compatible -> Transform {}
rotate3d x y z { value } =
  let
    coordsAsStrings =
      List.map numberToString [ x, y, z ]
  in
    { value = cssFunction "rotate3d" (coordsAsStrings ++ [ value ])
    , transform = Compatible
    }


{-| The [`scale`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale()) transform-function.

     transform (scale 0.5)
     transform (scale2 0.5 0.7)
-}
scale : number -> Transform {}
scale x =
  { value = cssFunction "scale" [ numberToString x ]
  , transform = Compatible
  }


{-| The [`scale`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale()) transform-function.

     transform (scale 0.5)
     transform (scale2 0.5 0.7)
-}
scale2 : number -> number -> Transform {}
scale2 x y =
  { value = cssFunction "scale" (List.map numberToString [ x, y ])
  , transform = Compatible
  }


{-| The [`scaleX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scaleX()) transform-function.

     transform (scaleX 0.5)
-}
scaleX : number -> Transform {}
scaleX x =
  { value = cssFunction "scaleX" [ numberToString x ]
  , transform = Compatible
  }


{-| The [`scaleY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scaleY()) transform-function.

     transform (scaleY 0.5)
-}
scaleY : number -> Transform {}
scaleY y =
  { value = cssFunction "scaleY" [ numberToString y ]
  , transform = Compatible
  }


{-| The [`scale3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale3d()) transform-function.

     transform (scale3d 0.5 0.5 1)
-}
scale3d : number -> number -> number -> Transform {}
scale3d x y z =
  { value = cssFunction "scale3d" (List.map numberToString [ x, y, z ])
  , transform = Compatible
  }


{-| The [`skew`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skew()) transform-function.

     transform (skew (deg 90))
     transform (skew2 (deg 90) (deg 45))
-}
skew : Angle compatible -> Transform {}
skew { value } =
  { value = cssFunction "skew" [ value ]
  , transform = Compatible
  }


{-| The [`skew`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skew()) transform-function.

     transform (skew (deg 90))
     transform (skew2 (deg 90) (deg 45))
-}
skew2 : Angle compatibleA -> Angle compatibleB -> Transform {}
skew2 ax ay =
  { value = cssFunction "skew" [ ax.value, ay.value ]
  , transform = Compatible
  }


{-| The [`skewX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skewX()) transform-function.

     transform (skewX (deg 90))
-}
skewX : Angle compatible -> Transform {}
skewX { value } =
  { value = cssFunction "skewX" [ value ]
  , transform = Compatible
  }


{-| The [`skewY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skewY()) transform-function.

    transform (skewY (deg 90))
-}
skewY : Angle compatible -> Transform {}
skewY { value } =
  { value = cssFunction "skewY" [ value ]
  , transform = Compatible
  }


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))
-}
translate : Length compatible units -> Transform {}
translate { value } =
  { value = cssFunction "translate" [ value ]
  , transform = Compatible
  }


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))
-}
translate2 : Length compatible units -> Length compatible units -> Transform {}
translate2 tx ty =
  { value = cssFunction "translate" [ tx.value, ty.value ]
  , transform = Compatible
  }


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translateX (px 100))
-}
translateX : Length compatible units -> Transform {}
translateX { value } =
  { value = cssFunction "translateX" [ value ]
  , transform = Compatible
  }


{-| The [`translateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateY()) transform-function.

    transform (translateY (px 100))
-}
translateY : Length compatible units -> Transform {}
translateY { value } =
  { value = cssFunction "translateY" [ value ]
  , transform = Compatible
  }


{-| The [`translateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateZ()) transform-function.

    transform (translateZ (px 100))
-}
translateZ : Length compatible units -> Transform {}
translateZ { value } =
  { value = cssFunction "translateZ" [ value ]
  , transform = Compatible
  }


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translate3d (px 100) (px 100) (px 100))
-}
translate3d : Length compatible units -> Length compatible units -> Length compatible units -> Transform {}
translate3d tx ty tz =
  { value = cssFunction "translate3d" [ tx.value, ty.value, tz.value ]
  , transform = Compatible
  }


{-| Sets [`transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
with a series of transform-functions. If an empty list is provided, the CSS
output will be `none`, as if to state directly that the set of transforms
applied to the current selector is empty:

    ~ transforms [] -- transform: none;

In the case that only one transform is needed, the `transform` function may be
used instead for convenience. `transform` expects exactly one transform-function
and cannot be passed `none`:

    ~ transform (matrix 1 2 3 4 5 6) -- transform: matrix(1, 2, 3, 4, 5, 6);

If a collection of transforms is needed, use the `transforms` function with a
populated list:

    ~ transforms [ perspective 1, scale2 1 1.4 ]
-}
transforms : List (Transform compatible) -> Mixin
transforms =
  prop1 "transform" << valuesOrNone


{-| Sets [`transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
with a single explicit transform value. If you need to set the transform
property to `none`, use the `transforms` function with an empty list. See
`transforms` for more details.

    transform (scaleX 1.4)
-}
transform : Transform compatible -> Mixin
transform only =
  transforms [ only ]


{-| The `fill-box` value for the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
fillBox : TransformBox {}
fillBox =
  { value = "fill-box"
  , transformBox = Compatible
  }


{-| The `content-box` value for the [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing) property.
-}
contentBox : BoxSizing {}
contentBox =
  { value = "content-box"
  , boxSizing = Compatible
  }


{-| The `border-box` value for the [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing) property.
-}
borderBox : BoxSizing {}
borderBox =
  { value = "border-box"
  , boxSizing = Compatible
  }


{-| The `view-box` value for the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
viewBox : TransformBox {}
viewBox =
  { value = "view-box"
  , transformBox = Compatible
  }


{-| The [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
transformBox : TransformBox compatible -> Mixin
transformBox =
  prop1 "transform-box"


{-| Sets [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing)

    ~ boxSizing borderBox
-}
boxSizing : BoxSizing compatible -> Mixin
boxSizing =
  prop1 "box-sizing"


{-| The `preserve-3d` value for the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
preserve3d : TransformStyle {}
preserve3d =
  { value = "preserve-3d"
  , transformStyle = Compatible
  }


{-| The `flat` value for the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
flat : TransformStyle {}
flat =
  { value = "flat"
  , transformStyle = Compatible
  }


{-| The [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
transformStyle : TransformStyle compatible -> Mixin
transformStyle =
  prop1 "transform-style"



{- FLEX BOX -}


{-| Sets [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) property.}

flex (none | content | auto | (n 1) | (px 10))
flex2 (n 1) ((n 1) | (px 10 ))
flex3 (n 1) (n 1) ((n 1) | (px 10))

-}
flex : LengthOrNumberOrAutoOrNoneOrContent compatible -> Mixin
flex =
  prop1 "flex"


{-| Sets [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) property.}

flex (none | content | auto | (n 1) | (px 10))
flex2 (n 1) ((n 1) | (px 10 ))
flex3 (n 1) (n 1) ((n 1) | (px 10))

-}
flex2 : Number compatibleA -> LengthOrNumber compatibleB -> Mixin
flex2 =
  prop2 "flex"


{-| Sets [`flex`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex) property.}

flex (none | content | auto | (n 1) | (px 10))
flex2 (n 1) ((n 1) | (px 10 ))
flex3 (n 1) (n 1) ((n 1) | (px 10))

-}
flex3 : Number compatibleA -> Number compatibleB -> LengthOrNumber compatbileC -> Mixin
flex3 =
  prop3 "flex"


{-| Sets [`flex-basis`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis) property.}

flex (none | content | auto | (n 1) | (px 10))
flex2 (n 1) ((n 1) | (px 10 ))
flex3 (n 1) (n 1) ((n 1) | (px 10))

-}
flexBasis : FlexBasis compatible -> Mixin
flexBasis =
  prop1 "flex-basis"


{-| Sets [`flex-grow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow) property.}
-}
flexGrow : Number compatible -> Mixin
flexGrow =
  prop1 "flex-grow"


{-| Sets [`flex-shrink`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink) property.}
-}
flexShrink : Number compatible -> Mixin
flexShrink =
  prop1 "flex-shrink"


{-| Sets [`flex-wrap`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap) property.}
-}
flexWrap : FlexWrap compatible -> Mixin
flexWrap =
  prop1 "flex-wrap"


{-| Sets [`flex-direction`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction) property.}
-}
flexDirection : FlexDirection compatible -> Mixin
flexDirection =
  prop1 "flex-direction"


{-| Sets [`flex-flow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow) property.}

flexFlow1 (wrap | wrapReverse | noWrap)
flexFlow2 (wrap | wrapReverse | noWrap) (row | column | rowReverse | columnReverse)

Or vice versa, order is not important for flex-flow
-}
flexFlow1 : FlexDirectionOrWrap compatible -> Mixin
flexFlow1 =
  prop1 "flex-flow"


{-| Sets [`flex-flow`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow) property.}

flexFlow1 (wrap | wrapReverse | noWrap)
flexFlow2 (wrap | wrapReverse | noWrap) (row | column | rowReverse | columnReverse)

Or vice versa, order is not important for flex-flow
-}
flexFlow2 : FlexDirectionOrWrap compatibleA -> FlexDirectionOrWrap compatibleB -> Mixin
flexFlow2 =
  prop2 "flex-flow"


{-| Sets [`align-items`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items).
-}
alignItems : (ExplicitLength IncompatibleUnits -> Mixin) -> Mixin
alignItems fn =
  getOverloadedProperty "alignItems" "align-items" (fn lengthForOverloadedProperty)


{-| Sets [`align-self`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-self).

  **Note:** Due to certain implementation constraints, `auto` cannot be
  supported here. If you need to set this property to `auto`,
  use this workaround:

  ~ ("text-align-last", "auto")

-}
alignSelf : (ExplicitLength IncompatibleUnits -> Mixin) -> Mixin
alignSelf fn =
  getOverloadedProperty "alignSelf" "align-self" (fn lengthForOverloadedProperty)


{-| Sets [`flex-wrap`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap) property.}
-}
order : Number compatible -> Mixin
order =
  prop1 "order"


{-| The [`content`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-basis#Values) value for the
  flex-basis property.
-}
content : LengthOrNumberOrAutoOrNoneOrContent (FlexBasis {})
content =
  { value = "content"
  , flexBasis = Compatible
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  }


{-| The[`wrap`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values) value for the
  flex-wrap property.
-}
wrap : FlexDirectionOrWrap (FlexWrap {})
wrap =
  { value = "wrap"
  , flexWrap = Compatible
  , flexDirectionOrWrap = Compatible
  }


{-| The[`wrap-reverse`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap#Values) value for the
  flex-wrap property.
-}
wrapReverse : FlexDirectionOrWrap (FlexWrap {})
wrapReverse =
  { wrap | value = "wrap-reverse" }


{-| The[`flex-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values) value for the
  align-items property.
-}
flexStart : AlignItems a b
flexStart =
  prop1 "flex-start"


{-| The[`flex-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values) value for the
  align-items property.
-}
flexEnd : AlignItems a b
flexEnd =
  prop1 "flex-end"


{-| The[`stretch`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values) value for the
  align-items property.
-}
stretch : AlignItems a b
stretch =
  prop1 "stretch"


{-| The[`row`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction #Values) value for the
  flex-direction property.
-}
row : FlexDirectionOrWrap (FlexDirection {})
row =
  { value = "row"
  , flexDirection = Compatible
  , flexDirectionOrWrap = Compatible
  }


{-| The[`row-reverse`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction #Values) value for the
  flex-direction property.
-}
rowReverse : FlexDirectionOrWrap (FlexDirection {})
rowReverse =
  { row | value = "row-reverse" }


{-| The[`column`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction #Values) value for the
  flex-direction property.
-}
column : FlexDirectionOrWrap (FlexDirection {})
column =
  { row | value = "column" }


{-| The[`column-reverse`](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction #Values) value for the
  flex-direction property.
-}
columnReverse : FlexDirectionOrWrap (FlexDirection {})
columnReverse =
  { row | value = "column-reverse" }



{- TEXT DECORATION LINES -}


{-| An [`underline`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
text decoration line.
-}
underline : TextDecorationLine {}
underline =
  { value = "underline"
  , textDecorationLine = Compatible
  }


{-| An [`overline`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
text decoration line.
-}
overline : TextDecorationLine {}
overline =
  { value = "overline"
  , textDecorationLine = Compatible
  }


{-| A [`line-through`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
text decoration line.
-}
lineThrough : TextDecorationLine {}
lineThrough =
  { value = "line-through"
  , textDecorationLine = Compatible
  }



{- BORDERS -}


{-| -}
block : Display {}
block =
  { value = "block"
  , display = Compatible
  }

{-| -}
dflex : Display {}
dflex =
  { value = "flex"
  , display = Compatible
  }

{-| -}
inlineBlock : Display {}
inlineBlock =
  { value = "inline-block"
  , display = Compatible
  }


{-| -}
inline : Display {}
inline =
  { value = "inline"
  , display = Compatible
  }


{-| -}
none :
  { borderStyle : Compatible
  , display : Compatible
  , lengthOrNumberOrAutoOrNoneOrContent : Compatible
  , none : Compatible
  , lengthOrNone : Compatible
  , lengthOrNoneOrMinMaxDimension : Compatible
  , textDecorationLine : Compatible
  , transform : Compatible
  , value : String
  }
none =
  { value = "none"
  , none = Compatible
  , lengthOrNone = Compatible
  , lengthOrNoneOrMinMaxDimension = Compatible
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  , textDecorationLine = Compatible
  , display = Compatible
  , transform = Compatible
  , borderStyle = Compatible
  }


{-| -}
auto :
  { lengthOrAuto : Compatible
  , overflow : Compatible
  , textRendering : Compatible
  , flexBasis : Compatible
  , lengthOrNumberOrAutoOrNoneOrContent : Compatible
  , value : String
  }
auto =
  { value = "auto"
  , flexBasis = Compatible
  , overflow = Compatible
  , textRendering = Compatible
  , lengthOrAuto = Compatible
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  }


{-| -}
noWrap : WhiteSpace (FlexDirectionOrWrap (FlexWrap {}))
noWrap =
  { value = "nowrap"
  , whiteSpace = Compatible
  , flexWrap = Compatible
  , flexDirectionOrWrap = Compatible
  }



{- VERTICAL-ALIGN -}


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign middle
-}
middle : VerticalAlign a b
middle =
  prop1 "middle"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign baseline
-}
baseline : VerticalAlign a b
baseline =
  prop1 "baseline"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign sub
-}
sub : VerticalAlign a b
sub =
  prop1 "sub"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign super
-}
super : VerticalAlign a b
super =
  prop1 "super"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textTop
-}
textTop : VerticalAlign a b
textTop =
  prop1 "text-top"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textBottom
-}
textBottom : VerticalAlign a b
textBottom =
  prop1 "text-bottom"


{-| The [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) property.
-}
position : Position compatible -> Mixin
position =
  prop1 "position"



{- Properties -}


prop1 : String -> Value a -> Mixin
prop1 key arg =
  property key arg.value


prop2 : String -> Value a -> Value b -> Mixin
prop2 key argA argB =
  property key (String.join " " [ argA.value, argB.value ])


prop3 : String -> Value a -> Value b -> Value c -> Mixin
prop3 key argA argB argC =
  property key (String.join " " [ argA.value, argB.value, argC.value ])


prop4 : String -> Value a -> Value b -> Value c -> Value d -> Mixin
prop4 key argA argB argC argD =
  property key (String.join " " [ argA.value, argB.value, argC.value, argD.value ])


{-| Sets [`text-decoration-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color)

    textDecorationColor (rgb 12 11 10)
-}
textDecorationColor : ColorValue compatible -> Mixin
textDecorationColor =
  prop1 "text-decoration-color"


{-| Sets [`text-align-last`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align-last).

    ~ textAlignLast start

    **Note:** Due to certain implementation constraints, `auto` cannot be
    supported here. If you need to set this property to `auto`,
    use this workaround:

    ~ ("text-align-last", "auto")
-}
textAlignLast : (ExplicitLength IncompatibleUnits -> Mixin) -> Mixin
textAlignLast fn =
  getOverloadedProperty "textAlignLast" "text-align-last" (fn lengthForOverloadedProperty)


{-| Sets [`text-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textAlign : (ExplicitLength IncompatibleUnits -> Mixin) -> Mixin
textAlign fn =
  getOverloadedProperty "textAlign" "text-align" (fn lengthForOverloadedProperty)


{-| Sets [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering).
-}
textRendering : TextRendering a -> Mixin
textRendering =
  prop1 "text-rendering"


{-| Sets [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow).

    ~ textOverflow ellipsis

To set `text-overflow` to an arbitrary String, use [`custom`](#custom) like so:

    ~ custom "text-overflow" "my custom text-overflow value"
-}
textOverflow : TextOverflow compatible -> Mixin
textOverflow =
  prop1 "text-overflow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow : None compatible -> Mixin
textShadow =
  prop1 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow2 : Length compatible units -> Length compatible units -> Mixin
textShadow2 =
  prop2 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow3 : Length compatible units -> Length compatible units -> ColorValue compatible -> Mixin
textShadow3 =
  prop3 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow4 : Length compatible units -> Length compatible units -> Length compatible units -> ColorValue compatible -> Mixin
textShadow4 =
  prop4 "text-shadow"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    ~ textIndent  (px 40)
    ~ textIndent2 (px 40) hanging
    ~ textIndent3 (px 40) hanging eachLine
-}
textIndent : Length compatible units -> Mixin
textIndent =
  prop1 "text-indent"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    ~ textIndent  (px 40)
    ~ textIndent2 (px 40) hanging
    ~ textIndent3 (px 40) hanging eachLine
-}
textIndent2 : Length compatibleA unitsA -> TextIndent compatibleB -> Mixin
textIndent2 =
  prop2 "text-indent"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    ~ textIndent  (px 40)
    ~ textIndent2 (px 40) hanging
    ~ textIndent3 (px 40) hanging eachLine
-}
textIndent3 : Length compatibleA unitsA -> TextIndent compatibleB -> TextIndent compatibleC -> Mixin
textIndent3 =
  prop3 "text-indent"


{-| Sets [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform).
-}
textTransform : TextTransform compatible -> Mixin
textTransform =
  prop1 "text-transform"


{-| Sets [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align).
-}
verticalAlign : (ExplicitLength IncompatibleUnits -> Mixin) -> Mixin
verticalAlign fn =
  getOverloadedProperty "verticalAlign" "vertical-align" (fn lengthForOverloadedProperty)


{-| -}
display : Display compatible -> Mixin
display =
  prop1 "display"


{-| -}
opacity : Number compatible -> Mixin
opacity =
  prop1 "opacity"


{-| Sets [`width`](https://developer.mozilla.org/en-US/docs/Web/CSS/width)

    ~ width (px 960)

-}
width : LengthOrAuto compatible -> Mixin
width =
  prop1 "width"


{-| Sets [`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width)

    ~ maxWidth (px 960)

-}
maxWidth : LengthOrNoneOrMinMaxDimension compatible -> Mixin
maxWidth =
  prop1 "max-width"


{-| Sets [`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width)

    ~ minWidth (px 100)

-}
minWidth : LengthOrMinMaxDimension compatible -> Mixin
minWidth =
  prop1 "min-width"


{-| Sets [`height`](https://developer.mozilla.org/en-US/docs/Web/CSS/height)

    ~ height (px 800)

-}
height : LengthOrAuto compatible -> Mixin
height =
  prop1 "height"


{-| Sets [`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height)

    ~ minHeight (px 100)

-}
minHeight : LengthOrMinMaxDimension compatible -> Mixin
minHeight =
  prop1 "min-height"


{-| Sets [`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height)

    ~ maxHeight (px 1024)

-}
maxHeight : LengthOrNoneOrMinMaxDimension compatible -> Mixin
maxHeight =
  prop1 "max-height"



{- PADDING PROPERTIES -}


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding : Length compatible units -> Mixin
padding =
  prop1 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding2 : Length compatible units -> Length compatible units -> Mixin
padding2 =
  prop2 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding3 : Length compatible units -> Length compatible units -> Length compatible units -> Mixin
padding3 =
  prop3 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding4 : Length compatible units -> Length compatible units -> Length compatible units -> Length compatible units -> Mixin
padding4 =
  prop4 "padding"


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start)

    paddingBlockStart (px 10)
-}
paddingBlockStart : LengthOrAuto compatible -> Mixin
paddingBlockStart =
  prop1 "padding-block-start"


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end)

    paddingBlockEnd (px 10)
-}
paddingBlockEnd : LengthOrAuto compatible -> Mixin
paddingBlockEnd =
  prop1 "padding-block-end"


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start)

    paddingInlineStart (px 10)
-}
paddingInlineStart : LengthOrAuto compatible -> Mixin
paddingInlineStart =
  prop1 "padding-inline-start"


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end)

    paddingInlineEnd (px 10)
-}
paddingInlineEnd : LengthOrAuto compatible -> Mixin
paddingInlineEnd =
  prop1 "padding-inline-end"


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top)

    paddingTop (px 10)
-}
paddingTop : Length compatible units -> Mixin
paddingTop =
  prop1 "padding-top"


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom)

    paddingBottom (px 10)
-}
paddingBottom : Length compatible units -> Mixin
paddingBottom =
  prop1 "padding-bottom"


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right)

    paddingRight (px 10)
-}
paddingRight : Length compatible units -> Mixin
paddingRight =
  prop1 "padding-right"


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left)

    paddingLeft (px 10)
-}
paddingLeft : Length compatible units -> Mixin
paddingLeft =
  prop1 "padding-left"



{- MARGIN PROPERTIES -}


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin : LengthOrAuto compatible -> Mixin
margin =
  prop1 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin2 : LengthOrAuto compatible -> LengthOrAuto compatible -> Mixin
margin2 =
  prop2 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin3 : LengthOrAuto compatible -> LengthOrAuto compatible -> LengthOrAuto compatible -> Mixin
margin3 =
  prop3 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin4 : LengthOrAuto compatible -> LengthOrAuto compatible -> LengthOrAuto compatible -> LengthOrAuto compatible -> Mixin
margin4 =
  prop4 "margin"


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top)

    marginTop (px 10)
-}
marginTop : LengthOrAuto compatible -> Mixin
marginTop =
  prop1 "margin-top"


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom)

    marginBottom (px 10)
-}
marginBottom : LengthOrAuto compatible -> Mixin
marginBottom =
  prop1 "margin-bottom"


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right)

    marginRight (px 10)
-}
marginRight : LengthOrAuto compatible -> Mixin
marginRight =
  prop1 "margin-right"


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left)

    marginLeft (px 10)
-}
marginLeft : LengthOrAuto compatible -> Mixin
marginLeft =
  prop1 "margin-left"


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start)

    marginBlockStart (px 10)
-}
marginBlockStart : LengthOrAuto compatible -> Mixin
marginBlockStart =
  prop1 "margin-block-start"


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end)

    marginBlockEnd (px 10)
-}
marginBlockEnd : LengthOrAuto compatible -> Mixin
marginBlockEnd =
  prop1 "margin-block-end"


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start)

    marginInlineStart (px 10)
-}
marginInlineStart : LengthOrAuto compatible -> Mixin
marginInlineStart =
  prop1 "margin-inline-start"


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end)

    marginInlineEnd (px 10)
-}
marginInlineEnd : LengthOrAuto compatible -> Mixin
marginInlineEnd =
  prop1 "margin-inline-end"


{-| The [`top`](https://developer.mozilla.org/en-US/docs/Web/CSS/top) property.

    ~ position absolute
    ~ top (px 5)

This can also be used as a `top` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign top
-}
top : LengthOrAuto compatible -> Mixin
top =
  prop1 "top"


{-| The [`bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/bottom) property.

    ~ position absolute
    ~ bottom (px 5)

This can also be used as a `bottom` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign bottom
-}
bottom : LengthOrAuto compatible -> Mixin
bottom =
  prop1 "bottom"


{-| The [`left`](https://developer.mozilla.org/en-US/docs/Web/CSS/left) property.

    ~ position absolute
    ~ left (px 5)

This can also be used as a `left` [text alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign left
-}
left : LengthOrAuto compatible -> Mixin
left =
  prop1 "left"


{-| Sets [`right`](https://developer.mozilla.org/en-US/docs/Web/CSS/right).

    ~ position absolute
    ~ right (px 5)

This can also be used as a `right` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign right
-}
right : LengthOrAuto compatible -> Mixin
right =
  prop1 "right"



{- MIN-MAX DIMENSIONS -}


{-| The `max-content` value for
[`min-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
maxContent : MinMaxDimension {}
maxContent =
  { fillAvailable | value = "max-content" }


{-| The `min-content` value for
[`min-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
minContent : MinMaxDimension {}
minContent =
  { fillAvailable | value = "min-content" }


{-| The `fit-content` value for
[`min-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
fitContent : MinMaxDimension {}
fitContent =
  { fillAvailable | value = "fit-content" }


{-| The `fill-available` value for
[`min-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-width#Values),
[`max-width`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-width#Values),
[`min-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/min-height#Values), and
[`max-height`]https://developer.mozilla.org/en-US/docs/Web/CSS/max-height#Values)
-}
fillAvailable : MinMaxDimension {}
fillAvailable =
  { value = "fill-available"
  , minMaxDimension = Compatible
  , lengthOrMinMaxDimension = Compatible
  , lengthOrNoneOrMinMaxDimension = Compatible
  }



{- POSITIONING -}


{-| A `static` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position static
-}
static : Position {}
static =
  { value = "static"
  , position = Compatible
  }


{-| A `fixed` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position fixed
-}
fixed : Position {}
fixed =
  { value = "fixed"
  , position = Compatible
  }


{-| A `sticky` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position sticky
-}
sticky : Position {}
sticky =
  { value = "sticky"
  , position = Compatible
  }


{-| A `relative` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position relative
-}
relative : Position {}
relative =
  { value = "relative"
  , position = Compatible
  }


{-| An `absolute` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position absolute
-}
absolute : Position {}
absolute =
  { value = "absolute"
  , position = Compatible
  }



{- FONT VALUES -}
-- Families --


{-| -}
serif : FontFamily {}
serif =
  { value = "serif", fontFamily = Compatible }


{-| -}
sansSerif : FontFamily {}
sansSerif =
  { value = "sans-serif", fontFamily = Compatible }


{-| -}
monospace : FontFamily {}
monospace =
  { value = "monospace", fontFamily = Compatible }


{-| -}
cursive : FontFamily {}
cursive =
  { value = "cursive", fontFamily = Compatible }


{-| -}
fantasy : FontFamily {}
fantasy =
  { value = "fantasy", fontFamily = Compatible }



-- Size --


{-| -}
xxSmall : FontSize {}
xxSmall =
  { value = "xx-small", fontSize = Compatible }


{-| -}
xSmall : FontSize {}
xSmall =
  { value = "x-small", fontSize = Compatible }


{-| -}
small : FontSize {}
small =
  { value = "small", fontSize = Compatible }


{-| -}
medium : FontSize {}
medium =
  { value = "medium", fontSize = Compatible }


{-| -}
large : FontSize {}
large =
  { value = "large", fontSize = Compatible }


{-| -}
xLarge : FontSize {}
xLarge =
  { value = "x-large", fontSize = Compatible }


{-| -}
xxLarge : FontSize {}
xxLarge =
  { value = "xx-large", fontSize = Compatible }


{-| -}
smaller : FontSize {}
smaller =
  { value = "smaller", fontSize = Compatible }


{-| -}
larger : FontSize {}
larger =
  { value = "larger", fontSize = Compatible }



-- Styles --


{-| -}
normal : FontStyle {}
normal =
  { value = "normal", fontStyle = Compatible }


{-| -}
italic : FontStyle {}
italic =
  { value = "italic", fontStyle = Compatible }


{-| -}
oblique : FontStyle {}
oblique =
  { value = "oblique", fontStyle = Compatible }



-- Weights --


{-| -}
bold : LengthOrNumberOrAutoOrNoneOrContent {}
bold =
  { value = "bold"
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  }


{-| -}
lighter : LengthOrNumberOrAutoOrNoneOrContent {}
lighter =
  { value = "lighter"
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  }


{-| -}
bolder : LengthOrNumberOrAutoOrNoneOrContent {}
bolder =
  { value = "bolder"
  , lengthOrNumberOrAutoOrNoneOrContent = Compatible
  }



-- VARIANTS --
-- CAPS --


{-| -}
smallCaps : FontVariantCaps {}
smallCaps =
  { value = "small-caps", fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
allSmallCaps : FontVariantCaps {}
allSmallCaps =
  { value = "all-small-caps", fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
petiteCaps : FontVariantCaps {}
petiteCaps =
  { value = "petite-caps", fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
allPetiteCaps : FontVariantCaps {}
allPetiteCaps =
  { value = "all-petite-caps", fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
unicase : FontVariantCaps {}
unicase =
  { value = "unicase", fontVariant = Compatible, fontVariantCaps = Compatible }


{-| -}
titlingCaps : FontVariantCaps {}
titlingCaps =
  { value = "titling-caps", fontVariant = Compatible, fontVariantCaps = Compatible }



-- LIGATURES --


{-| -}
commonLigatures : FontVariantLigatures {}
commonLigatures =
  { value = "common-ligatures"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
noCommonLigatures : FontVariantLigatures {}
noCommonLigatures =
  { value = "no-common-ligatures"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
discretionaryLigatures : FontVariantLigatures {}
discretionaryLigatures =
  { value = "discretionary-ligatures"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
noDiscretionaryLigatures : FontVariantLigatures {}
noDiscretionaryLigatures =
  { value = "no-discretionary-ligatures"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
historicalLigatures : FontVariantLigatures {}
historicalLigatures =
  { value = "historical-ligatures"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
noHistoricalLigatures : FontVariantLigatures {}
noHistoricalLigatures =
  { value = "no-historical-ligatures"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
contextual : FontVariantLigatures {}
contextual =
  { value = "context"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }


{-| -}
noContextual : FontVariantLigatures {}
noContextual =
  { value = "no-contextual"
  , fontVariant = Compatible
  , fontVariantLigatures = Compatible
  }



-- NUMERIC --


{-| -}
liningNums : FontVariantNumeric {}
liningNums =
  { value = "lining-nums"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
oldstyleNums : FontVariantNumeric {}
oldstyleNums =
  { value = "oldstyle-nums"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
proportionalNums : FontVariantNumeric {}
proportionalNums =
  { value = "proportional-nums"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
tabularNums : FontVariantNumeric {}
tabularNums =
  { value = "tabular-nums"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
diagonalFractions : FontVariantNumeric {}
diagonalFractions =
  { value = "diagonal-fractions"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
stackedFractions : FontVariantNumeric {}
stackedFractions =
  { value = "stacked-fractions"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
ordinal : FontVariantNumeric {}
ordinal =
  { value = "ordinal"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }


{-| -}
slashedZero : FontVariantNumeric {}
slashedZero =
  { value = "slashed-zero"
  , fontVariant = Compatible
  , fontVariantNumeric = Compatible
  }



{- BORDER PROPERTIES -}


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border : Length compatible units -> Mixin
border =
  prop1 "border"


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
border2 =
  prop2 "border"


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
border3 =
  prop3 "border"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop : Length compatible units -> Mixin
borderTop =
  prop1 "border-top"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderTop2 =
  prop2 "border-top"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderTop3 =
  prop3 "border-top"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom : Length compatible units -> Mixin
borderBottom =
  prop1 "border-bottom"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderBottom2 =
  prop2 "border-bottom"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderBottom3 =
  prop3 "border-bottom"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft : Length compatible units -> Mixin
borderLeft =
  prop1 "border-left"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderLeft2 =
  prop2 "border-left"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderLeft3 =
  prop3 "border-left"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight : Length compatible units -> Mixin
borderRight =
  prop1 "border-right"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderRight2 =
  prop2 "border-right"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderRight3 =
  prop3 "border-right"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart : Length compatible units -> Mixin
borderBlockStart =
  prop1 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderBlockStart2 =
  prop2 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart3 : Length compatibleA units -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderBlockStart3 =
  prop3 "border-block-start"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd : Length compatible units -> Mixin
borderBlockEnd =
  prop1 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderBlockEnd2 =
  prop2 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderBlockEnd3 =
  prop3 "border-block-end"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart : Length compatible units -> Mixin
borderInlineStart =
  prop1 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderInlineStart2 =
  prop2 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderInlineStart3 =
  prop3 "border-block-start"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd : Length compatible units -> Mixin
borderInlineEnd =
  prop1 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd2 : Length compatibleA unitsA -> BorderStyle compatibleB -> Mixin
borderInlineEnd2 =
  prop2 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd3 : Length compatibleA unitsA -> BorderStyle compatibleB -> ColorValue compatibleC -> Mixin
borderInlineEnd3 =
  prop3 "border-block-end"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset : LengthOrNumber compatible -> Mixin
borderImageOutset =
  prop1 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset2 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> Mixin
borderImageOutset2 =
  prop2 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset3 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> Mixin
borderImageOutset3 =
  prop3 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset4 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> LengthOrNumber compatibleD -> Mixin
borderImageOutset4 =
  prop4 "border-image-outset"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth : LengthOrNumber compatible -> Mixin
borderImageWidth =
  prop1 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth2 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> Mixin
borderImageWidth2 =
  prop2 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth3 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> Mixin
borderImageWidth3 =
  prop3 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth4 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> LengthOrNumber compatibleD -> Mixin
borderImageWidth4 =
  prop4 "border-image-width"


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color)

    borderBlockStartColor (rgb 101 202 0)
-}
borderBlockStartColor : ColorValue compatible -> Mixin
borderBlockStartColor =
  prop1 "border-block-start-color"


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color)

    borderBottomColor (rgb 101 202 0)
-}
borderBottomColor : ColorValue compatible -> Mixin
borderBottomColor =
  prop1 "border-bottom-color"


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color)

    borderInlineStartColor (rgb 101 202 0)
-}
borderInlineStartColor : ColorValue compatible -> Mixin
borderInlineStartColor =
  prop1 "border-inline-start-color"


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color)

    borderInlineEndColor (rgb 101 202 0)
-}
borderInlineEndColor : ColorValue compatible -> Mixin
borderInlineEndColor =
  prop1 "border-inline-end-color"


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color)

    borderLeftColor (rgb 101 202 0)
-}
borderLeftColor : ColorValue compatible -> Mixin
borderLeftColor =
  prop1 "border-left-color"


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color)

    borderRightColor (rgb 101 202 0)
-}
borderRightColor : ColorValue compatible -> Mixin
borderRightColor =
  prop1 "border-right-color"


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color)

    borderTopColor (rgb 101 202 0)
-}
borderTopColor : ColorValue compatible -> Mixin
borderTopColor =
  prop1 "border-top-color"


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color)

    borderBlockEndColor (rgb 101 202 0)
-}
borderBlockEndColor : ColorValue compatible -> Mixin
borderBlockEndColor =
  prop1 "border-block-end-color"


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style)

    borderBlockEndStyle dashed
-}
borderBlockEndStyle : BorderStyle compatible -> Mixin
borderBlockEndStyle =
  prop1 "border-block-end-style"


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style)

    borderBlockStartStyle dashed
-}
borderBlockStartStyle : BorderStyle compatible -> Mixin
borderBlockStartStyle =
  prop1 "border-block-start-style"


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style)

    borderInlineEndStyle dashed
-}
borderInlineEndStyle : BorderStyle compatible -> Mixin
borderInlineEndStyle =
  prop1 "border-inline-end-style"


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style)

    borderBottomStyle dashed
-}
borderBottomStyle : BorderStyle compatible -> Mixin
borderBottomStyle =
  prop1 "border-bottom-style"


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style)

    borderInlineStartStyle dashed
-}
borderInlineStartStyle : BorderStyle compatible -> Mixin
borderInlineStartStyle =
  prop1 "border-inline-start-style"


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style)

    borderLeftStyle dashed
-}
borderLeftStyle : BorderStyle compatible -> Mixin
borderLeftStyle =
  prop1 "border-left-style"


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style)

    borderRightStyle dashed
-}
borderRightStyle : BorderStyle compatible -> Mixin
borderRightStyle =
  prop1 "border-right-style"


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style)

    borderTopStyle dashed
-}
borderTopStyle : BorderStyle compatible -> Mixin
borderTopStyle =
  prop1 "border-top-style"


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style)

    borderStyle dashed
-}
borderStyle : BorderStyle compatible -> Mixin
borderStyle =
  prop1 "border-style"


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width)

    borderBottomWidth (em 4)
-}
borderBottomWidth : Length compatible units -> Mixin
borderBottomWidth =
  prop1 "border-bottom-width"


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width)

    borderInlineEndWidth (em 4)
-}
borderInlineEndWidth : Length compatible units -> Mixin
borderInlineEndWidth =
  prop1 "border-inline-end-width"


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width)

    borderLeftWidth (em 4)
-}
borderLeftWidth : Length compatible units -> Mixin
borderLeftWidth =
  prop1 "border-left-width"


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width)

    borderRightWidth (em 4)
-}
borderRightWidth : Length compatible units -> Mixin
borderRightWidth =
  prop1 "border-right-width"


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth : Length compatible units -> Mixin
borderTopWidth =
  prop1 "border-top-width"


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderTopWidth2 =
  prop2 "border-top-width"


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius : Length compatible units -> Mixin
borderBottomLeftRadius =
  prop1 "border-bottom-left-radius"


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderBottomLeftRadius2 =
  prop2 "border-bottom-left-radius"


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius : Length compatible units -> Mixin
borderBottomRightRadius =
  prop1 "border-bottom-right-radius"


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderBottomRightRadius2 =
  prop2 "border-bottom-right-radius"


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius : Length compatible units -> Mixin
borderTopLeftRadius =
  prop1 "border-top-left-radius"


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderTopLeftRadius2 =
  prop2 "border-top-left-radius"


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius : Length compatible units -> Mixin
borderTopRightRadius =
  prop1 "border-top-right-radius"


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderTopRightRadius2 =
  prop2 "border-top-right-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius : Length compatible units -> Mixin
borderRadius =
  prop1 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderRadius2 =
  prop2 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius3 : Length compatibleA unitsA -> Length compatibleB unitsB -> Length compatibleC unitsC -> Mixin
borderRadius3 =
  prop3 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius4 : Length compatibleB unitsB -> Length compatibleB unitsB -> Length compatibleC unitsC -> Length compatibleD unitsD -> Mixin
borderRadius4 =
  prop4 "border-radius"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing : Length compatible units -> Mixin
borderSpacing =
  prop1 "border-spacing"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing2 : Length compatibleA unitsA -> Length compatibleB unitsB -> Mixin
borderSpacing2 =
  prop2 "border-spacing"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor : ColorValue compatible -> Mixin
borderColor =
  prop1 "border-color"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor2 : ColorValue compatibleA -> ColorValue compatibleB -> Mixin
borderColor2 =
  prop2 "border-color"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor3 : ColorValue compatibleA -> ColorValue compatibleB -> ColorValue compatibleC -> Mixin
borderColor3 =
  prop3 "border-color"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor4 : ColorValue compatibleA -> ColorValue compatibleB -> ColorValue compatibleC -> ColorValue compatibleD -> Mixin
borderColor4 =
  prop4 "border-color"


{-| -}
overflow : Overflow compatible -> Mixin
overflow =
  prop1 "overflow"


{-| -}
overflowX : Overflow compatible -> Mixin
overflowX =
  prop1 "overflow-x"


{-| -}
overflowY : Overflow compatible -> Mixin
overflowY =
  prop1 "overflow-y"


{-| -}
whiteSpace : WhiteSpace compatible -> Mixin
whiteSpace =
  prop1 "white-space"


{-| -}
backgroundColor : ColorValue compatible -> Mixin
backgroundColor =
  prop1 "background-color"


{-| -}
color : ColorValue compatible -> Mixin
color =
  prop1 "color"


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
      Preprocess.MediaRule
        mediaQueries
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


{-| -}
withMedia : List Structure.MediaQuery -> List Mixin -> Mixin
withMedia =
  Preprocess.WithMedia



{- FONT PROPERTIES -}


{-| Sets [`line-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/line-height)

    lineHeight (px 10)
-}
lineHeight : Length compatible units -> Mixin
lineHeight =
  prop1 "line-height"


{-| Sets [`font-face`](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face)

    @ fontFace
        ~ font-family "Bitstream Vera Serif Bold"
        ~ src url("https://mdn.mozillademos.org/files/2468/VeraSeBd.ttf")
-}
src : ImportType compatible -> String
src value =
  toString value.value


{-| -}
fontFace : String -> String
fontFace value =
  "font-face " ++ value


{-| Sets [`font-family`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family)

    ~ fontFamily    serif
    ~ fontFamilies  [(qt "Gill Sans Extrabold"), "Helvetica", .value sansSerif]
-}
qt : String -> String
qt str =
  toString str


{-| -}
fontFamily : FontFamily a -> Mixin
fontFamily =
  prop1 "font-family"


{-| -}
fontFamilies : List String -> Mixin
fontFamilies =
  prop1 "font-family" << stringsToValue


{-| Sets [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size)

    ~ fontSize  xxSmall
    ~ fontSize  (px 12)
-}
fontSize : FontSize a -> Mixin
fontSize =
  prop1 "font-size"


{-| Sets [`font-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style)

    ~ fontStyle  italic
-}
fontStyle : FontStyle a -> Mixin
fontStyle =
  prop1 "font-style"


{-| Sets [`font-weight`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight)

    ~ fontWeight  bold
    ~ fontWeight  (n 300)
-}
fontWeight : LengthOrNumberOrAutoOrNoneOrContent a -> Mixin
fontWeight { value } =
  let
    validWeight weight =
      if value /= toString weight then
        -- This means it was one of the string keywords, e.g. "bold"
        True
      else
        [1..9]
          |> List.map ((*) 100)
          |> List.member weight

    warnings =
      if validWeight (stringToInt value) then
        []
      else
        [ "fontWeight " ++ value ++ " is invalid. Valid weights are: 100, 200, 300, 400, 500, 600, 700, 800, 900. Please see https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#Values" ]
  in
    propertyWithWarnings warnings "font-weight" value


{-| Sets [`font-variant`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)

    ~ fontVariant   smallCaps
    ~ fontVariant2  commonLigatures smallCaps
    ~ fontVariant3  commonLigatures smallCaps slashedZero
    ~ fontVariants  [ oldstyleNums tabularNums stackedFractions ordinal slashedZero ]
-}
fontVariant : FontVariant a -> Mixin
fontVariant =
  prop1 "font-variant"


{-| -}
fontVariant2 : FontVariant compatibleA -> FontVariant compatibleB -> Mixin
fontVariant2 =
  prop2 "font-variant"


{-| -}
fontVariant3 : FontVariant compatibleA -> FontVariant compatibleB -> FontVariant compatibleC -> Mixin
fontVariant3 =
  prop3 "font-variant"


{-| -}
fontVariantLigatures : FontVariantLigatures a -> Mixin
fontVariantLigatures =
  prop1 "font-variant-ligatures"


{-| -}
fontVariantCaps : FontVariantCaps a -> Mixin
fontVariantCaps =
  prop1 "font-variant-caps"


{-| -}
fontVariantNumeric : FontVariantNumeric a -> Mixin
fontVariantNumeric =
  prop1 "font-variant-numeric"


{-| -}
fontVariantNumeric2 : FontVariantNumeric compatibleA -> FontVariantNumeric compatibleB -> Mixin
fontVariantNumeric2 =
  prop2 "font-variant-numeric"


{-| -}
fontVariantNumeric3 : FontVariantNumeric compatibleA -> FontVariantNumeric compatibleB -> FontVariantNumeric compatibleC -> Mixin
fontVariantNumeric3 =
  prop3 "font-variant-numeric"


{-| -}
fontVariantNumerics : List (FontVariantNumeric compatible) -> Mixin
fontVariantNumerics =
  prop1 "font-variant-numeric" << valuesOrNone



{- TEXT DECORATION PROPERTIES -}


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration : TextDecorationLine a -> Mixin
textDecoration =
  prop1 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration2 : TextDecorationLine compatibleA -> TextDecorationStyle compatibleB -> Mixin
textDecoration2 =
  prop2 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration3 : TextDecorationLine compatibleA -> TextDecorationStyle compatibleB -> ColorValue compatibleC -> Mixin
textDecoration3 =
  prop3 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations : List (TextDecorationLine compatible) -> Mixin
textDecorations =
  prop1 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations2 : List (TextDecorationLine compatibleA) -> TextDecorationStyle compatibleB -> Mixin
textDecorations2 =
  prop2 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations3 : List (TextDecorationLine compatibleA) -> TextDecorationStyle compatibleB -> ColorValue compatibleC -> Mixin
textDecorations3 =
  prop3 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLine underline

You can specify multiple line decorations with `textDecorationLines`.

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLine : TextDecorationLine compatible -> Mixin
textDecorationLine =
  prop1 "text-decoration-line"


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLines : List (TextDecorationLine compatible) -> Mixin
textDecorationLines =
  prop1 "text-decoration-line" << valuesOrNone


{-| Sets [`text-decoration-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style)

    ~ textDecorationStyle dotted
-}
textDecorationStyle : TextDecorationStyle compatible -> Mixin
textDecorationStyle =
  prop1 "text-decoration-style"


{-| Sets [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)

    ~ animationName  Foo

You can also use [`animationNames`](#animationNames) to set multiple animation
names, or to set `animation-name: none;`

    ~ animationNames [ Foo, Bar ]
    ~ animationNames [] -- outputs "animation-name: none;"
-}
animationName : animation -> Mixin
animationName identifier =
  animationNames [ identifier ]


{-| Sets [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)

    ~ animationNames [ Foo, Bar ]

Pass `[]` to set `animation-name: none;`

    ~ animationNames [] -- outputs "animation-name: none;"
-}
animationNames : List animation -> Mixin
animationNames identifiers =
  let
    value =
      identifiers
        |> List.map (identifierToString "")
        |> String.join ", "
  in
    property "animation-name" value


{-| An empty namespaced stylesheet. Use this as the foundation on which to build
your stylesheet.

    stylesheet { name = "homepage" }
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
stylesheet : List Snippet -> Stylesheet
stylesheet =
  Preprocess.stylesheet


{-| A Mixin allowing you to modularly reuse common styles in other styles.
`mixin` declares the mixin, and `~=` adds the contents of a mixin to another
style.

    underlineOnHover =
        mixin "underlineOnHover"
            ~ textDecoration none

            &: hover
                ~ textDecoration underline

    a . FancyLink
        ~ color (rgb 128 64 32)
        ~= underlineOnHover

...has the same result as:

    a . FancyLink
        ~ color (rgb 128 64 32)
        ~ textDecoration none

        &: hover
            ~ textDecoration underline
-}
mixin : List Mixin -> Mixin
mixin =
  Preprocess.ApplyMixins


{-| An [id selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors).

    stylesheet "homepage"
        # NavBar
            ~ width 960 px
            ~ backgroundColor (rgb 123 42 208)

    stylesheet "login"
        button # Cancel
            ~ backgroundColor (rgb 128 64 32)
-}
(#) : id -> List Mixin -> Snippet
(#) id mixins =
  [ Structure.IdSelector (identifierToString "" id) ]
    |> Structure.UniversalSelectorSequence
    |> makeSnippet mixins


makeSnippet : List Mixin -> Structure.SimpleSelectorSequence -> Snippet
makeSnippet mixins sequence =
  let
    selector =
      Structure.Selector sequence [] Nothing
  in
    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock selector [] mixins) ]
      |> Preprocess.Snippet


{-| A [class selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors).
    StyleBlock transform
            ~ color (rgb 7 7 7)

    stylesheet "login"
        button . LoginFormButton
            ~ fontWeight normal
            ~ color (rgb 128 64 32)
-}
(.) : class -> List Mixin -> Snippet
(.) class mixins =
  [ Structure.ClassSelector (identifierToString "" class) ]
    |> Structure.UniversalSelectorSequence
    |> makeSnippet mixins



-- {-| A mixin that adds the [Clearfix for Modern Browsers](http://www.cssmojo.com/latest_new_clearfix_so_far/#clearfix-for-modern-browsers)
-- implementation of [clearfix](http://www.cssmojo.com/clearfix_block-formatting-context_and_hasLayout/).
--
-- This works with Internet Explorer 8 and later; if you need
-- to support older browsers, consider using the legacy [Micro Clearfix from 2011](http://nicolasgallagher.com/micro-clearfix-hack/)
-- instead.
-- -}
--clearfix : Mixin
--clearfix =
--  mixin
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
        $= "* [lang^=en]"
            ~ textDecoration underline
            ~ color (rgb 7 7 7)
-}
selector : String -> List Mixin -> Snippet
selector selectorStr mixins =
  Structure.CustomSelector selectorStr []
    |> makeSnippet mixins


{-| A [`*` selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    (.) Foo
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
everything : List Mixin -> Snippet
everything mixins =
  Structure.UniversalSelectorSequence []
    |> makeSnippet mixins


{-| Define a custom property.

    $ body
        ~ custom "-webkit-font-smoothing" "none"

...outputs

    body {
        -webkit-font-smoothing: none;
    }
-}
property : String -> String -> Mixin
property =
  propertyWithWarnings []


propertyWithWarnings : List String -> String -> String -> Mixin
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


{-| An [`:active`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aactive)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
active : List Mixin -> Mixin
active =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "active")


{-| An [`:any`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aany)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
any : String -> List Mixin -> Mixin
any str =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("any(" ++ str ++ ")"))


{-| A [`:checked`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Achecked)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
checked : List Mixin -> Mixin
checked =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "checked")


{-| A [`:dir`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Adir)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
dir : Directionality -> List Mixin -> Mixin
dir directionality =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("dir(" ++ (directionalityToString directionality) ++ ")"))


{-| A [`:disabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Adisabled)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
disabled : List Mixin -> Mixin
disabled =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "disabled")


{-| An [`:empty`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aempty)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
empty : List Mixin -> Mixin
empty =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "empty")


{-| An [`:enabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aenabled)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
enabled : List Mixin -> Mixin
enabled =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "enabled")


{-| A [`:first`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
first : List Mixin -> Mixin
first =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "first")


{-| A [`:first-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
firstChild : List Mixin -> Mixin
firstChild =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "first-child")


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
firstOfType : List Mixin -> Mixin
firstOfType =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "first-of-type")


{-| A [`:fullscreen`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afullscreen)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
fullscreen : List Mixin -> Mixin
fullscreen =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "fullscreen")


{-| A [`:focus`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afocus)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
focus : List Mixin -> Mixin
focus =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "focus")


{-| An [`:hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ahover)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
hover : List Mixin -> Mixin
hover =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "hover")


{-| An [`:indeterminate`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aindeterminate)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
indeterminate : List Mixin -> Mixin
indeterminate =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "indeterminate")


{-| An [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ainvalid)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
invalid : List Mixin -> Mixin
invalid =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "invalid")


{-| A [`:lang`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alang)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lang : String -> List Mixin -> Mixin
lang str =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("lang(" ++ str ++ ")"))


{-| A [`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alast-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lastChild : List Mixin -> Mixin
lastChild =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "last-child")


{-| A [`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alast-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lastOfType : List Mixin -> Mixin
lastOfType =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "last-of-type")


{-| A [`:link`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alink)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
link : List Mixin -> Mixin
link =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "link")


{-| An [`:nth-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthChild : String -> List Mixin -> Mixin
nthChild str =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("nth-child(" ++ str ++ ")"))


{-| An [`:nth-last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-last-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthLastChild : String -> List Mixin -> Mixin
nthLastChild str =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("nth-last-child(" ++ str ++ ")"))


{-| An [`:nth-last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-last-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthLastOfType : String -> List Mixin -> Mixin
nthLastOfType str =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("nth-last-of-type(" ++ str ++ ")"))


{-| An [`:nth`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthOfType : String -> List Mixin -> Mixin
nthOfType str =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector ("nth-of-type(" ++ str ++ ")"))


{-| An [`:only-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aonly-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
onlyChild : List Mixin -> Mixin
onlyChild =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "only-child")


{-| An [`:only-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aonly-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
onlyOfType : List Mixin -> Mixin
onlyOfType =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "only-of-type")


{-| An [`:optional`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aoptional)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
optional : List Mixin -> Mixin
optional =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "optional")


{-| An [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aout-of-range)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
outOfRange : List Mixin -> Mixin
outOfRange =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "out-of-range")


{-| A [`:read-write`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aread-write)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
readWrite : List Mixin -> Mixin
readWrite =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "read-write")


{-| A [`:required`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Arequired)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
required : List Mixin -> Mixin
required =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "required")


{-| A [`:root`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aroot)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
root : List Mixin -> Mixin
root =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "root")


{-| A [`:scope`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ascope)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
scope : List Mixin -> Mixin
scope =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "scope")


{-| A [`:target`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Atarget)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
target : List Mixin -> Mixin
target =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "target")


{-| A [`:valid`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Avalid)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
valid : List Mixin -> Mixin
valid =
  Preprocess.ExtendSelector (Structure.PseudoClassSelector "valid")



-- Pseudo-Elements --


{-| An [`::after`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aafter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
after : List Mixin -> Mixin
after =
  Preprocess.WithPseudoElement (Structure.PseudoElement "after")


{-| A [`::before`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Abefore)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
before : List Mixin -> Mixin
before =
  Preprocess.WithPseudoElement (Structure.PseudoElement "before")


{-| A [`::first-letter`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Afirst-letter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
firstLetter : List Mixin -> Mixin
firstLetter =
  Preprocess.WithPseudoElement (Structure.PseudoElement "first-letter")


{-| A [`::first-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Afirst-line)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
firstLine : List Mixin -> Mixin
firstLine =
  Preprocess.WithPseudoElement (Structure.PseudoElement "first-line")


{-| A [`::selection`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aselection)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
selection : List Mixin -> Mixin
selection =
  Preprocess.WithPseudoElement (Structure.PseudoElement "selection")



-- Intentionally Unsupported --


type IntentionallyUnsupportedPleaseSeeDocs
  = IntentionallyUnsupportedPleaseSeeDocs


{-| The
[border width values](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)
of `thin`, `medium`, and `thick` have unspecified behavior according to the
CSS specification, and as such are intentionally unsupported.

Using them is a bad idea, but if the fate of the world depends on it, you can
fall back on something like this:

    stylesheet { name = "badIdeas" }
        $ button
            ~ ( "border-left", "thin" )
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

    stylesheet { name = "badIdeas" }
        $ button
            ~ ( "border-left", "thin" )
-}
thick : IntentionallyUnsupportedPleaseSeeDocs
thick =
  IntentionallyUnsupportedPleaseSeeDocs


{-| [`blink`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
is ~~totally rad~~ deprecated, and as such has been ~~reluctantly~~ omitted
from elm-css.
-}
blink : IntentionallyUnsupportedPleaseSeeDocs
blink =
  IntentionallyUnsupportedPleaseSeeDocs


{-| -}
children : List Snippet -> Mixin
children =
  Preprocess.NestSnippet Structure.Child


{-| -}
withClass : class -> List Mixin -> Mixin
withClass class =
  Preprocess.ExtendSelector (Structure.ClassSelector (identifierToString "" class))


{-| -}
descendants : List Snippet -> Mixin
descendants =
  Preprocess.NestSnippet Structure.Descendant


{-| -}
adjacentSiblings : List Snippet -> Mixin
adjacentSiblings =
  Preprocess.NestSnippet Structure.AdjacentSibling


{-| -}
generalSiblings : List Snippet -> Mixin
generalSiblings =
  Preprocess.NestSnippet Structure.GeneralSibling


{-| -}
each : List (List Mixin -> Snippet) -> List Mixin -> Snippet
each snippetCreators mixins =
  let
    selectorsToSnippet selectors =
      case selectors of
        [] ->
          Preprocess.Snippet []

        first :: rest ->
          [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock first rest mixins) ]
            |> Preprocess.Snippet
  in
    List.map ((|>) []) snippetCreators
      |> List.concatMap unwrapSnippet
      |> collectSelectors
      |> selectorsToSnippet


numberToString : number -> String
numberToString num =
  toString (num + 0)


stringToInt : String -> Int
stringToInt str =
  Result.withDefault 0 <| String.toInt str


numericalPercentageToString : number -> String
numericalPercentageToString value =
  value |> (*) 100 |> numberToString |> (flip (++)) "%"


valuesOrNone : List (Value compatible) -> Value {}
valuesOrNone list =
  if List.isEmpty list then
    { value = "none" }
  else
    { value = String.join " " (List.map .value list) }


stringsToValue : List String -> Value {}
stringsToValue list =
  if List.isEmpty list then
    { value = "none" }
  else
    { value = String.join ", " (List.map (\s -> s) list) }


{-| Compile the given stylesheet to a CSS string, or to an error
message if it could not be compiled.
-}
compile : Stylesheet -> { css : String, warnings : List String }
compile =
  Resolve.compile


collectSelectors : List Preprocess.SnippetDeclaration -> List Structure.Selector
collectSelectors declarations =
  case declarations of
    [] ->
      []

    (Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock firstSelector otherSelectors _)) :: rest ->
      (firstSelector :: otherSelectors) ++ (collectSelectors rest)

    _ :: rest ->
      collectSelectors rest
