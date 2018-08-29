module DEPRECATED.Css exposing (asPairs)

{-| Deprecated functions.

Okay, deprecated _function_.

Just the one, really.

@docs asPairs

-}

import Css exposing (Style)
import Css.Preprocess


{-| **DEPRECATED**. Like compiling to .css files, support for `asPairs` is planned to be removed in a
future release (likely sometime in 2018), once [`Html.Styled`](Html-Styled) has
matured sufficiently. The design goal is for elm-css to offer One Way To Do It,
and that one way is planned to be `Html.Styled`!

Take a list of styles and return a list of key-value pairs that
can then be passed to a `style` attribute.
styled = asPairs >> Html.Attributes.style
button
[ styled [ position absolute, left (px 5) ] ][ text "Whee!" ]

-}
asPairs : List Style -> List ( String, String )
asPairs =
    Css.Preprocess.toPropertyPairs
