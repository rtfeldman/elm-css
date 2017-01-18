module Arithmetic exposing (all)

import Test exposing (..)
import Fuzz
import Expect
import Css exposing (em, (|+|), (|*|), (|/|), (|-|))


all : Test
all =
    describe "arithmetic operators"
        [ describe "|+|"
            [ fuzzArithmetic3 "it adds" <|
                \first second third ->
                    (em first |+| em second |+| em third)
                        |> Expect.equal (em (first + second + third))
            , fuzzArithmetic2 "it is commutative" <|
                \left right ->
                    (em left |+| em right)
                        |> Expect.equal (em right |+| em left)
            , fuzzArithmetic3 "it is associative" <|
                \first second third ->
                    (em first |+| em second |+| em third)
                        |> Expect.equal ((em first |+| em second) |+| em third)
            ]
        , describe "|*|"
            [ fuzzArithmetic3 "it multiplies" <|
                \first second third ->
                    (em first |*| em second |*| em third)
                        |> Expect.equal (em (first * second * third))
            , fuzzArithmetic2 "it is commutative" <|
                \left right ->
                    (em left |*| em right)
                        |> Expect.equal (em right |*| em left)
            , fuzzArithmetic3 "it is associative" <|
                \first second third ->
                    (em first |*| em second |*| em third)
                        |> Expect.equal ((em first |*| em second) |*| em third)
            ]
        , describe "|-|"
            [ fuzzArithmetic3 "it subtracts" <|
                \first second third ->
                    ((em first |-| em second) |-| em third)
                        |> Expect.equal (em ((first - second) - third))
            ]
        , describe "|/|"
            [ fuzzArithmetic3 "it divides" <|
                \first second third ->
                    if second == 0 || (first / second) == 0 then
                        -- Skip tests of division by zero.
                        Expect.pass
                    else
                        ((em first |/| em second) |/| em third)
                            |> Expect.equal (em ((first / second) / third))
            ]
        ]


fuzzArithmetic2 : String -> (Float -> Float -> Expect.Expectation) -> Test
fuzzArithmetic2 =
    fuzz2 (Fuzz.map toFloat Fuzz.int) (Fuzz.map toFloat Fuzz.int)


fuzzArithmetic3 : String -> (Float -> Float -> Float -> Expect.Expectation) -> Test
fuzzArithmetic3 =
    fuzz3 (Fuzz.map toFloat Fuzz.int) (Fuzz.map toFloat Fuzz.int) (Fuzz.map toFloat Fuzz.int)
