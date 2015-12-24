module FixturesCss (..) where

import Css exposing (..)
import Style exposing (Style(..))


type CssClasses = Hidden
type CssIds = Page

pageBackground = rgb 100 90 128
pageDefaultText = rgb 40 35 76


unstyledDiv : Style a b
unstyledDiv =
    stylesheet { name = "" }
        $ div


divWidthHeight : Style a b
divWidthHeight =
    stylesheet { name = "" }
        $ div
            ~ width (pct 32)
            ~ height (px 50)


multiDescendent : Style CssClasses CssIds
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


multiSelector : Style CssClasses CssIds
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

keyValue : Style CssClasses CssIds
keyValue =
    stylesheet { name = "multiSelector" }
        $ body
            ~ ("-webkit-font-smoothing", "none")
            ! ("-moz-font-smoothing", "none")


dreamwriter : Style CssClasses CssIds
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


underlineOnHover : Style CssClasses CssIds
underlineOnHover =
    mixin
        --~ textDecoration none
        ~ color (rgb 128 127 126)

        &: hover
            --~ textDecoration underline
            ~ color (rgb 23 24 25)


greenOnHover : Style CssClasses CssIds
greenOnHover =
    mixin
        &: hover
            ~ color (rgb 0 0 122)


mixinGreenOnHoverStyle : Style CssClasses CssIds
mixinGreenOnHoverStyle =
    stylesheet { name = "greenOnHoverStylesheet" }
        $ button
            ~ color (rgb 11 22 33)
            ~= greenOnHover


mixinUnderlineOnHoverStyle : Style CssClasses CssIds
mixinUnderlineOnHoverStyle =
    stylesheet { name = "underlineOnHoverStylesheet" }
        $ a
            --~ color (rgb 128 64 32)
            ~= underlineOnHover

manualUnderlineOnHoverStyle : Style CssClasses CssIds
manualUnderlineOnHoverStyle =
    stylesheet { name = "underlineOnHoverStylesheet" }
        $ a
            ~ color (rgb 128 127 126)

            &: hover
                ~ color (rgb 23 24 25)

