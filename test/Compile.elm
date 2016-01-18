module Compile (all) where

import ElmTest exposing (..)
import TestUtil exposing (outdented)
import Css exposing (compile)
import CompileFixtures

all : Test
all =
  suite
    "elm-css"
    [ unstyledDiv
    , dreamwriter
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
      [ test "pretty prints the expected output"
          <| assertEqual output (prettyPrint input)
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
      ]



prettyPrint style =
  case compile style of
    Ok result ->
      result

    Err message ->
      "Invalid Stylesheet: " ++ message
