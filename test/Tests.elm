module Tests (all) where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (..)
import Stylesheets
import Fixtures

import String


prettyPrint =
    Stylesheets.prettyPrint 2


all : Test
all =
    suite "elm-stylesheets"
        [ divWidthHeight
        ]


divWidthHeight : Test
divWidthHeight =
    let
        input =
            Fixtures.divWidthHeight

        output =
            "div {\n  width: 32%;\n  height: 50px;\n}"
    in
        suite "basic div with fixed width and height"
            [ test "pretty prints the expected output" <|
                assertEqual output (prettyPrint input)
            ]
