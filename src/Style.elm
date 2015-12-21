module Style (Style(..)) where

import Css.Declaration exposing (Declaration, CompoundSelector, Property)


{-| A namespaced stylesheet, a mixin, or an invalid style.
-}
type Style class id
    = NamespacedStyle String (List Declaration)
    | Mixin (Style class id -> Style class id)
    | InvalidStyle String
