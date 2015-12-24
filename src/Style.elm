module Style (Style(..)) where

import Css.Declaration exposing (Declaration, CompoundSelector, Property)


{-| A namespaced stylesheet, a mixin, or an invalid style.
-}
type Style class id namespace
    = NamespacedStyle namespace (List Declaration)
    | Mixin (Style class id namespace -> Style class id namespace)
    | InvalidStyle String
