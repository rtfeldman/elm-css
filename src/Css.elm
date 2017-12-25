module Css
    exposing
        ( Style
        , Supported
        , Value
        , absolute
        , active
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
        , auto
        , baseline
        , center
        , display
        , displayFlex
        , end
        , firstBaseline
        , flexEnd
        , flexStart
        , inherit
        , initial
        , lastBaseline
        , left
        , none
        , normal
        , pct
        , pseudoClass
        , pseudoElement
        , px
        , revert
        , right
        , safeCenter
        , selfEnd
        , selfStart
        , start
        , stretch
        , unsafeCenter
        , unset
        , zero
        )

{-|


## General Values

All CSS properties can have these values.

@docs unset, initial, inherit, all, revert, auto, none


## Numeric Units

@docs zero, px, pct


## Pseudo-Classes

@docs pseudoClass, any, active


## Pseudo-Elements

@docs pseudoElement, after


## Display

@docs display, displayFlex


## Positions

@docs absolute


## Flexbox

@docs alignItems, alignSelf


## Font Variants

@docs allPetiteCaps, allSmallCaps


## Cursors

@docs allScroll


## List Style Type

@docs arabicIndic, armenian

-}

import Css.Preprocess as Preprocess exposing (Style(AppendProperty))
import Css.Structure as Structure


-- TYPES --


type alias Style =
    Preprocess.Style


type Value r
    = Value String


type Supported
    = Supported



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



-- NUMBERS --


{-| Compiles to 0 with no units.

    css [ padding zero ]

...compiles to:

    padding: 0;

This conveniently lets you avoid doing things like `padding (px 0)`

-}
zero : Value { provides | px : Supported, pct : Supported }
zero =
    Value "0"


{-| [`px`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#px) units.
-}
px : Float -> Value { provides | px : Supported }
px value =
    Value (toString value ++ "px")


{-| [`pct`](https://developer.mozilla.org/en-US/docs/Web/CSS/length#pct) units.
-}
pct : Float -> Value { provides | pct : Supported }
pct value =
    Value (toString value ++ "%")



-- DISPLAY --


{-| The [`display`](https://developer.mozilla.org/en-US/docs/Web/CSS/display) property.

    display block

For `display: flex`, use [`displayFlex`](#displayFlex).

-}
display :
    Value
        { block : Supported
        , flex : Supported
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


{-| `display: flex`. This works around the fact that
[`flex` is already taken](#flex).
-}
displayFlex : Style
displayFlex =
    AppendProperty "display:flex"



-- ALIGN-ITEMS VALUES --


normal : Value { provides | normal : Supported }
normal =
    Value "normal"


stretch : Value { provides | stretch : Supported }
stretch =
    Value "stretch"


center : Value { provides | center : Supported }
center =
    Value "center"


start : Value { provides | start : Supported }
start =
    Value "start"


end : Value { provides | end : Supported }
end =
    Value "end"


flexStart : Value { provides | flexStart : Supported }
flexStart =
    Value "flex-start"


flexEnd : Value { provides | flexEnd : Supported }
flexEnd =
    Value "flex-end"


selfStart : Value { provides | selfStart : Supported }
selfStart =
    Value "self-start"


selfEnd : Value { provides | selfEnd : Supported }
selfEnd =
    Value "self-end"


left : Value { provides | left : Supported }
left =
    Value "left"


right : Value { provides | right : Supported }
right =
    Value "right"


baseline : Value { provides | baseline : Supported }
baseline =
    Value "baseline"


firstBaseline : Value { provides | firstBaseline : Supported }
firstBaseline =
    Value "first baseline"


lastBaseline : Value { provides | lastBaseline : Supported }
lastBaseline =
    Value "last baseline"


safeCenter : Value { provides | safeCenter : Supported }
safeCenter =
    Value "safe center"


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
        { accepts
            | auto : Supported
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



-- FONT VARIANTS --


allPetiteCaps : Value { provides | allPetiteCaps : Supported }
allPetiteCaps =
    Value "all-petite-caps"


allSmallCaps : Value { provides | allSmallCaps : Supported }
allSmallCaps =
    Value "all-small-caps"



-- CURSOR --


allScroll : Value { provides | allScroll : Supported }
allScroll =
    Value "all-scroll"



-- LIST STYLE TYPE --


arabicIndic : Value { provides | arabicIndic : Supported }
arabicIndic =
    Value "arabic-indic"


armenian : Value { provides | armenian : Supported }
armenian =
    Value "armenian"
