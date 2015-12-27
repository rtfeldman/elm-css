module FixturesCss (..) where

import Css exposing (..)
import Css.Elements exposing (..)
import Style exposing (Style(..))


type CssClasses = Hidden
type CssIds = Page
type CssAnimations = Wobble


unstyledDiv : Style String a b c
unstyledDiv =
    stylesheet { name = "" }
        $ div


divWidthHeight : Style String a b c
divWidthHeight =
    stylesheet { name = "" }
        $ div
            ~ width (pct 32)
            ~ height (px 50)


multiDescendent : Style String CssAnimations CssClasses CssIds
multiDescendent =
    stylesheet { name = "" }
        $ html |$ body
            ~ boxSizing borderBox
            ~ display none

            >$ div
                ~ width (pct 100)
                ~ height (pct 100)

        $ h1 |$ h2
            ~ padding zero
            ~ margin zero

            >$ h3
                ~ width (pct 100)

                >$ h4
                    ~ height (pct 100)

        $ span
            ~ padding (px 10)
            ~ margin (px 11)

            >$ h2 >$ h1
                ~ width (px 1)
                ~ height (pct 2)


multiSelector : Style String CssAnimations CssClasses CssIds
multiSelector =
    stylesheet { name = "multiSelector" }
        $ div # Page . Hidden
            ~ display none
            ~ width (pct 100)
            ~ height (pct 100)

        $ span
            ~ padding (px 10)
            ~ margin (px 11)

            >$ h2 >$ h1
                ~ width (px 1)
                ~ height (pct 2)


keyValue : Style String CssAnimations CssClasses CssIds
keyValue =
    stylesheet { name = "multiSelector" }
        $ body
            ~ custom "-webkit-font-smoothing" "none"
            ~ ((custom "-moz-font-smoothing" "none") |> important)


leftRightTopBottom : Style String CssAnimations CssClasses CssIds
leftRightTopBottom =
    stylesheet { name = "left-right-top-bottom" }
        $ div
            ~ position absolute
            ~ top (em 2)
            ~ left (px 5)
            ~ textAlign left
            ~ verticalAlign bottom

        $ a
            ~ position relative
            ~ right zero
            ~ textAlign right
            ~ bottom (em 2)
            ~ verticalAlign top


borders : Style String CssAnimations CssClasses CssIds
borders =
    stylesheet { name = "border-test" }
        $ button
            ~ borderLeft3 (px 5) dashed (rgb 11 14 17)
            ~ borderRight (px 7)
            ~ borderImageOutset2 (n 3) (em 4)

        $ a
            ~ border2 (px 10) solid


dreamwriter : Style String CssAnimations CssClasses CssIds
dreamwriter =
    stylesheet { name = "dreamwriter" }
        $ html |$ body
            ~ width (pct 100)
            ~ height (pct 100)
            ~ boxSizing borderBox
            ~ padding zero
            ~ margin zero

        $ body
            ~ minWidth (px 1280)
            ~ overflowX auto

            >$ div
                ~ width (pct 100)
                ~ height (pct 100)

        . Hidden
            ~ ((display none) |> important)

        # Page
            ~ width (pct 100)
            ~ height (pct 100)
            ~ boxSizing borderBox
            ~ margin zero
            ~ padding (px 8)
            ~ backgroundColor (rgb 100 90 128)
            ~ color (rgb 40 35 76)


underlineOnHover : Style String CssAnimations CssClasses CssIds
underlineOnHover =
    mixin
        --~ textDecoration none
        ~ color (rgb 128 127 126)
        &: hover
            --~ textDecoration underline
            ~ color (rgb 23 24 25)


greenOnHover : Style String CssAnimations CssClasses CssIds
greenOnHover =
    mixin
        &: hover
            ~ color (rgb 0 0 122)


mixinGreenOnHoverStyle : Style String CssAnimations CssClasses CssIds
mixinGreenOnHoverStyle =
    stylesheet { name = "greenOnHoverStylesheet" }
        $ button
            ~ color (rgb 11 22 33)
            ~ greenOnHover


mixinUnderlineOnHoverStyle : Style String CssAnimations CssClasses CssIds
mixinUnderlineOnHoverStyle =
    stylesheet { name = "underlineOnHoverStylesheet" }
        $ a
            --~ color (rgb 128 64 32)
        ~ underlineOnHover


manualUnderlineOnHoverStyle : Style String CssAnimations CssClasses CssIds
manualUnderlineOnHoverStyle =
    stylesheet { name = "underlineOnHoverStylesheet" }
        $ a
            ~ color (rgb 128 127 126)
        &: hover
            ~ color (rgb 23 24 25)


transformsStyle : Style String CssAnimations CssClasses CssIds
transformsStyle =
    stylesheet { name = "transformsStyle" }
        $ body
            ~ transforms []
            ~ transforms
                [ matrix 1 2 3 4 5 6
                , matrix3d 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
                ]
            ~ transform (perspective 1)
            ~ transforms
                [ rotate (deg 90)
                , rotateX (rad 3.14)
                , rotateY (grad 3.14)
                , rotateZ (turn 1)
                , rotate3d 1 1 1 (deg 90)
                ]
            ~ transforms
                [ scale 1
                , scale2 1 1
                , scaleX 1
                , scaleY 1
                , scale3d 1 1 1
                ]
            ~ transforms
                [ skew (deg 90)
                , skew2 (deg 90) (deg 90)
                , skewX (deg 90)
                , skewY (deg 90)
                ]
            ~ transforms
                [ translate (px 1)
                , translate2 (px 1) (px 1)
                , translateX (px 1)
                , translateY (px 1)
                , translate3d (px 1) (px 1) (px 1)
                ]
            ~ transformBox viewBox
            ~ transformStyle preserve3d
