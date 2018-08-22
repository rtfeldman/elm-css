module Hash exposing (fromString)

import Hex
import Murmur3


fromString : String -> String
fromString str =
    str
        |> Murmur3.hashString murmurSeed
        |> Hex.toString
        |> String.cons '_'


murmurSeed : Int
murmurSeed =
    15739
