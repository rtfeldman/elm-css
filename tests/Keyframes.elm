module Keyframes exposing (..)

import Css exposing (..)
import Css.Global exposing (Snippet, a, body, button, class, i, li, media, mediaQuery, p, ul)
import Css.Preprocess exposing (stylesheet)
import Expect
import Test exposing (Test, describe, test, todo)
import TestUtil exposing (outdented, prettyPrint)


suite : Test
suite =
    describe "@keyframes"
        [ let
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
                    , i [ animationName sampleKeyframes ]
                    ]

            output =
                """
            body {
                padding:0;
            }

            button {
                margin:auto;
            }

            p {
                color:#FF0000;
                display:inline;
                animation-name:_e5ef3caa;
                background-color:rgb(11, 11, 11);
            }

            i {
                animation-name:_e5ef3caa;
            }

            @keyframes _e5ef3caa {
                0% {color:#00FF00;display:block;}

                50% {max-height:none;}

                100% {color:#00FF00;display:inline-block;}
            }
            """
          in
          test "one keyframe" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        , let
            sampleKeyframes =
                keyframes
                    [ ( 0, [ Css.color (hex "00FF00"), display block ] )
                    , ( 50, [ Css.maxHeight none ] )
                    , ( 100, [ Css.color (hex "00FF00"), display inlineBlock ] )
                    ]

            moreKeyframes =
                keyframes
                    [ ( 10, [ Css.minHeight (px 100) ] ) ]

            input =
                stylesheet
                    [ body [ padding zero ]
                    , button
                        [ margin auto
                        , animationName moreKeyframes
                        , Css.backgroundColor (hex "0F0F0F")
                        ]
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

            button {
                margin:auto;
                animation-name:_85cdb76;
                background-color:#0F0F0F;
            }

            @keyframes _85cdb76 {
                10% {min-height:100px;}
            }

            p {
                color:#FF0000;
                display:inline;
                animation-name:_e5ef3caa;
                background-color:rgb(11, 11, 11);
            }

            @keyframes _e5ef3caa {
                0% {color:#00FF00;display:block;}

                50% {max-height:none;}

                100% {color:#00FF00;display:inline-block;}
            }
            """
          in
          test "multiple keyframes" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


testEmptyKeyframes : Test
testEmptyKeyframes =
    describe "@keyframes with special cases for value"
        [ test "initial" (\_ -> assertEmtyKeyframesForProperty initial "initial")
        , test "unset" (\_ -> assertEmtyKeyframesForProperty unset "unset")
        , test "inherit" (\_ -> assertEmtyKeyframesForProperty inherit "inherit")
        , test "literal none" (\_ -> assertEmtyKeyframesForProperty none "none")
        , test "empty keyframes" (\_ -> assertEmtyKeyframesForProperty (keyframes []) "none")
        ]


assertEmtyKeyframesForProperty : Keyframes compatible -> String -> Expect.Expectation
assertEmtyKeyframesForProperty property expectedValue =
    let
        input =
            stylesheet
                [ body [ padding zero ]
                , p
                    [ Css.color (hex "FF0000")
                    , animationName property
                    ]
                ]

        output =
            """
            body {
                padding:0;
            }

            p {
                color:#FF0000;
                animation-name:""" ++ expectedValue ++ """;
            }
            """
    in
    outdented (prettyPrint input)
        |> Expect.equal (outdented output)
