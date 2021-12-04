module Keyframes exposing (assertEmptyKeyframesForProperty, suite, testEmptyKeyframes)

import Css exposing (..)
import Css.Animations as Anim exposing (Keyframes, keyframes)
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
                    [ ( 0, [ Anim.backgroundColor (hex "00FF00"), Anim.backgroundSize (px 2) ] )
                    , ( 50, [ Anim.opacity zero ] )
                    , ( 100, [ Anim.border (px 5), Anim.backgroundColor (rgb 11 22 33) ] )
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
            @keyframes _d72e57d0{0%{background-color:#00FF00;background-size:2px;}50%{opacity:0;}100%{border:5px;background-color:rgb(11,22,33);}}
            body{padding:0;}
            button{margin:auto;}
            p{color:#FF0000;display:inline;animation-name:_d72e57d0;background-color:rgb(11,11,11);}
            i{animation-name:_d72e57d0;}
            """
          in
          test "one keyframe" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        , let
            sampleKeyframes =
                keyframes
                    [ ( 0, [ Anim.backgroundColor (hex "00FF00"), Anim.backgroundSize (px 2) ] )
                    , ( 50, [ Anim.opacity zero ] )
                    , ( 100, [ Anim.border (px 5), Anim.backgroundColor (rgb 11 22 33) ] )
                    ]

            moreKeyframes =
                keyframes
                    [ ( 10, [ Anim.transform [ Css.translate (px 100) ] ] ) ]

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
            @keyframes _d72e57d0{0%{background-color:#00FF00;background-size:2px;}50%{opacity:0;}100%{border:5px;background-color:rgb(11,22,33);}}
            @keyframes _d952be4e{10%{transform:translate(100px);}}
            body{padding:0;}
            button{margin:auto;animation-name:_d952be4e;background-color:#0F0F0F;}
            p{color:#FF0000;display:inline;animation-name:_d72e57d0;background-color:rgb(11,11,11);}
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
        [ test "initial" (\_ -> assertEmptyKeyframesForProperty initial "initial")
        , test "unset" (\_ -> assertEmptyKeyframesForProperty unset "unset")
        , test "inherit" (\_ -> assertEmptyKeyframesForProperty inherit "inherit")
        , test "literal none" (\_ -> assertEmptyKeyframesForProperty none "none")
        , test "empty keyframes" (\_ -> assertEmptyKeyframesForProperty (keyframes []) "none")
        ]


assertEmptyKeyframesForProperty : Keyframes compatible -> String -> Expect.Expectation
assertEmptyKeyframesForProperty property expectedValue =
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
            body{padding:0;}
            p{color:#FF0000;animation-name:""" ++ expectedValue ++ """;}
            """
    in
    outdented (prettyPrint input)
        |> Expect.equal (outdented output)
