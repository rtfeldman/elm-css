module Style (Style(..)) where

import Css.Declaration exposing (Declaration, CompoundSelector, Property)


{-| A namespaced stylesheet, a mixin, or an invalid style.
-}
type Style namespace animation class id
    = NamespacedStyle namespace (List Declaration)
    | Mixin (Style namespace animation class id -> Style namespace animation class id)
    | InvalidStyle String
