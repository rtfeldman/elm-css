module Css (stylesheet, mixin, (~=), ($), (#), (.), (@), (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.), ($=), (~), (&::), (&:), (!), a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input, currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, width, minWidth, height, minHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, outline, solid, transparent, rgb, rgba, hex, zero, pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, n, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, visible, block, inlineBlock, inline, none, auto, inherit, initial, unset, noWrap, static, fixed, sticky, relative, absolute, position, top, bottom, middle, baseline, sub, super, textTop, textBottom, after, before, firstLetter, firstLine, selection, active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, root, scope, target, valid, hidden, dotted, dashed, double, groove, ridge, inset, outset, blink, thin, medium, thick) where

{-| Functions for building stylesheets.

# Style
@docs stylesheet, mixin

# Statements
@docs ($), (#), (.), (@), ($=)

# Combinators
@docs (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.)

# Elements
@docs a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input

# Attributes
@docs currentColor, underline, overline, lineThrough, textDecoration, textDecoration2, textDecoration3, textDecorationLine, textDecorations, textDecorations2, textDecorations3, textDecorationLine, textDecorationLines, textDecorationStyle, textAlign, textAlignLast, left, right, center, textJustify, justifyAll, start, end, matchParent, true, verticalAlign, display, opacity, width, minWidth, height, minHeight, padding, padding2, padding3, padding4, paddingTop, paddingBottom, paddingRight, paddingLeft, paddingBlockStart, paddingBlockEnd, paddingInlineStart, paddingInlineEnd, margin, margin2, margin3, margin4, marginTop, marginBottom, marginRight, marginLeft, marginBlockStart, marginBlockEnd, marginInlineStart, marginInlineEnd, boxSizing, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, outline

# Values
@docs (~), (!), (~=), solid, transparent, rgb, rgba, hex, borderColor, borderColor2, borderColor3, borderColor4, borderBottomLeftRadius, borderBottomLeftRadius2, borderBottomRightRadius, borderBottomRightRadius2, borderTopLeftRadius, borderTopLeftRadius2, borderTopRightRadius, borderTopRightRadius2, borderRadius, borderRadius2, borderRadius3, borderRadius4, borderBottomWidth, borderInlineEndWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBlockEndStyle, borderBlockStartStyle, borderInlineEndStyle, borderBottomStyle, borderInlineStartStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderStyle, borderBlockStartColor, borderBlockEndColor, borderBottomColor, borderInlineStartColor, borderInlineEndColor, borderLeftColor, borderRightColor, borderTopColor, borderBox, border, border2, border3, borderTop, borderTop2, borderTop3, borderBottom, borderBottom2, borderBottom3, borderLeft, borderLeft2, borderLeft3, borderRight, borderRight2, borderRight3, borderBlockEnd, borderBlockEnd2, borderBlockEnd3, borderBlockStart, borderBlockStart2, borderBlockStart3, borderInlineEnd, borderInlineEnd2, borderInlineEnd3, borderInlineStart, borderInlineStart2, borderInlineStart3, borderImageOutset, borderImageOutset2, borderImageOutset3, borderImageOutset4, borderImageWidth, borderImageWidth2, borderImageWidth3, borderImageWidth4, visible, block, inlineBlock, inline, none, auto, inherit, unset, initial, noWrap, top, static, fixed, sticky, relative, absolute, position, bottom, middle, baseline, sub, super, textTop, textBottom, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

# Length
@docs pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, n, zero

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

import Css.Declaration as Declaration exposing (..)
import Css.Util exposing (toCssIdentifier, classToString)
import Style exposing (Style(..))
import String


{- Tags -}


{-| Selector for a html element.
-}
html : Tag
html =
    Tag "html"


{-| Selector for a body element.
-}
body : Tag
body =
    Tag "body"


{-| Selector for a header element.
-}
header : Tag
header =
    Tag "header"


{-| Selector for an `<a>` element.
-}
a : Tag
a =
    Tag "a"


{-| Selector for a nav element.
-}
nav : Tag
nav =
    Tag "nav"


{-| Selector for a div element.
-}
div : Tag
div =
    Tag "div"


{-| Selector for a span element.
-}
span : Tag
span =
    Tag "span"


{-| Selector for a img element.
-}
img : Tag
img =
    Tag "img"


{-| Selector for a nowrap element.
-}
nowrap : Tag
nowrap =
    Tag "nowrap"


{-| Selector for a button element.
-}
button : Tag
button =
    Tag "button"


{-| Selector for an h1 element.
-}
h1 : Tag
h1 =
    Tag "h1"


{-| Selector for an h2 element.
-}
h2 : Tag
h2 =
    Tag "h2"


{-| Selector for an h3 element.
-}
h3 : Tag
h3 =
    Tag "h3"


{-| Selector for an h4 element.
-}
h4 : Tag
h4 =
    Tag "h4"


{-| Selector for a p element.
-}
p : Tag
p =
    Tag "p"


{-| Selector for an ol element.
-}
ol : Tag
ol =
    Tag "ol"


{-| Selector for an input element.
-}
input : Tag
input =
    Tag "input"


tagToString : Tag -> String
tagToString (Tag str) =
    str



-- TODO these are just for @media - maybe improve type guarantees?


screen : String
screen =
    "screen"


print : String
print =
    "print"



{- Length -}


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


textAlignToString : TextAlign -> String
textAlignToString fn =
    fn zero
        |> fst


verticalAlignToString : VerticalAlign -> String
verticalAlignToString fn =
    fn zero
        |> fst


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


opacityStyleToString : OpacityStyle -> String
opacityStyleToString =
    explicitOpacityStyleToString
        |> transparentToString
        |> propertyValueToString


type Tag
    = Tag String


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


type alias TextDecorationLine =
    PropertyValue (NoneOr ExplicitTextDecorationLine)


type alias BoxSizing =
    PropertyValue ExplicitBoxSizing


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


type alias Length =
    PropertyValue (AutoOr ExplicitLength)



{- Because `left` and `right` are both common properties and common values
in CSS (e.g. `left: 5px` with `position: absolute` and `text-align: left`),
we implement it as a property (for the `left: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String in the first part of the tuple, and use
that. (See `textAlignToString`. Note that `VerticalAlign follows a similar
pattern.)
-}


type alias TextAlign =
    Length -> ( String, String )



{- Because `top` and `bottom` are both common properties and common values
in CSS (e.g. `top: 5px` with `position: absolute` and `vertical-align: top`),
we implement it as a property (for the `top: 5px` case) and allow it to
be used as a value as well. When being used as a value, we call it, expect
that it will return the desired String in the first part of the tuple, and use
that. (See `verticalAlignToString`. Note that `TextAlign` follows a similar
pattern.)
-}


type alias VerticalAlign =
    Length -> ( String, String )


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



-- Properties --


{-| A [transparent](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent_keyword) color.
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
    ExplicitColor ("rgb(" ++ (numberToString r) ++ ", " ++ (numberToString g) ++ ", " ++ (numberToString b) ++ ")")
        |> NotTransparent
        |> NotAuto
        |> ExplicitValue


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : number -> number -> number -> number -> Color
rgba r g b a =
    ExplicitColor ("rgba(" ++ (numberToString r) ++ ", " ++ (numberToString g) ++ ", " ++ (numberToString b) ++ ", " ++ (numberToString a) ++ ")")
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
center : TextAlign
center =
    prop1 "center" lengthToString


{-| `text-justify` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textJustify : TextAlign
textJustify =
    prop1 "text-justify" lengthToString


{-| `justify-all` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
justifyAll : TextAlign
justifyAll =
    prop1 "justify-all" lengthToString


{-| `start` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
start : TextAlign
start =
    prop1 "start" lengthToString


{-| `end` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
end : TextAlign
end =
    prop1 "end" lengthToString


{-| `match-parent` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
matchParent : TextAlign
matchParent =
    prop1 "match-parent" lengthToString


{-| `true` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
true : TextAlign
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
borderBox : BoxSizing
borderBox =
    "border-box" |> ExplicitBoxSizing |> ExplicitValue


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
middle : VerticalAlign
middle =
    prop1 "middle" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign baseline
-}
baseline : VerticalAlign
baseline =
    prop1 "baseline" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign sub
-}
sub : VerticalAlign
sub =
    prop1 "sub" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign super
-}
super : VerticalAlign
super =
    prop1 "super" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textTop
-}
textTop : VerticalAlign
textTop =
    prop1 "text-top" lengthToString


{-| The `middle` [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value.

    ~ verticalAlign textBottom
-}
textBottom : VerticalAlign
textBottom =
    prop1 "text-bottom" lengthToString


position : Position -> ( String, String )
position =
    prop1 "position" positionToString



{- Properties -}


prop1 : String -> (a -> String) -> a -> ( String, String )
prop1 key translate value =
    ( key, (translate value) )


prop2 : String -> (a -> String) -> (b -> String) -> a -> b -> ( String, String )
prop2 key translateA translateB valueA valueB =
    ( key, String.join " " [ translateA valueA, translateB valueB ] )


prop3 : String -> (a -> String) -> (b -> String) -> (c -> String) -> a -> b -> c -> ( String, String )
prop3 key translateA translateB translateC valueA valueB valueC =
    ( key, String.join " " [ translateA valueA, translateB valueB, translateC valueC ] )


prop4 : String -> (a -> String) -> (b -> String) -> (c -> String) -> (d -> String) -> a -> b -> c -> d -> ( String, String )
prop4 key translateA translateB translateC translateD valueA valueB valueC valueD =
    ( key, String.join " " [ translateA valueA, translateB valueB, translateC valueC, translateD valueD ] )


prop5 : String -> (a -> String) -> (b -> String) -> (c -> String) -> (d -> String) -> (e -> String) -> a -> b -> c -> d -> e -> ( String, String )
prop5 key translateA translateB translateC translateD translateE valueA valueB valueC valueD valueE =
    ( key, String.join " " [ translateA valueA, translateB valueB, translateC valueC, translateD valueD, translateE valueE ] )


{-| Sets [`text-decoration-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color)

    textDecorationColor (rgb 12 11 10)
-}
textDecorationColor : Color -> ( String, String )
textDecorationColor =
    prop1 "text-decoration-color" colorToString


{-| Sets [`text-align-last`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align-last).

    ~ textAlignLast start

    **Note:** Due to certain implementation constraints, `auto` cannot be
    supported here. If you need to set this property to `auto`,
    use this workaround:

    ~ ("text-align-last", "auto")
-}
textAlignLast : TextAlign -> ( String, String )
textAlignLast =
    prop1 "text-align-last" textAlignToString


{-| Sets [`text-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align).
-}
textAlign : TextAlign -> ( String, String )
textAlign =
    prop1 "text-align" textAlignToString


{-| Sets [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align).
-}
verticalAlign : VerticalAlign -> ( String, String )
verticalAlign =
    prop1 "vertical-align" verticalAlignToString


{-| -}
display : Display -> ( String, String )
display =
    prop1 "display" displayToString


{-| -}
opacity : OpacityStyle -> ( String, String )
opacity =
    prop1 "opacity" toString


{-| -}
width : Length -> ( String, String )
width =
    prop1 "width" lengthToString


{-| -}
minWidth : Length -> ( String, String )
minWidth =
    prop1 "min-width" lengthToString


{-| -}
height : Length -> ( String, String )
height =
    prop1 "height" lengthToString


{-| -}
minHeight : Length -> ( String, String )
minHeight =
    prop1 "min-height" lengthToString


{-| -}
boxSizing : BoxSizing -> ( String, String )
boxSizing =
    prop1 "box-sizing" boxSizingToString



{- PADDING PROPERTIES -}


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding : Length -> ( String, String )
padding =
    prop1 "padding" lengthToString


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding2 : Length -> Length -> ( String, String )
padding2 =
    prop2 "padding" lengthToString lengthToString


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding3 : Length -> Length -> Length -> ( String, String )
padding3 =
    prop3 "padding" lengthToString lengthToString lengthToString


{-| Sets [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding)

    padding  (px 10)
    padding2 (px 10) (px 10)
    padding3 (px 10) (px 10) (px 10)
    padding4 (px 10) (px 10) (px 10) (px 10)
-}
padding4 : Length -> Length -> Length -> Length -> ( String, String )
padding4 =
    prop4 "padding" lengthToString lengthToString lengthToString lengthToString


{-| Sets [`padding-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start)

    paddingBlockStart (px 10)
-}
paddingBlockStart : Length -> ( String, String )
paddingBlockStart =
    prop1 "padding-block-start" lengthToString


{-| Sets [`padding-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end)

    paddingBlockEnd (px 10)
-}
paddingBlockEnd : Length -> ( String, String )
paddingBlockEnd =
    prop1 "padding-block-end" lengthToString


{-| Sets [`padding-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start)

    paddingInlineStart (px 10)
-}
paddingInlineStart : Length -> ( String, String )
paddingInlineStart =
    prop1 "padding-inline-start" lengthToString


{-| Sets [`padding-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end)

    paddingInlineEnd (px 10)
-}
paddingInlineEnd : Length -> ( String, String )
paddingInlineEnd =
    prop1 "padding-inline-end" lengthToString


{-| Sets [`padding-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top)

    paddingTop (px 10)
-}
paddingTop : Length -> ( String, String )
paddingTop =
    prop1 "padding-top" lengthToString


{-| Sets [`padding-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom)

    paddingBottom (px 10)
-}
paddingBottom : Length -> ( String, String )
paddingBottom =
    prop1 "padding-bottom" lengthToString


{-| Sets [`padding-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right)

    paddingRight (px 10)
-}
paddingRight : Length -> ( String, String )
paddingRight =
    prop1 "padding-right" lengthToString


{-| Sets [`padding-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left)

    paddingLeft (px 10)
-}
paddingLeft : Length -> ( String, String )
paddingLeft =
    prop1 "padding-left" lengthToString



{- MARGIN PROPERTIES -}


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin : Length -> ( String, String )
margin =
    prop1 "margin" lengthToString


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin2 : Length -> Length -> ( String, String )
margin2 =
    prop2 "margin" lengthToString lengthToString


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin3 : Length -> Length -> Length -> ( String, String )
margin3 =
    prop3 "margin" lengthToString lengthToString lengthToString


{-| Sets [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin)

    margin  (px 10)
    margin2 (px 10) (px 10)
    margin3 (px 10) (px 10) (px 10)
    margin4 (px 10) (px 10) (px 10) (px 10)
-}
margin4 : Length -> Length -> Length -> Length -> ( String, String )
margin4 =
    prop4 "margin" lengthToString lengthToString lengthToString lengthToString


{-| Sets [`margin-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top)

    marginTop (px 10)
-}
marginTop : Length -> ( String, String )
marginTop =
    prop1 "margin-top" lengthToString


{-| Sets [`margin-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom)

    marginBottom (px 10)
-}
marginBottom : Length -> ( String, String )
marginBottom =
    prop1 "margin-bottom" lengthToString


{-| Sets [`margin-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right)

    marginRight (px 10)
-}
marginRight : Length -> ( String, String )
marginRight =
    prop1 "margin-right" lengthToString


{-| Sets [`margin-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left)

    marginLeft (px 10)
-}
marginLeft : Length -> ( String, String )
marginLeft =
    prop1 "margin-left" lengthToString


{-| Sets [`margin-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start)

    marginBlockStart (px 10)
-}
marginBlockStart : Length -> ( String, String )
marginBlockStart =
    prop1 "margin-block-start" lengthToString


{-| Sets [`margin-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end)

    marginBlockEnd (px 10)
-}
marginBlockEnd : Length -> ( String, String )
marginBlockEnd =
    prop1 "margin-block-end" lengthToString


{-| Sets [`margin-inline-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start)

    marginInlineStart (px 10)
-}
marginInlineStart : Length -> ( String, String )
marginInlineStart =
    prop1 "margin-inline-start" lengthToString


{-| Sets [`margin-inline-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end)

    marginInlineEnd (px 10)
-}
marginInlineEnd : Length -> ( String, String )
marginInlineEnd =
    prop1 "margin-inline-end" lengthToString


{-| The [`top`](https://developer.mozilla.org/en-US/docs/Web/CSS/top) property.

    ~ position absolute
    ~ top (px 5)

This can also be used as a `top` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign top
-}
top : Length -> ( String, String )
top =
    prop1 "top" lengthToString


{-| The [`bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/bottom) property.

    ~ position absolute
    ~ bottom (px 5)

This can also be used as a `bottom` [vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) value:

    ~ verticalAlign bottom
-}
bottom : Length -> ( String, String )
bottom =
    prop1 "bottom" lengthToString


{-| The [`left`](https://developer.mozilla.org/en-US/docs/Web/CSS/left) property.

    ~ position absolute
    ~ left (px 5)

This can also be used as a `left` [text alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign left
-}
left : Length -> ( String, String )
left =
    prop1 "left" lengthToString


{-| Sets [`right`](https://developer.mozilla.org/en-US/docs/Web/CSS/right).

    ~ position absolute
    ~ right (px 5)

This can also be used as a `right` [alignment](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) value:

    ~ textAlign right
-}
right : Length -> ( String, String )
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
border : Length -> ( String, String )
border =
    prop1 "border" lengthToString


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)

-}
border2 : Length -> BorderStyle -> ( String, String )
border2 =
    prop2 "border" lengthToString borderStyleToString


{-| Sets [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border)

    border  (px 10)
    border2 (px 10) dashed
    border3 (px 10) dashed (rgb 11 14 17)
-}
border3 : Length -> BorderStyle -> Color -> ( String, String )
border3 =
    prop3 "border" lengthToString borderStyleToString colorToString


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop : Length -> ( String, String )
borderTop =
    prop1 "border-top" lengthToString


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop2 : Length -> BorderStyle -> ( String, String )
borderTop2 =
    prop2 "border-top" lengthToString borderStyleToString


{-| Sets [`border-top`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top)

    borderTop  (px 5)
    borderTop2 (px 5) dashed
    borderTop3 (px 5) dashed (rgb 11 14 17)

-}
borderTop3 : Length -> BorderStyle -> Color -> ( String, String )
borderTop3 =
    prop3 "border-top" lengthToString borderStyleToString colorToString


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom : Length -> ( String, String )
borderBottom =
    prop1 "border-bottom" lengthToString


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom2 : Length -> BorderStyle -> ( String, String )
borderBottom2 =
    prop2 "border-bottom" lengthToString borderStyleToString


{-| Sets [`border-bottom`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)

    borderBottom  (px 5)
    borderBottom2 (px 5) dashed
    borderBottom3 (px 5) dashed (rgb 11 14 17)

-}
borderBottom3 : Length -> BorderStyle -> Color -> ( String, String )
borderBottom3 =
    prop3 "border-bottom" lengthToString borderStyleToString colorToString


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft : Length -> ( String, String )
borderLeft =
    prop1 "border-left" lengthToString


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft2 : Length -> BorderStyle -> ( String, String )
borderLeft2 =
    prop2 "border-left" lengthToString borderStyleToString


{-| Sets [`border-left`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left)

    borderLeft  (px 5)
    borderLeft2 (px 5) dashed
    borderLeft3 (px 5) dashed (rgb 11 14 17)

-}
borderLeft3 : Length -> BorderStyle -> Color -> ( String, String )
borderLeft3 =
    prop3 "border-left" lengthToString borderStyleToString colorToString


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight : Length -> ( String, String )
borderRight =
    prop1 "border-right" lengthToString


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight2 : Length -> BorderStyle -> ( String, String )
borderRight2 =
    prop2 "border-right" lengthToString borderStyleToString


{-| Sets [`border-right`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right)

    borderRight  (px 5)
    borderRight2 (px 5) dashed
    borderRight3 (px 5) dashed (rgb 11 14 17)

-}
borderRight3 : Length -> BorderStyle -> Color -> ( String, String )
borderRight3 =
    prop3 "border-right" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart : Length -> ( String, String )
borderBlockStart =
    prop1 "border-block-start" lengthToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart2 : Length -> BorderStyle -> ( String, String )
borderBlockStart2 =
    prop2 "border-block-start" lengthToString borderStyleToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderBlockStart  (px 5)
    borderBlockStart2 (px 5) dashed
    borderBlockStart3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockStart3 : Length -> BorderStyle -> Color -> ( String, String )
borderBlockStart3 =
    prop3 "border-block-start" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd : Length -> ( String, String )
borderBlockEnd =
    prop1 "border-block-end" lengthToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd2 : Length -> BorderStyle -> ( String, String )
borderBlockEnd2 =
    prop2 "border-block-end" lengthToString borderStyleToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderBlockEnd  (px 5)
    borderBlockEnd2 (px 5) dashed
    borderBlockEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderBlockEnd3 : Length -> BorderStyle -> Color -> ( String, String )
borderBlockEnd3 =
    prop3 "border-block-end" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart : Length -> ( String, String )
borderInlineStart =
    prop1 "border-block-start" lengthToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart2 : Length -> BorderStyle -> ( String, String )
borderInlineStart2 =
    prop2 "border-block-start" lengthToString borderStyleToString


{-| Sets [`border-block-start`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)

    borderInlineStart  (px 5)
    borderInlineStart2 (px 5) dashed
    borderInlineStart3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineStart3 : Length -> BorderStyle -> Color -> ( String, String )
borderInlineStart3 =
    prop3 "border-block-start" lengthToString borderStyleToString colorToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd : Length -> ( String, String )
borderInlineEnd =
    prop1 "border-block-end" lengthToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd2 : Length -> BorderStyle -> ( String, String )
borderInlineEnd2 =
    prop2 "border-block-end" lengthToString borderStyleToString


{-| Sets [`border-block-end`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)

    borderInlineEnd  (px 5)
    borderInlineEnd2 (px 5) dashed
    borderInlineEnd3 (px 5) dashed (rgb 11 14 17)

-}
borderInlineEnd3 : Length -> BorderStyle -> Color -> ( String, String )
borderInlineEnd3 =
    prop3 "border-block-end" lengthToString borderStyleToString colorToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset : LengthOrNumber -> ( String, String )
borderImageOutset =
    prop1 "border-image-outset" lengthOrNumberToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset2 : LengthOrNumber -> LengthOrNumber -> ( String, String )
borderImageOutset2 =
    prop2 "border-image-outset" lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset3 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> ( String, String )
borderImageOutset3 =
    prop3 "border-image-outset" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-outset`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-outset)

    borderImageOutset  (n 2)
    borderImageOutset2 (n 2) (px 15)
    borderImageOutset3 (n 2) (px 15) (n 1.5)
    borderImageOutset4 (n 2) (px 15) (n 14) (em 3)

-}
borderImageOutset4 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> ( String, String )
borderImageOutset4 =
    prop4 "border-image-outset" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth : LengthOrNumber -> ( String, String )
borderImageWidth =
    prop1 "border-image-width" lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth2 : LengthOrNumber -> LengthOrNumber -> ( String, String )
borderImageWidth2 =
    prop2 "border-image-width" lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth3 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> ( String, String )
borderImageWidth3 =
    prop3 "border-image-width" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-image-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-width)

    borderImageWidth  (n 3)
    borderImageWidth2 (n 3) (px 15)
    borderImageWidth3 (n 3) (px 15) auto
    borderImageWidth4 (n 3) (px 15) auto (n 2)

-}
borderImageWidth4 : LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> LengthOrNumber -> ( String, String )
borderImageWidth4 =
    prop4 "border-image-width" lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString lengthOrNumberToString


{-| Sets [`border-block-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color)

    borderBlockStartColor (rgb 101 202 0)
-}
borderBlockStartColor : Color -> ( String, String )
borderBlockStartColor =
    prop1 "border-block-start-color" colorToString


{-| Sets [`border-bottom-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-color)

    borderBottomColor (rgb 101 202 0)
-}
borderBottomColor : Color -> ( String, String )
borderBottomColor =
    prop1 "border-bottom-color" colorToString


{-| Sets [`border-inline-start-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-color)

    borderInlineStartColor (rgb 101 202 0)
-}
borderInlineStartColor : Color -> ( String, String )
borderInlineStartColor =
    prop1 "border-inline-start-color" colorToString


{-| Sets [`border-inline-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-color)

    borderInlineEndColor (rgb 101 202 0)
-}
borderInlineEndColor : Color -> ( String, String )
borderInlineEndColor =
    prop1 "border-inline-end-color" colorToString


{-| Sets [`border-left-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color)

    borderLeftColor (rgb 101 202 0)
-}
borderLeftColor : Color -> ( String, String )
borderLeftColor =
    prop1 "border-left-color" colorToString


{-| Sets [`border-right-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-color)

    borderRightColor (rgb 101 202 0)
-}
borderRightColor : Color -> ( String, String )
borderRightColor =
    prop1 "border-right-color" colorToString


{-| Sets [`border-top-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-color)

    borderTopColor (rgb 101 202 0)
-}
borderTopColor : Color -> ( String, String )
borderTopColor =
    prop1 "border-top-color" colorToString


{-| Sets [`border-block-end-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-color)

    borderBlockEndColor (rgb 101 202 0)
-}
borderBlockEndColor : Color -> ( String, String )
borderBlockEndColor =
    prop1 "border-block-end-color" colorToString


{-| Sets [`border-block-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style)

    borderBlockEndStyle dashed
-}
borderBlockEndStyle : BorderStyle -> ( String, String )
borderBlockEndStyle =
    prop1 "border-block-end-style" borderStyleToString


{-| Sets [`border-block-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style)

    borderBlockStartStyle dashed
-}
borderBlockStartStyle : BorderStyle -> ( String, String )
borderBlockStartStyle =
    prop1 "border-block-start-style" borderStyleToString


{-| Sets [`border-inline-end-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style)

    borderInlineEndStyle dashed
-}
borderInlineEndStyle : BorderStyle -> ( String, String )
borderInlineEndStyle =
    prop1 "border-inline-end-style" borderStyleToString


{-| Sets [`border-bottom-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style)

    borderBottomStyle dashed
-}
borderBottomStyle : BorderStyle -> ( String, String )
borderBottomStyle =
    prop1 "border-bottom-style" borderStyleToString


{-| Sets [`border-inline-start-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style)

    borderInlineStartStyle dashed
-}
borderInlineStartStyle : BorderStyle -> ( String, String )
borderInlineStartStyle =
    prop1 "border-inline-start-style" borderStyleToString


{-| Sets [`border-left-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style)

    borderLeftStyle dashed
-}
borderLeftStyle : BorderStyle -> ( String, String )
borderLeftStyle =
    prop1 "border-left-style" borderStyleToString


{-| Sets [`border-right-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style)

    borderRightStyle dashed
-}
borderRightStyle : BorderStyle -> ( String, String )
borderRightStyle =
    prop1 "border-right-style" borderStyleToString


{-| Sets [`border-top-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style)

    borderTopStyle dashed
-}
borderTopStyle : BorderStyle -> ( String, String )
borderTopStyle =
    prop1 "border-top-style" borderStyleToString


{-| Sets [`border-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style)

    borderStyle dashed
-}
borderStyle : BorderStyle -> ( String, String )
borderStyle =
    prop1 "border-style" borderStyleToString


{-| Sets [`border-bottom-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width)

    borderBottomWidth (em 4)
-}
borderBottomWidth : Length -> ( String, String )
borderBottomWidth =
    prop1 "border-bottom-width" lengthToString


{-| Sets [`border-inline-end-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width)

    borderInlineEndWidth (em 4)
-}
borderInlineEndWidth : Length -> ( String, String )
borderInlineEndWidth =
    prop1 "border-inline-end-width" lengthToString


{-| Sets [`border-left-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width)

    borderLeftWidth (em 4)
-}
borderLeftWidth : Length -> ( String, String )
borderLeftWidth =
    prop1 "border-left-width" lengthToString


{-| Sets [`border-right-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width)

    borderRightWidth (em 4)
-}
borderRightWidth : Length -> ( String, String )
borderRightWidth =
    prop1 "border-right-width" lengthToString


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth : Length -> ( String, String )
borderTopWidth =
    prop1 "border-top-width" lengthToString


{-| Sets [`border-top-width`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)

    borderTopWidth  (em 4)
    borderTopWidth2 (em 4) (px 2)
-}
borderTopWidth2 : Length -> Length -> ( String, String )
borderTopWidth2 =
    prop2 "border-top-width" lengthToString lengthToString


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius : Length -> ( String, String )
borderBottomLeftRadius =
    prop1 "border-bottom-left-radius" lengthToString


{-| Sets [`border-bottom-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)

    borderBottomLeftRadius  (em 4)
    borderBottomLeftRadius2 (em 4) (px 2)
-}
borderBottomLeftRadius2 : Length -> Length -> ( String, String )
borderBottomLeftRadius2 =
    prop2 "border-bottom-left-radius" lengthToString lengthToString


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius : Length -> ( String, String )
borderBottomRightRadius =
    prop1 "border-bottom-right-radius" lengthToString


{-| Sets [`border-bottom-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-right-radius)

    borderBottomRightRadius  (em 4)
    borderBottomRightRadius2 (em 4) (px 2)
-}
borderBottomRightRadius2 : Length -> Length -> ( String, String )
borderBottomRightRadius2 =
    prop2 "border-bottom-right-radius" lengthToString lengthToString


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius : Length -> ( String, String )
borderTopLeftRadius =
    prop1 "border-top-left-radius" lengthToString


{-| Sets [`border-top-left-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)

    borderTopLeftRadius  (em 4)
    borderTopLeftRadius2 (em 4) (px 2)
-}
borderTopLeftRadius2 : Length -> Length -> ( String, String )
borderTopLeftRadius2 =
    prop2 "border-top-left-radius" lengthToString lengthToString


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius : Length -> ( String, String )
borderTopRightRadius =
    prop1 "border-top-right-radius" lengthToString


{-| Sets [`border-top-right-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)

    borderTopRightRadius  (em 4)
    borderTopRightRadius2 (em 4) (px 2)
-}
borderTopRightRadius2 : Length -> Length -> ( String, String )
borderTopRightRadius2 =
    prop2 "border-top-right-radius" lengthToString lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius : Length -> ( String, String )
borderRadius =
    prop1 "border-radius" lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius2 : Length -> Length -> ( String, String )
borderRadius2 =
    prop2 "border-radius" lengthToString lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius3 : Length -> Length -> Length -> ( String, String )
borderRadius3 =
    prop3 "border-radius" lengthToString lengthToString lengthToString


{-| Sets [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

    borderRadius  (em 4)
    borderRadius2 (em 4) (px 2)
    borderRadius3 (em 4) (px 2) (pct 5)
    borderRadius4 (em 4) (px 2) (pct 5) (px 3)
-}
borderRadius4 : Length -> Length -> Length -> Length -> ( String, String )
borderRadius4 =
    prop4 "border-radius" lengthToString lengthToString lengthToString lengthToString


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing : Length -> ( String, String )
borderSpacing =
    prop1 "border-spacing" lengthToString


{-| Sets [`border-spacing`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)

    borderSpacing  (em 4)
    borderSpacing2 (em 4) (px 2)
-}
borderSpacing2 : Length -> Length -> ( String, String )
borderSpacing2 =
    prop2 "border-spacing" lengthToString lengthToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor : Color -> ( String, String )
borderColor =
    prop1 "border-color" colorToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor2 : Color -> Color -> ( String, String )
borderColor2 =
    prop2 "border-color" colorToString colorToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor3 : Color -> Color -> Color -> ( String, String )
borderColor3 =
    prop3 "border-color" colorToString colorToString colorToString


{-| Sets [`border-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-color)

    borderColor  (rgb 12 11 10)
    borderColor2 (rgb 12 11 10) (hex "FFBBCC")
    borderColor3 (rgb 12 11 10) (hex "FFBBCC") inherit
    borderColor4 (rgb 12 11 10) (hex "FFBBCC") inherit (rgb 1 2 3)
-}
borderColor4 : Color -> Color -> Color -> Color -> ( String, String )
borderColor4 =
    prop4 "border-color" colorToString colorToString colorToString colorToString


{-| -}
overflowX : Overflow -> ( String, String )
overflowX =
    prop1 "overflow-x" overflowToString


{-| -}
overflowY : Overflow -> ( String, String )
overflowY =
    prop1 "overflow-y" overflowToString


{-| -}
whiteSpace : WhiteSpace -> ( String, String )
whiteSpace =
    prop1 "white-space" whiteSpaceToString


{-| -}
backgroundColor : Color -> ( String, String )
backgroundColor =
    prop1 "background-color" colorToString


{-| -}
color : Color -> ( String, String )
color =
    prop1 "color" colorToString


{-| -}
media : a -> String
media value =
    "media " ++ (toString value)


{-| -}
textShadow : TextShadow -> ( String, String )
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
textDecoration : TextDecorationLine -> ( String, String )
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
textDecoration2 : TextDecorationLine -> TextDecorationStyle -> ( String, String )
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
textDecoration3 : TextDecorationLine -> TextDecorationStyle -> Color -> ( String, String )
textDecoration3 =
    prop3 "text-decoration" textDecorationLineToString textDecorationStyleToString colorToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations : List TextDecorationLine -> ( String, String )
textDecorations =
    prop1 "text-decoration" textDecorationLinesToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations2 : List TextDecorationLine -> TextDecorationStyle -> ( String, String )
textDecorations2 =
    prop2 "text-decoration" textDecorationLinesToString textDecorationStyleToString


{-| Sets [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)

    ~ textDecorations  [ underline, overline ]
    ~ textDecorations2 [ underline, overline ] wavy
    ~ textDecorations3 [ underline, overline ] wavy (rgb 128 64 32)
-}
textDecorations3 : List TextDecorationLine -> TextDecorationStyle -> Color -> ( String, String )
textDecorations3 =
    prop3 "text-decoration" textDecorationLinesToString textDecorationStyleToString colorToString


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLine underline

You can specify multiple line decorations with `textDecorationLines`.

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLine : TextDecorationLine -> ( String, String )
textDecorationLine =
    prop1 "text-decoration-line" textDecorationLineToString


{-| Sets [`text-decoration-line`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)

    ~ textDecorationLines  [ underline, overline ]
-}
textDecorationLines : List TextDecorationLine -> ( String, String )
textDecorationLines =
    prop1 "text-decoration-line" textDecorationLinesToString


{-| Sets [`text-decoration-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style)

    ~ textDecorationStyle dotted
-}
textDecorationStyle : TextDecorationStyle -> ( String, String )
textDecorationStyle =
    prop1 "text-decoration-style" textDecorationStyleToString


{-| -}
outline : Float -> Length -> BorderStyle -> OpacityStyle -> ( String, String )
outline =
    prop4
        "outline"
        toString
        lengthToString
        (\str -> " " ++ borderStyleToString str ++ " ")
        opacityStyleToString


{-| An empty namespaced stylesheet. Use this as the foundation on which to build
your stylesheet.

    stylesheet { name = "homepage" }
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
stylesheet : { a | name : namespace } -> Style class id namespace
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
mixin : Style class id namespace
mixin =
    Mixin identity


{-| A [type selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors).

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
($) : Style class id namespace -> Tag -> Style class id namespace
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
(#) : Style class id namespace -> id -> Style class id namespace
(#) style id =
    let
        selector =
            IdSelector (toCssIdentifier id)
    in
        case style of
            NamespacedStyle name declarations ->
                declarations
                    |> introduceSelector selector
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
(.) : Style class id namespace -> class -> Style class id namespace
(.) style class =
    case style of
        NamespacedStyle name declarations ->
            declarations
                |> introduceSelector (ClassSelector (classToString name class))
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
(@) : Style class id namespace -> String -> Style class id namespace
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
($=) : Style class id namespace -> String -> Style class id namespace
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


{-| Inject the contents of a [`mixin`](#mixin).

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
(~=) : Style class id namespace -> Style class id namespace -> Style class id namespace
(~=) style mixinToApply =
    case mixinToApply of
        Mixin update ->
            update style

        NamespacedStyle name _ ->
            InvalidStyle ("A stylesheet with namespace " ++ (toString name) ++ " is not a valid mixin.")

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


{-| A [property](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference).

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)

You can also give `~` an arbitrary key-value pair:

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ ("-webkit-font-smoothing", "none")
-}
(~) : Style class id namespace -> ( String, String ) -> Style class id namespace
(~) style (( key, value ) as tuple) =
    let
        property =
            { key = key, value = value, important = False }
    in
        case style of
            NamespacedStyle name declarations ->
                case addProperty "~" property declarations of
                    Ok newDeclarations ->
                        NamespacedStyle name newDeclarations

                    Err message ->
                        InvalidStyle message

            Mixin update ->
                Mixin (\subject -> (update subject) ~ tuple)

            InvalidStyle _ ->
                style


{-| An [`!important`](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity#The_!important_exception)
property.

    stylesheet "homepage"
        $ button
            ~ color (rgb 7 7 7)
            ! fontWeight normal

You can also give `!` an arbitrary key-value pair:

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ! ("-webkit-font-smoothing", "none")
-}
(!) : Style class id namespace -> ( String, String ) -> Style class id namespace
(!) style (( key, value ) as tuple) =
    let
        property =
            { key = key, value = value, important = True }
    in
        case style of
            NamespacedStyle name declarations ->
                case addProperty "!" property declarations of
                    Ok newDeclarations ->
                        NamespacedStyle name newDeclarations

                    Err message ->
                        InvalidStyle message

            Mixin update ->
                Mixin (\subject -> (update subject) ! tuple)

            InvalidStyle _ ->
                style


{-|
    stylesheet "homepage"
        $ html >$ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
(>$) : Style class id namespace -> Tag -> Style class id namespace
(>$) style tag =
    extendTypeSelector
        ">$"
        (\_ parent -> (Child parent (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(>>$) : Style class id namespace -> Tag -> Style class id namespace
(>>$) style tag =
    extendTypeSelector
        ">>$"
        (\_ -> (Descendant (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(+$) : Style class id namespace -> Tag -> Style class id namespace
(+$) style tag =
    extendTypeSelector
        "+$"
        (\_ -> (AdjacentSibling (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(~$) : Style class id namespace -> Tag -> Style class id namespace
(~$) style tag =
    extendTypeSelector
        "~$"
        (\_ -> (GeneralSibling (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(>.) : Style class id namespace -> class -> Style class id namespace
(>.) style class =
    extendTypeSelector
        ">."
        (\name -> (Child (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(>>.) : Style class id namespace -> class -> Style class id namespace
(>>.) style class =
    extendTypeSelector
        ">>."
        (\name -> (Descendant (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(+.) : Style class id namespace -> class -> Style class id namespace
(+.) style class =
    extendTypeSelector
        "+."
        (\name -> (AdjacentSibling (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(~.) : Style class id namespace -> class -> Style class id namespace
(~.) style class =
    extendTypeSelector
        "~."
        (\name -> (GeneralSibling (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(>#) : Style class id namespace -> id -> Style class id namespace
(>#) style id =
    extendTypeSelector
        ">#"
        (\_ -> (Child (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(>>#) : Style class id namespace -> id -> Style class id namespace
(>>#) style id =
    extendTypeSelector
        ">>#"
        (\_ -> (Descendant (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(+#) : Style class id namespace -> id -> Style class id namespace
(+#) style id =
    extendTypeSelector
        "+#"
        (\_ -> (AdjacentSibling (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(~#) : Style class id namespace -> id -> Style class id namespace
(~#) style id =
    extendTypeSelector
        "~#"
        (\_ -> (GeneralSibling (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(&:) : Style class id namespace -> PseudoClass -> Style class id namespace
(&:) style pseudoClass =
    extendTypeSelector
        "&:"
        (\_ -> (PseudoClass (pseudoClassToString pseudoClass)))
        style


{-| -}
(&::) : Style class id namespace -> PseudoElement -> Style class id namespace
(&::) style pseudoElement =
    extendTypeSelector
        "&::"
        (\_ -> (PseudoElement (pseudoElementToString pseudoElement)))
        style


extendTypeSelector : String -> (namespace -> CompoundSelector -> CompoundSelector) -> Style class id namespace -> Style class id namespace
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


extendLastMixinSelector : String -> (CompoundSelector -> CompoundSelector) -> List ( List CompoundSelector, List Property ) -> Result String (List ( List CompoundSelector, List Property ))
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
(|$) : Style class id namespace -> Tag -> Style class id namespace
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


addProperty : String -> Property -> List Declaration -> Result String (List Declaration)
addProperty operatorName property declarations =
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
                                extraSelectors
                                (properties ++ [ property ])
                    in
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err (operatorName ++ " cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err (operatorName ++ " cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case addProperty operatorName property rest of
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
