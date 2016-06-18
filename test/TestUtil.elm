module TestUtil exposing (..)

import String
import Css exposing (Snippet, rgb, rgba)
import Fuzz exposing (Fuzzer)
import Random.Pcg as Random exposing (Generator)


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
            Css.compile sheet
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
    frequencyOrCrash
        [ ( 1, Fuzz.intRange -300 -1 )
        , ( 1, Fuzz.intRange 256 300 )
        ]


invalidAlphaValue : Fuzzer Float
invalidAlphaValue =
    frequencyOrCrash
        [ ( 1, Fuzz.floatRange -300 -1.0e-3 )
        , ( 1, Fuzz.floatRange 1.0001 300 )
        ]


frequency : List ( Float, Fuzzer a ) -> Result String (Fuzzer a)
frequency list =
    case List.head list of
        Nothing ->
            Err "You must provide at least one frequency pair."

        Just ( _, { shrinker } ) ->
            if List.any (\( weight, _ ) -> weight < 0) list then
                Err "No frequency weights can be less than 0."
            else if List.sum (List.map fst list) <= 0 then
                Err "Frequency weights must sum to more than 0."
            else
                let
                    generator =
                        list
                            |> List.map toGeneratorFrequency
                            |> Random.frequency
                in
                    Ok (Fuzzer generator shrinker)


toGeneratorFrequency : ( Float, Fuzzer a ) -> ( Float, Generator a )
toGeneratorFrequency ( weight, { generator } ) =
    ( weight, generator )


frequencyOrCrash : List ( Float, Fuzzer a ) -> Fuzzer a
frequencyOrCrash =
    frequency >> okOrCrash


okOrCrash : Result String a -> a
okOrCrash result =
    case result of
        Ok a ->
            a

        Err str ->
            Debug.crash str
