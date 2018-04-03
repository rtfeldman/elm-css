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
        , arabicIndic
        , armenian
        , auto
        , backgroundAttachment
        , backgroundAttachments
        , backgroundBlendMode
        , backgroundBlendModes
        , backgroundClip
        , backgroundClips
        , backgroundColor
        , backgroundOrigin
        , backgroundOrigins
        , baseline
        , batch
        , before
        , bengali
        , block
        , bold
        , bolder
        , borderBox
        , bottom
        , boxShadow
        , cell
        , center
        , ch
        , cjkEarthlyBranch
        , cjkHeavenlyStem
        , cm
        , colResize
        , color
        , colorBurn
        , colorDodge
        , color_
        , commonLigatures
        , contentBox
        , contextMenu
        , contextual
        , copy
        , crosshair
        , cursive
        , cursor
        , darken
        , dashed
        , default
        , defaultBoxShadow
        , deg
        , devanagari
        , diagonalFractions
        , difference
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
        , exclusion
        , fantasy
        , firstBaseline
        , fixed
        , flexEnd
        , flexStart
        , fontFamilies
        , fontFamily
        , fontSize
        , fontStyle
        , fontVariantCaps
        , fontVariantLigatures
        , fontVariantNumeric
        , fontWeight
        , georgian
        , grab
        , grabbing
        , grad
        , grid
        , groove
        , gujarati
        , gurmukhi
        , hardLight
        , help
        , hex
        , historicalLigatures
        , hsl
        , hsla
        , hue
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
        , lighten
        , lighter
        , linearGradient
        , linearGradient2
        , liningNums
        , listStyle
        , listStyle2
        , listStyle3
        , local
        , luminosity
        , malayalam
        , medium
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
        , none
        , normal
        , notAllowed
        , nsResize
        , num
        , nwResize
        , nwseResize
        , oblique
        , oldstyleNums
        , ordinal
        , oriya
        , outset
        , overlay
        , paddingBox
        , pc
        , pct
        , petiteCaps
        , pointer
        , progress
        , proportionalNums
        , pseudoClass
        , pseudoElement
        , pt
        , px
        , rad
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
        , saturation
        , screen
        , scroll
        , seResize
        , selfEnd
        , selfStart
        , serif
        , slashedZero
        , small
        , smallCaps
        , smaller
        , softLight
        , solid
        , stackedFractions
        , start
        , stop
        , stop2
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
        , tabularNums
        , telugu
        , text
        , text_
        , thai
        , titlingCaps
        , to
        , toCorner
        , top
        , turn
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

@docs pseudoClass, active


## Pseudo-Elements

@docs pseudoElement, before, after


## Background Attachment

@docs backgroundAttachment, backgroundAttachments, scroll, fixed, local


## Background Blend Mode

@docs backgroundBlendMode, backgroundBlendModes, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color_, luminosity


## Background Clip and Origin

@docs backgroundClip, backgroundClips, backgroundOrigin, backgroundOrigins, borderBox, paddingBox, contentBox, text_


## Background Image

@docs linearGradient, linearGradient2, stop, stop2, to, toCorner


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


## Font Variant Numeric

@docs fontVariantNumeric, ordinal, slashedZero, liningNums, oldstyleNums, proportionalNums, tabularNums, diagonalFractions, stackedFractions


# Align Items

@docs normal, stretch, center, start, end, flexStart, flexEnd, selfStart, selfEnd, left, right, top, bottom, baseline, firstBaseline, lastBaseline, safeCenter, unsafeCenter


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


## Angles

@docs deg, grad, rad, turn

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
        }
    -> Style
color (Value val) =
    AppendProperty ("color:" ++ val)


{-| Sets [`background-color`](https://css-tricks.com/almanac/properties/b/background-color/).

    backgroundColor (hex "#60b5cc")
    backgroundColor (rgb 96 181 204)
    backgroundColor (rgba 96 181 204 0.5)

-}
backgroundColor : Value { rgb : Supported } -> Style
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
            ++ toString red
            ++ ","
            ++ toString green
            ++ ","
            ++ toString blue
            ++ ")"


{-| [RGBA color value](https://css-tricks.com/the-power-of-rgba/).

    color (rgba 96 181 204 0.25)

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


{-| [HSL color value](https://css-tricks.com/mother-effing-hsl/).

The `s` and `l` values are expressed as a number between 0 and 1 and are converted to the appropriate percentage.

    color (hsl 193 0.51 0.59) -- hsl(193, 51%, 59%)

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


{-| [HSLA color value](https://css-tricks.com/yay-for-hsla/)

The `s` and `l` values are expressed as a number between 0 and 1 and are converted to the appropriate percentage.

    color (hsla 193 0.51 0.59 0.25) -- hsl(193, 51%, 59%, 0.25)

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


{-| [RGB color value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#rgb()) in hexadecimal notation.

You can optionally include `#` as the first character, for benefits like syntax highlighting in editors, ease of copy/pasting from tools which express these as e.g. `#abcdef0`, etc.

    color (hex "#60b5cc")
    color (hex "60b5cc")

-}
hex : String -> Value { provides | hex : Supported }
hex str =
    Value <|
        if String.startsWith "#" str then
            String.dropLeft 1 str
        else
            str



-- POSITIONS --


{-| An `absolute` [`position`](https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/) value.

    position absolute

-}
absolute : Value { provides | position : Supported }
absolute =
    Value "absolute"



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
    Value (toString value ++ "px")


{-| [`em`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (em 5)

-}
em : Float -> Value { provides | em : Supported }
em value =
    Value (toString value ++ "em")


{-| [`ex`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (ex 5)

-}
ex : Float -> Value { provides | ex : Supported }
ex value =
    Value (toString value ++ "ex")


{-| [`ch`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (ch 5)

-}
ch : Float -> Value { provides | ch : Supported }
ch value =
    Value (toString value ++ "ch")


{-| [`rem`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (rem 5)

-}
rem : Float -> Value { provides | rem : Supported }
rem value =
    Value (toString value ++ "rem")


{-| [`vh`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vh 5)

-}
vh : Float -> Value { provides | vh : Supported }
vh value =
    Value (toString value ++ "vh")


{-| [`vw`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vw 5)

-}
vw : Float -> Value { provides | vw : Supported }
vw value =
    Value (toString value ++ "vw")


{-| [`vmin`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vmin 5)

-}
vmin : Float -> Value { provides | vmin : Supported }
vmin value =
    Value (toString value ++ "vmin")


{-| [`vmax`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (vmax 5)

-}
vmax : Float -> Value { provides | vmax : Supported }
vmax value =
    Value (toString value ++ "vmax")


{-| [`mm`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (mm 5)

-}
mm : Float -> Value { provides | mm : Supported }
mm value =
    Value (toString value ++ "mm")


{-| [`cm`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (cm 5)

-}
cm : Float -> Value { provides | cm : Supported }
cm value =
    Value (toString value ++ "cm")


{-| [`in`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (inches 5)

(This is `inches` instead of `in` because `in` is a reserved keyword in Elm.)

-}
inches : Float -> Value { provides | inches : Supported }
inches value =
    Value (toString value ++ "in")


{-| [`pt`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pt 5)

-}
pt : Float -> Value { provides | pt : Supported }
pt value =
    Value (toString value ++ "pt")


{-| [`pc`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pc 5)

-}
pc : Float -> Value { provides | pc : Supported }
pc value =
    Value (toString value ++ "pc")


{-| [`pct`](https://css-tricks.com/the-lengths-of-css/) length units.

    borderWidth (pct 5)

-}
pct : Float -> Value { provides | pct : Supported }
pct value =
    Value (toString value ++ "%")


{-| A unitless number. Useful with properties like [`flexGrow`](#flexGrow) which accept unitless numbers.

    flexGrow (num 2)

-}
num : Float -> Value { provides | num : Supported }
num value =
    Value (toString value)


{-| A unitless integer. Useful with properties like [`borderImageOutset`](#borderImageOutset) which accept either length units or unitless numbers for some properties.

    borderImageOutset (int 3)

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


{-| Sets [`box-shadow`](https://css-tricks.com/almanac/properties/b/box-shadow/).

    boxShadow  [] -- "box-shadow: none"

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
    in
    insetStr ++ offsetX ++ " " ++ offsetY ++ blurRadius ++ spreadRadius



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
        , for_display_flex_see_docs_for_displayFlex : Supported
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
top : Value { provides | top : Supported }
top =
    Value "top"


{-| -}
bottom : Value { provides | bottom : Supported }
bottom =
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



-- FONT SIZE --


{-| Sets [`font-size`](https://css-tricks.com/almanac/properties/f/font-size/)

    fontSize  xxSmall
    fontSize  (px 12)

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


{-| Sets [`font-style`](https://css-tricks.com/almanac/properties/f/font-style/)

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


{-| Sets [`font-weight`](https://css-tricks.com/almanac/properties/f/font-weight/)

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
maybeValToString maybeVal =
    case maybeVal of
        Just (Value str) ->
            Just str

        Nothing ->
            Nothing


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
                |> List.map (\(Value str) -> str)
                |> String.join ","
    in
    AppendProperty ("background-attachment:" ++ str)


{-| The `fixed` [`background-attachment` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)

    backgroundAttachment fixed

-}
fixed : Value { provides | fixed : Supported }
fixed =
    Value "fixed"


{-| The `scroll` [`background-attachment` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment#Values)

    backgroundAttachment scroll

-}
scroll : Value { provides | scroll : Supported }
scroll =
    Value "scroll"


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
        , color : Supported
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
                |> List.map (\(Value str) -> str)
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

    backgroundBlendMode color-colorDodge

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
                |> List.map (\(Value str) -> str)
                |> String.join ","
    in
    AppendProperty ("background-clip:" ++ str)


{-| The `border-box` value, used with [`background-clip`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip#Values)
and [`background-origin`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin#Values).

    backgroundClip borderBox
    backgroundOrigin borderBox

-}
borderBox : Value { provides | borderBox : Supported }
borderBox =
    Value "border-box"


{-| The `padding-box` value, used with [`background-clip`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip#Values)
and [`background-origin`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin#Values).

    backgroundClip paddingBox
    backgroundOrigin paddingBox

-}
paddingBox : Value { provides | paddingBox : Supported }
paddingBox =
    Value "padding-box"


{-| The `content-box` value, used with [`background-clip`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip#Values)
and [`background-origin`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin#Values).

    backgroundClip contentBox
    backgroundOrigin contentBox

-}
contentBox : Value { provides | contentBox : Supported }
contentBox =
    Value "content-box"


{-| The `text` [`background-clip` value](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip#Values).

    backgroundClip text_

-}
text_ : Value { provides | text_ : Supported }
text_ =
    Value "text"



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
                |> List.map (\(Value str) -> str)
                |> String.join ","
    in
    AppendProperty ("background-origin:" ++ str)



{- GRADIENTS -}


{-| Sets [`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient)

    linearGradient (stop red) (stop blue) []

    linearGradient (stop red) (stop blue) [ stop green ]

See also [`linearGradient2`](#linearGradient2) if you don't need to set the angle.

-}
linearGradient :
    Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Style
linearGradient (Value firstStop) (Value secondStop) moreStops =
    let
        peeledStops =
            List.map (\(Value stop) -> stop) moreStops

        stops =
            String.join "," (firstStop :: secondStop :: peeledStops)
    in
    AppendProperty ("linear-gradient(" ++ stops ++ ")")


{-| Sets [`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient), providing an angle.

    linearGradient2 (deg 90) (stop red) (stop blue) []

    linearGradient2 (top left) (stop red) (stop blue) []

See also [`linearGradient`](#linearGradient) if you don't need to set the angle.

-}
linearGradient2 :
    Value { deg : Supported }
    -> Value { colorStop : Supported }
    -> Value { colorStop : Supported }
    -> List (Value { colorStop : Supported })
    -> Style
linearGradient2 (Value angle) (Value firstStop) (Value secondStop) moreStops =
    let
        peeledStops =
            List.map (\(Value stop) -> stop) moreStops

        stops =
            String.join "," (firstStop :: secondStop :: peeledStops)
    in
    AppendProperty ("linear-gradient(" ++ angle ++ "," ++ stops ++ ")")


{-| Provides a stop for a [gradient](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient).

    stop red

See also [`stop2`](#stop2) for controlling stop positioning.

-}
stop : Color -> Value { provides | colorStop : Supported }
stop (Value color) =
    Value color


{-| Provides a stop for a [gradient](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient).

    stop2 red (px 20)

See also [`stop`](#stop) if you don't need to control the stop position.

-}
stop2 :
    Color
    ->
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
            }
    -> Value { supported | colorStop : Supported }
stop2 (Value color) (Value position) =
    Value (color ++ " " ++ position)


{-| Provides the special [`to` side angle](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient) for gradients.

    to top

See also [`toCorner`](#to) for a corner.

-}
to :
    Value
        { top : Supported
        , bottom : Supported
        , left : Supported
        , right : Supported
        }
    -> Value { supported | to : Supported }
to (Value direction) =
    Value ("to " ++ direction)


{-| Provides the special [`to` corner angle](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient) for gradients.

    toCorner top left

    toCorner bottom right

See also [`to`](#to) for a side.

-}
toCorner :
    Value { top : Supported, bottom : Supported }
    -> Value { left : Supported, right : Supported }
    -> Value { supported | to : Supported }
toCorner (Value topBottom) (Value leftRight) =
    Value ("to " ++ topBottom ++ " " ++ leftRight)



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



-- ANGLES --


{-| A [`deg` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    deg 360 -- one full circle

    deg 14.23

-}
deg : Float -> Value { provides | deg : Supported }
deg degrees =
    Value (toString degrees ++ "deg")


{-| A [`grad` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    grad 400 -- one full circle

    grad 38.8

-}
grad : Float -> Value { provides | grad : Supported }
grad gradians =
    Value (toString gradians ++ "grad")


{-| A [`rad` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    rad 6.2832 -- approximately one full circle

    rad 1

-}
rad : Float -> Value { provides | rad : Supported }
rad radians =
    Value (toString radians ++ "rad")


{-| A [`turn` angle](https://developer.mozilla.org/en-US/docs/Web/CSS/angle)

    turn 1 -- one full circle

    turn 0.25

-}
turn : Float -> Value { provides | turn : Supported }
turn turns =
    Value (toString turns ++ "turn")
