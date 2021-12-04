module Tests exposing (atRule, attributeCombinator, backgrounds, borders, bug140, bug280, bug335, bug99, divWidthHeight, fonts, greenOnHoverStyle, importantOnBatch, keyValue, leftRightTopBottom, multiDescendent, multiSelector, nestedAtRule, nestedEach, pseudoClasses, pseudoElements, simpleEach, transformsStyle, underlineOnHoverManual, underlineOnHoverStyle, universal, unstyledDiv)

import Expect exposing (Expectation)
import Fixtures
import Test exposing (..)
import TestUtil exposing (outdented, prettyPrint)


unstyledDiv : Test
unstyledDiv =
    let
        input =
            Fixtures.unstyledDiv

        output =
            ""
    in
    describe "unstyled div"
        [ test "pretty prints nothing, because the stylesheet had no properties." <|
            \_ ->
                prettyPrint input
                    |> Expect.equal output
        ]


divWidthHeight : Test
divWidthHeight =
    let
        actual =
            Fixtures.divWidthHeight

        expected =
            "div{width:32%;height:50px;}"
    in
    describe "basic div with fixed width and height"
        [ test "pretty prints the expected output" <|
            \_ ->
                prettyPrint actual
                    |> Expect.equal expected
        ]


simpleEach : Test
simpleEach =
    let
        input =
            Fixtures.simpleEach

        output =
            """
            span{width:30px;height:2em;}
            html,body{box-sizing:border-box;display:none;}
            button{color:rgb(22,23,24);padding:0;}
      """
    in
    describe "simple each function test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


leftRightTopBottom : Test
leftRightTopBottom =
    let
        input =
            Fixtures.leftRightTopBottom

        output =
            """
            div{position:absolute;top:2em;left:5px;text-align:left;vertical-align:bottom;}
            a{position:relative;right:0;text-align:right;bottom:2em;vertical-align:top;}
        """
    in
    describe "left & right, top & bottom property/value duality test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


atRule : Test
atRule =
    let
        input =
            Fixtures.atRule

        output =
            """
          body{padding:0;}
          @media only print{body{margin:2em;}}
          @media screen and ( max-width: 600px ){body{margin:3em;}}
          button{margin:auto;}
      """
    in
    describe "@media test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


nestedAtRule : Test
nestedAtRule =
    let
        input =
            Fixtures.nestedAtRule

        output =
            """
          button{padding:0;}
          body{margin:auto;}
          @media only print{body{margin:2em;}}
          a{text-decoration:none;}
      """
    in
    describe "nested @media test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


{-| Regression test for <https://github.com/rtfeldman/elm-css/issues/140>
-}
bug140 : Test
bug140 =
    let
        input =
            Fixtures.bug140

        output =
            """
input:focus,select:focus,textarea:focus{border-color:#000000;}
input::after,select::after,textarea::after{color:#aaaaaa;}
            """
    in
    describe "`each` with pseudo classes"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


{-| Regression test for <https://github.com/rtfeldman/elm-css/issues/99>
-}
bug99 : Test
bug99 =
    let
        input =
            Fixtures.bug99

        output =
            """
article{margin:0;}
article > header{margin:1em;}
article > section{margin:2px;}
article > nav{margin:3%;}
"""
    in
    describe "Parents do not print duplicate rules for each child."
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


borders : Test
borders =
    let
        input =
            Fixtures.borders

        output =
            """
            button{border-left:5px dashed rgb(11,14,17);border-right:7px;border-image-outset:3 4em;}
            a{border:10px solid;}
            table{border-spacing:10px;}
        """
    in
    describe "Borders test"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


multiDescendent : Test
multiDescendent =
    let
        input =
            Fixtures.multiDescendent

        output =
            """
            html,body{box-sizing:border-box;display:none;}
            html > div,body > div{width:100%;height:100%;}
            h1,h2{padding:0;margin:0;}
            h1 > h3,h2 > h3{width:100%;}
            h1 > h3 > h4,h2 > h3 > h4{height:100%;}
            span{padding:10px;margin:11px;}
            span > h2 > h1{width:1px;height:2%;}
        """
    in
    describe "Multi-descendent stylesheet"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


universal : Test
universal =
    let
        input =
            Fixtures.universal

        output =
            """
          *{display:none;}
          * > *{width:100%;height:100%;}
          span > *{margin:11px;}
        """
    in
    describe "Universal selector stylesheet"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


multiSelector : Test
multiSelector =
    let
        input =
            Fixtures.multiSelector

        output =
            """
          div.Page.Hidden{display:none;width:100%;height:100%;}
          span{padding:10px;margin:11px;}
        """
    in
    describe "Multi-selector stylesheet"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


attributeCombinator : Test
attributeCombinator =
    let
        input =
            Fixtures.attributeCombinator

        output =
            """
          custom-element-one[data-custom-attribute]{display:none;}
          custom-element-two[data-custom-attribute=value][data-other-attribute]{display:none;}
            """
    in
    describe "withAttribute combinator"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


keyValue : Test
keyValue =
    let
        input =
            Fixtures.keyValue

        output =
            """
          body{-webkit-font-smoothing:none;-moz-font-smoothing:none !important;}
        """
    in
    describe "Custom key-value properties"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


importantOnBatch : Test
importantOnBatch =
    let
        input =
            Fixtures.importantOnBatch

        output =
            """
            div{color:#000 !important;width:100% !important;}
            """
    in
    describe "Important on batch"
        [ test "Using important on batch" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


underlineOnHoverStyle : Test
underlineOnHoverStyle =
    let
        input =
            Fixtures.styleUnderlineOnHoverStylesheet

        output =
            """
            a{color:rgb(128,127,126);}
            a:hover{color:rgb(23,24,25);}
            """
    in
    describe "underline on hover link (style)"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


underlineOnHoverManual : Test
underlineOnHoverManual =
    let
        input =
            Fixtures.manualUnderlineOnHoverStylesheet

        output =
            """
            a{color:rgb(128,127,126);}
            a:hover{color:rgb(23,24,25);}
            """
    in
    describe "underline on hover link (manual)"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


greenOnHoverStyle : Test
greenOnHoverStyle =
    let
        input =
            Fixtures.styleGreenOnHoverStylesheet

        output =
            """
            button{color:rgb(11,22,33);}
            button:hover{color:rgb(0,0,122);}
            """
    in
    describe "green on hover (style)"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


transformsStyle : Test
transformsStyle =
    let
        input =
            Fixtures.transformsStylesheet

        output =
            """
            body{transform:none;transform:matrix(1,2,3,4,5,6) matrix3d(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);transform:perspective(1);transform:rotate(90deg) rotateX(3.14rad) rotateY(3.14grad) rotateZ(1turn) rotate3d(1,1,1,90deg);transform:scale(1) scale(1,1) scaleX(1) scaleY(1) scale3d(1,1,1);transform:skew(90deg) skew(90deg,90deg) skewX(90deg) skewY(90deg);transform:translate(1px) translate(1px,1px) translateX(1px) translateY(1px) translate3d(1px,1px,1px);transform-box:view-box;transform-style:preserve-3d;}
            """
    in
    describe "transforms"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


fonts : Test
fonts =
    let
        input =
            Fixtures.fontStylesheet

        output =
            """
            body{line-height:14px;font-family:serif;font-family:"Gill Sans Extrabold", Helvetica, sans-serif;font-size:x-small;font-style:italic;font-weight:bold;font-weight:100;font-variant:small-caps;font-variant:common-ligatures slashed-zero;font-variant-numeric:oldstyle-nums tabular-nums stacked-fractions ordinal slashed-zero;}
            """
    in
    describe "fonts"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


pseudoElements : Test
pseudoElements =
    let
        input =
            Fixtures.pseudoElementStylesheet

        output =
            """
            #Page{margin:10px;color:#aaa;}
            #Page::before{color:#fff;}
            #Page::after{color:#000;}
            #Page::-webkit-scrollbar{display:none;}
            """
    in
    describe "pseudo elements"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


pseudoClasses : Test
pseudoClasses =
    let
        input =
            Fixtures.pseudoClassStylesheet

        output =
            """
            #Page{color:#fff;background-color:#aaa;}
            #Page:hover{margin-top:10px;}
            #Page:hover:focus{color:#000;}
            #Page:first{font-size:3em;}
            #Page:disabled{margin-top:20px;}
            #Page:any-link{color:#f00;}
            """
    in
    describe "pseudo classes"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


backgrounds : Test
backgrounds =
    let
        input =
            Fixtures.backgrounds

        output =
            """
            div{background-color:rgb(128,127,126);background-repeat:repeat-x;background-repeat:repeat-y;background-repeat:repeat no-repeat;background-repeat:space round;background-attachment:local;background-attachment:scroll;background-attachment:fixed;background-blend-mode:color;background-blend-mode:screen;background-blend-mode:multiply;background-blend-mode:overlay;background-blend-mode:darken;background-blend-mode:lighten;background-blend-mode:color-dodge;background-blend-mode:color-burn;background-blend-mode:hard-light;background-blend-mode:soft-light;background-blend-mode:difference;background-blend-mode:exclusion;background-blend-mode:hue;background-blend-mode:saturation;background-blend-mode:luminosity;background-clip:border-box;background-clip:padding-box;background-clip:content-box;background-image:url(http://example.com/elm.png);background-image:linear-gradient(#111,rgb(16,32,64),#222 25px);background-image:linear-gradient(to left,#111,#222);background-origin:border-box;background-origin:padding-box;background-origin:content-box;background-size:cover;background-size:contain;background-size:50px;background-size:auto 20px;background-position:center;background-position:10% 0;}
        """
    in
    describe "borders"
        [ test "pretty prints the expected output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


bug280 : Test
bug280 =
    let
        input =
            Fixtures.mediaQueryIndentation

        actual =
            "@media (max-width: 515px){.mdl-layout__header > .mdl-layout-icon{display:none;}}"
    in
    describe "bug280"
        [ test "pretty prints the expected output" <|
            \_ ->
                prettyPrint input
                    |> Expect.equal actual
        ]


bug335 : Test
bug335 =
    let
        compiledWithAngle =
            prettyPrint Fixtures.linearGradientWithAngle

        compiledWithDirection =
            prettyPrint Fixtures.linearGradientWithDirection
    in
    describe "Github Issue #335: https://github.com/rtfeldman/elm-css/issues/335"
        [ test "linearGradient2 does not prepend an angle value with the \"to\" keyword." <|
            \_ ->
                Expect.false
                    "Expected compiled angle not to include \"to\"."
                    (String.contains "to" compiledWithAngle)
        , test "linearGradient2 prepend a direction value with the \"to\" keyword." <|
            \_ ->
                Expect.true
                    "Expected compiled direction to include \"to\"."
                    (String.contains "to" compiledWithDirection)
        ]


nestedEach : Test
nestedEach =
    let
        input =
            Fixtures.nestedEach

        output =
            """
            span,span:focus,span:focus:hover,span  span:active{color:#FF0000;}
            """
    in
    describe "nestedEach"
        [ test "pretty prints the actual output" <|
            \_ ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]
