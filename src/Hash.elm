module Hash exposing (fromString, initialSeed)

import Hex
import Murmur3


fromString : String -> String
fromString str =
    str
        |> Murmur3.hashString initialSeed
        |> Hex.toString
        |> String.cons '_'


initialSeed : Int
initialSeed =
    15739
