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
        , dreamwriter
        , multiDescendent
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


dreamwriter : Test
dreamwriter =
    let
        input =
            Fixtures.dreamwriter

        output =
            String.trim """
html, body {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  padding: 0px;
  margin: 0px;
}

body {
  min-width: 1280px;
  overflow-x: auto;
}

body > div {
  width: 100%;
  height: 100%;
}

.Hidden {
  display: none !important;
}

#Page {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  margin: 0px;
  padding: 8px;
  background-color: rgb(100, 90, 128);
  color: rgb(40, 35, 76);
}

      """
    in
        suite "Sample stylesheet from Dreamwriter"
            [ test "pretty prints the expected output" <|
                assertEqual output (prettyPrint input)

multiDescendent : Test
multiDescendent =
    let
        input =
            Fixtures.multiDescendent

        output =
            String.trim """
html, body {
  box-sizing: border-box;
  display: none;
}

html, body > div {
  width: 100%;
  height: 100%;
}

h1, h2 {
  padding: 0px;
  margin: 0px;
}

h1, h2 > h3, h1, h2 > h4 {
  width: 100%;
  height: 100%;
}

span {
  padding: 10px;
  margin: 11px;
}

span > h2, span > h1 {
  width: 1px;
  height: 2%;
}
        """
    in
        suite "Multi-descendent stylesheet"
            [ test "pretty prints the expected output" <|
                assertEqual output (prettyPrint input)
            ]
