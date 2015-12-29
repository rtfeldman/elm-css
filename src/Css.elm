module Css (stylesheet, mixin, all, custom, important, ($), (#), (.), (@), (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.), ($=), (~), (&::), (&:), transformStyle, transformBox, transform, transforms, currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, capitalize, uppercase, lowercase, fullWidth, hanging, eachLine, textIndent, textIndent2, textIndent3, ellipsis, clip, textOverflow, optimizeSpeed, optimizeLegibility, geometricPrecision, textRendering, textTransform, textShadow, textShadow2, textShadow3, textShadow4, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, minContent, maxContent, fitContent, fillAvailable, width, minWidth, maxWidth, height, minHeight, maxHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflow, overflowX, overflowY, whiteSpace, backgroundColor, color, media, solid, transparent, rgb, rgba, hex, zero, pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, n, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, contentBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, scroll, visible, block, inlineBlock, inline, none, auto, inherit, initial, unset, noWrap, static, fixed, sticky, relative, absolute, position, top, bottom, middle, baseline, sub, super, textTop, textBottom, after, before, firstLetter, firstLine, selection, active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid, hidden, wavy, dotted, dashed, double, groove, ridge, inset, outset, blink, thin, medium, thick, matrix, matrix3d, perspective, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scale3d, scaleX, scaleY, skew, skew2, skewX, skewY, translate, translate2, translate3d, translateX, translateY, translateZ, rotate, fillBox, viewBox, flat, preserve3d, deg, rad, grad, turn) where

{-| Functions for building stylesheets.

# Style
@docs stylesheet, mixin

# Statements
@docs ($), (#), (.), (@), ($=)

# Combinators
@docs (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.)

# Attributes
@docs transformStyle, transformBox, transform, transforms, currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, capitalize, uppercase, lowercase, fullWidth, hanging, eachLine, textIndent, textIndent2, textIndent3, clip, ellipsis, textOverflow, optimizeSpeed, optimizeLegibility, geometricPrecision, textRendering, textTransform, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, minContent, maxContent, fitContent, fillAvailable, width, minWidth, maxWidth, height, minHeight, maxHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflow, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, textShadow2, textShadow3, textShadow4

# Values
@docs all, important, custom, (~), solid, transparent, rgb, rgba, hex, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, contentBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, scroll, visible, block, inlineBlock, inline, none, auto, inherit, unset, initial, noWrap, top, static, fixed, sticky, relative, absolute, position, bottom, middle, baseline, sub, super, textTop, textBottom, hidden, wavy, dotted, dashed, solid, double, groove, ridge, inset, outset, matrix, matrix3d, perspective, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scale3d, scaleX, scaleY, skew, skew2, skewX, skewY, translate, translate2, translate3d, translateX, translateY, translateZ, rotate, fillBox, viewBox, flat, preserve3d

# Length
@docs pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, n, zero

# Angle
@docs deg, rad, grad, turn

# Pseudo-Classes
@docs (&:), active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid

# Pseudo-Elements
@docs (&::), after, before, firstLetter, firstLine, selection

# Intentionally Unsupported

These are features you might expect to be in elm-css (because they are in the
CSS specification) but which have been omitted because their use is either
deprecated or discouraged.

@docs thin, medium, thick, blink
-}

import Css.Declaration as Declaration exposing (Declaration(..), Selector(..), CompoundSelector(..), introduceSelector, getLastProperty, updateLastProperty, extendLastSelector, addProperty, addSelector)
import Css.Elements exposing (Tag, tagToString)
import Css.Util exposing (toCssIdentifier, identifierToString)
import Style exposing (Style(..))
import String


type Compatible
    = Compatible



-- TODO these are just for @media - maybe improve type guarantees?


screen : String
screen =
    "screen"


print : String
print =
    "print"



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

`key` is the name of the property.
`functionName` is just for better error messages.
-}
getOverloadedProperty : String -> String -> Style namespace animation class id -> Property namespace animation class id
getOverloadedProperty functionName key style =
    case style of
        NamespacedStyle name _ ->
            InvalidStyle ("`" ++ functionName ++ "` must be given a property or mixin, not a stylesheet with name \"" ++ (toCssIdentifier name) ++ "\"")

        Mixin applyMixin ->
            let
                newStyleFromDeclarations style name declarations =
                    let
                        value =
                            getLastProperty declarations
                                |> Maybe.map .key
                                |> Maybe.withDefault ""

                        update subject =
                            { subject | key = key, value = value }
                    in
                        case updateLastProperty functionName update declarations of
                            Ok newDeclarations ->
                                NamespacedStyle name newDeclarations

                            Err message ->
                                InvalidStyle message
            in
                Mixin (applyMixin >> (resolveMixin newStyleFromDeclarations))

        (InvalidStyle _) as invalidStyle ->
            invalidStyle


lastPropertyKeyToString : Style namespace animation class id -> String
lastPropertyKeyToString style =
    case style of
        NamespacedStyle _ declarations ->
            getLastProperty declarations
                |> Maybe.map .key
                |> Maybe.withDefault ""

        Mixin applyMixin ->
            (toString applyMixin)

        InvalidStyle _ ->
            ""


getLastProperty : List Declaration -> Maybe Declaration.Property
getLastProperty declarations =
    case declarations of
        [] ->
            Nothing

        (StyleBlock _ _ properties) :: [] ->
            getLast properties

        first :: rest ->
            getLastProperty rest


getLast : List a -> Maybe a
getLast list =
    case list of
        [] ->
            Nothing

        elem :: [] ->
            Just elem

        first :: rest ->
            getLast rest


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
type alias Color compatible =
    { compatible | value : String, color : Compatible }


{-| https://developer.mozilla.org/en-US/docs/Web/CSS/length
-}
type alias Length compatible =
    { compatible | value : String, length : Compatible }


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


type alias ExplicitLength =
    { value : String
    , length : Compatible
    , lengthOrAuto : Compatible
    , lengthOrNumber : Compatible
    , lengthOrNone : Compatible
    , lengthOrMinMaxDimension : Compatible
    , lengthOrNoneOrMinMaxDimension : Compatible
    , textIndent : Compatible
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



{- Because `left` and `right` are both common properties and common values
in CSS (e.g. `left: 5px` with `position: absolute` and `text-align: left`),
we implement it as a property (for the `left: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String as its key, and use that as our value.
(See `getOverloadedProperty`. Note that `VerticalAlign` follows a similar pattern.)
-}


type alias TextAlign namespace animation class id a =
    Length a -> Property namespace animation class id



{- Because `top` and `bottom` are both common properties and common values
in CSS (e.g. `top: 5px` with `position: absolute` and `vertical-align: top`),
we implement it as a property (for the `top: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String as its key, and use that as our value.
(See `getOverloadedProperty`. Note that `TextAlign` follows a similar pattern.)
-}


type alias VerticalAlign namespace animation class id a =
    Length a -> Property namespace animation class id


type alias Property namespace animation class id =
    Style namespace animation class id



-- Properties --


{-| An [`all`](https://developer.mozilla.org/en-US/docs/Web/CSS/all) property.
-}
all : All compatible -> Property namespace animation class id
all =
    prop1 "all"


{-| Transforms the given property by adding !important to the end of its
declaration.
-}
important : Property namespace animation class id -> Property namespace animation class id
important style =
    case style of
        NamespacedStyle name newDeclarations ->
            InvalidStyle ("`important` must be given a property or mixin, not a stylesheet with namespace " ++ (toCssIdentifier name))

        Mixin applyMixin ->
            let
                update property =
                    { property | important = True }

                newStyleFromDeclarations style name declarations =
                    case updateLastProperty "important" update declarations of
                        Ok newDeclarations ->
                            NamespacedStyle name newDeclarations

                        Err message ->
                            InvalidStyle message
            in
                Mixin (applyMixin >> (resolveMixin newStyleFromDeclarations))

        InvalidStyle _ ->
            style


{-| A [`transparent`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent_keyword) color.
-}
transparent : Color {}
transparent =
    { value = "transparent"
    , color = Compatible
    }


{-| The [`currentColor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword)
    value.
-}
currentColor : Color {}
currentColor =
    { value = "currentColor"
    , color = Compatible
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
    , boxSizing : Compatible
    , display : Compatible
    , none : Compatible
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
    , textDecorationLine = Compatible
    , textRendering = Compatible
    , textIndent = Compatible
    , textDecorationStyle = Compatible
    , boxSizing = Compatible
    , display = Compatible
    , all = Compatible
    , length = Compatible
    , lengthOrAuto = Compatible
    , lengthOrNone = Compatible
    , lengthOrNumber = Compatible
    , lengthOrMinMaxDimension = Compatible
    , lengthOrNoneOrMinMaxDimension = Compatible
    }


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
    in functional notation.
-}
rgb : number -> number -> number -> Color {}
rgb r g b =
    { value = cssFunction "rgb" (List.map numberToString [ r, g, b ])
    , color = Compatible
    }


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : number -> number -> number -> number -> Color {}
rgba r g b a =
    { value = cssFunction "rgba" (List.map numberToString [ r, g, b, a ])
    , color = Compatible
    }


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
    in hexadecimal notation.
-}
hex : String -> Color {}
hex str =
    { value = "#" ++ str
    , color = Compatible
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
-}
center : TextAlign namespace animation class id a
center =
    prop1 "center"


{-| `text-justify` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textJustify : TextAlign namespace animation class id a
textJustify =
    prop1 "text-justify"


{-| `justify-all` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
justifyAll : TextAlign namespace animation class id a
justifyAll =
    prop1 "justify-all"


{-| `start` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
start : TextAlign namespace animation class id a
start =
    prop1 "start"


{-| `end` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
end : TextAlign namespace animation class id a
end =
    prop1 "end"


{-| `match-parent` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
matchParent : TextAlign namespace animation class id a
matchParent =
    prop1 "match-parent"


{-| `true` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
true : TextAlign namespace animation class id a
true =
    prop1 "true"



{- LENGTHS -}


lengthConverter : String -> number -> ExplicitLength
lengthConverter suffix num =
    { value = (numberToString num) ++ suffix
    , length = Compatible
    , lengthOrAuto = Compatible
    , lengthOrNumber = Compatible
    , lengthOrNone = Compatible
    , lengthOrMinMaxDimension = Compatible
    , lengthOrNoneOrMinMaxDimension = Compatible
    , textIndent = Compatible
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
    }


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : number -> ExplicitLength
pct =
    lengthConverter "%"


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
em : number -> ExplicitLength
em =
    lengthConverter "em"


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
ex : number -> ExplicitLength
ex =
    lengthConverter "ex"


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
ch : number -> ExplicitLength
ch =
    lengthConverter "ch"


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
rem : number -> ExplicitLength
rem =
    lengthConverter "rem"


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
vh : number -> ExplicitLength
vh =
    lengthConverter "vh"


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
vw : number -> ExplicitLength
vw =
    lengthConverter "vw"


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
vmin : number -> ExplicitLength
vmin =
    lengthConverter "vmin"


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
vmax : number -> ExplicitLength
vmax =
    lengthConverter "vmax"


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : number -> ExplicitLength
px =
    lengthConverter "px"


{-| [`mm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm) units.
-}
mm : number -> ExplicitLength
mm =
    lengthConverter "mm"


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
cm : number -> ExplicitLength
cm =
    lengthConverter "cm"


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)
-}
inches : number -> ExplicitLength
inches =
    lengthConverter "in"


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
pt : number -> ExplicitLength
pt =
    lengthConverter "pt"


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
pc : number -> ExplicitLength
pc =
    lengthConverter "pc"


{-| A unitless number. Useful with properties like [`borderImageOutset`](#borderImageOutset)
which accept either length units or unitless numbers for some properties.
-}
n : number -> LengthOrNumber (Number {})
n num =
    { value = numberToString num
    , lengthOrNumber = Compatible
    , number = Compatible
    }



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
translate : Length compatible -> Transform {}
translate { value } =
    { value = cssFunction "translate" [ value ]
    , transform = Compatible
    }


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))
-}
translate2 : Length compatible -> Length compatible -> Transform {}
translate2 tx ty =
    { value = cssFunction "translate" [ tx.value, ty.value ]
    , transform = Compatible
    }


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translateX (px 100))
-}
translateX : Length compatible -> Transform {}
translateX { value } =
    { value = cssFunction "translateX" [ value ]
    , transform = Compatible
    }


{-| The [`translateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateY()) transform-function.

    transform (translateY (px 100))
-}
translateY : Length compatible -> Transform {}
translateY { value } =
    { value = cssFunction "translateY" [ value ]
    , transform = Compatible
    }


{-| The [`translateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateZ()) transform-function.

    transform (translateZ (px 100))
-}
translateZ : Length compatible -> Transform {}
translateZ { value } =
    { value = cssFunction "translateZ" [ value ]
    , transform = Compatible
    }


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translate3d (px 100) (px 100) (px 100))
-}
translate3d : Length compatible -> Length compatible -> Length compatible -> Transform {}
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
transforms : List (Transform compatible) -> Property namespace animation class id
transforms =
    prop1 "transform" << valuesOrNone


{-| Sets [`transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
with a single explicit transform value. If you need to set the transform
property to `none`, use the `transforms` function with an empty list. See
`transforms` for more details.

    transform (scaleX 1.4)
-}
transform : Transform compatible -> Property namespace animation class id
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
transformBox : TransformBox compatible -> Property namespace animation class id
transformBox =
    prop1 "transform-box"


{-| Sets [`box-sizing`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing)

    ~ boxSizing borderBox
-}
boxSizing : BoxSizing compatible -> Property namespace animation class id
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
transformStyle : TransformStyle compatible -> Property namespace animation class id
transformStyle =
    prop1 "transform-style"



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
    , value : String
    }
auto =
    { value = "auto"
    , overflow = Compatible
    , textRendering = Compatible
    , lengthOrAuto = Compatible
    }


{-| -}
noWrap : WhiteSpace {}
noWrap =
    { value = "no-wrap"
    , whiteSpace = Compatible
    }



{- VERTICAL-ALIGN -}


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign middle
-}
middle : VerticalAlign namespace animation class id a
middle =
    prop1 "middle"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign baseline
-}
baseline : VerticalAlign namespace animation class id a
baseline =
    prop1 "baseline"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign sub
-}
sub : VerticalAlign namespace animation class id a
sub =
    prop1 "sub"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign super
-}
super : VerticalAlign namespace animation class id a
super =
    prop1 "super"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textTop
-}
textTop : VerticalAlign namespace animation class id a
textTop =
    prop1 "text-top"


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textBottom
-}
textBottom : VerticalAlign namespace animation class id a
textBottom =
    prop1 "text-bottom"


{-| The [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) property.
-}
position : Position compatible -> Property namespace animation class id
position =
    prop1 "position"



{- Properties -}


prop1 : String -> Value a -> Property namespace animation class id
prop1 key arg =
    custom key arg.value


prop2 : String -> Value a -> Value b -> Property namespace animation class id
prop2 key argA argB =
    custom key (String.join " " [ argA.value, argB.value ])


prop3 : String -> Value a -> Value b -> Value c -> Property namespace animation class id
prop3 key argA argB argC =
    custom key (String.join " " [ argA.value, argB.value, argC.value ])


prop4 : String -> Value a -> Value b -> Value c -> Value d -> Property namespace animation class id
prop4 key argA argB argC argD =
    custom key (String.join " " [ argA.value, argB.value, argC.value, argD.value ])


{-| Sets [`text-decoration-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color)

    textDecorationColor (rgb 12 11 10)
-}
textDecorationColor : Color compatible -> Property namespace animation class id
textDecorationColor =
    prop1 "text-decoration-color"


{-| Sets [`text-align-last`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align-last).

    ~ textAlignLast start

    **Note:** Due to certain implementation constraints, `auto` cannot be
    supported here. If you need to set this property to `auto`,
    use this workaround:

    ~ ("text-align-last", "auto")
-}
textAlignLast : (ExplicitLength -> Style a b c d) -> Property a b c d
textAlignLast fn =
    getOverloadedProperty "textAlignLast" "text-align-last" (fn (pct 0))


{-| Sets [`text-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textAlign : (ExplicitLength -> Style a b c d) -> Property a b c d
textAlign fn =
    getOverloadedProperty "textAlign" "text-align" (fn (pct 0))


{-| Sets [`text-rendering`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering).
-}
textRendering : TextRendering a -> Property namespace animation class id
textRendering =
    prop1 "text-rendering"


{-| Sets [`text-overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow).

    ~ textOverflow ellipsis

To set `text-overflow` to an arbitrary String, use [`custom`](#custom) like so:

    ~ custom "text-overflow" "my custom text-overflow value"
-}
textOverflow : TextOverflow compatible -> Property namespace animation class id
textOverflow =
    prop1 "text-overflow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow : None compatible -> Property namespace animation class id
textShadow =
    prop1 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow2 : Length compatible -> Length compatible -> Property namespace animation class id
textShadow2 =
    prop2 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow3 : Length compatible -> Length compatible -> Color compatible -> Property namespace animation class id
textShadow3 =
    prop3 "text-shadow"


{-| Sets [`text-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow).

    ~ textShadow  none
    ~ textShadow2 (px 1) (px 2)
    ~ textShadow3 (px 1) (px 2) (rgb 211 121 112)
    ~ textShadow4 (px 1) (px 2) (px 3) (rgb 211 121 112)

-}
textShadow4 : Length compatible -> Length compatible -> Length compatible -> Color compatible -> Property namespace animation class id
textShadow4 =
    prop4 "text-shadow"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    ~ textIndent  (px 40)
    ~ textIndent2 (px 40) hanging
    ~ textIndent3 (px 40) hanging eachLine
-}
textIndent : Length compatible -> Property namespace animation class id
textIndent =
    prop1 "text-indent"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    ~ textIndent  (px 40)
    ~ textIndent2 (px 40) hanging
    ~ textIndent3 (px 40) hanging eachLine
-}
textIndent2 : Length compatibleA -> TextIndent compatibleB -> Property namespace animation class id
textIndent2 =
    prop2 "text-indent"


{-| Sets [`text-indent`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent).

    ~ textIndent  (px 40)
    ~ textIndent2 (px 40) hanging
    ~ textIndent3 (px 40) hanging eachLine
-}
textIndent3 : Length compatibleA -> TextIndent compatibleB -> TextIndent compatibleC -> Property namespace animation class id
textIndent3 =
    prop3 "text-indent"


{-| Sets [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform).
-}
textTransform : TextTransform compatible -> Property namespace animation class id
textTransform =
    prop1 "text-transform"


{-| Sets [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align).
-}
verticalAlign : (ExplicitLength -> Style a b c d) -> Property a b c d
verticalAlign fn =
    getOverloadedProperty "verticalAlign" "vertical-align" (fn (pct 0))


{-| -}
display : Display compatible -> Property namespace animation class id
display =
    prop1 "display"


{-| -}
opacity : number -> Property namespace animation class id
opacity num =
    prop1 "opacity" { value = numberToString num }


{-| Sets [`width`](https://developer.mozilla.org/en-US/docs/Web/CSS/width)

    ~ width (px 960)

-}
width : LengthOrAuto compatible -> Property namespace animation class id
width =
    prop1 "width"


{-| Sets [`max-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-width)

    ~ maxWidth (px 960)

-}
maxWidth : LengthOrNoneOrMinMaxDimension compatible -> Property namespace animation class id
maxWidth =
    prop1 "max-width"


{-| Sets [`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width)

    ~ minWidth (px 100)

-}
minWidth : LengthOrMinMaxDimension compatible -> Property namespace animation class id
minWidth =
    prop1 "min-width"


{-| Sets [`height`](https://developer.mozilla.org/en-US/docs/Web/CSS/height)

    ~ height (px 800)

-}
height : LengthOrAuto compatible -> Property namespace animation class id
height =
    prop1 "height"


{-| Sets [`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height)

    ~ minHeight (px 100)

-}
minHeight : LengthOrMinMaxDimension compatible -> Property namespace animation class id
minHeight =
    prop1 "min-height"


{-| Sets [`max-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height)

    ~ maxHeight (px 1024)

-}
maxHeight : LengthOrNoneOrMinMaxDimension compatible -> Property namespace animation class id
maxHeight =
    prop1 "max-height"



{- PADDING PROPERTIES -}


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding : Length compatible -> Property namespace animation class id
padding =
    prop1 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding2 : Length compatible -> Length compatible -> Property namespace animation class id
padding2 =
    prop2 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding3 : Length compatible -> Length compatible -> Length compatible -> Property namespace animation class id
padding3 =
    prop3 "padding"


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding4 : Length compatible -> Length compatible -> Length compatible -> Length compatible -> Property namespace animation class id
padding4 =
    prop4 "padding"


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start)

    paddingBlockStart (px 10)
-}
paddingBlockStart : LengthOrAuto compatible -> Property namespace animation class id
paddingBlockStart =
    prop1 "padding-block-start"


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end)

    paddingBlockEnd (px 10)
-}
paddingBlockEnd : LengthOrAuto compatible -> Property namespace animation class id
paddingBlockEnd =
    prop1 "padding-block-end"


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start)

    paddingInlineStart (px 10)
-}
paddingInlineStart : LengthOrAuto compatible -> Property namespace animation class id
paddingInlineStart =
    prop1 "padding-inline-start"


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end)

    paddingInlineEnd (px 10)
-}
paddingInlineEnd : LengthOrAuto compatible -> Property namespace animation class id
paddingInlineEnd =
    prop1 "padding-inline-end"


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top)

    paddingTop (px 10)
-}
paddingTop : Length compatible -> Property namespace animation class id
paddingTop =
    prop1 "padding-top"


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom)

    paddingBottom (px 10)
-}
paddingBottom : Length compatible -> Property namespace animation class id
paddingBottom =
    prop1 "padding-bottom"


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right)

    paddingRight (px 10)
-}
paddingRight : Length compatible -> Property namespace animation class id
paddingRight =
    prop1 "padding-right"


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left)

    paddingLeft (px 10)
-}
paddingLeft : Length compatible -> Property namespace animation class id
paddingLeft =
    prop1 "padding-left"



{- MARGIN PROPERTIES -}


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin : LengthOrAuto compatible -> Property namespace animation class id
margin =
    prop1 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin2 : LengthOrAuto compatible -> LengthOrAuto compatible -> Property namespace animation class id
margin2 =
    prop2 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin3 : LengthOrAuto compatible -> LengthOrAuto compatible -> LengthOrAuto compatible -> Property namespace animation class id
margin3 =
    prop3 "margin"


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin4 : LengthOrAuto compatible -> LengthOrAuto compatible -> LengthOrAuto compatible -> LengthOrAuto compatible -> Property namespace animation class id
margin4 =
    prop4 "margin"


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top)

    marginTop (px 10)
-}
marginTop : LengthOrAuto compatible -> Property namespace animation class id
marginTop =
    prop1 "margin-top"


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom)

    marginBottom (px 10)
-}
marginBottom : LengthOrAuto compatible -> Property namespace animation class id
marginBottom =
    prop1 "margin-bottom"


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right)

    marginRight (px 10)
-}
marginRight : LengthOrAuto compatible -> Property namespace animation class id
marginRight =
    prop1 "margin-right"


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left)

    marginLeft (px 10)
-}
marginLeft : LengthOrAuto compatible -> Property namespace animation class id
marginLeft =
    prop1 "margin-left"


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start)

    marginBlockStart (px 10)
-}
marginBlockStart : LengthOrAuto compatible -> Property namespace animation class id
marginBlockStart =
    prop1 "margin-block-start"


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end)

    marginBlockEnd (px 10)
-}
marginBlockEnd : LengthOrAuto compatible -> Property namespace animation class id
marginBlockEnd =
    prop1 "margin-block-end"


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start)

    marginInlineStart (px 10)
-}
marginInlineStart : LengthOrAuto compatible -> Property namespace animation class id
marginInlineStart =
    prop1 "margin-inline-start"


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end)

    marginInlineEnd (px 10)
-}
marginInlineEnd : LengthOrAuto compatible -> Property namespace animation class id
marginInlineEnd =
    prop1 "margin-inline-end"


{-| The [`top`](https://developer.mozilla.org/en-US/docs/Web/CSS/top) property.

    ~ position absolute
    ~ top (px 5)

This can also be used as a `top` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign top
-}
top : LengthOrAuto compatible -> Property namespace animation class id
top =
    prop1 "top"


{-| The [`bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/bottom) property.

    ~ position absolute
    ~ bottom (px 5)

This can also be used as a `bottom` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign bottom
-}
bottom : LengthOrAuto compatible -> Property namespace animation class id
bottom =
    prop1 "bottom"


{-| The [`left`](https://developer.mozilla.org/en-US/docs/Web/CSS/left) property.

    ~ position absolute
    ~ left (px 5)

This can also be used as a `left` [text alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign left
-}
left : LengthOrAuto compatible -> Property namespace animation class id
left =
    prop1 "left"


{-| Sets [`right`](https://developer.mozilla.org/en-US/docs/Web/CSS/right).

    ~ position absolute
    ~ right (px 5)

This can also be used as a `right` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign right
-}
right : LengthOrAuto compatible -> Property namespace animation class id
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



{- BORDER PROPERTIES -}


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border : Length compatible -> Property namespace animation class id
border =
    prop1 "border"


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
border2 =
    prop2 "border"


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
border3 =
    prop3 "border"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop : Length compatible -> Property namespace animation class id
borderTop =
    prop1 "border-top"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderTop2 =
    prop2 "border-top"


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderTop3 =
    prop3 "border-top"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom : Length compatible -> Property namespace animation class id
borderBottom =
    prop1 "border-bottom"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderBottom2 =
    prop2 "border-bottom"


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderBottom3 =
    prop3 "border-bottom"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft : Length compatible -> Property namespace animation class id
borderLeft =
    prop1 "border-left"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderLeft2 =
    prop2 "border-left"


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderLeft3 =
    prop3 "border-left"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight : Length compatible -> Property namespace animation class id
borderRight =
    prop1 "border-right"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderRight2 =
    prop2 "border-right"


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderRight3 =
    prop3 "border-right"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart : Length compatible -> Property namespace animation class id
borderBlockStart =
    prop1 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderBlockStart2 =
    prop2 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderBlockStart3 =
    prop3 "border-block-start"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd : Length compatible -> Property namespace animation class id
borderBlockEnd =
    prop1 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderBlockEnd2 =
    prop2 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderBlockEnd3 =
    prop3 "border-block-end"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart : Length compatible -> Property namespace animation class id
borderInlineStart =
    prop1 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderInlineStart2 =
    prop2 "border-block-start"


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderInlineStart3 =
    prop3 "border-block-start"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd : Length compatible -> Property namespace animation class id
borderInlineEnd =
    prop1 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd2 : Length compatibleA -> BorderStyle compatibleB -> Property namespace animation class id
borderInlineEnd2 =
    prop2 "border-block-end"


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd3 : Length compatibleA -> BorderStyle compatibleB -> Color compatibleC -> Property namespace animation class id
borderInlineEnd3 =
    prop3 "border-block-end"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset : LengthOrNumber compatible -> Property namespace animation class id
borderImageOutset =
    prop1 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset2 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> Property namespace animation class id
borderImageOutset2 =
    prop2 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset3 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> Property namespace animation class id
borderImageOutset3 =
    prop3 "border-image-outset"


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset4 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> LengthOrNumber compatibleD -> Property namespace animation class id
borderImageOutset4 =
    prop4 "border-image-outset"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth : LengthOrNumber compatible -> Property namespace animation class id
borderImageWidth =
    prop1 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth2 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> Property namespace animation class id
borderImageWidth2 =
    prop2 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth3 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> Property namespace animation class id
borderImageWidth3 =
    prop3 "border-image-width"


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth4 : LengthOrNumber compatibleA -> LengthOrNumber compatibleB -> LengthOrNumber compatibleC -> LengthOrNumber compatibleD -> Property namespace animation class id
borderImageWidth4 =
    prop4 "border-image-width"


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color)

    borderBlockStartColor (rgb 101 202 0)
-}
borderBlockStartColor : Color compatible -> Property namespace animation class id
borderBlockStartColor =
    prop1 "border-block-start-color"


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color)

    borderBottomColor (rgb 101 202 0)
-}
borderBottomColor : Color compatible -> Property namespace animation class id
borderBottomColor =
    prop1 "border-bottom-color"


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color)

    borderInlineStartColor (rgb 101 202 0)
-}
borderInlineStartColor : Color compatible -> Property namespace animation class id
borderInlineStartColor =
    prop1 "border-inline-start-color"


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color)

    borderInlineEndColor (rgb 101 202 0)
-}
borderInlineEndColor : Color compatible -> Property namespace animation class id
borderInlineEndColor =
    prop1 "border-inline-end-color"


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color)

    borderLeftColor (rgb 101 202 0)
-}
borderLeftColor : Color compatible -> Property namespace animation class id
borderLeftColor =
    prop1 "border-left-color"


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color)

    borderRightColor (rgb 101 202 0)
-}
borderRightColor : Color compatible -> Property namespace animation class id
borderRightColor =
    prop1 "border-right-color"


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color)

    borderTopColor (rgb 101 202 0)
-}
borderTopColor : Color compatible -> Property namespace animation class id
borderTopColor =
    prop1 "border-top-color"


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color)

    borderBlockEndColor (rgb 101 202 0)
-}
borderBlockEndColor : Color compatible -> Property namespace animation class id
borderBlockEndColor =
    prop1 "border-block-end-color"


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style)

    borderBlockEndStyle dashed
-}
borderBlockEndStyle : BorderStyle compatible -> Property namespace animation class id
borderBlockEndStyle =
    prop1 "border-block-end-style"


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style)

    borderBlockStartStyle dashed
-}
borderBlockStartStyle : BorderStyle compatible -> Property namespace animation class id
borderBlockStartStyle =
    prop1 "border-block-start-style"


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style)

    borderInlineEndStyle dashed
-}
borderInlineEndStyle : BorderStyle compatible -> Property namespace animation class id
borderInlineEndStyle =
    prop1 "border-inline-end-style"


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style)

    borderBottomStyle dashed
-}
borderBottomStyle : BorderStyle compatible -> Property namespace animation class id
borderBottomStyle =
    prop1 "border-bottom-style"


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style)

    borderInlineStartStyle dashed
-}
borderInlineStartStyle : BorderStyle compatible -> Property namespace animation class id
borderInlineStartStyle =
    prop1 "border-inline-start-style"


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style)

    borderLeftStyle dashed
-}
borderLeftStyle : BorderStyle compatible -> Property namespace animation class id
borderLeftStyle =
    prop1 "border-left-style"


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style)

    borderRightStyle dashed
-}
borderRightStyle : BorderStyle compatible -> Property namespace animation class id
borderRightStyle =
    prop1 "border-right-style"


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style)

    borderTopStyle dashed
-}
borderTopStyle : BorderStyle compatible -> Property namespace animation class id
borderTopStyle =
    prop1 "border-top-style"


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style)

    borderStyle dashed
-}
borderStyle : BorderStyle compatible -> Property namespace animation class id
borderStyle =
    prop1 "border-style"


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width)

    borderBottomWidth (em 4)
-}
borderBottomWidth : Length compatible -> Property namespace animation class id
borderBottomWidth =
    prop1 "border-bottom-width"


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width)

    borderInlineEndWidth (em 4)
-}
borderInlineEndWidth : Length compatible -> Property namespace animation class id
borderInlineEndWidth =
    prop1 "border-inline-end-width"


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width)

    borderLeftWidth (em 4)
-}
borderLeftWidth : Length compatible -> Property namespace animation class id
borderLeftWidth =
    prop1 "border-left-width"


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width)

    borderRightWidth (em 4)
-}
borderRightWidth : Length compatible -> Property namespace animation class id
borderRightWidth =
    prop1 "border-right-width"


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth : Length compatible -> Property namespace animation class id
borderTopWidth =
    prop1 "border-top-width"


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderTopWidth2 =
    prop2 "border-top-width"


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius : Length compatible -> Property namespace animation class id
borderBottomLeftRadius =
    prop1 "border-bottom-left-radius"


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderBottomLeftRadius2 =
    prop2 "border-bottom-left-radius"


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius : Length compatible -> Property namespace animation class id
borderBottomRightRadius =
    prop1 "border-bottom-right-radius"


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderBottomRightRadius2 =
    prop2 "border-bottom-right-radius"


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius : Length compatible -> Property namespace animation class id
borderTopLeftRadius =
    prop1 "border-top-left-radius"


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderTopLeftRadius2 =
    prop2 "border-top-left-radius"


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius : Length compatible -> Property namespace animation class id
borderTopRightRadius =
    prop1 "border-top-right-radius"


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderTopRightRadius2 =
    prop2 "border-top-right-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius : Length compatible -> Property namespace animation class id
borderRadius =
    prop1 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderRadius2 =
    prop2 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius3 : Length compatibleA -> Length compatibleB -> Length compatibleC -> Property namespace animation class id
borderRadius3 =
    prop3 "border-radius"


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius4 : Length compatibleB -> Length compatibleB -> Length compatibleC -> Length compatibleD -> Property namespace animation class id
borderRadius4 =
    prop4 "border-radius"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing : Length compatible -> Property namespace animation class id
borderSpacing =
    prop1 "border-spacing"


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing2 : Length compatibleA -> Length compatibleB -> Property namespace animation class id
borderSpacing2 =
    prop2 "border-spacing"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor : Color compatible -> Property namespace animation class id
borderColor =
    prop1 "border-color"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor2 : Color compatibleA -> Color compatibleB -> Property namespace animation class id
borderColor2 =
    prop2 "border-color"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor3 : Color compatibleA -> Color compatibleB -> Color compatibleC -> Property namespace animation class id
borderColor3 =
    prop3 "border-color"


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor4 : Color compatibleA -> Color compatibleB -> Color compatibleC -> Color compatibleD -> Property namespace animation class id
borderColor4 =
    prop4 "border-color"


{-| -}
overflow : Overflow compatible -> Property namespace animation class id
overflow =
    prop1 "overflow"


{-| -}
overflowX : Overflow compatible -> Property namespace animation class id
overflowX =
    prop1 "overflow-x"


{-| -}
overflowY : Overflow compatible -> Property namespace animation class id
overflowY =
    prop1 "overflow-y"


{-| -}
whiteSpace : WhiteSpace compatible -> Property namespace animation class id
whiteSpace =
    prop1 "white-space"


{-| -}
backgroundColor : Color compatible -> Property namespace animation class id
backgroundColor =
    prop1 "background-color"


{-| -}
color : Color compatible -> Property namespace animation class id
color =
    prop1 "color"


{-| -}
media : a -> String
media value =
    "media " ++ (toString value)


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration : TextDecorationLine a -> Property namespace animation class id
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
textDecoration2 : TextDecorationLine compatibleA -> TextDecorationStyle compatibleB -> Property namespace animation class id
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
textDecoration3 : TextDecorationLine compatibleA -> TextDecorationStyle compatibleB -> Color compatibleC -> Property namespace animation class id
textDecoration3 =
    prop3 "text-decoration"


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations : List (TextDecorationLine compatible) -> Property namespace animation class id
textDecorations =
    prop1 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations2 : List (TextDecorationLine compatibleA) -> TextDecorationStyle compatibleB -> Property namespace animation class id
textDecorations2 =
    prop2 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations3 : List (TextDecorationLine compatibleA) -> TextDecorationStyle compatibleB -> Color compatibleC -> Property namespace animation class id
textDecorations3 =
    prop3 "text-decoration" << valuesOrNone


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLine underline

You can specify multiple line decorations with `textDecorationLines`.

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLine : TextDecorationLine compatible -> Property namespace animation class id
textDecorationLine =
    prop1 "text-decoration-line"


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLines : List (TextDecorationLine compatible) -> Property namespace animation class id
textDecorationLines =
    prop1 "text-decoration-line" << valuesOrNone


{-| Sets [`text-decoration-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style)

    ~ textDecorationStyle dotted
-}
textDecorationStyle : TextDecorationStyle compatible -> Property namespace animation class id
textDecorationStyle =
    prop1 "text-decoration-style"


{-| Sets [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)

    ~ animationName  Foo

You can also use [`animationNames`](#animationNames) to set multiple animation
names, or to set `animation-name: none;`

    ~ animationNames [ Foo, Bar ]
    ~ animationNames [] -- outputs "animation-name: none;"
-}
animationName : animation -> Property namespace animation class id
animationName identifier =
    animationNames [ identifier ]


{-| Sets [`animation-name`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name)

    ~ animationNames [ Foo, Bar ]

Pass `[]` to set `animation-name: none;`

    ~ animationNames [] -- outputs "animation-name: none;"
-}
animationNames : List animation -> Property namespace animation class id
animationNames identifiers =
    let
        propertyFromDeclarations style name declarations =
            let
                value =
                    identifiers
                        |> List.map (identifierToString name)
                        |> String.join ", "
            in
                { key = "animation-name", value = value, important = False }
    in
        propertyMixin propertyFromDeclarations


propertyMixin : (Style namespace animation class id -> namespace -> List Declaration -> Declaration.Property) -> Style namespace animation class id
propertyMixin propertyFromDeclarations =
    let
        newStyleFromDeclarations style name declarations =
            let
                property =
                    propertyFromDeclarations style name declarations
            in
                case addProperty property declarations of
                    Ok newDeclarations ->
                        NamespacedStyle name newDeclarations

                    Err message ->
                        InvalidStyle message
    in
        Mixin (resolveMixin newStyleFromDeclarations)


{-| An empty namespaced stylesheet. Use this as the foundation on which to build
your stylesheet.

    stylesheet { name = "homepage" }
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
stylesheet : { a | name : namespace } -> Style namespace animation class id
stylesheet { name } =
    NamespacedStyle name []


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
mixin : Style namespace animation class id
mixin =
    Mixin identity


{-| A [type selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors).

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
($) : Style namespace animation class id -> Tag -> Style namespace animation class id
($) style tag =
    let
        selector =
            TypeSelector (tagToString tag)
    in
        case style of
            NamespacedStyle name declarations ->
                -- TODO detect if the user tried to use two $ operators without
                -- intervening properties (e.g. `$ button $ img`) and return
                -- InvalidStyle if so; this will for sure emit invalid CSS!
                declarations
                    |> introduceSelector selector
                    |> NamespacedStyle name

            Mixin update ->
                Mixin (\subject -> (update subject) $ tag)

            InvalidStyle _ ->
                style


{-| An [id selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors).

    stylesheet "homepage"
        # NavBar
            ~ width 960 px
            ~ backgroundColor (rgb 123 42 208)

    stylesheet "login"
        button # Cancel
            ~ backgroundColor (rgb 128 64 32)
-}
(#) : Style namespace animation class id -> id -> Style namespace animation class id
(#) style id =
    case style of
        NamespacedStyle name declarations ->
            declarations
                |> introduceSelector (IdSelector (identifierToString name id))
                |> NamespacedStyle name

        Mixin update ->
            Mixin (\subject -> (update subject) # id)

        InvalidStyle _ ->
            style


{-| A [class selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors).

    stylesheet "homepage"
        . Hero
            ~ fontWeight bold
            ~ color (rgb 7 7 7)

    stylesheet "login"
        button . LoginFormButton
            ~ fontWeight normal
            ~ color (rgb 128 64 32)
-}
(.) : Style namespace animation class id -> class -> Style namespace animation class id
(.) style class =
    case style of
        NamespacedStyle name declarations ->
            declarations
                |> introduceSelector (ClassSelector (identifierToString name class))
                |> NamespacedStyle name

        Mixin update ->
            Mixin (\subject -> (update subject) . class)

        InvalidStyle _ ->
            style


{-| An [at-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule).

    stylesheet "homepage"
        @ charset "utf-8"

        $ html
            ~ width (pct 100)

        @ media screen
            $ body
                ~ width (px 960)

        @ media print
            $ body
                ~ width (pct 100)
-}
(@) : Style namespace animation class id -> String -> Style namespace animation class id
(@) style rule =
    case style of
        NamespacedStyle name declarations ->
            declarations
                ++ [ ConditionalGroupRule rule [] ]
                |> NamespacedStyle name

        Mixin _ ->
            InvalidStyle "@-rules are not allowed in mixins."

        InvalidStyle _ ->
            style


{-| A custom selector. Use this for things like
[attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
and [universal selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    stylesheet "homepage"
        $= "* [lang^=en]"
            ~ textDecoration underline
            ~ color (rgb 7 7 7)
-}
($=) : Style namespace animation class id -> String -> Style namespace animation class id
($=) style selectorStr =
    case style of
        NamespacedStyle name declarations ->
            declarations
                |> introduceSelector (CustomSelector selectorStr)
                |> NamespacedStyle name

        Mixin update ->
            Mixin (\subject -> (update subject) $= selectorStr)

        InvalidStyle _ ->
            style


{-| A [property](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference).

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)

To define a custom property, use [`custom`](#custom):

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ (custom "-webkit-font-smoothing" "none")

You can also use `~` to inject the contents of a [`mixin`](#mixin).

    underlineOnHover =
        mixin "underlineOnHover"
            ~ textDecoration none

            &: hover
                ~ textDecoration underline

    a . FancyLink
        ~ color (rgb 128 64 32)
        ~ underlineOnHover

...will have the same output as:

    a . FancyLink
        ~ color (rgb 128 64 32)
        ~ textDecoration none

        &: hover
            ~ textDecoration underline
-}
(~) : Style namespace animation class id -> Style namespace animation class id -> Style namespace animation class id
(~) style mixinToApply =
    case mixinToApply of
        Mixin update ->
            update style

        NamespacedStyle name _ ->
            InvalidStyle ("A stylesheet with namespace " ++ (toString name) ++ " is not a valid property or mixin.")

        InvalidStyle _ ->
            style


{-| Concatenate the given selector to the end of the last selector in the given list, e.g. ".foo#bar"
-}
lastSelectorToMulti : Selector -> List CompoundSelector -> List CompoundSelector
lastSelectorToMulti selector otherSelectors =
    case otherSelectors of
        [] ->
            [ SingleSelector selector ]

        compoundSelector :: [] ->
            [ MultiSelector compoundSelector selector ]

        first :: rest ->
            first :: (lastSelectorToMulti selector rest)


{-| Define a custom property.

    $ body
        ~ custom "-webkit-font-smoothing" "none"

...outputs

    body {
        -webkit-font-smoothing: none;
    }
-}
custom : String -> String -> Property namespace animation class id
custom key value =
    propertyMixin (\_ _ _ -> { key = key, value = value, important = False })


resolveMixin : (Style namespace animation class id -> namespace -> List Declaration -> Style namespace animation class id) -> Style namespace animation class id -> Style namespace animation class id
resolveMixin newStyleFromDeclarations style =
    case style of
        NamespacedStyle name declarations ->
            newStyleFromDeclarations style name declarations

        Mixin applyMixin ->
            let
                newUpdate subject =
                    case applyMixin subject of
                        (NamespacedStyle _ _) as newStyle ->
                            resolveMixin newStyleFromDeclarations newStyle

                        Mixin subUpdate ->
                            Mixin (subUpdate >> newUpdate)

                        (InvalidStyle _) as invalidStyle ->
                            invalidStyle
            in
                Mixin newUpdate

        InvalidStyle _ ->
            style


{-|
    stylesheet "homepage"
        $ html >$ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
(>$) : Style namespace animation class id -> Tag -> Style namespace animation class id
(>$) style tag =
    extendTypeSelector
        ">$"
        (\_ parent -> (Child parent (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(>>$) : Style namespace animation class id -> Tag -> Style namespace animation class id
(>>$) style tag =
    extendTypeSelector
        ">>$"
        (\_ -> (Descendant (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(+$) : Style namespace animation class id -> Tag -> Style namespace animation class id
(+$) style tag =
    extendTypeSelector
        "+$"
        (\_ -> (AdjacentSibling (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(~$) : Style namespace animation class id -> Tag -> Style namespace animation class id
(~$) style tag =
    extendTypeSelector
        "~$"
        (\_ -> (GeneralSibling (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(>.) : Style namespace animation class id -> class -> Style namespace animation class id
(>.) style class =
    extendTypeSelector
        ">."
        (\name -> (Child (SingleSelector (ClassSelector (identifierToString name class)))))
        style


{-| -}
(>>.) : Style namespace animation class id -> class -> Style namespace animation class id
(>>.) style class =
    extendTypeSelector
        ">>."
        (\name -> (Descendant (SingleSelector (ClassSelector (identifierToString name class)))))
        style


{-| -}
(+.) : Style namespace animation class id -> class -> Style namespace animation class id
(+.) style class =
    extendTypeSelector
        "+."
        (\name -> (AdjacentSibling (SingleSelector (ClassSelector (identifierToString name class)))))
        style


{-| -}
(~.) : Style namespace animation class id -> class -> Style namespace animation class id
(~.) style class =
    extendTypeSelector
        "~."
        (\name -> (GeneralSibling (SingleSelector (ClassSelector (identifierToString name class)))))
        style


{-| -}
(>#) : Style namespace animation class id -> id -> Style namespace animation class id
(>#) style id =
    extendTypeSelector
        ">#"
        (\name -> (Child (SingleSelector (IdSelector (identifierToString name id)))))
        style


{-| -}
(>>#) : Style namespace animation class id -> id -> Style namespace animation class id
(>>#) style id =
    extendTypeSelector
        ">>#"
        (\name -> (Descendant (SingleSelector (IdSelector (identifierToString name id)))))
        style


{-| -}
(+#) : Style namespace animation class id -> id -> Style namespace animation class id
(+#) style id =
    extendTypeSelector
        "+#"
        (\name -> (AdjacentSibling (SingleSelector (IdSelector (identifierToString name id)))))
        style


{-| -}
(~#) : Style namespace animation class id -> id -> Style namespace animation class id
(~#) style id =
    extendTypeSelector
        "~#"
        (\name -> (GeneralSibling (SingleSelector (IdSelector (identifierToString name id)))))
        style


{-| -}
(&:) : Style namespace animation class id -> PseudoClass -> Style namespace animation class id
(&:) style pseudoClass =
    extendTypeSelector
        "&:"
        (\_ -> (PseudoClass (pseudoClassToString pseudoClass)))
        style


{-| -}
(&::) : Style namespace animation class id -> PseudoElement -> Style namespace animation class id
(&::) style pseudoElement =
    extendTypeSelector
        "&::"
        (\_ -> (PseudoElement (pseudoElementToString pseudoElement)))
        style


extendTypeSelector : String -> (namespace -> CompoundSelector -> CompoundSelector) -> Style namespace animation class id -> Style namespace animation class id
extendTypeSelector operatorName update style =
    case style of
        NamespacedStyle name declarations ->
            case extendLastSelector operatorName (update name) declarations of
                Ok newDeclarations ->
                    NamespacedStyle name newDeclarations

                Err message ->
                    InvalidStyle message

        Mixin mixinUpdate ->
            Mixin (\subject -> extendTypeSelector operatorName update (mixinUpdate subject))

        InvalidStyle _ ->
            style



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
active : PseudoClass
active =
    ExplicitPseudoClass "active"


{-| An [`:any`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aany)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
any : String -> PseudoClass
any str =
    ExplicitPseudoClass ("any(" ++ str ++ ")")


{-| A [`:checked`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Achecked)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
checked : PseudoClass
checked =
    ExplicitPseudoClass "checked"


{-| A [`:dir`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Adir)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
dir : Directionality -> PseudoClass
dir directionality =
    ExplicitPseudoClass ("dir(" ++ (directionalityToString directionality) ++ ")")


{-| A [`:disabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Adisabled)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
disabled : PseudoClass
disabled =
    ExplicitPseudoClass "disabled"


{-| An [`:empty`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aempty)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
empty : PseudoClass
empty =
    ExplicitPseudoClass "empty"


{-| An [`:enabled`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aenabled)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
enabled : PseudoClass
enabled =
    ExplicitPseudoClass "enabled"


{-| A [`:first`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
first : PseudoClass
first =
    ExplicitPseudoClass "first"


{-| A [`:first-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
firstChild : PseudoClass
firstChild =
    ExplicitPseudoClass "first-child"


{-| A [`:first-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afirst-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
firstOfType : PseudoClass
firstOfType =
    ExplicitPseudoClass "first-of-type"


{-| A [`:fullscreen`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afullscreen)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
fullscreen : PseudoClass
fullscreen =
    ExplicitPseudoClass "fullscreen"


{-| A [`:focus`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Afocus)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
focus : PseudoClass
focus =
    ExplicitPseudoClass "focus"


{-| An [`:hover`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ahover)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
hover : PseudoClass
hover =
    ExplicitPseudoClass "hover"


{-| An [`:indeterminate`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aindeterminate)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
indeterminate : PseudoClass
indeterminate =
    ExplicitPseudoClass "indeterminate"


{-| An [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ainvalid)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
invalid : PseudoClass
invalid =
    ExplicitPseudoClass "invalid"


{-| A [`:lang`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alang)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lang : String -> PseudoClass
lang str =
    ExplicitPseudoClass ("lang(" ++ str ++ ")")


{-| A [`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alast-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lastChild : PseudoClass
lastChild =
    ExplicitPseudoClass "last-child"


{-| A [`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alast-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
lastOfType : PseudoClass
lastOfType =
    ExplicitPseudoClass "last-of-type"


{-| A [`:link`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Alink)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
link : PseudoClass
link =
    ExplicitPseudoClass "link"


{-| An [`:nth-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthChild : String -> PseudoClass
nthChild str =
    ExplicitPseudoClass ("nth-child(" ++ str ++ ")")


{-| An [`:nth-last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-last-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthLastChild : String -> PseudoClass
nthLastChild str =
    ExplicitPseudoClass ("nth-last-child(" ++ str ++ ")")


{-| An [`:nth-last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-last-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthLastOfType : String -> PseudoClass
nthLastOfType str =
    ExplicitPseudoClass ("nth-last-of-type(" ++ str ++ ")")


{-| An [`:nth`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Anth-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
nthOfType : String -> PseudoClass
nthOfType str =
    ExplicitPseudoClass ("nth-of-type(" ++ str ++ ")")


{-| An [`:only-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aonly-child)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
onlyChild : PseudoClass
onlyChild =
    ExplicitPseudoClass "only-child"


{-| An [`:only-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aonly-of-type)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
onlyOfType : PseudoClass
onlyOfType =
    ExplicitPseudoClass "only-of-type"


{-| An [`:optional`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aoptional)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
optional : PseudoClass
optional =
    ExplicitPseudoClass "optional"


{-| An [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aout-of-range)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
outOfRange : PseudoClass
outOfRange =
    ExplicitPseudoClass "out-of-range"


{-| A [`:read-write`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aread-write)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
readWrite : PseudoClass
readWrite =
    ExplicitPseudoClass "read-write"


{-| A [`:required`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Arequired)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
required : PseudoClass
required =
    ExplicitPseudoClass "required"


{-| A [`:root`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aroot)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
root : PseudoClass
root =
    ExplicitPseudoClass "root"


{-| A [`:scope`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Ascope)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
scope : PseudoClass
scope =
    ExplicitPseudoClass "scope"


{-| A [`:target`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Atarget)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
target : PseudoClass
target =
    ExplicitPseudoClass "target"


{-| A [`:valid`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Avalid)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
valid : PseudoClass
valid =
    ExplicitPseudoClass "valid"



-- Pseudo-Elements --


{-| An [`::after`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aafter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
after : PseudoElement
after =
    ExplicitPseudoElement "after"


{-| A [`::before`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Abefore)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
before : PseudoElement
before =
    ExplicitPseudoElement "before"


{-| A [`::first-letter`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Afirst-letter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
firstLetter : PseudoElement
firstLetter =
    ExplicitPseudoElement "first-letter"


{-| A [`::first-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Afirst-line)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
firstLine : PseudoElement
firstLine =
    ExplicitPseudoElement "first-line"


{-| A [`::selection`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aselection)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
selection : PseudoElement
selection =
    ExplicitPseudoElement "selection"



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
medium : IntentionallyUnsupportedPleaseSeeDocs
medium =
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


pseudoElementToString : PseudoElement -> String
pseudoElementToString (ExplicitPseudoElement str) =
    str


type PseudoElement
    = ExplicitPseudoElement String


pseudoClassToString : PseudoClass -> String
pseudoClassToString (ExplicitPseudoClass str) =
    str


type PseudoClass
    = ExplicitPseudoClass String


{-|
    stylesheet "homepage"
        $ html |$ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
(|$) : Style namespace animation class id -> Tag -> Style namespace animation class id
(|$) style tag =
    case style of
        NamespacedStyle name declarations ->
            let
                newSelector =
                    tag
                        |> tagToString
                        |> TypeSelector
            in
                case addSelector "|$" (SingleSelector newSelector) declarations of
                    Ok newDeclarations ->
                        NamespacedStyle name newDeclarations

                    Err message ->
                        InvalidStyle message

        Mixin update ->
            Mixin (\subject -> (update subject) |$ tag)

        InvalidStyle _ ->
            style


numberToString : number -> String
numberToString num =
    toString (num + 0)


valuesOrNone : List (Value compatible) -> Value {}
valuesOrNone list =
    if List.isEmpty list then
        { value = "none" }
    else
        { value = String.join " " (List.map .value list) }
