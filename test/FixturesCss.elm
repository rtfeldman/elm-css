module FixturesCss (..) where

import Css exposing (..)
import Style exposing (Style(..))


type CssClasses = Hidden
type CssIds = Page

pageBackground = rgb 100 90 128
pageDefaultText = rgb 40 35 76


unstyledDiv : Style a b String
unstyledDiv =
    stylesheet { name = "" }
        $ div


divWidthHeight : Style a b String
divWidthHeight =
    stylesheet { name = "" }
        $ div
            ~ width (pct 32)
            ~ height (px 50)


multiDescendent : Style CssClasses CssIds String
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


multiSelector : Style CssClasses CssIds String
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

keyValue : Style CssClasses CssIds String
keyValue =
    stylesheet { name = "multiSelector" }
        $ body
            ~ ("-webkit-font-smoothing", "none")
            ! ("-moz-font-smoothing", "none")


borders : Style CssClasses CssIds String
borders =
    stylesheet { name = "border-test" }
        $ button
            ~ borderLeft3 (px 5) dashed (rgb 11 14 17)
            ~ borderRight (px 7)

        $ a
            ~ border2 (px 10) solid


dreamwriter : Style CssClasses CssIds String
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
            ! display none

        # Page
            ~ width (pct 100)
            ~ height (pct 100)
            ~ boxSizing borderBox
            ~ margin zero
            ~ padding (px 8)

            ~ backgroundColor pageBackground
            ~ color pageDefaultText


underlineOnHover : Style CssClasses CssIds String
underlineOnHover =
    mixin
        --~ textDecoration none
        ~ color (rgb 128 127 126)

        &: hover
            --~ textDecoration underline
            ~ color (rgb 23 24 25)


greenOnHover : Style CssClasses CssIds String
greenOnHover =
    mixin
        &: hover
            ~ color (rgb 0 0 122)


mixinGreenOnHoverStyle : Style CssClasses CssIds String
mixinGreenOnHoverStyle =
    stylesheet { name = "greenOnHoverStylesheet" }
        $ button
            ~ color (rgb 11 22 33)
            ~= greenOnHover


mixinUnderlineOnHoverStyle : Style CssClasses CssIds String
mixinUnderlineOnHoverStyle =
    stylesheet { name = "underlineOnHoverStylesheet" }
        $ a
            --~ color (rgb 128 64 32)
            ~= underlineOnHover


manualUnderlineOnHoverStyle : Style CssClasses CssIds String
manualUnderlineOnHoverStyle =
    stylesheet { name = "underlineOnHoverStylesheet" }
        $ a
            ~ color (rgb 128 127 126)

            &: hover
                ~ color (rgb 23 24 25)

