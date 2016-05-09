module Tests (all) where

import ElmTest exposing (..)
import TestUtil exposing (outdented, prettyPrint)
import Tests.Expect exposing (expect)
import Compile
import Fixtures
import Properties


all : Test
all =
  suite
    "elm-css"
    [ Compile.all
    , unstyledDiv
    , keyValue
    , simpleEach
    , divWidthHeight
    , leftRightTopBottom
    , borders
    , atRule
    , nestedAtRule
    , bug99
    , universal
    , multiSelector
    , multiDescendent
    , underlineOnHoverMixin
    , underlineOnHoverManual
    , greenOnHoverMixin
    , transformsStyle
    , fonts
    , weightWarning
    , hexWarning
    , Properties.all
    ]


unstyledDiv : Test
unstyledDiv =
  let
    input =
      Fixtures.unstyledDiv

    output =
      ""
  in
    suite
      "unstyled div"
      [ (expect "pretty prints nothing, because the stylesheet had no properties.")
          { expected = output
          , actual = prettyPrint input
          }
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


simpleEach : Test
simpleEach =
  let
    input =
      Fixtures.simpleEach

    output =
      """
            span {
                width: 30px;
                height: 2em;
            }

            html, body {
                box-sizing: border-box;
                display: none;
            }

            button {
                color: rgb(22, 23, 24);
                padding: 0;
            }
      """
  in
    suite
      "simple each function test"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


leftRightTopBottom : Test
leftRightTopBottom =
  let
    input =
      Fixtures.leftRightTopBottom

    output =
      """
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
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


atRule : Test
atRule =
  let
    input =
      Fixtures.atRule

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
    suite
      "@media test"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


nestedAtRule : Test
nestedAtRule =
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
    suite
      "nested @media test"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


{-| Regression test for https://github.com/rtfeldman/elm-css/issues/99
-}
bug99 : Test
bug99 =
  let
    input =
      Fixtures.bug99

    output =
      """
article {
    margin: 0;
}

article > header {
    margin: 1em;
}

article > section {
    margin: 2px;
}

article > nav {
    margin: 3%;
}        """
  in
    suite
      "Parents do not print duplicate rules for each child."
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


borders : Test
borders =
  let
    input =
      Fixtures.borders

    output =
      """
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
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


multiDescendent : Test
multiDescendent =
  let
    input =
      Fixtures.multiDescendent

    output =
      """
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
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


universal : Test
universal =
  let
    input =
      Fixtures.universal

    output =
      """
          * {
            display: none;
          }

          * > * {
            width: 100%;
            height: 100%;
          }

          span > * {
            margin: 11px;
          }
        """
  in
    suite
      "Universal selector stylesheet"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


multiSelector : Test
multiSelector =
  let
    input =
      Fixtures.multiSelector

    output =
      """
          div.multiSelectorPage.multiSelectorHidden {
            display: none;
            width: 100%;
            height: 100%;
          }

          span {
            padding: 10px;
            margin: 11px;
          }
        """
  in
    suite
      "Multi-selector stylesheet"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


keyValue : Test
keyValue =
  let
    input =
      Fixtures.keyValue

    output =
      """
          body {
            -webkit-font-smoothing: none;
            -moz-font-smoothing: none !important;
          }
        """
  in
    suite
      "Custom key-value properties"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


underlineOnHoverMixin : Test
underlineOnHoverMixin =
  let
    input =
      Fixtures.mixinUnderlineOnHoverStylesheet

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
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


underlineOnHoverManual : Test
underlineOnHoverManual =
  let
    input =
      Fixtures.manualUnderlineOnHoverStylesheet

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
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


greenOnHoverMixin : Test
greenOnHoverMixin =
  let
    input =
      Fixtures.mixinGreenOnHoverStylesheet

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
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


transformsStyle : Test
transformsStyle =
  let
    input =
      Fixtures.transformsStylesheet

    output =
      """
            body {
                transform: none;
                transform: matrix(1, 2, 3, 4, 5, 6) matrix3d(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
                transform: perspective(1);
                transform: rotate(90deg) rotateX(3.14rad) rotateY(3.14grad) rotateZ(1turn) rotate3d(1, 1, 1, 90deg);
                transform: scale(1) scale(1, 1) scaleX(1) scaleY(1) scale3d(1, 1, 1);
                transform: skew(90deg) skew(90deg, 90deg) skewX(90deg) skewY(90deg);
                transform: translate(1px) translate(1px, 1px) translateX(1px) translateY(1px) translate3d(1px, 1px, 1px);
                transform-box: view-box;
                transform-style: preserve-3d;
            }
            """
  in
    suite
      "transforms"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


fonts : Test
fonts =
  let
    input =
      Fixtures.fontStylesheet

    output =
      """
            body {
                line-height: 14px;
                font-family: serif;
                font-family: "Gill Sans Extrabold", Helvetica, sans-serif;
                font-size: x-small;
                font-style: italic;
                font-weight: bold;
                font-weight: 100;
                font-variant: small-caps;
                font-variant: common-ligatures slashed-zero;
                font-variant-numeric: oldstyle-nums tabular-nums stacked-fractions ordinal slashed-zero;
            }
            """
  in
    suite
      "fonts"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


weightWarning : Test
weightWarning =
  let
    input =
      Fixtures.fontWeightWarning

    output =
      """
            Invalid Stylesheet:
            fontWeight 22 is invalid. Valid weights are: 100, 200, 300, 400, 500, 600, 700, 800, 900. Please see https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#Values"""
  in
    suite
      "fontWeightWarning"
      [ (expect "pretty prints the expected output")
          { expected = outdented output
          , actual = outdented (prettyPrint input)
          }
      ]


hexWarning : Test
hexWarning =
  let
    input1 =
      Fixtures.colorHexWarning

    input2 =
      Fixtures.colorHexAbbrWarning

    output1 =
      """
            Invalid Stylesheet:
            The syntax of a hex-color is a token whose value consists of 3, 4, 6, or 8 hexadecimal digits. #ababah is not valid. Please see: https://drafts.csswg.org/css-color/#hex-notation"""

    output2 =
      """
            Invalid Stylesheet:
            The syntax of a hex-color is a token whose value consists of 3, 4, 6, or 8 hexadecimal digits. #00i is not valid. Please see: https://drafts.csswg.org/css-color/#hex-notation"""
  in
    suite
      "colorHexWarning"
      [ (expect "pretty prints the expected output")
          { expected = outdented output1
          , actual = outdented (prettyPrint input1)
          }
      , (expect "pretty prints the expected output")
          { expected = outdented output2
          , actual = outdented (prettyPrint input2)
          }
      ]
