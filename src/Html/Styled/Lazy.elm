module Html.Styled.Lazy
    exposing
        ( lazy
        , lazy2
        , lazy3
        , lazy4
        , lazy5
        , lazy6
        , lazy7
        )

{-| Drop-in replacement for the `Html.Lazy` module from the `elm/html` package.
Well, almost — the only difference is that there is no `lazy8` function.

@docs lazy, lazy2, lazy3, lazy4, lazy5, lazy6, lazy7

-}

import Html.Styled as Html exposing (Html)
import VirtualDom.Styled


{-| A performance optimization that delays the building of virtual DOM nodes.
Calling `(view model)` will definitely build some virtual DOM, perhaps a lot of
it. Calling `(lazy view model)` delays the call until later. During diffing, we
can check to see if `model` is referentially equal to the previous value used,
and if so, we just stop. No need to build up the tree structure and diff it,
we know if the input to `view` is the same, the output must be the same!
-}
lazy : (a -> Html msg) -> a -> Html msg
lazy =
    VirtualDom.Styled.lazy


{-| Same as `lazy` but checks on two arguments.
-}
lazy2 : (a -> b -> Html msg) -> a -> b -> Html msg
lazy2 =
    VirtualDom.Styled.lazy2


{-| Same as `lazy` but checks on three arguments.
-}
lazy3 : (a -> b -> c -> Html msg) -> a -> b -> c -> Html msg
lazy3 =
    VirtualDom.Styled.lazy3


{-| Same as `lazy` but checks on four arguments.
-}
lazy4 : (a -> b -> c -> d -> Html msg) -> a -> b -> c -> d -> Html msg
lazy4 =
    VirtualDom.Styled.lazy4


{-| Same as `lazy` but checks on five arguments.
-}
lazy5 : (a -> b -> c -> d -> e -> Html msg) -> a -> b -> c -> d -> e -> Html msg
lazy5 =
    VirtualDom.Styled.lazy5


{-| Same as `lazy` but checks on six arguments.
-}
lazy6 : (a -> b -> c -> d -> e -> f -> Html msg) -> a -> b -> c -> d -> e -> f -> Html msg
lazy6 =
    VirtualDom.Styled.lazy6


{-| Same as `lazy` but checks on seven arguments.
-}
lazy7 : (a -> b -> c -> d -> e -> f -> g -> Html msg) -> a -> b -> c -> d -> e -> f -> g -> Html msg
lazy7 =
    VirtualDom.Styled.lazy7
