module AtRules exposing (all)

import Test exposing (..)
import Expect exposing (Expectation)
import TestUtil exposing (outdented, prettyPrint)
import Fixtures


all : Test
all =
    describe "at-rules"
        [ mediaQueryTests
        , nestedAtRules
        , fontFaceTests
        ]


fontFaceTests : Test
fontFaceTests =
    let
        input =
            Fixtures.fontFaceAtRule

        output =
            """
        @font-face {
          font-family: "MyFontName";
          src: url(https://example.com/fonts/MyFont-Weird.ttf),
            url(https://example.com/fonts/MyFont-Odd.ttf);
          font-variant: small-caps;
          font-weight: 500;
          font-style: italic;
        }

        @font-face {
          font-family: "MyFontName";
          src: url(https://example.com/fonts/MyFont-Bold.woff);
          font-weight: bold;
        }
    """
    in
        describe "@font-face"
            [ test "pretty prints the expected output" <|
                \_ ->
                    outdented (prettyPrint input)
                        |> Expect.equal (outdented output)
            ]


mediaQueryTests : Test
mediaQueryTests =
    let
        input =
            Fixtures.mediaQueryAtRule

        output =
            """
          body {
              padding: 0;
          }

          @media print {
              body {
                  margin: 2em;
              }
          }

          @media screen and ( max-width: 600px ) {
              body {
                  margin: 3em;
              }
          }

          button {
              margin: auto;
          }
      """
    in
        describe "@media test"
            [ test "pretty prints the expected output" <|
                \_ ->
                    outdented (prettyPrint input)
                        |> Expect.equal (outdented output)
            ]


nestedAtRules : Test
nestedAtRules =
    let
        input =
            Fixtures.nestedAtRule

        output =
            """
          button {
              padding: 0;
          }

          body {
              margin: auto;
          }

          @media print {
              body {
                  margin: 2em;
              }
          }

          a {
              text-decoration: none;
          }
      """
    in
        describe "nested @media test"
            [ test "pretty prints the expected output" <|
                \_ ->
                    outdented (prettyPrint input)
                        |> Expect.equal (outdented output)
            ]
