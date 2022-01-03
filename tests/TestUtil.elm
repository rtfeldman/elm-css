module TestUtil exposing (invalidAlphaValue, invalidRgbValue, outdented, prettyPrint, validAlphaValue, validRgbValue)

import Css.Preprocess exposing (Stylesheet)
import Css.Preprocess.Resolve exposing (compile)
import Fuzz exposing (Fuzzer)
import String


outdented : String -> String
outdented str =
    str
        |> String.split "\n"
        |> List.map String.trim
        |> String.join "\n"
        |> String.trim


prettyPrint : Stylesheet -> String
prettyPrint sheet =
    compile sheet


validRgbValue : Fuzzer Int
validRgbValue =
    Fuzz.intRange 0 255


validAlphaValue : Fuzzer Float
validAlphaValue =
    Fuzz.floatRange 0 1


invalidRgbValue : Fuzzer Int
invalidRgbValue =
    Fuzz.frequency
        [ ( 1, Fuzz.intRange -300 -1 )
        , ( 1, Fuzz.intRange 256 300 )
        ]


invalidAlphaValue : Fuzzer Float
invalidAlphaValue =
    Fuzz.frequency
        [ ( 1, Fuzz.floatRange -300 -1.0e-3 )
        , ( 1, Fuzz.floatRange 1.0001 300 )
        ]
