module Hash exposing (fromString, hash, initialSeed)

import ElmCssVendor.Murmur3 as Murmur3
import Hex


hash : String -> Int -> Int
hash str seed =
    Murmur3.hashString seed str


fromString : String -> String
fromString str =
    str
        |> Murmur3.hashString initialSeed
        |> Hex.toString
        |> String.cons '_'


initialSeed : Int
initialSeed =
    15739
