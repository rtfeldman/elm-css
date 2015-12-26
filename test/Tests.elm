module Tests (all) where

import ElmTest exposing (..)
import Css
import Css.File exposing (compile)
import FixturesCss as Fixtures
import String


prettyPrint style =
    case compile style of
        Ok result ->
            result

        Err message ->
            "Invalid Stylesheet: " ++ message


all : Test
all =
    suite
        "elm-stylesheets"
        [ unstyledDiv
        , keyValue
        , divWidthHeight
        , leftRightTopBottom
        , borders
        , dreamwriter
        , multiDescendent
        , multiSelector
        , underlineOnHoverMixin
        , underlineOnHoverManual
        , greenOnHoverMixin
        ]


unstyledDiv : Test
unstyledDiv =
    let
        input =
            Fixtures.unstyledDiv

        output =
            "div {\n\n}"
    in
        suite
            "unstyled div"
            [ test "pretty prints the expected output"
                <| assertEqual output (prettyPrint input)
            ]


divWidthHeight : Test
divWidthHeight =
    let
        input =
            Fixtures.divWidthHeight

        output =
            "div {\n    width: 32%;\n    height: 50px;\n}"
    in
        suite
            "basic div with fixed width and height"
            [ test "pretty prints the expected output"
                <| assertEqual output (prettyPrint input)
            ]


leftRightTopBottom : Test
leftRightTopBottom =
    let
        input =
            Fixtures.leftRightTopBottom

        output = """
            div {
                position: absolute;
                top: 2em;
                left: 5px;
                text-align: left;
                vertical-align: bottom;
            }

            a {
                position: relative;
                right: 0;
                text-align: right;
                bottom: 2em;
                vertical-align: top;
            }
        """
    in
        suite
            "left & right, top & bottom property/value duality test"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


borders : Test
borders =
    let
        input =
            Fixtures.borders

        output = """
            button {
                border-left: 5px dashed rgb(11, 14, 17);
                border-right: 7px;
                border-image-outset: 3 4em;
            }

            a {
                border: 10px solid;
            }
        """
    in
        suite
            "Borders test"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


dreamwriter : Test
dreamwriter =
    let
        input =
            Fixtures.dreamwriter

        output = """
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

            #Page {
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


multiDescendent : Test
multiDescendent =
    let
        input =
            Fixtures.multiDescendent

        output = """
            html, body {
              box-sizing: border-box;
              display: none;
            }

            html > div, body > div {
              width: 100%;
              height: 100%;
            }

            h1, h2 {
              padding: 0;
              margin: 0;
            }

            h1 > h3, h2 > h3 {
              width: 100%;
            }

            h1 > h3 > h4, h2 > h3 > h4 {
              height: 100%;
            }

            span {
              padding: 10px;
              margin: 11px;
            }

            span > h2 > h1 {
              width: 1px;
              height: 2%;
            }
        """
    in
        suite
            "Multi-descendent stylesheet"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


multiSelector : Test
multiSelector =
    let
        input =
            Fixtures.multiSelector

        output = """
          div#Page.multiSelectorHidden {
            display: none;
            width: 100%;
            height: 100%;
          }

          span {
            padding: 10px;
            margin: 11px;
          }

          span > h2 > h1 {
            width: 1px;
            height: 2%;
          }
        """
    in
        suite
            "Multi-descendent stylesheet"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


keyValue : Test
keyValue =
    let
        input =
            Fixtures.keyValue

        output = """
          body {
            -webkit-font-smoothing: none;
            -moz-font-smoothing: none !important;
          }
        """
    in
        suite
            "Arbitrary key-value properties"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


outdented : String -> String
outdented str =
    str
        |> String.split "\n"
        |> List.map String.trim
        |> String.join "\n"
        |> String.trim


underlineOnHoverMixin : Test
underlineOnHoverMixin =
    let
        input =
            Fixtures.mixinUnderlineOnHoverStyle

        output =
            """
            a {
                color: rgb(128, 127, 126);
            }

            a:hover {
                color: rgb(23, 24, 25);
            }
            """
    in
        suite
            "underline on hover link (mixin)"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


underlineOnHoverManual : Test
underlineOnHoverManual =
    let
        input =
            Fixtures.manualUnderlineOnHoverStyle

        output =
            """
            a {
                color: rgb(128, 127, 126);
            }

            a:hover {
                color: rgb(23, 24, 25);
            }
            """
    in
        suite
            "underline on hover link (manual)"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]


greenOnHoverMixin : Test
greenOnHoverMixin =
    let
        input =
            Fixtures.mixinGreenOnHoverStyle

        output =
            """
            button {
                color: rgb(11, 22, 33);
            }

            button:hover {
                color: rgb(0, 0, 122);
            }
            """
    in
        suite
            "green on hover (mixin)"
            [ test "pretty prints the expected output"
                <| assertEqual (outdented output) (outdented (prettyPrint input))
            ]
