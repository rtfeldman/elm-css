module Css (stylesheet, mixin, prettyPrint, (~=), ($), (#), (.), (@), (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.), ($=), (~), (&::), (&:), (!), a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input, verticalAlign, display, opacity, width, minWidth, height, minHeight, padding, paddingTop, paddingBottom, paddingRight, paddingLeft, margin, marginTop, marginBottom, marginRight, marginLeft, boxSizing, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, outline, solid, transparent, rgb, rgba, hex, pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc, borderBox, visible, block, inlineBlock, inline, none, auto, inherit, initial, unset, noWrap, top, middle, bottom, after, before, firstLetter, firstLine, selection, active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, left, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, right, root, scope, target, valid, CompilerOutput, outputToPort) where

{-| Functions for building stylesheets.

# Style
@docs stylesheet, prettyPrint

# Mixins
@docs mixin, (~=)

# Statements
@docs ($), (#), (.), (@), ($=)

# Combinators
@docs (|$), (>$), (>>$), (+$), (~$), (>#), (>>#), (+#), (~#), (>.), (>>.), (+.), (~.)

# Elements
@docs a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input

# Attributes
@docs verticalAlign, display, opacity, width, minWidth, height, minHeight, padding, paddingTop, paddingBottom, paddingRight, paddingLeft, margin, marginTop, marginBottom, marginRight, marginLeft, boxSizing, overflowX, overflowY, whiteSpace, backgroundColor, color, media, textShadow, outline

# Values
@docs (~), (!), solid, transparent, rgb, rgba, hex, borderBox, visible, block, inlineBlock, inline, none, auto, inherit, unset, initial, noWrap, top, middle, bottom

# Units
@docs pct, px, em, pt, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pc

# Pseudo-Classes
@docs (&:), active, any, checked, dir, disabled, empty, enabled, first, firstChild, firstOfType, fullscreen, focus, hover, indeterminate, invalid, lang, lastChild, lastOfType, left, link, nthChild, nthLastChild, nthLastOfType, nthOfType, onlyChild, onlyOfType, optional, outOfRange, readWrite, required, right, root, scope, target, valid

# Pseudo-Elements
@docs (&::), after, before, firstLetter, firstLine, selection

# Compiler Output
@docs (CompilerOutput, outputToPort)
-}

import Css.Declaration as Declaration exposing (..)
import Css.Declaration.Output exposing (prettyPrintDeclarations)
import Css.Util exposing (toCssIdentifier, classToString)
import Style exposing (Style(..))


{-| -}
prettyPrint : Style class id -> Result String String
prettyPrint style =
    case style of
        NamespacedStyle _ declarations ->
            declarations
                |> prettyPrintDeclarations
                |> Ok

        Mixin _ ->
            Err ("Cannot translate mixin to CSS directly. Use `~=` to apply it to a stylesheet instead!")

        InvalidStyle message ->
            Err message



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


tagToString (Tag str) =
    str



-- TODO these are just for @media - maybe improve type guarantees?


screen =
    "screen"


print =
    "print"



{- Units -}


propertyValueToString : (a -> String) -> PropertyValue a -> String
propertyValueToString translate value =
    case value of
        Inherit ->
            "inherit"

        Initial ->
            "initial"

        Unset ->
            "unset"

        NotInherit notInherit ->
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


unitsToString : Units -> String
unitsToString =
    (\(ExplicitUnits str) -> str)
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


verticalAlignToString : VerticalAlign -> String
verticalAlignToString =
    (\(ExplicitVerticalAlign str) -> str)
        |> propertyValueToString


whiteSpaceToString : WhiteSpace -> String
whiteSpaceToString =
    (\(ExplicitWhiteSpace str) -> str)
        |> autoToString
        |> propertyValueToString


colorToString : Color -> String
colorToString =
    (\(ExplicitColor str) -> str)
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


outlineStyleToString : OutlineStyle -> String
outlineStyleToString (OutlineStyle str) =
    str


opacityStyleToString : OpacityStyle -> String
opacityStyleToString (OpacityStyle str) =
    str


type Tag
    = Tag String


type PropertyValue a
    = Inherit
    | Unset
    | Initial
    | NotInherit a


type AutoOr a
    = Auto
    | NotAuto a


type NoneOr a
    = None
    | NotNone a


type alias BoxSizing =
    PropertyValue ExplicitBoxSizing


type alias Overflow =
    PropertyValue (AutoOr ExplicitOverflow)


type alias Display =
    PropertyValue (NoneOr ExplicitDisplay)


type alias WhiteSpace =
    PropertyValue (AutoOr ExplicitWhiteSpace)


type alias Color =
    PropertyValue (AutoOr ExplicitColor)


type alias TextShadow =
    PropertyValue (NoneOr ExplicitTextShadow)


type alias Outline =
    PropertyValue ExplicitOutline


type alias Units =
    PropertyValue ExplicitUnits


type alias VerticalAlign =
    PropertyValue ExplicitVerticalAlign


type ExplicitUnits
    = ExplicitUnits String


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


type ExplicitVerticalAlign
    = ExplicitVerticalAlign String


type ExplicitOutline
    = ExplicitOutline Float ExplicitUnits OutlineStyle OpacityStyle


type OutlineStyle
    = OutlineStyle String


type OpacityStyle
    = OpacityStyle String


type ExplicitTextShadow
    = NoTextShadow



-- Properties --


{-| -}
solid : OutlineStyle
solid =
    OutlineStyle "solid"


{-| A [transparent](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#transparent_keyword) color.
-}
transparent : OpacityStyle
transparent =
    OpacityStyle "transparent"


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()]
    in functional notation.
-}
rgb : number -> number -> number -> Color
rgb r g b =
    ExplicitColor ("rgb(" ++ (numberToString r) ++ ", " ++ (numberToString g) ++ ", " ++ (numberToString b) ++ ")")
        |> NotAuto
        |> NotInherit


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : number -> number -> number -> number -> Color
rgba r g b a =
    ExplicitColor ("rgba(" ++ (numberToString r) ++ ", " ++ (numberToString g) ++ ", " ++ (numberToString b) ++ ", " ++ (numberToString a) ++ ")")
        |> NotAuto
        |> NotInherit


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()]
    in hexadecimal notation.
-}
hex : String -> Color
hex str =
    ExplicitColor ("#" ++ str)
        |> NotAuto
        |> NotInherit


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : Units
pct =
    "%" |> ExplicitUnits |> NotInherit


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
em : Units
em =
    "em" |> ExplicitUnits |> NotInherit


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
ex : Units
ex =
    "ex" |> ExplicitUnits |> NotInherit


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
ch : Units
ch =
    "ch" |> ExplicitUnits |> NotInherit


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
rem : Units
rem =
    "rem" |> ExplicitUnits |> NotInherit


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
vh : Units
vh =
    "vh" |> ExplicitUnits |> NotInherit


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
vw : Units
vw =
    "vw" |> ExplicitUnits |> NotInherit


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
vmin : Units
vmin =
    "vmin" |> ExplicitUnits |> NotInherit


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
vmax : Units
vmax =
    "vmax" |> ExplicitUnits |> NotInherit


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : Units
px =
    "px" |> ExplicitUnits |> NotInherit


{-| [`mm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm) units.
-}
mm : Units
mm =
    "mm" |> ExplicitUnits |> NotInherit


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
cm : Units
cm =
    "cm" |> ExplicitUnits |> NotInherit


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)
-}
inches : Units
inches =
    "in" |> ExplicitUnits |> NotInherit


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
pt : Units
pt =
    "pt" |> ExplicitUnits |> NotInherit


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
pc : Units
pc =
    "pc" |> ExplicitUnits |> NotInherit


{-| -}
borderBox : BoxSizing
borderBox =
    "border-box" |> ExplicitBoxSizing |> NotInherit


{-| -}
visible : Display
visible =
    "visible" |> ExplicitDisplay |> NotNone |> NotInherit


{-| -}
block : Display
block =
    "block" |> ExplicitDisplay |> NotNone |> NotInherit


{-| -}
inlineBlock : Display
inlineBlock =
    "inline-block" |> ExplicitDisplay |> NotNone |> NotInherit


{-| -}
inline : Display
inline =
    "inline" |> ExplicitDisplay |> NotNone |> NotInherit


{-| -}
none : PropertyValue (NoneOr a)
none =
    None |> NotInherit


{-| -}
auto : PropertyValue (AutoOr a)
auto =
    Auto |> NotInherit


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
    "no-wrap" |> ExplicitWhiteSpace |> NotAuto |> NotInherit


{-| -}
top : VerticalAlign
top =
    "top" |> ExplicitVerticalAlign |> NotInherit


{-| -}
middle : VerticalAlign
middle =
    "middle" |> ExplicitVerticalAlign |> NotInherit


{-| -}
bottom : VerticalAlign
bottom =
    "bottom" |> ExplicitVerticalAlign |> NotInherit



{- Properties -}


prop1 key translate value =
    ( key, (translate value) )


prop2 key translateA translateB valueA valueB =
    ( key, (translateA valueA) ++ (translateB valueB) )


prop3 key translateA translateB translateC valueA valueB valueC =
    ( key, (translateA valueA) ++ (translateB valueB) ++ (translateC valueC) )


prop4 key translateA translateB translateC translateD valueA valueB valueC valueD =
    ( key, (translateA valueA) ++ (translateB valueB) ++ (translateC valueC) ++ (translateD valueD) )


prop5 key translateA translateB translateC translateD translateE valueA valueB valueC valueD valueE =
    ( key, (translateA valueA) ++ (translateB valueB) ++ (translateC valueC) ++ (translateD valueD) ++ (translateE valueE) )


{-| -}
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
width : number -> Units -> ( String, String )
width =
    prop2 "width" numberToString unitsToString


{-| -}
minWidth : number -> Units -> ( String, String )
minWidth =
    prop2 "min-width" numberToString unitsToString


{-| -}
height : number -> Units -> ( String, String )
height =
    prop2 "height" numberToString unitsToString


{-| -}
minHeight : number -> Units -> ( String, String )
minHeight =
    prop2 "min-height" numberToString unitsToString


{-| -}
padding : number -> Units -> ( String, String )
padding =
    prop2 "padding" numberToString unitsToString


{-| -}
paddingTop : number -> Units -> ( String, String )
paddingTop =
    prop2 "padding-top" numberToString unitsToString


{-| -}
paddingBottom : number -> Units -> ( String, String )
paddingBottom =
    prop2 "padding-bottom" numberToString unitsToString


{-| -}
paddingRight : number -> Units -> ( String, String )
paddingRight =
    prop2 "padding-right" numberToString unitsToString


{-| -}
paddingLeft : number -> Units -> ( String, String )
paddingLeft =
    prop2 "padding-left" numberToString unitsToString


{-| -}
margin : number -> Units -> ( String, String )
margin =
    prop2 "margin" numberToString unitsToString


{-| -}
marginTop : number -> Units -> ( String, String )
marginTop =
    prop2 "margin-top" numberToString unitsToString


{-| -}
marginBottom : number -> Units -> ( String, String )
marginBottom =
    prop2 "margin-bottom" numberToString unitsToString


{-| -}
marginRight : number -> Units -> ( String, String )
marginRight =
    prop2 "margin-right" numberToString unitsToString


{-| -}
marginLeft : number -> Units -> ( String, String )
marginLeft =
    prop2 "margin-left" numberToString unitsToString


{-| -}
boxSizing : BoxSizing -> ( String, String )
boxSizing =
    prop1 "box-sizing" boxSizingToString


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


{-| -}
outline : Float -> Units -> OutlineStyle -> OpacityStyle -> ( String, String )
outline =
    prop4
        "outline"
        toString
        unitsToString
        (\str -> " " ++ outlineStyleToString str ++ " ")
        opacityStyleToString


{-| An empty namespaced stylesheet. Use this as the foundation on which to build
your stylesheet.

    stylesheet { name = "homepage" }
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
stylesheet : { a | name : String } -> Style class id
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
mixin : Style class id
mixin =
    Mixin identity


{-| A [type selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Type_selectors).

    stylesheet "homepage"
        $ body
            ~ width 960 px
            ~ color (rgb 7 7 7)
-}
($) : Style class id -> Tag -> Style class id
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
(#) : Style class id -> id -> Style class id
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
(.) : Style class id -> class -> Style class id
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

        html
            width 100 pct

        @ media screen
            $ body
                width 960 px

        @ media print
            $ body
                width 100 pct
-}
(@) : Style class id -> String -> Style class id
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
($=) : Style class id -> String -> Style class id
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
(~=) : Style class id -> Style class id -> Style class id
(~=) style mixinToApply =
    case mixinToApply of
        Mixin update ->
            update style

        NamespacedStyle name _ ->
            InvalidStyle ("A stylesheet with namespace \"" ++ name ++ "\" is not a valid mixin.")

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

        {- If there are no properties declared, then we have a situation
            like `Bar` in the following:

                stylesheet "homepage"
                    . Foo . Bar
                        ~ fontWeight bold

                ...as opposed to:

                stylesheet "homepage"
                    . Foo
                        ~ fontWeight bold

            In this case, we don't make a new declaration, but rather add
            the new selector to the existing list of selectors.
        -}
        (StyleBlock firstSelector otherSelectors []) :: [] ->
            case lastSelectorToMulti selector (firstSelector :: otherSelectors) of
                [] ->
                    [ StyleBlock (SingleSelector selector) [] [] ]

                first :: rest ->
                    [ StyleBlock first rest [] ]

        {- Here the most recent declaration had properties defined, meaning
             this must be a new top-level declaration, like `Bar` in the following:

                stylesheet "homepage"
                    . Foo
                        ~ fontWeight normal

                    . Bar
                        ~ fontWeight bold
        -}
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
(~) : Style class id -> ( String, String ) -> Style class id
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
(!) : Style class id -> ( String, String ) -> Style class id
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
(>$) : Style class id -> Tag -> Style class id
(>$) style tag =
    extendTypeSelector
        ">$"
        (\_ parent -> (Child parent (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(>>$) : Style class id -> Tag -> Style class id
(>>$) style tag =
    extendTypeSelector
        ">>$"
        (\_ -> (Descendant (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(+$) : Style class id -> Tag -> Style class id
(+$) style tag =
    extendTypeSelector
        "+$"
        (\_ -> (AdjacentSibling (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(~$) : Style class id -> Tag -> Style class id
(~$) style tag =
    extendTypeSelector
        "~$"
        (\_ -> (GeneralSibling (SingleSelector (TypeSelector (tagToString tag)))))
        style


{-| -}
(>.) : Style class id -> class -> Style class id
(>.) style class =
    extendTypeSelector
        ">."
        (\name -> (Child (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(>>.) : Style class id -> class -> Style class id
(>>.) style class =
    extendTypeSelector
        ">>."
        (\name -> (Descendant (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(+.) : Style class id -> class -> Style class id
(+.) style class =
    extendTypeSelector
        "+."
        (\name -> (AdjacentSibling (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(~.) : Style class id -> class -> Style class id
(~.) style class =
    extendTypeSelector
        "~."
        (\name -> (GeneralSibling (SingleSelector (ClassSelector (classToString name class)))))
        style


{-| -}
(>#) : Style class id -> id -> Style class id
(>#) style id =
    extendTypeSelector
        ">#"
        (\_ -> (Child (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(>>#) : Style class id -> id -> Style class id
(>>#) style id =
    extendTypeSelector
        ">>#"
        (\_ -> (Descendant (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(+#) : Style class id -> id -> Style class id
(+#) style id =
    extendTypeSelector
        "+#"
        (\_ -> (AdjacentSibling (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(~#) : Style class id -> id -> Style class id
(~#) style id =
    extendTypeSelector
        "~#"
        (\_ -> (GeneralSibling (SingleSelector (IdSelector (toCssIdentifier id)))))
        style


{-| -}
(&:) : Style class id -> PseudoClass -> Style class id
(&:) style pseudoClass =
    extendTypeSelector
        "&:"
        (\_ -> (PseudoClass (pseudoClassToString pseudoClass)))
        style


{-| -}
(&::) : Style class id -> PseudoElement -> Style class id
(&::) style pseudoElement =
    extendTypeSelector
        "&::"
        (\_ -> (PseudoElement (pseudoElementToString pseudoElement)))
        style


extendTypeSelector : String -> (String -> CompoundSelector -> CompoundSelector) -> Style class id -> Style class id
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


{-| A [`:left`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aleft)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
left : PseudoClass
left =
    ExplicitPseudoClass "left"


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


{-| A [`:right`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aright)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
right : PseudoClass
right =
    ExplicitPseudoClass "right"


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
(|$) : Style class id -> Tag -> Style class id
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


{- Compiler Output -}

{-| Record type for converting a Result to something consumable in Node
-}
type alias CompilerOutput =
    { success: Bool
    , content: String
    }


{-| Converts a Result emitted by prettyPrint to a CompilerOutput

    port output =
        outputToPort css

    css =
        prettyPrint <|
            stylsheet "example"
                $ body
                    ~ margin 0 px
-}
outputToPort : Result String String -> CompilerOutput
outputToPort result =
    case result of
        Ok styleString ->
            CompilerOutput True styleString
        Err message ->
            CompilerOutput False message
