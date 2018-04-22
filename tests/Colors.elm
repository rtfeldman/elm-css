module Colors exposing (hexTests)

import Css exposing (hex)
import Expect
import Test exposing (Test, describe, test)


hexTests : Test
hexTests =
    describe "hex color mixing"
        [ test "short hashless color" <|
            \() ->
                hex "fff"
                    |> Expect.equal (hex "#fff")
        , test "long hashless color" <|
            \() ->
                hex "0ff000"
                    |> Expect.equal (hex "#0ff000")
        , test "short hash color" <|
            \() ->
                hex "#000"
                    |> Expect.equal (hex "#000")
        , test "long hash color" <|
            \() ->
                hex "#f00fff"
                    |> Expect.equal (hex "#f00fff")
        ]
