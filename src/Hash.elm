module Hash exposing (fromString)

import FNV1a
import Hex


fromString : String -> String
fromString str =
    FNV1a.hash str
        |> Hex.toString
        |> String.cons '_'
