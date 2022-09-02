module Svg.Styled.Lazy exposing
    ( lazy, lazy2, lazy3, lazy4, lazy5, lazy6, lazy7
    , keyedLazy, keyedLazy2, keyedLazy3, keyedLazy4, keyedLazy5, keyedLazy6, keyedLazy7
    )

{-| **NOTE:** `Svg.Lazy` goes up to `lazy8`, but `Svg.Styled.Lazy` can only go
up to `lazy7` because it uses one of the arguments to track styling info.

Since all Elm functions are pure we have a guarantee that the same input
will always result in the same output. This module gives us tools to be lazy
about building `Svg` that utilize this fact.

Rather than immediately applying functions to their arguments, the `lazy`
functions just bundle the function and arguments up for later. When diffing
the old and new virtual DOM, it checks to see if all the arguments are equal.
If so, it skips calling the function!

This is a really cheap test and often makes things a lot faster, but definitely
benchmark to be sure!

@docs lazy, lazy2, lazy3, lazy4, lazy5, lazy6, lazy7
@docs keyedLazy, keyedLazy2, keyedLazy3, keyedLazy4, keyedLazy5, keyedLazy6, keyedLazy7

-}

import Svg.Styled exposing (Svg)
import VirtualDom.Styled


{-| A performance optimization that delays the building of virtual DOM nodes.

Calling `(view model)` will definitely build some virtual DOM, perhaps a lot of
it. Calling `(lazy view model)` delays the call until later. During diffing, we
can check to see if `model` is referentially equal to the previous value used,
and if so, we just stop. No need to build up the tree structure and diff it,
we know if the input to `view` is the same, the output must be the same!

-}
lazy : (a -> Svg msg) -> a -> Svg msg
lazy =
    VirtualDom.Styled.lazy


{-| Same as `lazy` but checks on two arguments.
-}
lazy2 : (a -> b -> Svg msg) -> a -> b -> Svg msg
lazy2 =
    VirtualDom.Styled.lazy2


{-| Same as `lazy` but checks on three arguments.
-}
lazy3 : (a -> b -> c -> Svg msg) -> a -> b -> c -> Svg msg
lazy3 =
    VirtualDom.Styled.lazy3


{-| Same as `lazy` but checks on four arguments.
-}
lazy4 : (a -> b -> c -> d -> Svg msg) -> a -> b -> c -> d -> Svg msg
lazy4 =
    VirtualDom.Styled.lazy4


{-| Same as `lazy` but checks on five arguments.
-}
lazy5 : (a -> b -> c -> d -> e -> Svg msg) -> a -> b -> c -> d -> e -> Svg msg
lazy5 =
    VirtualDom.Styled.lazy5


{-| Same as `lazy` but checks on six arguments.
-}
lazy6 : (a -> b -> c -> d -> e -> f -> Svg msg) -> a -> b -> c -> d -> e -> f -> Svg msg
lazy6 =
    VirtualDom.Styled.lazy6


{-| Same as `lazy` but checks on seven arguments.
-}
lazy7 : (a -> b -> c -> d -> e -> f -> g -> Svg msg) -> a -> b -> c -> d -> e -> f -> g -> Svg msg
lazy7 =
    VirtualDom.Styled.lazy7


{-| Much like `lazy`, but allows specifying a key for the created `Svg` node. This can increase performance in cases when you want to lazily generate a list of nodes.

This key becomes the id of the root node and all css that is generated will be scoped to that id. This allows the browser to spend less time calculating styles as there won't be lots styles with the same class name.

Some notes about using this function:

  - The key must be a valid HTML id
  - The key should be unique among other ids on the page and unique among the keys for other siblings
  - No other id attribute should be specified on the root node - it will be ignored

-}
keyedLazy : (a -> ( String, Svg msg )) -> a -> Svg msg
keyedLazy =
    VirtualDom.Styled.keyedLazy


{-| Same as `keyedLazy` but checks on two arguments.
-}
keyedLazy2 : (a -> b -> ( String, Svg msg )) -> a -> b -> Svg msg
keyedLazy2 =
    VirtualDom.Styled.keyedLazy2


{-| Same as `keyedLazy` but checks on three arguments.
-}
keyedLazy3 : (a -> b -> c -> ( String, Svg msg )) -> a -> b -> c -> Svg msg
keyedLazy3 =
    VirtualDom.Styled.keyedLazy3


{-| Same as `keyedLazy` but checks on four arguments.
-}
keyedLazy4 : (a -> b -> c -> d -> ( String, Svg msg )) -> a -> b -> c -> d -> Svg msg
keyedLazy4 =
    VirtualDom.Styled.keyedLazy4


{-| Same as `keyedLazy` but checks on five arguments.
-}
keyedLazy5 : (a -> b -> c -> d -> e -> ( String, Svg msg )) -> a -> b -> c -> d -> e -> Svg msg
keyedLazy5 =
    VirtualDom.Styled.keyedLazy5


{-| Same as `keyedLazy` but checks on six arguments.
-}
keyedLazy6 : (a -> b -> c -> d -> e -> f -> ( String, Svg msg )) -> a -> b -> c -> d -> e -> f -> Svg msg
keyedLazy6 =
    VirtualDom.Styled.keyedLazy6


{-| Same as `keyedLazy` but checks on seven arguments.
-}
keyedLazy7 : (a -> b -> c -> d -> e -> f -> g -> ( String, Svg msg )) -> a -> b -> c -> d -> e -> f -> g -> Svg msg
keyedLazy7 =
    VirtualDom.Styled.keyedLazy7
