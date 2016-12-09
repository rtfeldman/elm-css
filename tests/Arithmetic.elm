module Arithmetic exposing (all)

import Test exposing (..)
import Fuzz
import Expect
import Css exposing (..)


all : Test
all =
    describe "arithmetic operators"
        [ describe "|+|"
            [ fuzzArithmetic "it is commutative" <|
                \leftArg rightArg ->
                    (em leftArg |+| em rightArg)
                        |> Expect.equal (em rightArg |+| em leftArg)
            , fuzzArithmetic "it distributes the +" <|
                \leftArg rightArg ->
                    (em leftArg |+| em rightArg)
                        |> Expect.equal (em (leftArg + rightArg))
            ]
        ]


fuzzArithmetic : String -> (Float -> Float -> Expect.Expectation) -> Test
fuzzArithmetic =
    fuzz2 (Fuzz.map toFloat Fuzz.int) (Fuzz.map toFloat Fuzz.int)
