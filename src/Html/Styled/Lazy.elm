module Html.Styled.Lazy exposing (lazy, lazy2, lazy3)

{-|

@docs lazy, lazy2, lazy3

-}

import Html.Styled as Html exposing (Html)
import Html.Styled.Internal exposing (InternalHtml(Unstyled))
import VirtualDom exposing (Node)


lazy : (a -> Html msg) -> a -> Html msg
lazy fn arg =
    VirtualDom.lazy (Html.toUnstyled << fn) arg
        |> Unstyled


lazy2 : (a -> b -> Html msg) -> a -> b -> Html msg
lazy2 fn arg1 arg2 =
    VirtualDom.lazy2 (\a b -> Html.toUnstyled (fn a b)) arg1 arg2
        |> Unstyled


lazy3 : (a -> b -> c -> Html msg) -> a -> b -> c -> Html msg
lazy3 fn arg1 arg2 arg3 =
    VirtualDom.lazy3 (\a b c -> Html.toUnstyled (fn a b c)) arg1 arg2 arg3
        |> Unstyled
