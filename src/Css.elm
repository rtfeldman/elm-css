module Css (stylesheet, mixin, all, custom, important, ($), (#), (.), (@), (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.), ($=), (~), (&::), (&:), currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, width, minWidth, height, minHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, outline, solid, transparent, rgb, rgba, hex, zero, pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, n, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, visible, block, inlineBlock, inline, none, auto, inherit, initial, unset, noWrap, static, fixed, sticky, relative, absolute, position, top, bottom, middle, baseline, sub, super, textTop, textBottom, after, before, firstLetter, firstLine, selection, active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid, hidden, dotted, dashed, double, groove, ridge, inset, outset, blink, thin, medium, thick, transform, transforms, matrix, matrix3d, perspective, rotate, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scaleX, scaleY, scale3d, skew, skew2, skewX, skewY, translate, translate2, translateX, translateY, translateZ, translate3d, deg, rad, grad, turn, transformBox, viewBox, fillBox, transformStyle, preserve3d, flat) where

{-| Functions for building stylesheets.

# Style
@docs stylesheet, mixin

# Statements
@docs ($), (#), (.), (@), ($=)

# Combinators
@docs (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.)

# Attributes
@docs transformStyle, transformBox, transform, transforms, currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, width, minWidth, height, minHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, outline

# Values
@docs all, important, custom, (~), solid, transparent, rgb, rgba, hex, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, visible, block, inlineBlock, inline, none, auto, inherit, unset, initial, noWrap, top, static, fixed, sticky, relative, absolute, position, bottom, middle, baseline, sub, super, textTop, textBottom, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset, matrix, matrix3d, perspective, rotate3d, rotateX, rotateY, rotateZ, scale, scale2, scale3d, scaleX, scaleY, skew, skew2, skewX, skewY, translate, translate2, translate3d, translateX, translateY, translateZ, rotate, fillBox, viewBox, flat, preserve3d

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

import Css.Declaration as Declaration exposing (Declaration(..), Selector(..), CompoundSelector(..))
import Css.Elements exposing (Tag, tagToString)
import Css.Util exposing (toCssIdentifier, identifierToString)
import Style exposing (Style(..))
import String


-- TODO these are just for @media - maybe improve type guarantees?


screen : String
screen =
    "screen"


print : String
print =
    "print"



{- Length -}


cssFunction : String -> (a -> String) -> List a -> String
cssFunction funcName converter args =
    args
        |> List.map converter
        |> String.join ", "
        |> (++) (funcName ++ "(")
        |> (flip (++)) ")"


propertyValueToString : (a -> String) -> PropertyValue a -> String
propertyValueToString translate value =
    case value of
        Inherit ->
            "inherit"

        Initial ->
            "initial"

        Unset ->
            "unset"

        ExplicitValue notInherit ->
            translate notInherit


autoToString : (a -> String) -> AutoOr a -> String
autoToString translate value =
    case value of
        Auto ->
            "auto"

        NotAuto notAuto ->
            translate notAuto


noneToString : (a -> String) -> NoneOr a -> String
noneToString translate value =
    case value of
        None ->
            "none"

        NotNone notNone ->
            translate notNone


lengthToString : Length -> String
lengthToString =
    (\(ExplicitLength str) -> str)
        |> autoToString
        |> propertyValueToString


angleToString : Angle -> String
angleToString =
    (\(ExplicitAngle str) -> str)
        |> propertyValueToString


transformListToString : List Transform -> String
transformListToString list =
    case list of
        [] ->
            "none"

        _ ->
            list
                |> List.map (\(Transform str) -> str)
                |> String.join " "


lengthOrNumberToString : LengthOrNumber -> String
lengthOrNumberToString =
    lengthToString


borderStyleToString : BorderStyle -> String
borderStyleToString =
    (\(ExplicitBorderStyle str) -> str)
        |> noneToString
        |> propertyValueToString


boxSizingToString : BoxSizing -> String
boxSizingToString =
    (\(ExplicitBoxSizing str) -> str)
        |> borderBoxToString
        |> propertyValueToString


overflowToString : Overflow -> String
overflowToString =
    (\(ExplicitOverflow str) -> str)
        |> autoToString
        |> propertyValueToString


displayToString : Display -> String
displayToString =
    (\(ExplicitDisplay str) -> str)
        |> noneToString
        |> propertyValueToString


positionToString : Position -> String
positionToString =
    (\(ExplicitPosition str) -> str)
        |> propertyValueToString


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


whiteSpaceToString : WhiteSpace -> String
whiteSpaceToString =
    (\(ExplicitWhiteSpace str) -> str)
        |> autoToString
        |> propertyValueToString


textDecorationStyleToString : TextDecorationStyle -> String
textDecorationStyleToString =
    borderStyleToString


textDecorationLinesToString : List TextDecorationLine -> String
textDecorationLinesToString list =
    list
        |> List.map textDecorationLineToString
        |> String.join " "


textDecorationLineToString : TextDecorationLine -> String
textDecorationLineToString =
    (\(ExplicitTextDecorationLine str) -> str)
        |> noneToString
        |> propertyValueToString


colorToString : Color -> String
colorToString =
    (\(ExplicitColor str) -> str)
        |> transparentToString
        |> autoToString
        |> propertyValueToString


numberToString : number -> String
numberToString num =
    toString (num + 0)


textShadowToString : TextShadow -> String
textShadowToString =
    explicitTextShadowToString
        |> noneToString
        |> propertyValueToString


explicitTextShadowToString : ExplicitTextShadow -> String
explicitTextShadowToString value =
    case value of
        NoTextShadow ->
            "TODO"


explicitOpacityStyleToString : ExplicitOpacityStyle -> String
explicitOpacityStyleToString (ExplicitOpacityStyle str) =
    str


transparentToString : (a -> String) -> TransparentOr a -> String
transparentToString translate value =
    case value of
        Transparent ->
            "transparent"

        NotTransparent notTransparent ->
            translate notTransparent


transformBoxToString : TransformBox -> String
transformBoxToString =
    (\(ExplicitTransformBox str) -> str)
        |> borderBoxToString
        |> propertyValueToString


transformStyleToString : TransformStyle -> String
transformStyleToString =
    (\(ExplicitTransformStyle str) -> str)
        |> propertyValueToString


borderBoxToString : (a -> String) -> BorderBoxOr a -> String
borderBoxToString translate value =
    case value of
        BorderBox ->
            "border-box"

        NotBorderBox notBorderBox ->
            translate notBorderBox


opacityStyleToString : OpacityStyle -> String
opacityStyleToString =
    explicitOpacityStyleToString
        |> transparentToString
        |> propertyValueToString


type PropertyValue a
    = Inherit
    | Unset
    | Initial
    | ExplicitValue a


type TransparentOr a
    = Transparent
    | NotTransparent a


type AutoOr a
    = Auto
    | NotAuto a


type NoneOr a
    = None
    | NotNone a


type BorderBoxOr a
    = BorderBox
    | NotBorderBox a


type alias TextDecorationLine =
    PropertyValue (NoneOr ExplicitTextDecorationLine)


type alias BoxSizing =
    PropertyValue (BorderBoxOr ExplicitBoxSizing)


type alias Overflow =
    PropertyValue (AutoOr ExplicitOverflow)


type alias Display =
    PropertyValue (NoneOr ExplicitDisplay)


type alias WhiteSpace =
    PropertyValue (AutoOr ExplicitWhiteSpace)


type alias Color =
    PropertyValue (AutoOr (TransparentOr ExplicitColor))


type alias TextShadow =
    PropertyValue (NoneOr ExplicitTextShadow)


type alias Outline =
    PropertyValue ExplicitOutline


type alias OpacityStyle =
    PropertyValue (TransparentOr ExplicitOpacityStyle)


type alias LengthOrAuto =
    PropertyValue (AutoOr ExplicitLength)


type alias Length =
    LengthOrAuto


type Transform
    = Transform String


type alias Angle =
    PropertyValue ExplicitAngle



{- Because `left` and `right` are both common properties and common values
in CSS (e.g. `left: 5px` with `position: absolute` and `text-align: left`),
we implement it as a property (for the `left: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String as its key, and use that as our value.
(See `getOverloadedProperty`. Note that `VerticalAlign` follows a similar pattern.)
-}


type alias TextAlign namespace animation class id =
    Length -> Property namespace animation class id



{- Because `top` and `bottom` are both common properties and common values
in CSS (e.g. `top: 5px` with `position: absolute` and `vertical-align: top`),
we implement it as a property (for the `top: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String as its key, and use that as our value.
(See `getOverloadedProperty`. Note that `TextAlign` follows a similar pattern.)
-}


type alias VerticalAlign namespace animation class id =
    Length -> Property namespace animation class id


type alias Property namespace animation class id =
    Style namespace animation class id


{-| Although not many propeties accept either a length or a number,
there's no way to type check them separately. Having a separate type
alias is at least more self-documenting.
-}
type alias LengthOrNumber =
    Length


type alias TextDecorationStyle =
    BorderStyle


type alias Position =
    PropertyValue ExplicitPosition


type alias BorderStyle =
    PropertyValue (NoneOr ExplicitBorderStyle)


type alias TransformBox =
    PropertyValue (BorderBoxOr ExplicitTransformBox)


type alias TransformStyle =
    PropertyValue ExplicitTransformStyle


type ExplicitTransformBox
    = ExplicitTransformBox String


type ExplicitTransformStyle
    = ExplicitTransformStyle String


type ExplicitPosition
    = ExplicitPosition String


type ExplicitTextDecorationLine
    = ExplicitTextDecorationLine String


type ExplicitLength
    = ExplicitLength String


type ExplicitBoxSizing
    = ExplicitBoxSizing String


type ExplicitOverflow
    = ExplicitOverflow String


type ExplicitDisplay
    = ExplicitDisplay String


type ExplicitWhiteSpace
    = ExplicitWhiteSpace String


type ExplicitColor
    = ExplicitColor String


type ExplicitBorderStyle
    = ExplicitBorderStyle String


type ExplicitVerticalAlign
    = ExplicitVerticalAlign String


type ExplicitOutline
    = ExplicitOutline Float ExplicitLength BorderStyle OpacityStyle


type ExplicitOpacityStyle
    = ExplicitOpacityStyle String


type ExplicitTextShadow
    = NoTextShadow


type ExplicitAngle
    = ExplicitAngle String



-- Properties --


{-| An [`all`](https://developer.mozilla.org/en-US/docs/Web/CSS/all) property.
-}
all : PropertyValue String -> Property namespace animation class id
all =
    prop1 "all" (propertyValueToString (\_ -> ""))


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
transparent : OpacityStyle
transparent =
    Transparent |> ExplicitValue


{-| The [`currentColor`](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword)
    value.
-}
currentColor : Color
currentColor =
    ExplicitColor "currentColor"
        |> NotTransparent
        |> NotAuto
        |> ExplicitValue


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
    in functional notation.
-}
rgb : number -> number -> number -> Color
rgb r g b =
    cssFunction "rgb" numberToString [ r, g, b ]
        |> ExplicitColor
        |> NotTransparent
        |> NotAuto
        |> ExplicitValue


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : number -> number -> number -> number -> Color
rgba r g b a =
    cssFunction "rgba" numberToString [ r, g, b, a ]
        |> ExplicitColor
        |> NotTransparent
        |> NotAuto
        |> ExplicitValue


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
    in hexadecimal notation.
-}
hex : String -> Color
hex str =
    ExplicitColor ("#" ++ str)
        |> NotTransparent
        |> NotAuto
        |> ExplicitValue


{-| A `hidden` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
hidden : BorderStyle
hidden =
    "hidden" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `wavy` [text decoration style](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style#Values).
-}
wavy : TextDecorationStyle
wavy =
    "wavy" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `dotted` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dotted : BorderStyle
dotted =
    "dotted" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `dashed` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dashed : BorderStyle
dashed =
    "dashed" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `solid` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
solid : BorderStyle
solid =
    "solid" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `double` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
double : BorderStyle
double =
    "double" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `groove` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
groove : BorderStyle
groove =
    "groove" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| A `ridge` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
ridge : BorderStyle
ridge =
    "ridge" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| An `inset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
inset : BorderStyle
inset =
    "inset" |> ExplicitBorderStyle |> NotNone |> ExplicitValue


{-| An `outset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
outset : BorderStyle
outset =
    "outset" |> ExplicitBorderStyle |> NotNone |> ExplicitValue



{- ALIGNMENTS -}


{-| `center` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
center : TextAlign namespace animation class id
center =
    prop1 "center" lengthToString


{-| `text-justify` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textJustify : TextAlign namespace animation class id
textJustify =
    prop1 "text-justify" lengthToString


{-| `justify-all` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
justifyAll : TextAlign namespace animation class id
justifyAll =
    prop1 "justify-all" lengthToString


{-| `start` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
start : TextAlign namespace animation class id
start =
    prop1 "start" lengthToString


{-| `end` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
end : TextAlign namespace animation class id
end =
    prop1 "end" lengthToString


{-| `match-parent` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
matchParent : TextAlign namespace animation class id
matchParent =
    prop1 "match-parent" lengthToString


{-| `true` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
true : TextAlign namespace animation class id
true =
    prop1 "true" lengthToString



{- LENGTHS -}


lengthConverter : String -> number -> Length
lengthConverter suffix num =
    ExplicitLength ((numberToString num) ++ suffix)
        |> NotAuto
        |> ExplicitValue


{-| Convenience length value that compiles to 0 with no units.

    $ ul
        ~ padding zero

...compiles to:

    ul {
        padding: 0;
    }
-}
zero : Length
zero =
    "0" |> ExplicitLength |> NotAuto |> ExplicitValue


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : number -> Length
pct =
    lengthConverter "%"


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
em : number -> Length
em =
    lengthConverter "em"


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
ex : number -> Length
ex =
    lengthConverter "ex"


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
ch : number -> Length
ch =
    lengthConverter "ch"


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
rem : number -> Length
rem =
    lengthConverter "rem"


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
vh : number -> Length
vh =
    lengthConverter "vh"


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
vw : number -> Length
vw =
    lengthConverter "vw"


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
vmin : number -> Length
vmin =
    lengthConverter "vmin"


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
vmax : number -> Length
vmax =
    lengthConverter "vmax"


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : number -> Length
px =
    lengthConverter "px"


{-| [`mm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm) units.
-}
mm : number -> Length
mm =
    lengthConverter "mm"


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
cm : number -> Length
cm =
    lengthConverter "cm"


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)
-}
inches : number -> Length
inches =
    lengthConverter "in"


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
pt : number -> Length
pt =
    lengthConverter "pt"


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
pc : number -> Length
pc =
    lengthConverter "pc"


{-| A unitless number. Useful with properties like [`borderImageOutset`](#borderImageOutset)
which accept either length units or unitless numbers for some properties.
-}
n : number -> LengthOrNumber
n =
    lengthConverter ""



{- ANGLES -}


angleConverter : String -> number -> Angle
angleConverter suffix num =
    ((numberToString num) ++ suffix)
        |> ExplicitAngle
        |> ExplicitValue


{-| [`deg`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#deg) units.
-}
deg : number -> Angle
deg =
    angleConverter "deg"


{-| [`grad`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#grad) units.
-}
grad : number -> Angle
grad =
    angleConverter "grad"


{-| [`rad`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#rad) units.
-}
rad : number -> Angle
rad =
    angleConverter "rad"


{-| [`turn`](https://developer.mozilla.org/en-US/docs/Web/CSS/angle#tr) units.
-}
turn : number -> Angle
turn =
    angleConverter "turn"



{- TRANSFORMS -}


{-| The [`matrix()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#matrix()) transform-function.

    ~ transform (matrix 0.5 1 1.5 2 2.5 3)
-}
matrix : number -> number -> number -> number -> number -> number -> Transform
matrix a b c d tx ty =
    cssFunction "matrix" numberToString [ a, b, c, d, tx, ty ] |> Transform


{-| The [`matrix3d()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#matrix3d()) transform-function.

    ~ transform (matrix3d 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3 0.5 1 1.5 2 2.5 3)
-}
matrix3d : number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> number -> Transform
matrix3d a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4 =
    cssFunction "matrix3d" numberToString [ a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, d1, d2, d3, d4 ]
        |> Transform


{-| The [`perspective()`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#perspective()) transform-function.

     transform (perspective 0.5)
-}
perspective : number -> Transform
perspective l =
    cssFunction "perspective" numberToString [ l ] |> Transform


{-| The [`rotate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotate()) transform-function.

     transform (rotate (deg 90))
-}
rotate : Angle -> Transform
rotate a =
    cssFunction "rotate" angleToString [ a ] |> Transform


{-| The [`rotateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateX()) transform-function.

     transform (rotateX (deg 90))
-}
rotateX : Angle -> Transform
rotateX a =
    cssFunction "rotateX" angleToString [ a ] |> Transform


{-| The [`rotateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateY()) transform-function.

     transform (rotateY (deg 90))
-}
rotateY : Angle -> Transform
rotateY a =
    cssFunction "rotateY" angleToString [ a ] |> Transform


{-| The [`rotateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotateZ()) transform-function.

     transform (rotateZ (deg 90))
-}
rotateZ : Angle -> Transform
rotateZ a =
    cssFunction "rotateZ" angleToString [ a ] |> Transform


{-| The [`rotate3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#rotate3d()) transform-function.

     transform (rotate3d 1 1 1 (deg 90))
-}
rotate3d : number -> number -> number -> Angle -> Transform
rotate3d x y z a =
    let
        coordsAsStrings =
            List.map numberToString [ x, y, z ]

        angleAsString =
            angleToString a

        allValues =
            coordsAsStrings ++ [ angleAsString ]
    in
        cssFunction "rotate3d" identity allValues |> Transform


{-| The [`scale`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale()) transform-function.

     transform (scale 0.5)
     transform (scale2 0.5 0.7)
-}
scale : number -> Transform
scale x =
    cssFunction "scale" numberToString [ x ] |> Transform


{-| The [`scale`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale()) transform-function.

     transform (scale 0.5)
     transform (scale2 0.5 0.7)
-}
scale2 : number -> number -> Transform
scale2 x y =
    cssFunction "scale" numberToString [ x, y ] |> Transform


{-| The [`scaleX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scaleX()) transform-function.

     transform (scaleX 0.5)
-}
scaleX : number -> Transform
scaleX x =
    cssFunction "scaleX" numberToString [ x ] |> Transform


{-| The [`scaleY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scaleY()) transform-function.

     transform (scaleY 0.5)
-}
scaleY : number -> Transform
scaleY y =
    cssFunction "scaleY" numberToString [ y ] |> Transform


{-| The [`scale3d`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#scale3d()) transform-function.

     transform (scale3d 0.5 0.5 1)
-}
scale3d : number -> number -> number -> Transform
scale3d x y z =
    cssFunction "scale3d" numberToString [ x, y, z ] |> Transform


{-| The [`skew`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skew()) transform-function.

     transform (skew (deg 90))
     transform (skew2 (deg 90) (deg 45))
-}
skew : Angle -> Transform
skew ax =
    cssFunction "skew" angleToString [ ax ] |> Transform


{-| The [`skew`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skew()) transform-function.

     transform (skew (deg 90))
     transform (skew2 (deg 90) (deg 45))
-}
skew2 : Angle -> Angle -> Transform
skew2 ax ay =
    cssFunction "skew" angleToString [ ax, ay ] |> Transform


{-| The [`skewX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skewX()) transform-function.

     transform (skewX (deg 90))
-}
skewX : Angle -> Transform
skewX a =
    cssFunction "skewX" angleToString [ a ] |> Transform


{-| The [`skewY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#skewY()) transform-function.

    transform (skewY (deg 90))
-}
skewY : Angle -> Transform
skewY a =
    cssFunction "skewY" angleToString [ a ] |> Transform


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))
-}
translate : Length -> Transform
translate tx =
    cssFunction "translate" lengthToString [ tx ] |> Transform


{-| The [`translate`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translate()) transform-function.

    transform (translate (px 100))
    transform (translate2 (px 100) (pct -45))
-}
translate2 : Length -> Length -> Transform
translate2 tx ty =
    cssFunction "translate" lengthToString [ tx, ty ] |> Transform


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translateX (px 100))
-}
translateX : Length -> Transform
translateX t =
    cssFunction "translateX" lengthToString [ t ] |> Transform


{-| The [`translateY`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateY()) transform-function.

    transform (translateY (px 100))
-}
translateY : Length -> Transform
translateY t =
    cssFunction "translateY" lengthToString [ t ] |> Transform


{-| The [`translateZ`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateZ()) transform-function.

    transform (translateZ (px 100))
-}
translateZ : Length -> Transform
translateZ t =
    cssFunction "translateZ" lengthToString [ t ] |> Transform


{-| The [`translateX`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function#translateX()) transform-function.

    transform (translate3d (px 100) (px 100) (px 100))
-}
translate3d : Length -> Length -> Length -> Transform
translate3d tx ty tz =
    cssFunction "translate3d" lengthToString [ tx, ty, tz ] |> Transform


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
transforms : List Transform -> Property namespace animation class id
transforms =
    prop1 "transform" transformListToString


{-| Sets [`transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
with a single explicit transform value. If you need to set the transform
property to `none`, use the `transforms` function with an empty list. See
`transforms` for more details.

    transform (scaleX 1.4)
-}
transform : Transform -> Property namespace animation class id
transform only =
    transforms [ only ]


{-|
-}
borderBox : PropertyValue (BorderBoxOr a)
borderBox =
    BorderBox |> ExplicitValue


{-| The `fill-box` value for the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
fillBox : TransformBox
fillBox =
    "fill-box" |> ExplicitTransformBox |> NotBorderBox |> ExplicitValue


{-| The `view-box` value for the [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
viewBox : TransformBox
viewBox =
    "view-box" |> ExplicitTransformBox |> NotBorderBox |> ExplicitValue


{-| The [`transform-box`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-box) property.
-}
transformBox : TransformBox -> Property namespace animation class id
transformBox =
    prop1 "transform-box" transformBoxToString


{-| The `preserve-3d` value for the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
preserve3d : TransformStyle
preserve3d =
    "preserve-3d" |> ExplicitTransformStyle |> ExplicitValue


{-| The `flat` value for the [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
flat : TransformStyle
flat =
    "flat" |> ExplicitTransformStyle |> ExplicitValue


{-| The [`transform-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style) property.
-}
transformStyle : TransformStyle -> Property namespace animation class id
transformStyle =
    prop1 "transform-style" transformStyleToString



{- TEXT DECORATION LINES -}


{-| An [`underline`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
text decoration line.
-}
underline : TextDecorationLine
underline =
    "underline" |> ExplicitTextDecorationLine |> NotNone |> ExplicitValue


{-| An [`overline`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
text decoration line.
-}
overline : TextDecorationLine
overline =
    "overline" |> ExplicitTextDecorationLine |> NotNone |> ExplicitValue


{-| A [`line-through`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line#Value)
text decoration line.
-}
lineThrough : TextDecorationLine
lineThrough =
    "line-through" |> ExplicitTextDecorationLine |> NotNone |> ExplicitValue



{- BORDERS -}


{-| -}
visible : Display
visible =
    "visible" |> ExplicitDisplay |> NotNone |> ExplicitValue


{-| -}
block : Display
block =
    "block" |> ExplicitDisplay |> NotNone |> ExplicitValue


{-| -}
inlineBlock : Display
inlineBlock =
    "inline-block" |> ExplicitDisplay |> NotNone |> ExplicitValue


{-| -}
inline : Display
inline =
    "inline" |> ExplicitDisplay |> NotNone |> ExplicitValue


{-| -}
none : PropertyValue (NoneOr a)
none =
    None |> ExplicitValue


{-| -}
auto : PropertyValue (AutoOr a)
auto =
    Auto |> ExplicitValue


{-| The [`inherit`](https://developer.mozilla.org/en-US/docs/Web/CSS/inherit) value.
Any CSS property can be set to this value.
-}
inherit : PropertyValue a
inherit =
    Inherit


{-| The [`unset`](https://developer.mozilla.org/en-US/docs/Web/CSS/unset) value.
Any CSS property can be set to this value.
-}
unset : PropertyValue a
unset =
    Unset


{-| The [`initial`](https://developer.mozilla.org/en-US/docs/Web/CSS/initial) value.
Any CSS property can be set to this value.
-}
initial : PropertyValue a
initial =
    Initial


{-| -}
noWrap : WhiteSpace
noWrap =
    "no-wrap" |> ExplicitWhiteSpace |> NotAuto |> ExplicitValue



{- VERTICAL-ALIGN -}


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign middle
-}
middle : VerticalAlign namespace animation class id
middle =
    prop1 "middle" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign baseline
-}
baseline : VerticalAlign namespace animation class id
baseline =
    prop1 "baseline" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign sub
-}
sub : VerticalAlign namespace animation class id
sub =
    prop1 "sub" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign super
-}
super : VerticalAlign namespace animation class id
super =
    prop1 "super" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textTop
-}
textTop : VerticalAlign namespace animation class id
textTop =
    prop1 "text-top" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textBottom
-}
textBottom : VerticalAlign namespace animation class id
textBottom =
    prop1 "text-bottom" lengthToString


{-| The [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) property.
-}
position : Position -> Property namespace animation class id
position =
    prop1 "position" positionToString



{- Properties -}


prop1 : String -> (a -> String) -> a -> Property namespace animation class id
prop1 key translate value =
    custom key (translate value)


prop2 : String -> (a -> String) -> (b -> String) -> a -> b -> Property namespace animation class id
prop2 key translateA translateB valueA valueB =
    custom key (String.join " " [ translateA valueA, translateB valueB ])


prop3 : String -> (a -> String) -> (b -> String) -> (c -> String) -> a -> b -> c -> Property namespace animation class id
prop3 key translateA translateB translateC valueA valueB valueC =
    custom key (String.join " " [ translateA valueA, translateB valueB, translateC valueC ])


prop4 : String -> (a -> String) -> (b -> String) -> (c -> String) -> (d -> String) -> a -> b -> c -> d -> Property namespace animation class id
prop4 key translateA translateB translateC translateD valueA valueB valueC valueD =
    custom key (String.join " " [ translateA valueA, translateB valueB, translateC valueC, translateD valueD ])


prop5 : String -> (a -> String) -> (b -> String) -> (c -> String) -> (d -> String) -> (e -> String) -> a -> b -> c -> d -> e -> Property namespace animation class id
prop5 key translateA translateB translateC translateD translateE valueA valueB valueC valueD valueE =
    custom key (String.join " " [ translateA valueA, translateB valueB, translateC valueC, translateD valueD, translateE valueE ])


{-| Sets [`text-decoration-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color)

    textDecorationColor (rgb 12 11 10)
-}
textDecorationColor : Color -> Property namespace animation class id
textDecorationColor =
    prop1 "text-decoration-color" colorToString


{-| Sets [`text-align-last`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align-last).

    ~ textAlignLast start

    **Note:** Due to certain implementation constraints, `auto` cannot be
    supported here. If you need to set this property to `auto`,
    use this workaround:

    ~ ("text-align-last", "auto")
-}
textAlignLast : TextAlign namespace animation class id -> Property namespace animation class id
textAlignLast fn =
    getOverloadedProperty "textAlignLast" "text-align-last" (fn zero)


{-| Sets [`text-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textAlign : TextAlign namespace animation class id -> Property namespace animation class id
textAlign fn =
    getOverloadedProperty "textAlign" "text-align" (fn zero)


{-| Sets [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align).
-}
verticalAlign : VerticalAlign namespace animation class id -> Property namespace animation class id
verticalAlign fn =
    getOverloadedProperty "verticalAlign" "vertical-align" (fn zero)


{-| -}
display : Display -> Property namespace animation class id
display =
    prop1 "display" displayToString


{-| -}
opacity : OpacityStyle -> Property namespace animation class id
opacity =
    prop1 "opacity" toString


{-| Sets [`width`](https://developer.mozilla.org/en-US/docs/Web/CSS/width)

    ~ width (px 960)

-}
width : LengthOrAuto -> Property namespace animation class id
width =
    prop1 "width" lengthToString


{-| Sets [`min-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-width)

    ~ minWidth (px 100)

-}
minWidth : LengthOrAuto -> Property namespace animation class id
minWidth =
    prop1 "min-width" lengthToString


{-| Sets [`height`](https://developer.mozilla.org/en-US/docs/Web/CSS/height)

    ~ height (px 800)

-}
height : LengthOrAuto -> Property namespace animation class id
height =
    prop1 "height" lengthToString


{-| Sets [`min-height`](https://developer.mozilla.org/en-US/docs/Web/CSS/min-height)

    ~ minHeight (px 100)

-}
minHeight : LengthOrAuto -> Property namespace animation class id
minHeight =
    prop1 "min-height" lengthToString


{-| -}
boxSizing : BoxSizing -> Property namespace animation class id
boxSizing =
    prop1 "box-sizing" boxSizingToString



{- PADDING PROPERTIES -}


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding : Length -> Property namespace animation class id
padding =
    prop1 "padding" lengthToString


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding2 : Length -> Length -> Property namespace animation class id
padding2 =
    prop2 "padding" lengthToString lengthToString


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding3 : Length -> Length -> Length -> Property namespace animation class id
padding3 =
    prop3 "padding" lengthToString lengthToString lengthToString


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding4 : Length -> Length -> Length -> Length -> Property namespace animation class id
padding4 =
    prop4 "padding" lengthToString lengthToString lengthToString lengthToString


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start)

    paddingBlockStart (px 10)
-}
paddingBlockStart : LengthOrAuto -> Property namespace animation class id
paddingBlockStart =
    prop1 "padding-block-start" lengthToString


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end)

    paddingBlockEnd (px 10)
-}
paddingBlockEnd : LengthOrAuto -> Property namespace animation class id
paddingBlockEnd =
    prop1 "padding-block-end" lengthToString


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start)

    paddingInlineStart (px 10)
-}
paddingInlineStart : LengthOrAuto -> Property namespace animation class id
paddingInlineStart =
    prop1 "padding-inline-start" lengthToString


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end)

    paddingInlineEnd (px 10)
-}
paddingInlineEnd : LengthOrAuto -> Property namespace animation class id
paddingInlineEnd =
    prop1 "padding-inline-end" lengthToString


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top)

    paddingTop (px 10)
-}
paddingTop : Length -> Property namespace animation class id
paddingTop =
    prop1 "padding-top" lengthToString


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom)

    paddingBottom (px 10)
-}
paddingBottom : Length -> Property namespace animation class id
paddingBottom =
    prop1 "padding-bottom" lengthToString


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right)

    paddingRight (px 10)
-}
paddingRight : Length -> Property namespace animation class id
paddingRight =
    prop1 "padding-right" lengthToString


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left)

    paddingLeft (px 10)
-}
paddingLeft : Length -> Property namespace animation class id
paddingLeft =
    prop1 "padding-left" lengthToString



{- MARGIN PROPERTIES -}


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin : LengthOrAuto -> Property namespace animation class id
margin =
    prop1 "margin" lengthToString


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin2 : LengthOrAuto -> LengthOrAuto -> Property namespace animation class id
margin2 =
    prop2 "margin" lengthToString lengthToString


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin3 : LengthOrAuto -> LengthOrAuto -> LengthOrAuto -> Property namespace animation class id
margin3 =
    prop3 "margin" lengthToString lengthToString lengthToString


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin4 : LengthOrAuto -> LengthOrAuto -> LengthOrAuto -> LengthOrAuto -> Property namespace animation class id
margin4 =
    prop4 "margin" lengthToString lengthToString lengthToString lengthToString


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top)

    marginTop (px 10)
-}
marginTop : LengthOrAuto -> Property namespace animation class id
marginTop =
    prop1 "margin-top" lengthToString


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom)

    marginBottom (px 10)
-}
marginBottom : LengthOrAuto -> Property namespace animation class id
marginBottom =
    prop1 "margin-bottom" lengthToString


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right)

    marginRight (px 10)
-}
marginRight : LengthOrAuto -> Property namespace animation class id
marginRight =
    prop1 "margin-right" lengthToString


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left)

    marginLeft (px 10)
-}
marginLeft : LengthOrAuto -> Property namespace animation class id
marginLeft =
    prop1 "margin-left" lengthToString


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start)

    marginBlockStart (px 10)
-}
marginBlockStart : LengthOrAuto -> Property namespace animation class id
marginBlockStart =
    prop1 "margin-block-start" lengthToString


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end)

    marginBlockEnd (px 10)
-}
marginBlockEnd : LengthOrAuto -> Property namespace animation class id
marginBlockEnd =
    prop1 "margin-block-end" lengthToString


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start)

    marginInlineStart (px 10)
-}
marginInlineStart : LengthOrAuto -> Property namespace animation class id
marginInlineStart =
    prop1 "margin-inline-start" lengthToString


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end)

    marginInlineEnd (px 10)
-}
marginInlineEnd : LengthOrAuto -> Property namespace animation class id
marginInlineEnd =
    prop1 "margin-inline-end" lengthToString


{-| The [`top`](https://developer.mozilla.org/en-US/docs/Web/CSS/top) property.

    ~ position absolute
    ~ top (px 5)

This can also be used as a `top` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign top
-}
top : LengthOrAuto -> Property namespace animation class id
top =
    prop1 "top" lengthToString


{-| The [`bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/bottom) property.

    ~ position absolute
    ~ bottom (px 5)

This can also be used as a `bottom` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign bottom
-}
bottom : LengthOrAuto -> Property namespace animation class id
bottom =
    prop1 "bottom" lengthToString


{-| The [`left`](https://developer.mozilla.org/en-US/docs/Web/CSS/left) property.

    ~ position absolute
    ~ left (px 5)

This can also be used as a `left` [text alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign left
-}
left : LengthOrAuto -> Property namespace animation class id
left =
    prop1 "left" lengthToString


{-| Sets [`right`](https://developer.mozilla.org/en-US/docs/Web/CSS/right).

    ~ position absolute
    ~ right (px 5)

This can also be used as a `right` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign right
-}
right : LengthOrAuto -> Property namespace animation class id
right =
    prop1 "right" lengthToString



{- POSITIONING -}


{-| A `static` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position static
-}
static : Position
static =
    "static" |> ExplicitPosition |> ExplicitValue


{-| A `fixed` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position fixed
-}
fixed : Position
fixed =
    "fixed" |> ExplicitPosition |> ExplicitValue


{-| A `sticky` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position sticky
-}
sticky : Position
sticky =
    "sticky" |> ExplicitPosition |> ExplicitValue


{-| A `relative` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position relative
-}
relative : Position
relative =
    "relative" |> ExplicitPosition |> ExplicitValue


{-| An `absolute` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    ~ position absolute
-}
absolute : Position
absolute =
    "absolute" |> ExplicitPosition |> ExplicitValue



{- BORDER PROPERTIES -}


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border : Length -> Property namespace animation class id
border =
    prop1 "border" lengthToString


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border2 : Length -> BorderStyle -> Property namespace animation class id
border2 =
    prop2 "border" lengthToString borderStyleToString


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border3 : Length -> BorderStyle -> Color -> Property namespace animation class id
border3 =
    prop3 "border" lengthToString borderStyleToString colorToString


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop : Length -> Property namespace animation class id
borderTop =
    prop1 "border-top" lengthToString


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop2 : Length -> BorderStyle -> Property namespace animation class id
borderTop2 =
    prop2 "border-top" lengthToString borderStyleToString


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderTop3 =
    prop3 "border-top" lengthToString borderStyleToString colorToString


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom : Length -> Property namespace animation class id
borderBottom =
    prop1 "border-bottom" lengthToString


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom2 : Length -> BorderStyle -> Property namespace animation class id
borderBottom2 =
    prop2 "border-bottom" lengthToString borderStyleToString


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderBottom3 =
    prop3 "border-bottom" lengthToString borderStyleToString colorToString


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft : Length -> Property namespace animation class id
borderLeft =
    prop1 "border-left" lengthToString


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft2 : Length -> BorderStyle -> Property namespace animation class id
borderLeft2 =
    prop2 "border-left" lengthToString borderStyleToString


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderLeft3 =
    prop3 "border-left" lengthToString borderStyleToString colorToString


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight : Length -> Property namespace animation class id
borderRight =
    prop1 "border-right" lengthToString


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight2 : Length -> BorderStyle -> Property namespace animation class id
borderRight2 =
    prop2 "border-right" lengthToString borderStyleToString


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderRight3 =
    prop3 "border-right" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart : Length -> Property namespace animation class id
borderBlockStart =
    prop1 "border-block-start" lengthToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart2 : Length -> BorderStyle -> Property namespace animation class id
borderBlockStart2 =
    prop2 "border-block-start" lengthToString borderStyleToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderBlockStart3 =
    prop3 "border-block-start" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd : Length -> Property namespace animation class id
borderBlockEnd =
    prop1 "border-block-end" lengthToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd2 : Length -> BorderStyle -> Property namespace animation class id
borderBlockEnd2 =
    prop2 "border-block-end" lengthToString borderStyleToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderBlockEnd3 =
    prop3 "border-block-end" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart : Length -> Property namespace animation class id
borderInlineStart =
    prop1 "border-block-start" lengthToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart2 : Length -> BorderStyle -> Property namespace animation class id
borderInlineStart2 =
    prop2 "border-block-start" lengthToString borderStyleToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderInlineStart3 =
    prop3 "border-block-start" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd : Length -> Property namespace animation class id
borderInlineEnd =
    prop1 "border-block-end" lengthToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd2 : Length -> BorderStyle -> Property namespace animation class id
borderInlineEnd2 =
    prop2 "border-block-end" lengthToString borderStyleToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd3 : Length -> BorderStyle -> Color -> Property namespace animation class id
borderInlineEnd3 =
    prop3 "border-block-end" lengthToString borderStyleToString colorToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset : LengthOrNumber -> Property namespace animation class id
borderImageOutset =
    prop1 "border-image-outset" lengthOrNumberToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset2 : LengthOrNumber -> LengthOrNumber -> Property namespace animation class id
borderImageOutset2 =
    prop2 "border-image-outset" lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset3 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> Property namespace animation class id
borderImageOutset3 =
    prop3 "border-image-outset" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset4 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> Property namespace animation class id
borderImageOutset4 =
    prop4 "border-image-outset" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth : LengthOrNumber -> Property namespace animation class id
borderImageWidth =
    prop1 "border-image-width" lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth2 : LengthOrNumber -> LengthOrNumber -> Property namespace animation class id
borderImageWidth2 =
    prop2 "border-image-width" lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth3 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> Property namespace animation class id
borderImageWidth3 =
    prop3 "border-image-width" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth4 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> Property namespace animation class id
borderImageWidth4 =
    prop4 "border-image-width" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color)

    borderBlockStartColor (rgb 101 202 0)
-}
borderBlockStartColor : Color -> Property namespace animation class id
borderBlockStartColor =
    prop1 "border-block-start-color" colorToString


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color)

    borderBottomColor (rgb 101 202 0)
-}
borderBottomColor : Color -> Property namespace animation class id
borderBottomColor =
    prop1 "border-bottom-color" colorToString


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color)

    borderInlineStartColor (rgb 101 202 0)
-}
borderInlineStartColor : Color -> Property namespace animation class id
borderInlineStartColor =
    prop1 "border-inline-start-color" colorToString


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color)

    borderInlineEndColor (rgb 101 202 0)
-}
borderInlineEndColor : Color -> Property namespace animation class id
borderInlineEndColor =
    prop1 "border-inline-end-color" colorToString


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color)

    borderLeftColor (rgb 101 202 0)
-}
borderLeftColor : Color -> Property namespace animation class id
borderLeftColor =
    prop1 "border-left-color" colorToString


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color)

    borderRightColor (rgb 101 202 0)
-}
borderRightColor : Color -> Property namespace animation class id
borderRightColor =
    prop1 "border-right-color" colorToString


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color)

    borderTopColor (rgb 101 202 0)
-}
borderTopColor : Color -> Property namespace animation class id
borderTopColor =
    prop1 "border-top-color" colorToString


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color)

    borderBlockEndColor (rgb 101 202 0)
-}
borderBlockEndColor : Color -> Property namespace animation class id
borderBlockEndColor =
    prop1 "border-block-end-color" colorToString


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style)

    borderBlockEndStyle dashed
-}
borderBlockEndStyle : BorderStyle -> Property namespace animation class id
borderBlockEndStyle =
    prop1 "border-block-end-style" borderStyleToString


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style)

    borderBlockStartStyle dashed
-}
borderBlockStartStyle : BorderStyle -> Property namespace animation class id
borderBlockStartStyle =
    prop1 "border-block-start-style" borderStyleToString


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style)

    borderInlineEndStyle dashed
-}
borderInlineEndStyle : BorderStyle -> Property namespace animation class id
borderInlineEndStyle =
    prop1 "border-inline-end-style" borderStyleToString


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style)

    borderBottomStyle dashed
-}
borderBottomStyle : BorderStyle -> Property namespace animation class id
borderBottomStyle =
    prop1 "border-bottom-style" borderStyleToString


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style)

    borderInlineStartStyle dashed
-}
borderInlineStartStyle : BorderStyle -> Property namespace animation class id
borderInlineStartStyle =
    prop1 "border-inline-start-style" borderStyleToString


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style)

    borderLeftStyle dashed
-}
borderLeftStyle : BorderStyle -> Property namespace animation class id
borderLeftStyle =
    prop1 "border-left-style" borderStyleToString


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style)

    borderRightStyle dashed
-}
borderRightStyle : BorderStyle -> Property namespace animation class id
borderRightStyle =
    prop1 "border-right-style" borderStyleToString


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style)

    borderTopStyle dashed
-}
borderTopStyle : BorderStyle -> Property namespace animation class id
borderTopStyle =
    prop1 "border-top-style" borderStyleToString


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style)

    borderStyle dashed
-}
borderStyle : BorderStyle -> Property namespace animation class id
borderStyle =
    prop1 "border-style" borderStyleToString


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width)

    borderBottomWidth (em 4)
-}
borderBottomWidth : Length -> Property namespace animation class id
borderBottomWidth =
    prop1 "border-bottom-width" lengthToString


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width)

    borderInlineEndWidth (em 4)
-}
borderInlineEndWidth : Length -> Property namespace animation class id
borderInlineEndWidth =
    prop1 "border-inline-end-width" lengthToString


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width)

    borderLeftWidth (em 4)
-}
borderLeftWidth : Length -> Property namespace animation class id
borderLeftWidth =
    prop1 "border-left-width" lengthToString


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width)

    borderRightWidth (em 4)
-}
borderRightWidth : Length -> Property namespace animation class id
borderRightWidth =
    prop1 "border-right-width" lengthToString


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth : Length -> Property namespace animation class id
borderTopWidth =
    prop1 "border-top-width" lengthToString


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth2 : Length -> Length -> Property namespace animation class id
borderTopWidth2 =
    prop2 "border-top-width" lengthToString lengthToString


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius : Length -> Property namespace animation class id
borderBottomLeftRadius =
    prop1 "border-bottom-left-radius" lengthToString


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius2 : Length -> Length -> Property namespace animation class id
borderBottomLeftRadius2 =
    prop2 "border-bottom-left-radius" lengthToString lengthToString


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius : Length -> Property namespace animation class id
borderBottomRightRadius =
    prop1 "border-bottom-right-radius" lengthToString


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius2 : Length -> Length -> Property namespace animation class id
borderBottomRightRadius2 =
    prop2 "border-bottom-right-radius" lengthToString lengthToString


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius : Length -> Property namespace animation class id
borderTopLeftRadius =
    prop1 "border-top-left-radius" lengthToString


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius2 : Length -> Length -> Property namespace animation class id
borderTopLeftRadius2 =
    prop2 "border-top-left-radius" lengthToString lengthToString


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius : Length -> Property namespace animation class id
borderTopRightRadius =
    prop1 "border-top-right-radius" lengthToString


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius2 : Length -> Length -> Property namespace animation class id
borderTopRightRadius2 =
    prop2 "border-top-right-radius" lengthToString lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius : Length -> Property namespace animation class id
borderRadius =
    prop1 "border-radius" lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius2 : Length -> Length -> Property namespace animation class id
borderRadius2 =
    prop2 "border-radius" lengthToString lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius3 : Length -> Length -> Length -> Property namespace animation class id
borderRadius3 =
    prop3 "border-radius" lengthToString lengthToString lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius4 : Length -> Length -> Length -> Length -> Property namespace animation class id
borderRadius4 =
    prop4 "border-radius" lengthToString lengthToString lengthToString lengthToString


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing : Length -> Property namespace animation class id
borderSpacing =
    prop1 "border-spacing" lengthToString


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing2 : Length -> Length -> Property namespace animation class id
borderSpacing2 =
    prop2 "border-spacing" lengthToString lengthToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor : Color -> Property namespace animation class id
borderColor =
    prop1 "border-color" colorToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor2 : Color -> Color -> Property namespace animation class id
borderColor2 =
    prop2 "border-color" colorToString colorToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor3 : Color -> Color -> Color -> Property namespace animation class id
borderColor3 =
    prop3 "border-color" colorToString colorToString colorToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor4 : Color -> Color -> Color -> Color -> Property namespace animation class id
borderColor4 =
    prop4 "border-color" colorToString colorToString colorToString colorToString


{-| -}
overflowX : Overflow -> Property namespace animation class id
overflowX =
    prop1 "overflow-x" overflowToString


{-| -}
overflowY : Overflow -> Property namespace animation class id
overflowY =
    prop1 "overflow-y" overflowToString


{-| -}
whiteSpace : WhiteSpace -> Property namespace animation class id
whiteSpace =
    prop1 "white-space" whiteSpaceToString


{-| -}
backgroundColor : Color -> Property namespace animation class id
backgroundColor =
    prop1 "background-color" colorToString


{-| -}
color : Color -> Property namespace animation class id
color =
    prop1 "color" colorToString


{-| -}
media : a -> String
media value =
    "media " ++ (toString value)


{-| -}
textShadow : TextShadow -> Property namespace animation class id
textShadow =
    prop1 "text-shadow" textShadowToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration : TextDecorationLine -> Property namespace animation class id
textDecoration =
    prop1 "text-decoration" textDecorationLineToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration2 : TextDecorationLine -> TextDecorationStyle -> Property namespace animation class id
textDecoration2 =
    prop2 "text-decoration" textDecorationLineToString textDecorationStyleToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecoration  underline
    ~ textDecoration2 underline wavy
    ~ textDecoration3 underline wavy (rgb 128 64 32)

You can specify multiple line decorations with `textDecorations`.

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecoration3 : TextDecorationLine -> TextDecorationStyle -> Color -> Property namespace animation class id
textDecoration3 =
    prop3 "text-decoration" textDecorationLineToString textDecorationStyleToString colorToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations : List TextDecorationLine -> Property namespace animation class id
textDecorations =
    prop1 "text-decoration" textDecorationLinesToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations2 : List TextDecorationLine -> TextDecorationStyle -> Property namespace animation class id
textDecorations2 =
    prop2 "text-decoration" textDecorationLinesToString textDecorationStyleToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations3 : List TextDecorationLine -> TextDecorationStyle -> Color -> Property namespace animation class id
textDecorations3 =
    prop3 "text-decoration" textDecorationLinesToString textDecorationStyleToString colorToString


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLine underline

You can specify multiple line decorations with `textDecorationLines`.

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLine : TextDecorationLine -> Property namespace animation class id
textDecorationLine =
    prop1 "text-decoration-line" textDecorationLineToString


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLines : List TextDecorationLine -> Property namespace animation class id
textDecorationLines =
    prop1 "text-decoration-line" textDecorationLinesToString


{-| Sets [`text-decoration-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style)

    ~ textDecorationStyle dotted
-}
textDecorationStyle : TextDecorationStyle -> Property namespace animation class id
textDecorationStyle =
    prop1 "text-decoration-style" textDecorationStyleToString


{-| -}
outline : Float -> Length -> BorderStyle -> OpacityStyle -> Property namespace animation class id
outline =
    prop4
        "outline"
        toString
        lengthToString
        (\str -> " " ++ borderStyleToString str ++ " ")
        opacityStyleToString


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


introduceSelector : Selector -> List Declaration -> List Declaration
introduceSelector selector declarations =
    case declarations of
        [] ->
            [ StyleBlock (SingleSelector selector) [] [] ]

        -- If there are no properties declared, then we have a situation
        --   like `Bar` in the following:
        --       stylesheet "homepage"
        --           . Foo . Bar
        --               ~ fontWeight bold
        -- ...as opposed to:
        --       stylesheet "homepage"
        --           . Foo
        --               ~ fontWeight bold
        -- In this case, we don't make a new declaration, but rather add
        -- the new selector to the existing list of selectors.
        (StyleBlock firstSelector otherSelectors []) :: [] ->
            case lastSelectorToMulti selector (firstSelector :: otherSelectors) of
                [] ->
                    [ StyleBlock (SingleSelector selector) [] [] ]

                first :: rest ->
                    [ StyleBlock first rest [] ]

        -- Here the most recent declaration had properties defined, meaning
        -- this must be a new top-level declaration, like `Bar` in the following:
        --    stylesheet "homepage"
        --        . Foo
        --            ~ fontWeight normal
        --        . Bar
        --            ~ fontWeight bold
        lastDeclaration :: [] ->
            lastDeclaration :: [ StyleBlock (SingleSelector selector) [] [] ]

        {- We haven't reached the last declaration yet, so recurse. -}
        firstDeclaration :: otherDeclarations ->
            firstDeclaration :: (introduceSelector selector otherDeclarations)


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


extendLastMixinSelector : String -> (CompoundSelector -> CompoundSelector) -> List ( List CompoundSelector, List (Property namespace animation class id) ) -> Result String (List ( List CompoundSelector, List (Property namespace animation class id) ))
extendLastMixinSelector operatorName update mixinStyles =
    case mixinStyles of
        [] ->
            Err (operatorName ++ " cannot be used as the first mixin style.")

        ( selectors, properties ) :: [] ->
            Ok [ ( List.map update selectors, properties ) ]

        first :: rest ->
            case extendLastMixinSelector operatorName update rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err



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


selectorToBlock : Selector -> Declaration
selectorToBlock selector =
    StyleBlock (SingleSelector selector) [] []


updateLastProperty : String -> (Declaration.Property -> Declaration.Property) -> List Declaration -> Result String (List Declaration)
updateLastProperty functionName update declarations =
    case declarations of
        [] ->
            Err ("`" ++ functionName ++ "` cannot update an empty list of declarations.")

        declaration :: [] ->
            case declaration of
                StyleBlock firstSelector extraSelectors properties ->
                    let
                        newDeclaration =
                            StyleBlock
                                firstSelector
                                extraSelectors
                                (updateLast update properties)
                    in
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err ("`" ++ functionName ++ "` cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err ("`" ++ functionName ++ "` cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case updateLastProperty functionName update rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


addProperty : Declaration.Property -> List Declaration -> Result String (List Declaration)
addProperty property declarations =
    case declarations of
        [] ->
            Err "`~` cannot be used as the first declaration."

        declaration :: [] ->
            case declaration of
                StyleBlock firstSelector extraSelectors properties ->
                    let
                        newDeclaration =
                            StyleBlock
                                firstSelector
                                extraSelectors
                                (properties ++ [ property ])
                    in
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err ("`~` cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err ("`~` cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case addProperty property rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


extendLastSelector : String -> (CompoundSelector -> CompoundSelector) -> List Declaration -> Result String (List Declaration)
extendLastSelector operatorName update declarations =
    case declarations of
        [] ->
            Err (operatorName ++ " cannot be used as the first declaration.")

        declaration :: [] ->
            case declaration of
                StyleBlock firstSelector extraSelectors properties ->
                    let
                        newDeclaration =
                            StyleBlock
                                (update firstSelector)
                                (List.map update extraSelectors)
                                []

                        newDeclarations =
                            if List.isEmpty properties then
                                -- Don't bother keeping empty declarations.
                                [ newDeclaration ]
                            else
                                [ declaration, newDeclaration ]
                    in
                        Ok newDeclarations

                ConditionalGroupRule _ _ ->
                    Err (operatorName ++ " cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err (operatorName ++ " cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case extendLastSelector operatorName update rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


addSelector : String -> CompoundSelector -> List Declaration -> Result String (List Declaration)
addSelector operatorName newSelector declarations =
    case declarations of
        [] ->
            Err (operatorName ++ " cannot be used as the first declaration.")

        declaration :: [] ->
            case declaration of
                StyleBlock firstSelector extraSelectors properties ->
                    let
                        newDeclaration =
                            StyleBlock
                                firstSelector
                                (extraSelectors ++ [ newSelector ])
                                properties
                    in
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err (operatorName ++ " cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err (operatorName ++ " cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case addSelector operatorName newSelector rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


updateLast : (a -> a) -> List a -> List a
updateLast update list =
    case list of
        [] ->
            list

        singleton :: [] ->
            [ update singleton ]

        first :: rest ->
            first :: updateLast update rest
