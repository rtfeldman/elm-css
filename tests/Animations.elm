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
                        [ ( 0, [ backgroundColor red ] )
                        , ( 50, [ backgroundColor blue ] )
                        , ( 100, [ backgroundColor yellow ] )
                        ]
                    ]
                    |> prettyPrint
                    |> Expect.equal """@keyframes foo {
    0% {
            background-color: #FF4136;
    }
    50% {
            background-color: #0074D9;
    }
    100% {
            background-color: #FFDC00;
    }
}"""
        ]
