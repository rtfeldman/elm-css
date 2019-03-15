module Css.Animations exposing
    ( Property, keyframes, Keyframes
    , opacity, transform, all, backgroundSize, backgroundSize2, border, property, backgroundColor, border2, border3, borderBottom, borderBottom2, borderBottom3, custom
    )

{-|


# Animations

@docs Property, keyframes, Keyframes


# Animatable Properties

As [MDN explains](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties), only certain CSS properties are animatable.

Some of the animatable properties (except for experimental properties, or properties with browser prefixes) are listed here. Many of them share a name and similar type with `Style` equivalents in the `Css` module, but they are different in that unlike `Style`s, animatable properties [are not compatible with `!important`](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes#!important_in_a_keyframe) or various selectors or media queries.

**NOTE:** We're looking to expand this list, but only on the `phantom-types` branch! See <https://github.com/rtfeldman/elm-css/issues/392>

@docs opacity, transform, all, backgroundSize, backgroundSize2, border, property, backgroundColor, border2, border3, borderBottom, borderBottom2, borderBottom3, custom

-}

import Css.Internal exposing (AnimationProperty(..), ColorValue, ExplicitLength, Length, LengthOrAutoOrCoverOrContain, lengthConverter, lengthForOverloadedProperty)
import Css.Preprocess as Preprocess
import Css.Structure exposing (Compatible(..))


{-| An [animatable property](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties).

Many of these share a name and similar type with `Style` equivalents in the `Css` module, but they are different in that unlike `Style`s, animatable properties [are not compatible with `!important`](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes#!important_in_a_keyframe) or various selectors or media queries.

If you need to use an experimental or vendor-prefixed animatable property, see [`custom`](#custom).

-}
type alias Property =
    AnimationProperty


type alias Style =
    Preprocess.Style


{-| -}
type alias Keyframes compatible =
    { compatible | keyframes : Compatible, none : Compatible, value : String }


{-| Specify a list of ( percentage, properties) tuples to use for
animation keyframes.

Pass the result to [`Css.animationName`](Css#animationName)!

`keyframes []` is equivalent to `none`.

-}
keyframes : List ( Int, List Property ) -> Keyframes {}
keyframes tuples =
    if List.isEmpty tuples then
        -- animationName is special-cased to pick up on this.
        { value = "none"
        , none = Compatible
        , keyframes = Compatible
        }

    else
        { value = Css.Internal.compileKeyframes tuples
        , none = Compatible
        , keyframes = Compatible
        }



-- ANIMATABLE PROPERTIES


{-| Create a custom animatable property with the given name and value. You can use this to define vendor-prefixed or experimental properties.

    custom "-moz-outline-radius" "25px"

**WARNING:** Some properties are not exposed in this module because they
are not animatable! This means browsers will refuse to animate them even if you pass them to this function.

MDN has [a list of the animatable properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties).

-}
custom : String -> String -> Property
custom name value =
    Property (name ++ ":" ++ value)


{-| -}
all : { compatible | value : String, all : Compatible } -> Property
all { value } =
    Property ("all:" ++ value)


{-| -}
backgroundColor : { compatible | value : String, color : Compatible } -> Property
backgroundColor { value } =
    Property ("background-color:" ++ value)


{-| -}
backgroundSize : LengthOrAutoOrCoverOrContain compatible -> Property
backgroundSize { value } =
    Property ("background-size:" ++ value)


{-| -}
backgroundSize2 : LengthOrAutoOrCoverOrContain compatible -> LengthOrAutoOrCoverOrContain compatible -> Property
backgroundSize2 arg1 arg2 =
    Property ("background-size:" ++ arg1.value ++ " " ++ arg2.value)


{-| -}
border : Length compatible units -> Property
border { value } =
    Property ("border:" ++ value)


{-| -}
border2 : Length compatible units -> Length compatible units -> Property
border2 arg1 arg2 =
    Property ("border:" ++ arg1.value ++ " " ++ arg2.value)


{-| -}
border3 : Length compatible units -> Length compatible units -> Length compatible units -> Property
border3 arg1 arg2 arg3 =
    Property ("border:" ++ arg1.value ++ " " ++ arg2.value ++ " " ++ arg3.value)


{-| -}
borderBottom : Length compatible units -> Property
borderBottom { value } =
    Property ("border-bottom:" ++ value)


{-| -}
borderBottom2 : Length compatible units -> Length compatible units -> Property
borderBottom2 arg1 arg2 =
    Property ("border-bottom:" ++ arg1.value ++ " " ++ arg2.value)


{-| -}
borderBottom3 : Length compatible units -> Length compatible units -> Length compatible units -> Property
borderBottom3 arg1 arg2 arg3 =
    Property ("border-bottom:" ++ arg1.value ++ " " ++ arg2.value ++ " " ++ arg3.value)


{-| -}
opacity : { compatible | value : String, number : Compatible } -> Property
opacity { value } =
    Property ("opacity:" ++ value)


{-| -}
transform : List { compatible | value : String, transform : Compatible } -> Property
transform values =
    Property <|
        if List.isEmpty values then
            "transform:none"

        else
            "transform:" ++ String.join " " (List.map .value values)


{-| Define a custom animatable property.

    css [ animationName (keyframes [ ( 5, property "backdrop-filter" "blur(3px)" ) ]) ]

...outputs

    @keyframes _cf0d1b {
        5% {
            backdrop-filter:blur(3px);
        }
    }

    ...

    animation-name: _cf0d1b

-}
property : String -> String -> Property
property key value =
    Property (key ++ ":" ++ value)
