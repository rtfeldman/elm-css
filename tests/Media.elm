module Media exposing (basicMediaQuery, bug352, expectFeatureWorks, mediaFeatures, mediaTypes, testFeature, testMedia, testMediaQuery, testMediaType, testUnparameterizedFeature, testWithMedia, testWithMediaQuery, withMediaInside, withMediaInsideAndOtheDeclarations, withMediaOutside, withMediaOutsideAndOtherDeclarations)

import Css exposing (..)
import Css.Global exposing (Snippet, a, body, button, class, li, media, mediaQuery, p, ul)
import Css.Media as Media exposing (..)
import Css.Preprocess exposing (stylesheet)
import Expect
import Test exposing (Test, describe, test)
import TestUtil exposing (outdented, prettyPrint)


mediaTypes : Test
mediaTypes =
    describe "media types"
        [ testMediaType "screen" screen
        , testMediaType "print" print
        , testMediaType "speech" speech
        ]


testMediaType : String -> MediaType -> Test
testMediaType str mediaType =
    let
        actual =
            prettyPrint (stylesheet [ basicMediaQuery (only mediaType []) ])

        expectedBody =
            "p{background-color:#FF0000;"

        expected =
            "@media only " ++ str ++ "{" ++ expectedBody ++ "}}"
    in
    describe (str ++ " media type")
        [ test "pretty prints the expected output" <| \() -> Expect.equal expected actual ]


mediaFeatures : Test
mediaFeatures =
    describe "media features"
        [ testFeature "min-width"
            [ ( Media.minWidth (px 600), "600px" )
            , ( Media.minWidth (em 300), "300em" )
            ]
        , testFeature "width"
            [ ( Media.width (pt 400), "400pt" )
            , ( Media.width (Css.rem 500), "500rem" )
            ]
        , testFeature "max-width"
            [ ( Media.maxWidth (cm 400), "400cm" )
            , ( Media.maxWidth (pc 500), "500pc" )
            ]
        , testFeature "min-height"
            [ ( Media.minHeight (pt 400), "400pt" )
            , ( Media.minHeight (Css.rem 500), "500rem" )
            ]
        , testFeature "height"
            [ ( Media.height (pt 400), "400pt" )
            , ( Media.height (Css.rem 500), "500rem" )
            ]
        , testFeature "max-height"
            [ ( Media.maxHeight (pt 400), "400pt" )
            , ( Media.maxHeight (Css.rem 500), "500rem" )
            ]
        , testFeature "min-aspect-ratio"
            [ ( minAspectRatio (ratio 4 3), "4/3" ) ]
        , testFeature "aspect-ratio"
            [ ( aspectRatio (ratio 16 10), "16/10" ) ]
        , testFeature "max-aspect-ratio"
            [ ( maxAspectRatio (ratio 16 9), "16/9" ) ]
        , testFeature "orientation"
            [ ( orientation landscape, "landscape" )
            , ( orientation portrait, "portrait" )
            ]
        , testFeature "min-resolution"
            [ ( minResolution (dpi 102), "102dpi" ) ]
        , testFeature "resolution"
            [ ( resolution (dpcm 100), "100dpcm" ) ]
        , testFeature "max-resolution"
            [ ( maxResolution (dppx 2), "2dppx" )
            , ( maxResolution (dppx 1.9), "1.9dppx" )
            ]
        , testFeature "scan"
            [ ( scan progressive, "progressive" )
            , ( scan interlace, "interlace" )
            ]
        , testFeature "update"
            [ ( update none, "none" )
            , ( update slow, "slow" )
            , ( update fast, "fast" )
            ]
        , testFeature "overflow-block"
            [ ( overflowBlock none, "none" )
            , ( overflowBlock scroll, "scroll" )
            , ( overflowBlock paged, "paged" )
            , ( overflowBlock optionalPaged, "optional-paged" )
            ]
        , testFeature "overflow-inline"
            [ ( overflowInline none, "none" )
            , ( overflowInline scroll, "scroll" )
            ]
        , testFeature "min-color"
            [ ( minColor (bits 8), "8" ) ]
        , testUnparameterizedFeature "color" Media.color
        , testFeature "max-color"
            [ ( maxColor (bits 24), "24" ) ]
        , testFeature "min-color-index"
            [ ( minColorIndex (int 256), "256" ) ]
        , testFeature "color-index"
            [ ( colorIndex (int 32768), "32768" ) ]
        , testFeature "max-color-index"
            [ ( maxColorIndex (int 16777216), "16777216" ) ]
        , testFeature "min-monochrome"
            [ ( minMonochrome (bits 1), "1" ) ]
        , testUnparameterizedFeature "monochrome" monochrome
        , testFeature "max-monochrome"
            [ ( maxMonochrome (bits 4), "4" ) ]
        , testFeature "color-gamut"
            [ ( colorGamut srgb, "srgb" )
            , ( colorGamut p3, "p3" )
            , ( colorGamut rec2020, "rec2020" )
            ]
        , testFeature "pointer"
            [ ( Media.pointer none, "none" )
            , ( Media.pointer fine, "fine" )
            , ( Media.pointer coarse, "coarse" )
            ]
        , testFeature "any-pointer"
            [ ( anyPointer none, "none" )
            , ( anyPointer fine, "fine" )
            , ( anyPointer coarse, "coarse" )
            ]
        , testFeature "hover"
            [ ( Media.hover none, "none" )
            , ( Media.hover canHover, "hover" )
            ]
        , testFeature "any-hover"
            [ ( anyHover none, "none" )
            , ( anyHover canHover, "hover" )
            ]
        , testFeature "scripting"
            [ ( scripting none, "none" )
            , ( scripting initialOnly, "initial-only" )
            , ( scripting Media.enabled, "enabled" )
            ]
        ]


testFeature : String -> List ( Expression, String ) -> Test
testFeature featureName modifierPairs =
    describe (featureName ++ " media feature")
        (List.indexedMap (expectFeatureWorks featureName) modifierPairs)


testUnparameterizedFeature : String -> Expression -> Test
testUnparameterizedFeature featureName component =
    let
        actual =
            prettyPrint (stylesheet [ basicMediaQuery (Media.all [ component ]) ])

        expectedBody =
            "p{background-color:#FF0000;"

        expected =
            "@media (" ++ featureName ++ "){" ++ expectedBody ++ "}}"
    in
    test ("pretty prints the expected boolean output" ++ featureName ++ " media feature") <| \() -> Expect.equal expected actual


expectFeatureWorks : String -> Int -> ( Expression, String ) -> Test
expectFeatureWorks featureName n ( component, expectedStr ) =
    let
        actual =
            prettyPrint (stylesheet [ basicMediaQuery (Media.all [ component ]) ])

        expectedBody =
            "p{background-color:#FF0000;"

        expected =
            "@media (" ++ featureName ++ ": " ++ expectedStr ++ "){" ++ expectedBody ++ "}}"
    in
    test ("pretty prints the expected feature output for:" ++ featureName ++ String.fromInt n) <| \() -> Expect.equal expected actual


basicMediaQuery : MediaQuery -> Snippet
basicMediaQuery query =
    media [ query ] [ p [ backgroundColor (hex "FF0000") ] ]


testMedia : Test
testMedia =
    let
        input =
            stylesheet
                [ body [ padding zero ]
                , media [ only print [] ] [ body [ margin (Css.em 2) ] ]
                , media [ only screen [ Media.maxWidth (px 600) ] ]
                    [ body [ margin (Css.em 3) ] ]
                , button [ margin auto ]
                , media
                    [ only screen [ Media.color, Media.pointer fine, scan interlace, grid ] ]
                    [ p [ Css.color (hex "FF0000") ] ]
                , media [ Media.not screen [ Media.color ] ] [ p [ Css.color (hex "000000") ] ]
                ]

        output =
            """
            body{padding:0;}
            @media only print{body{margin:2em;}}
            @media only screen and (max-width: 600px){body{margin:3em;}}
            button{margin:auto;}
            @media only screen and (color) and (pointer: fine) and (scan: interlace) and (grid){p{color:#FF0000;}}
            @media not screen and (color){p{color:#000000;}}
            """
    in
    describe "@media test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


testWithMedia : Test
testWithMedia =
    let
        input =
            stylesheet
                [ button [ padding zero ]
                , body
                    [ Css.color (hex "333333")
                    , withMedia [ only print [], Media.all [ monochrome ] ] [ Css.color (hex "000000") ]
                    ]
                , p
                    [ withMedia [ only screen [] ] [ textDecoration underline ]
                    , Css.color (hex "AA0000")
                    ]
                , a
                    [ withMedia [ only print [] ] [ textDecoration none ]
                    , withMedia [ only screen [] ] [ textDecoration underline ]
                    , Css.color (hex "BB0000")
                    ]
                , ul
                    [ Css.color (hex "CC0000")
                    , withMedia [ only print [] ] [ textDecoration none ]
                    , withMedia [ only screen [] ] [ textDecoration underline ]
                    ]
                , li
                    [ Css.color (hex "DD0000")
                    , withMedia [ only print [] ] [ textDecoration none ]
                    , withMedia [ only screen [] ] [ textDecoration underline ]
                    , Css.backgroundColor (hex "EE0000")
                    ]
                , class "Container"
                    [ Css.maxWidth (px 800)
                    , withMedia [ only screen [ Media.maxWidth (px 375) ], only screen [ Media.maxHeight (px 667) ] ]
                        [ Css.maxWidth (px 300) ]
                    ]
                ]

        output =
            """
            button{padding:0;}
            body{color:#333333;}
            @media only print, (monochrome){body{color:#000000;}}
            p{color:#AA0000;}
            @media only screen{p{text-decoration:underline;}}
            a{color:#BB0000;}
            @media only screen{a{text-decoration:underline;}}
            @media only print{a{text-decoration:none;}}
            ul{color:#CC0000;}
            @media only screen{ul{text-decoration:underline;}}
            @media only print{ul{text-decoration:none;}}
            li{color:#DD0000;background-color:#EE0000;}
            @media only screen{li{text-decoration:underline;}}
            @media only print{li{text-decoration:none;}}
            .Container{max-width:800px;}
            @media only screen and (max-width: 375px), only screen and (max-height: 667px){.Container{max-width:300px;}}
            """
    in
    describe "nested @media test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


withMediaOutside : Test
withMediaOutside =
    let
        input =
            stylesheet
                [ body
                    [ Css.color (hex "ff0000")
                    , nthOfType "2n+1"
                        [ withMedia [ only screen [ Media.minWidth (px 600) ] ]
                            [ marginRight (px 16) ]
                        ]
                    ]
                ]

        output =
            """
            body{color:#ff0000;}
            @media only screen and (min-width: 600px){body:nth-of-type(2n+1){margin-right:16px;}}
            """
    in
    describe "withMedia on the outside"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


withMediaOutsideAndOtherDeclarations : Test
withMediaOutsideAndOtherDeclarations =
    let
        input =
            stylesheet
                [ body
                    [ Css.color (hex "ff0000")
                    , nthOfType "2n+1"
                        [ withMedia [ only screen [ Media.minWidth (px 600) ] ]
                            [ marginRight (px 16) ]
                        ]
                    , Css.backgroundColor (hex "0000aa")
                    ]
                ]

        output =
            """
            body{color:#ff0000;background-color:#0000aa;}
            @media only screen and (min-width: 600px){body:nth-of-type(2n+1){margin-right:16px;}}
            """
    in
    describe "withMedia on the outside and other declarations"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


withMediaInside : Test
withMediaInside =
    let
        input =
            stylesheet
                [ body
                    [ withMedia [ only screen [ Media.minWidth (px 600) ] ]
                        [ nthOfType "2n+1"
                            [ marginRight (px 16) ]
                        ]
                    ]
                ]

        output =
            """
            @media only screen and (min-width: 600px){body:nth-of-type(2n+1){margin-right:16px;}}
            """
    in
    describe "withMedia on the inside"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


withMediaInsideAndOtheDeclarations : Test
withMediaInsideAndOtheDeclarations =
    let
        input =
            stylesheet
                [ body
                    [ Css.color (hex "ff0000")
                    , withMedia [ only screen [ Media.minWidth (px 600) ] ]
                        [ nthOfType "2n+1"
                            [ marginRight (px 16) ]
                        ]
                    , Css.backgroundColor (hex "0000aa")
                    ]
                ]

        output =
            """
            body{color:#ff0000;background-color:#0000aa;}
            @media only screen and (min-width: 600px){body:nth-of-type(2n+1){margin-right:16px;}}
            """
    in
    describe "withMedia on the inside and other declarations"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


bug352 : Test
bug352 =
    let
        input =
            stylesheet
                [ button [ padding zero ]
                , body
                    [ Css.color (hex "333333")
                    , nthOfType "2n+1"
                        [ withMedia [ only screen [ Media.minWidth (px 600) ] ]
                            [ marginRight (px 16) ]
                        ]
                    ]
                , a
                    [ Css.color (hex "FF0000")
                    , withMedia [ only print [] ] [ textDecoration none ]
                    , nthOfType "2n+1"
                        [ withMedia [ only screen [ Media.minWidth (px 600) ] ]
                            [ marginRight (px 16) ]
                        ]
                    ]
                , class "Container"
                    [ Css.maxWidth (px 800)
                    , withMedia [ only screen [ Media.maxWidth (px 375) ], only screen [ Media.maxHeight (px 667) ] ]
                        [ Css.maxWidth (px 300) ]
                    , Css.maxHeight (px 600)
                    ]
                ]

        output =
            """
            button{padding:0;}
            body{color:#333333;}
            @media only screen and (min-width: 600px){body:nth-of-type(2n+1){margin-right:16px;}}
            a{color:#FF0000;}
            @media only screen and (min-width: 600px){a:nth-of-type(2n+1){margin-right:16px;}}
            @media only print{a{text-decoration:none;}}
            .Container{max-width:800px;max-height:600px;}
            @media only screen and (max-width: 375px), only screen and (max-height: 667px){.Container{max-width:300px;}}
            """
    in
    describe "Regression test for #352"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


testMediaQuery : Test
testMediaQuery =
    let
        input =
            stylesheet
                [ mediaQuery [ "tv", "screen and (scan: interlace)" ]
                    [ body [ backgroundColor (hex "FFFFFF") ] ]
                ]

        output =
            """
            @media tv, screen and (scan: interlace){body{background-color:#FFFFFF;}}
            """
    in
    describe "mediaQuery test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


testWithMediaQuery : Test
testWithMediaQuery =
    let
        input =
            stylesheet
                [ body
                    [ fontSize (px 12)
                    , withMediaQuery [ "screen and (min-device-width: 600px)", "screen and (min-width: 600px)" ]
                        [ fontSize (px 14) ]
                    ]
                ]

        output =
            """
            body{font-size:12px;}
            @media screen and (min-device-width: 600px), screen and (min-width: 600px){body{font-size:14px;}}
            """
    in
    describe "withMediaQuery test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]
