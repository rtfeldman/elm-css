module Css.Class exposing (Class, class)

import Css exposing (Snippet, Style)


{-| Styles scoped under an automatically-generated class.
-}
type Class
    = Class (List Style)


class : List Style -> Class
class =
    Class
