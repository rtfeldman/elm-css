module Keyframes exposing (..)

import Css exposing (..)
import Css.Global exposing (Snippet, a, body, button, class, li, media, mediaQuery, p, ul)
import Css.Preprocess exposing (stylesheet)
import Expect
import Test exposing (Test, describe, test, todo)
import TestUtil exposing (outdented, prettyPrint)


testKeyframes : Test
testKeyframes =
    let
        sampleKeyframes =
            keyframes
                [ ( 0, [ Css.color (hex "00FF00"), display block ] )
                , ( 50, [ Css.maxHeight none ] )
                , ( 100, [ Css.color (hex "00FF00"), display inlineBlock ] )
                ]

        input =
            stylesheet
                [ body [ padding zero ]
                , button [ margin auto ]
                , p
                    [ Css.color (hex "FF0000")
                    , display inline
                    , animationName sampleKeyframes
                    , Css.backgroundColor (Css.rgb 11 11 11)
                    ]
                ]

        output =
            """
            body {
                padding:0;
            }

            @media only print {
                body {
                    margin:2em;
                }
            }

            @media only screen and (max-width: 600px) {
                body {
                    margin:3em;
                }
            }

            button {
                margin:auto;
            }

            @media only screen and (color) and (pointer: fine) and (scan: interlace) and (grid) {
                p {
                    color:#FF0000;
                }
            }

            @media not screen and (color) {
                p {
                    color:#000000;
                }
            }
            """
    in
    describe "@media test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]
