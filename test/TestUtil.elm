module TestUtil exposing (..)

import String
import Css exposing (Snippet, rgb, rgba)
import Fuzz exposing (Fuzzer)


outdented : String -> String
outdented str =
    str
        |> String.split "\n"
        |> List.map String.trim
        |> String.join "\n"
        |> String.trim


prettyPrint : Css.Stylesheet -> String
prettyPrint sheet =
    let
        { warnings, css } =
            Css.compile [ sheet ]
    in
        if List.isEmpty warnings then
            css
        else
            "Invalid Stylesheet:\n" ++ (String.join "\n" warnings)


validRgbValue : Fuzzer Int
validRgbValue =
    Fuzz.intRange 0 255


validAlphaValue : Fuzzer Float
validAlphaValue =
    Fuzz.floatRange 0 1


invalidRgbValue : Fuzzer Int
invalidRgbValue =
    Fuzz.frequencyOrCrash
        [ ( 1, Fuzz.intRange -300 -1 )
        , ( 1, Fuzz.intRange 256 300 )
        ]


invalidAlphaValue : Fuzzer Float
invalidAlphaValue =
    Fuzz.frequencyOrCrash
        [ ( 1, Fuzz.floatRange -300 -1.0e-3 )
        , ( 1, Fuzz.floatRange 1.0001 300 )
        ]
