module Animations exposing (all)

import Test exposing (..)
import Expect
import TestUtil exposing (prettyPrint)
import Css exposing (..)
import Css.Colors exposing (..)


all : Test
all =
    describe "animations"
        [ animations ]


animations : Test
animations =
    describe "Animations"
        [ test "keyframes" <|
            \() ->
                stylesheet
                    [ keyframes "foo"
                        [ ( 0, [ backgroundColor red, color black ] )
                        , ( 50, [ backgroundColor blue, color black ] )
                        , ( 100, [ backgroundColor yellow, color black ] )
                        ]
                    ]
                    |> prettyPrint
                    |> Expect.equal """@keyframes foo {
    0% {
        background-color: #FF4136;
        color: #111111;
    }
    50% {
        background-color: #0074D9;
        color: #111111;
    }
    100% {
        background-color: #FFDC00;
        color: #111111;
    }
}"""
        ]
