module Css
    exposing
        ( BoxShadowConfig
        , Color
        , Style
        , Supported
        , Value
        , absolute
        , active
        , after
        , alias
        , alignItems
        , alignSelf
        , all
        , allPetiteCaps
        , allScroll
        , allSmallCaps
        , any
        , arabicIndic
        , armenian
        , auto
        , backgroundColor
        , baseline
        , batch
        , before
        , bengali
        , block
        , bold
        , bolder
        , boxShadow
        , cell
        , center
        , ch
        , cjkEarthlyBranch
        , cjkHeavenlyStem
        , cm
        , colResize
        , color
        , commonLigatures
        , contextMenu
        , contextual
        , copy
        , crosshair
        , cursive
        , cursor
        , dashed
        , default
        , defaultBoxShadow
        , devanagari
        , discretionaryLigatures
        , display
        , displayFlex
        , dotted
        , double
        , eResize
        , em
        , end
        , ewResize
        , ex
        , fantasy
        , firstBaseline
        , flexEnd
        , flexStart
        , fontFamilies
        , fontFamily
        , fontSize
        , fontStyle
        , fontVariantCaps
        , fontVariantLigatures
        , fontWeight
        , georgian
        , grab
        , grabbing
        , grid
        , groove
        , gujarati
        , gurmukhi
        , help
        , hex
        , historicalLigatures
        , hsl
        , hsla
        , inches
        , inherit
        , initial
        , inline
        , inlineBlock
        , inlineFlex
        , inset
        , int
        , italic
        , kannada
        , khmer
        , lao
        , large
        , larger
        , lastBaseline
        , left
        , lighter
        , listStyle
        , listStyle2
        , listStyle3
        , malayalam
        , medium
        , mm
        , monospace
        , move
        , myanmar
        , nResize
        , neResize
        , neswResize
        , noCommonLigatures
        , noContextual
        , noDiscretionaryLigatures
        , noDrop
        , noHistoricalLigatures
        , none
        , normal
        , notAllowed
        , nsResize
        , num
        , nwResize
        , nwseResize
        , oblique
        , oriya
        , outset
        , pc
        , pct
        , petiteCaps
        , pointer
        , progress
        , pseudoClass
        , pseudoElement
        , pt
        , px
        , rem
        , revert
        , rgb
        , rgba
        , ridge
        , right
        , rowResize
        , sResize
        , safeCenter
        , sansSerif
        , seResize
        , selfEnd
        , selfStart
        , serif
        , small
        , smallCaps
        , smaller
        , solid
        , start
        , stretch
        , swResize
        , systemUi
        , table
        , tableCaption
        , tableCell
        , tableColumn
        , tableColumnGroup
        , tableFooterGroup
        , tableHeaderGroup
        , tableRow
        , tableRowGroup
        , telugu
        , text
        , thai
        , titlingCaps
        , unicase
        , unsafeCenter
        , unset
        , url
        , verticalText
        , vh
        , vmax
        , vmin
        , vw
        , wResize
        , wait
        , wavy
        , xLarge
        , xSmall
        , xxLarge
        , xxSmall
        , zero
        , zoomIn
        , zoomOut
        )

{-|


## CSS Values

@docs Value, Supported


## Reusable Styles

@docs Style, batch


## General Values

All CSS properties can have the values `unset`, `initial`, and `inherit`.

@docs unset, initial, inherit

@docs all, revert


## Numeric Units

@docs zero, px, em, ex, ch, rem, vh, vw, vmin, vmax, mm, cm, inches, pt, pc, pct, num, int


## Color

@docs Color, color, backgroundColor, hex, rgb, rgba, hsl, hsla


## Pseudo-Classes

@docs pseudoClass, any, active


## Pseudo-Elements

@docs pseudoElement, before, after


## Box Shadow

@docs BoxShadowConfig, boxShadow, defaultBoxShadow


## Border Style

@docs wavy, dotted, dashed, solid, double, groove, ridge, inset, outset


## Display

@docs display, displayFlex

@docs block, grid, inline, inlineBlock, inlineFlex, table, tableCaption, tableCell, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup


## Positions

@docs absolute


## Flexbox

@docs alignItems, alignSelf


## Font Size

@docs fontSize, xxSmall, xSmall, small, medium, large, xLarge, xxLarge, smaller, larger


## Font Family

@docs fontFamily, fontFamilies, serif, sansSerif, monospace, cursive, fantasy, systemUi


## Font Styles

@docs fontStyle, italic, oblique

[`normal`](#normal) is also a supported font style.


## Font Weights

@docs fontWeight, bold, lighter, bolder

[`normal`](#normal) is also a supported font weight.


## Font Variant Caps

@docs fontVariantCaps, smallCaps, allSmallCaps, petiteCaps, allPetiteCaps, unicase, titlingCaps


## Font Variant Ligatures

@docs fontVariantLigatures , commonLigatures , noCommonLigatures , discretionaryLigatures , noDiscretionaryLigatures , historicalLigatures , noHistoricalLigatures , contextual , noContextual


# Align Items

@docs normal, stretch, center, start, end, flexStart, flexEnd, selfStart, selfEnd, left, right, baseline, firstBaseline, lastBaseline, safeCenter, unsafeCenter


# Url

@docs url


## Cursors

@docs cursor, pointer, default, contextMenu, help, progress, wait, cell
@docs crosshair, text, verticalText, alias, copy, move, noDrop
@docs notAllowed, allScroll, colResize, rowResize, nResize, eResize, sResize
@docs wResize, neResize, nwResize, seResize, swResize, ewResize, nsResize
@docs neswResize, nwseResize, zoomIn, zoomOut, grab, grabbing


## List Style Type

@docs listStyle, listStyle2, listStyle3
@docs arabicIndic, armenian, bengali, cjkEarthlyBranch, cjkHeavenlyStem, devanagari, georgian, gujarati, gurmukhi, kannada, khmer, lao, malayalam, myanmar, oriya, telugu, thai


## Shared Values

Multiple CSS properties use these values.

@docs auto, none

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

-}
initial : Value { provides | initial : Supported }
initial =
    Value "initial"


{-| The [`unset`](https://developer.mozilla.org/en-US/docs/Web/CSS/unset) value.
Any CSS property can be set to this value.

    display unset

-}
unset : Value { provides | unset : Supported }
unset =
    Value "unset"


{-| An [`all`](https://developer.mozilla.org/en-US/docs/Web/CSS/all) property.

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


{-| The `url` value for the [`cursor`](#cursor) and [`backgroundImage`](#backgroundImage)
properties.
-}
url : String -> Value { provides | url : Supported }
url str =
    Value ("url(" ++ ")")


{-| The `auto` value used for properties such as [`width`](#width).

    width auto

-}
auto : Value { provides | auto : Supported }
auto =
    Value "auto"


{-| The `none` value used for properties such as [`display`](#display).

    display none

-}
none : Value { provides | none : Supported }
none =
    Value "none"



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
        }


{-| -}
color :
    Value
        { rgb : Supported
        , rgba : Supported
        , hsl : Supported
        , hsla : Supported
        , hex : Supported
        }
    -> Style
color (Value val) =
    AppendProperty ("color:" ++ val)


{-| -}
backgroundColor : Value { rgb : Supported } -> Style
backgroundColor (Value val) =
    AppendProperty ("background-color:" ++ val)


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in functional notation.
-}
rgb : Int -> Int -> Int -> Value { provides | rgb : Supported }
rgb red green blue =
    Value <|
        "rgb("
            ++ toString red
            ++ ","
            ++ toString green
            ++ ","
            ++ toString blue
            ++ ")"


{-| [RGBA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgba()).
-}
rgba : Int -> Int -> Int -> Float -> Value { provides | rgba : Supported }
rgba red green blue alpha =
    Value <|
        "rgba("
            ++ toString red
            ++ ","
            ++ toString green
            ++ ","
            ++ toString blue
            ++ ","
            ++ toString alpha
            ++ ")"


{-| [HSL color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsl())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsl : Float -> Float -> Float -> Value { provides | hsl : Supported }
hsl hue saturation lightness =
    Value <|
        "hsl("
            ++ toString hue
            ++ ","
            ++ toString (saturation * 100)
            ++ "%,"
            ++ toString (lightness * 100)
            ++ "%,"
            ++ ")"


{-| [HSLA color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#hsla())
`s` and `l` values are expressed as a number between 0 and 1 and are converted
to the appropriate percentage at compile-time
-}
hsla : Float -> Float -> Float -> Float -> Value { provides | hsla : Supported }
hsla hue saturation lightness alpha =
    Value <|
        "hsl("
            ++ toString hue
            ++ ","
            ++ toString (saturation * 100)
            ++ "%,"
            ++ toString (lightness * 100)
            ++ "%,"
            ++ toString alpha
            ++ ")"


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb())
in hexadecimal notation. You can optionally include `#` as the first character,
for benefits like syntax highlighting in editors, ease of copy/pasting from
tools which express these as e.g. `#abcdef0`, etc.
-}
hex : String -> Value { provides | hex : Supported }
hex str =
    Value <|
        if String.startsWith "#" str then
            String.dropLeft 1 str
        else
            str



-- POSITIONS --


{-| An `absolute` [`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) value.

    position absolute

-}
absolute : Value { provides | position : Supported }
absolute =
    Value "absolute"



-- PSEUDO-CLASSES --


{-| Define a custom pseudo-class.

This can be useful for deprecated pseudo-classes such as `-moz-any-link`, which
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


{-| An [`:any`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aany)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
any : String -> List Style -> Style
any str =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector ("any(" ++ str ++ ")"))


{-| An [`:active`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3Aactive)
[pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes).
-}
active : List Style -> Style
active =
    Preprocess.ExtendSelector (Structure.PseudoClassSelector "active")



-- PSEUDO-ELEMENTS--


{-| Define a custom pseudo-element.

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


{-| An [`::after`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Aafter)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
after : List Style -> Style
after =
    Preprocess.WithPseudoElement (Structure.PseudoElement "after")


{-| A [`::before`](https://developer.mozilla.org/en-US/docs/Web/CSS/%3A%3Abefore)
[pseudo-element](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements).
-}
before : List Style -> Style
before =
    pseudoElement "before"



-- NUMBERS --


{-| Compiles to 0 with no units.

    css [ padding zero ]

...compiles to:

    padding: 0;

This conveniently lets you avoid doing things like `padding (px 0)`

-}
zero : Value { provides | zero : Supported }
zero =
    Value "0"


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : Float -> Value { provides | px : Supported }
px value =
    Value (toString value ++ "px")


{-| [`em`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#em) units.
-}
em : Float -> Value { provides | em : Supported }
em value =
    Value (toString value ++ "em")


{-| [`ex`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ex) units.
-}
ex : Float -> Value { provides | ex : Supported }
ex value =
    Value (toString value ++ "ex")


{-| [`ch`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#ch) units.
-}
ch : Float -> Value { provides | ch : Supported }
ch value =
    Value (toString value ++ "ch")


{-| [`rem`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#rem) units.
-}
rem : Float -> Value { provides | rem : Supported }
rem value =
    Value (toString value ++ "rem")


{-| [`vh`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vh) units.
-}
vh : Float -> Value { provides | vh : Supported }
vh value =
    Value (toString value ++ "vh")


{-| [`vw`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vw) units.
-}
vw : Float -> Value { provides | vw : Supported }
vw value =
    Value (toString value ++ "vw")


{-| [`vmin`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmin) units.
-}
vmin : Float -> Value { provides | vmin : Supported }
vmin value =
    Value (toString value ++ "vmin")


{-| [`vmax`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#vmax) units.
-}
vmax : Float -> Value { provides | vmax : Supported }
vmax value =
    Value (toString value ++ "vmax")


{-| [`mm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#mm) units.
-}
mm : Float -> Value { provides | mm : Supported }
mm value =
    Value (toString value ++ "mm")


{-| [`cm`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#cm) units.
-}
cm : Float -> Value { provides | cm : Supported }
cm value =
    Value (toString value ++ "cm")


{-| [`in`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#in) units.

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)

-}
inches : Float -> Value { provides | inches : Supported }
inches value =
    Value (toString value ++ "in")


{-| [`pt`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pt) units.
-}
pt : Float -> Value { provides | pt : Supported }
pt value =
    Value (toString value ++ "pt")


{-| [`pc`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pc) units.
-}
pc : Float -> Value { provides | pc : Supported }
pc value =
    Value (toString value ++ "pc")


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : Float -> Value { provides | pct : Supported }
pct value =
    Value (toString value ++ "%")


{-| A unitless number. Useful with properties like [`flexGrow`](#flexGrow)
which accept unitless numbers.
-}
num : Float -> Value { provides | num : Supported }
num value =
    Value (toString value)


{-| A unitless integer. Useful with properties like [`borderImageOutset`](#borderImageOutset)
which accept either length units or unitless numbers for some properties.
-}
int : Int -> Value { provides | int : Supported }
int value =
    Value (toString value)



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
                }
            )
    , color :
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


{-| Sets [`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

    boxShadow  [] -- "box-shadow: none"
    boxShadow [ { defaultBoxShadow | offsetX = (px 3), offsetY = (px 5) } -- "box-shadow: 3px 5px"

TODO full example

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
    in
    insetStr ++ offsetX ++ " " ++ offsetY ++ blurRadius ++ spreadRadius



-- DISPLAY --


{-| The [`display`](https://developer.mozilla.org/en-US/docs/Web/CSS/display) property.

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
        , for_display_flex_see_docs_for_displayFlex : Supported
        , inherit : Supported
        , initial : Supported
        , unset : Supported
        }
    -> Style
display (Value val) =
    AppendProperty ("display:" ++ val)


{-| `display: flex`. This works around the fact that
[`flex` is already taken](#flex).
-}
displayFlex : Style
displayFlex =
    AppendProperty "display:flex"


{-| -}
block : Value { provides | block : Supported }
block =
    Value "block"


{-| -}
grid : Value { provides | block : Supported }
grid =
    Value "grid"


{-| -}
inline : Value { provides | inline : Supported }
inline =
    Value "inline"


{-| -}
inlineBlock : Value { provides | inlineBlock : Supported }
inlineBlock =
    Value "inlineBlock"


{-| -}
inlineFlex : Value { provides | inlineFlex : Supported }
inlineFlex =
    Value "inlineFlex"


{-| -}
table : Value { provides | table : Supported }
table =
    Value "table"


{-| -}
tableCaption : Value { provides | tableCaption : Supported }
tableCaption =
    Value "tableCaption"


{-| -}
tableCell : Value { provides | tableCell : Supported }
tableCell =
    Value "tableCell"


{-| -}
tableColumn : Value { provides | tableColumn : Supported }
tableColumn =
    Value "tableColumn"


{-| -}
tableColumnGroup : Value { provides | tableColumnGroup : Supported }
tableColumnGroup =
    Value "tableColumnGroup"


{-| -}
tableFooterGroup : Value { provides | tableFooterGroup : Supported }
tableFooterGroup =
    Value "tableFooterGroup"


{-| -}
tableHeaderGroup : Value { provides | tableHeaderGroup : Supported }
tableHeaderGroup =
    Value "tableHeaderGroup"


{-| -}
tableRow : Value { provides | tableRow : Supported }
tableRow =
    Value "tableRow"


{-| -}
tableRowGroup : Value { provides | tableRowGroup : Supported }
tableRowGroup =
    Value "tableRowGroup"



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


{-| -}
left : Value { provides | left : Supported }
left =
    Value "left"


{-| -}
right : Value { provides | right : Supported }
right =
    Value "right"


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


{-| TODO
-}
unsafeCenter : Value { provides | unsafeCenter : Supported }
unsafeCenter =
    Value "unsafe center"



-- FLEXBOX --


{-| Sets [`align-items`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items).

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


{-| Sets [`align-self`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-self).

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



-- FONT SIZE --


{-| Sets [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size)

    fontSize  xxSmall
    fontSize  (px 12)

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


{-| The `medium` [`font-size` value](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#Values).

    fontSize medium

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

    fontSize  xxLarge

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


{-| Define multiple [font families](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family).

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
                    ++ String.join "," (List.map enquoteIfNotGeneric list)
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


{-| Sets [`font-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style)

    fontStyle  italic

-}
fontStyle : Value { normal : Supported, bold : Supported, bolder : Supported, lighter : Supported } -> Style
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


{-| Sets [`font-weight`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight)

    fontWeight  bold
    fontWeight  (int 300)

-}
fontWeight : Value { normal : Supported, bold : Supported, bolder : Supported, lighter : Supported } -> Style
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
[`font-variant-caps`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps#Values)
and [`align-items`](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items#Values).

    fontVariantCaps normal
    alignItems normal

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



-- CURSOR --


{-| A [`cursor`](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor#Values)
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


{-| The `text` value for the [`cursor`](#cursor) property.
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


{-| The `zoomOut` value for the [`cursor`](#cursor) property.
-}
zoomOut : Value { provides | zoomOut : Supported }
zoomOut =
    Value "zoomOut"


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



{- LIST STYLE SHORTHAND -}


{-| The [`list-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style) shorthand property.
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
        }
    -> Style
listStyle (Value val) =
    AppendProperty ("list-style:" ++ val)


{-| The [`list-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style) shorthand property.
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


{-| The [`list-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style) shorthand property.
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



-- BORDER STYLE --


{-| A `wavy` [text decoration style](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-style#Values).
-}
wavy : Value { provides | wavy : Supported }
wavy =
    Value "wavy"


{-| A `dotted` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dotted : Value { provides | dotted : Supported }
dotted =
    Value "dotted"


{-| A `dashed` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
dashed : Value { provides | dashed : Supported }
dashed =
    Value "dashed"


{-| A `solid` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
solid : Value { provides | solid : Supported }
solid =
    Value "solid"


{-| A `double` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
double : Value { provides | double : Supported }
double =
    Value "double"


{-| A `groove` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
groove : Value { provides | groove : Supported }
groove =
    Value "groove"


{-| A `ridge` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
ridge : Value { provides | ridge : Supported }
ridge =
    Value "ridge"


{-| An `inset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
inset : Value { provides | inset : Supported }
inset =
    Value "inset"


{-| An `outset` [border style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style#Values).
-}
outset : Value { provides | outset : Supported }
outset =
    Value "outset"
