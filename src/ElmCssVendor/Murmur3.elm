module ElmCssVendor.Murmur3 exposing (hashString)

{-| Murmur 3 hash function for hashing strings

The MIT License (MIT)
Copyright (c) 2016 Robin Heggelund Hansen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

@docs hashString

-}

import Bitwise as Bit


type alias HashData =
    { shift : Int
    , seed : Int
    , hash : Int
    , charsProcessed : Int
    }


c1 : Int
c1 =
    0xCC9E2D51


c2 : Int
c2 =
    0x1B873593


{-| Takes a seed and a string. Produces a hash (integer).
Given the same seed and string, it will always produce the same hash.

    hashString 1234 "Turn me into a hash" == 4138100590

-}
hashString : Int -> String -> Int
hashString seed str =
    str
        |> String.foldl hashFold (HashData 0 seed 0 0)
        |> finalize


hashFold : Char -> HashData -> HashData
hashFold c data =
    let
        res =
            Char.toCode c
                |> Bit.and 0xFF
                |> Bit.shiftLeftBy data.shift
                |> Bit.or data.hash
    in
    -- Using case-of instead of == avoids costly .cmp check
    case data.shift of
        24 ->
            { shift = 0
            , seed = mix data.seed res
            , hash = 0
            , charsProcessed = data.charsProcessed + 1
            }

        _ ->
            { shift = data.shift + 8
            , seed = data.seed
            , hash = res
            , charsProcessed = data.charsProcessed + 1
            }


mix : Int -> Int -> Int
mix h1 k1 =
    (k1
        |> multiplyBy c1
        |> rotlBy 15
        |> multiplyBy c2
        |> Bit.xor h1
        |> rotlBy 13
        |> multiplyBy 5
    )
        + 0xE6546B64


finalize : HashData -> Int
finalize data =
    let
        acc =
            if data.hash /= 0 then
                data.hash
                    |> multiplyBy c1
                    |> rotlBy 15
                    |> multiplyBy c2
                    |> Bit.xor data.seed

            else
                data.seed

        h0 =
            Bit.xor acc data.charsProcessed

        h1 =
            Bit.xor h0 (Bit.shiftRightZfBy 16 h0)
                |> multiplyBy 0x85EBCA6B

        h2 =
            Bit.xor h1 (Bit.shiftRightZfBy 13 h1)
                |> multiplyBy 0xC2B2AE35
    in
    Bit.xor h2 (Bit.shiftRightZfBy 16 h2)
        |> Bit.shiftRightZfBy 0


{-| 32-bit multiplication
-}
multiplyBy : Int -> Int -> Int
multiplyBy b a =
    (Bit.and a 0xFFFF * b) + Bit.shiftLeftBy 16 (Bit.and (Bit.shiftRightZfBy 16 a * b) 0xFFFF)


{-| Given a 32bit int and an int representing a number of bit positions,
returns the 32bit int rotated left by that number of positions.
-}
rotlBy : Int -> Int -> Int
rotlBy b a =
    Bit.or
        (Bit.shiftLeftBy b a)
        (Bit.shiftRightZfBy (32 - b) a)
