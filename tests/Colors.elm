module Colors exposing (..)

import Css exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Hex
import Test exposing (..)


hexTests : Test
hexTests =
    describe "hex color mixing"
        [ test "fff works" <|
            \() ->
                hex "fff"
                    |> expectEqualsRgba ( 255, 255, 255, 1 )
        , test "#fff works" <|
            \() ->
                hex "#fff"
                    |> expectEqualsRgba ( 255, 255, 255, 1 )
        , test "000 works" <|
            \() ->
                hex "000"
                    |> expectEqualsRgba ( 0, 0, 0, 1 )
        , test "#0f0 works" <|
            \() ->
                hex "#0f0"
                    |> expectEqualsRgba ( 0, 255, 0, 1 )
        , test "#00f works" <|
            \() ->
                hex "#00f"
                    |> expectEqualsRgba ( 0, 0, 255, 1 )
        , test "#f00 works" <|
            \() ->
                hex "#f00"
                    |> expectEqualsRgba ( 255, 0, 0, 1 )
        , test "#000 works" <|
            \() ->
                hex "#000"
                    |> expectEqualsRgba ( 0, 0, 0, 1 )
        , fuzz (Fuzz.tuple4 ( hexInt, hexInt, hexInt, hexInt )) "a valid 8-char hex string" <|
            \tuple ->
                tuple
                    |> fromRgba8
                    |> hex
                    |> expectEqualsRgba (alphaToPercentage tuple)
        ]


alphaToPercentage : ( Int, Int, Int, Int ) -> ( Int, Int, Int, Float )
alphaToPercentage ( r, g, b, a ) =
    ( r, g, b, toFloat a / 255 )


fromRgba8 : ( Int, Int, Int, Int ) -> String
fromRgba8 ( r, g, b, a ) =
    [ r, g, b, a ]
        |> List.map (Hex.toString >> String.padLeft 2 '0')
        |> String.join ""


smallHexInt : Fuzzer Int
smallHexInt =
    Fuzz.intRange 0 15


hexInt : Fuzzer Int
hexInt =
    Fuzz.intRange 0 255


expectEqualsRgba :
    ( Int, Int, Int, Float )
    -> { record | red : Int, green : Int, blue : Int, alpha : Float }
    -> Expectation
expectEqualsRgba ( expectedRed, expectedGreen, expectedBlue, expectedAlpha ) { red, green, blue, alpha } =
    { red = red, green = green, blue = blue, alpha = alpha }
        |> Expect.equal
            { red = expectedRed
            , green = expectedGreen
            , blue = expectedBlue
            , alpha = expectedAlpha
            }
