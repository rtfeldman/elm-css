module Svg.Styled.Lazy exposing (lazy, lazy2, lazy3)

{-| A not-quite-drop-in replacement for the `Svg.Lazy` module from the
`elm-lang/svg` package.

The only difference between this and the `lazy` from `elm-lang/svg` is that the
caller must call `toUnstyled` inside the function being passed to `lazy`.

For example:

        import Css exposing (backgroundColor, rgb)
        import Svg.Styled exposing (Svg, circle, svg, toUnstyled)
        import Svg.Styled.Attributes exposing (css, cx, cy, r, viewBox)
        import Svg.Styled.Lazy exposing (lazy)
        import VirtualDom


        view : Model -> Svg Msg
        view model =
            svg [ viewBox "0 0 100 100" ]
                [ lazy viewCircle model.radius
                ]


        viewCircle : Int -> VirtualDom.Node msg
        viewCircle radius =
            circle
                [ cx "60"
                , cy "60"
                , r (String.fromInt radius)
                , css [ backgroundColor (rgb 200 0 0) ]
                ]
                |> toUnstyled -- toUnstyled must happen inside viewCircle!

@docs lazy, lazy2, lazy3

-}

import Svg.Styled exposing (Svg)
import VirtualDom
import VirtualDom.Styled


{-| A performance optimization that delays the building of virtual DOM nodes.

Calling `(view model)` will definitely build some virtual DOM, perhaps a lot of
it. Calling `(lazy view model)` delays the call until later. During diffing, we
can check to see if `model` is referentially equal to the previous value used,
and if so, we just stop. No need to build up the tree structure and diff it,
we know if the input to `view` is the same, the output must be the same!

-}
lazy : (a -> VirtualDom.Node msg) -> a -> Svg msg
lazy =
    VirtualDom.Styled.lazy


{-| Same as `lazy` but checks on two arguments.
-}
lazy2 : (a -> b -> VirtualDom.Node msg) -> a -> b -> Svg msg
lazy2 =
    VirtualDom.Styled.lazy2


{-| Same as `lazy` but checks on three arguments.
-}
lazy3 : (a -> b -> c -> VirtualDom.Node msg) -> a -> b -> c -> Svg msg
lazy3 =
    VirtualDom.Styled.lazy3
