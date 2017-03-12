module Media exposing (all)

import Compile
import Css exposing (..)
import Css.Elements exposing (p, button, body, a)
import Css.Media as Media exposing (..)
import Css.Namespace exposing (namespace)
import Expect
import Test exposing (..)
import TestUtil exposing (outdented, prettyPrint)


all : Test
all =
    describe "media"
        [ Compile.all
        , mediaFeatures
        , mediaTypes
        , testMedia
        , testWithMedia
        , testMediaQuery
        , testWithMediaQuery
        ]


mediaTypes =
    describe "media types"
        [ testMediaType "all" Media.all
        , testMediaType "screen" screen
        , testMediaType "print" print
        , testMediaType "speech" speech
        , testMediaType "aural" aural
        , testMediaType "embossed" embossed
        , testMediaType "braille" braille
        , testMediaType "handheld" handheld
        , testMediaType "tv" tv
        , testMediaType "tty" tty
        , testMediaType "projection" projection
        ]


testMediaType str component =
    let
        actual =
            prettyPrint ((stylesheet << namespace "test") [ basicMediaQuery component ])

        expectedBody =
            "\n        p {\n    background-color: #FF0000;\n"

        expected =
            "@media " ++ str ++ " {" ++ expectedBody ++ "}\n}"
    in
        describe (str ++ " media type")
            [ test "pretty prints the expected output" <| \() -> Expect.equal expected actual ]


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
        , testBooleanFeature "color" Media.color
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
        , testBooleanFeature "monochrome" monochrome
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


testFeature : String -> List ( MediaQueryComponent, String ) -> Test
testFeature featureName modifierPairs =
    describe (featureName ++ " media feature")
        (List.map (expectFeatureWorks featureName) modifierPairs)


testBooleanFeature : String -> MediaQueryComponent -> Test
testBooleanFeature featureName component =
    let
        actual =
            prettyPrint ((stylesheet << namespace "test") [ basicMediaQuery component ])

        expectedBody =
            "\n        p {\n    background-color: #FF0000;\n"

        expected =
            "@media (" ++ featureName ++ ") {" ++ expectedBody ++ "}\n}"
    in
        describe (featureName ++ " media feature")
            [ test "pretty prints the expected output" <| \() -> Expect.equal expected actual ]


expectFeatureWorks : String -> ( MediaQueryComponent, String ) -> Test
expectFeatureWorks featureName ( component, expectedStr ) =
    let
        actual =
            prettyPrint ((stylesheet << namespace "test") [ basicMediaQuery component ])

        expectedBody =
            "\n        p {\n    background-color: #FF0000;\n"

        expected =
            "@media (" ++ featureName ++ ": " ++ expectedStr ++ ") {" ++ expectedBody ++ "}\n}"
    in
        describe "works properly"
            [ test "pretty prints the expected output" <| \() -> Expect.equal expected actual ]


basicMediaQuery component =
    media [ component ] [ p [ backgroundColor (hex "FF0000") ] ]


testMedia =
    let
        input =
            (stylesheet << namespace "homepage")
                [ body [ padding zero ]
                , media [ print ] [ body [ margin (Css.em 2) ] ]
                , media [ screen, Media.maxWidth (px 600) ]
                    [ body [ margin (Css.em 3) ] ]
                , button [ margin auto ]
                , media
                    [ screen, Media.color, Media.pointer fine, scan interlace, or, grid ]
                    [ p [ Css.color (hex "FF0000") ] ]
                , media [ Media.not, screen, Media.color ] [ p [ Css.color (hex "000000") ] ]
                , media [ only, speech, anyPointer fine ] [ p [ display block ] ]
                ]

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

            @media screen and (max-width: 600px) {
                body {
                    margin: 3em;
                }
            }

            button {
                margin: auto;
            }

            @media screen and (color) and (pointer: fine) and (scan: interlace),
            (grid) {
                p {
                    color: #FF0000;
                }
            }

            @media not screen and (color) {
                p {
                    color: #000000;
                }
            }

            @media only speech and (any-pointer: fine) {
                p {
                    display: block;
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


type CssClasses
    = Container


testWithMedia : Test
testWithMedia =
    let
        input =
            (stylesheet << namespace "homepage")
                [ button [ padding zero ]
                , body
                    [ Css.color (hex "333333")
                    , (withMedia [ print, or, monochrome ]) [ Css.color (hex "000000") ]
                    ]
                , a
                    [ Css.color (hex "FF0000")
                    , withMedia [ print ] [ textDecoration none ]
                    ]
                , class Container
                    [ Css.maxWidth (px 800)
                    , withMedia [ screen, Media.maxWidth (px 375), or, screen, Media.maxHeight (px 667) ]
                        [ Css.maxWidth (px 300) ]
                    ]
                ]

        output =
            """
            button {
                padding: 0;
            }

            body {
                color: #333333;
            }

            @media print,
            (monochrome) {
               body {
                   color: #000000;
               }
             }

            a {
               color: #FF0000;
            }

            @media print {
               a {
                   text-decoration: none;
               }
            }

            .homepageContainer {
               max-width: 800px;
            }

            @media screen and (max-width: 375px),
            screen and (max-height: 667px) {
                .homepageContainer {
                    max-width: 300px;
                }
            }
            """
    in
        describe "nested @media test"
            [ test "pretty prints the expected output" <|
                \_ ->
                    outdented (prettyPrint input)
                        |> Expect.equal (outdented output)
            ]


testMediaQuery : Test
testMediaQuery =
    let
        input =
            (stylesheet << namespace "homepage")
                [ mediaQuery [ "tv", "screen and (scan: interlace)" ]
                    [ body [ backgroundColor (hex "FFFFFF") ] ]
                ]

        output =
            """
            @media tv,
            screen and (scan: interlace) {
                body {
                    background-color: #FFFFFF;
                }
            }
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
            (stylesheet << namespace "homepage")
                [ body
                    [ fontSize (px 12)
                    , withMediaQuery [ "screen and (min-device-width: 600px)", "screen and (min-width: 600px)" ]
                        [ fontSize (px 14) ]
                    ]
                ]

        output =
            """
            body {
                font-size: 12px;
            }

            @media screen and (min-device-width: 600px),
            screen and (min-width: 600px) {
                body {
                    font-size: 14px;
                }
            }
            """
    in
        describe "withMediaQuery test"
            [ test "pretty prints the expected output" <|
                \_ ->
                    outdented (prettyPrint input)
                        |> Expect.equal (outdented output)
            ]
