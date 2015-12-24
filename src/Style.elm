module Style (Style(..)) where

import Css.Declaration exposing (Declaration, CompoundSelector, Property)


{-| A namespaced stylesheet, a mixin, or an invalid style.
-}
type Style class id name
    = NamespacedStyle name (List Declaration)
    | Mixin (Style class id name -> Style class id name)
    | InvalidStyle String
