module Tests (all) where

import ElmTest exposing (..)
import TestUtil exposing (outdented, prettyPrint)
import Compile
import Fixtures
import Properties


all : Test
all =
  suite
    "elm-css"
    [ Compile.all
    , keyValue
    , divWidthHeight
    , leftRightTopBottom
    , borders
    , atRule
    , nestedAtRule
    , multiSelector
    , multiDescendent
    , underlineOnHoverMixin
    , underlineOnHoverManual
    , greenOnHoverMixin
    , transformsStyle
    , standaloneAt
    , fonts
    , weightWarning
    , Properties.all
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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

          @media "print" {
              body {
                  margin: 2em;
              }
          }

          button {
              margin: auto;
          }
      """
  in
    suite
      "@media test"
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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

          @media "print" {
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
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
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
      ]


weightWarning : Test
weightWarning =
  let
    input =
      Fixtures.fontWeightWarning

    output =
      """
            Invalid Stylesheet:
            22 is invalid. Valid weights are: 100, 200, 300, 400, 500, 600, 700, 800, 900. Please see https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#Values"""
  in
    suite
      "fontWeightWarning"
      [ test "pretty prints the expected output"
          <| assertEqual (outdented output) (outdented (prettyPrint input))
      ]
