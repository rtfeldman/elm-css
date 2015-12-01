module Css.Helpers (stylesheet) where

import Html exposing (Attribute)
import Html.Attributes as Attr
import Css.Util exposing (toCssIdentifier, classToString)
import String


type alias Stylesheet class id =
    { class : class -> Attribute
    , classList : List ( class, Bool ) -> Attribute
    , id : id -> Attribute
    }


stylesheet : String -> Stylesheet class id
stylesheet name =
    { class = classToString name >> Attr.class
    , classList = classList name
    , id = toCssIdentifier >> Attr.id
    }


classList : String -> List ( class, Bool ) -> Attribute
classList name list =
    list
        |> List.filter snd
        |> List.map (fst >> classToString name)
        |> String.join " "
        |> Attr.class
