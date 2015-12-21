module Style (Style(..)) where

import Css.Declaration exposing (Declaration, CompoundSelector, Property)


{-| A namespaced stylesheet, a mixin, or an invalid style.
-}
type Style class id
    = NamespacedStyle String (List Declaration)
    | Mixin (List ( List CompoundSelector, List Property ))
    | InvalidStyle String
