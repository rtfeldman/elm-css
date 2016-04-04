module Compile (all) where

import ElmTest exposing (..)
import TestUtil exposing (outdented, prettyPrint, it)
import Tests.Expect exposing (expect)
import Check.Investigator exposing (..)
import CompileFixtures
import Random.Extra
import Random
import Shrink
import Css exposing (..)


all : Test
all =
  suite
    "elm-css"
    [ unstyledDiv
    , dreamwriter
    , colorWarnings
    ]


validRgbValue : Investigator Int
validRgbValue =
  investigator (Random.int 0 255) Shrink.int


validAlphaValue : Investigator Float
validAlphaValue =
  investigator (Random.float 0 1) Shrink.float


invalidRgbValue : Investigator Int
invalidRgbValue =
  let
    generator =
      Random.Extra.frequency
        [ ( 1, Random.int -300 -1 )
        , ( 1, Random.int 256 300 )
        ]
        (Random.int 256 300)
  in
    investigator generator Shrink.int


invalidAlphaValue : Investigator Float
invalidAlphaValue =
  let
    generator =
      Random.Extra.frequency
        [ ( 1, Random.float -300 -1.0e-3 )
        , ( 1, Random.float 1.0001 300 )
        ]
        (Random.float -300 -1.0e-3)
  in
    investigator generator Shrink.float


getRgbaWarnings : ( Int, Int, Int, Float ) -> Int
getRgbaWarnings ( red, green, blue, alpha ) =
  rgba red green blue alpha |> .warnings |> List.length


getRgbWarnings : ( Int, Int, Int ) -> Int
getRgbWarnings ( red, green, blue ) =
  rgb red green blue |> .warnings |> List.length


colorWarnings : Test
colorWarnings =
  suite
    "color warnings"
    [ (suite "rgb")
        [ (it "does not warn when everything is valid")
            (\_ -> 0)
            getRgbWarnings
            (tuple3 ( validRgbValue, validRgbValue, validRgbValue ))
        , (it "warns for invalid r values")
            (\_ -> 1)
            getRgbWarnings
            (tuple3 ( invalidRgbValue, validRgbValue, validRgbValue ))
        , (it "warns for invalid g values")
            (\_ -> 1)
            getRgbWarnings
            (tuple3 ( validRgbValue, invalidRgbValue, validRgbValue ))
        , (it "warns for invalid b values")
            (\_ -> 1)
            getRgbWarnings
            (tuple3 ( validRgbValue, validRgbValue, invalidRgbValue ))
        ]
    , (suite "rgba")
        [ (it "does not warn when everything is valid")
            (\_ -> 0)
            getRgbaWarnings
            (tuple4 ( validRgbValue, validRgbValue, validRgbValue, validAlphaValue ))
        , (it "warns for invalid r values")
            (\_ -> 1)
            getRgbaWarnings
            (tuple4 ( invalidRgbValue, validRgbValue, validRgbValue, validAlphaValue ))
        , (it "warns for invalid g values")
            (\_ -> 1)
            getRgbaWarnings
            (tuple4 ( validRgbValue, invalidRgbValue, validRgbValue, validAlphaValue ))
        , (it "warns for invalid b values")
            (\_ -> 1)
            getRgbaWarnings
            (tuple4 ( validRgbValue, validRgbValue, invalidRgbValue, validAlphaValue ))
        , (it "warns for invalid a values")
            (\_ -> 1)
            getRgbaWarnings
            (tuple4 ( validRgbValue, validRgbValue, validRgbValue, invalidAlphaValue ))
        ]
    ]


unstyledDiv : Test
unstyledDiv =
  let
    input =
      CompileFixtures.unstyledDiv

    output =
      ""
  in
    suite
      "unstyled div"
      [ (expect "pretty prints the expected output")
          { expected = output
          , actual = prettyPrint input
          }
      ]


dreamwriter : Test
dreamwriter =
  let
    input =
      CompileFixtures.dreamwriter

    output =
      """
            html, body {
              width: 100%;
              height: 100%;
              box-sizing: border-box;
              padding: 0;
              margin: 0;
            }

            body {
              min-width: 1280px;
              overflow-x: auto;
            }

            body > div {
              width: 100%;
              height: 100%;
            }

            .dreamwriterHidden {
              display: none !important;
            }

            #dreamwriterPage {
              width: 100%;
              height: 100%;
              box-sizing: border-box;
              margin: 0;
              padding: 8px;
              background-color: rgb(100, 90, 128);
              color: rgb(40, 35, 76);
            }
        """
  in
    suite
      "Sample stylesheet from Dreamwriter"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]
