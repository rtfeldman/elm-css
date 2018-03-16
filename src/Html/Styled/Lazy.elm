module Html.Styled.Lazy exposing (lazy, lazy2, lazy3)

{-| A not-quite-drop-in replacement for the `Html.Lazy` module from the
`elm-lang/html` package.

The only difference between this and the `lazy` from `elm-lang/html` is that the
caller must call `toUnstyled` inside the function being passed to `lazy`.

For example:

        import Html.Styled as Html exposing (Html)
        import Html.Styled.Lazy exposing (lazy)
        import VirtualDom


        view : Model -> Html Msg
        view model =
            lazy viewCount model.count


        viewCount : Int -> VirtualDom.Node msg
        viewCount count =
            span [ css [ textDecoration underline ] ] [ text (toString count) ]
                |> toUnstyled -- toUnstyled must happen inside viewCount!

@docs lazy, lazy2, lazy3

-}

import Html.Styled exposing (Html)
import VirtualDom
import VirtualDom.Styled


{-| A performance optimization that delays the building of virtual DOM nodes.
Calling `(view model)` will definitely build some virtual DOM, perhaps a lot of
it. Calling `(lazy view model)` delays the call until later. During diffing, we
can check to see if `model` is referentially equal to the previous value used,
and if so, we just stop. No need to build up the tree structure and diff it,
we know if the input to `view` is the same, the output must be the same!
-}
lazy : (a -> VirtualDom.Node msg) -> a -> Html msg
lazy =
    VirtualDom.Styled.lazy


{-| Same as `lazy` but checks on two arguments.
-}
lazy2 : (a -> b -> VirtualDom.Node msg) -> a -> b -> Html msg
lazy2 =
    VirtualDom.Styled.lazy2


{-| Same as `lazy` but checks on three arguments.
-}
lazy3 : (a -> b -> c -> VirtualDom.Node msg) -> a -> b -> c -> Html msg
lazy3 =
    VirtualDom.Styled.lazy3
