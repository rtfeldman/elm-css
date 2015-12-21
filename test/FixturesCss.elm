module FixturesCss (..) where

import Css exposing (..)
import Style exposing (Style(..))


type CssClasses = Hidden
type CssIds = Page

pageBackground = rgb 100 90 128
pageDefaultText = rgb 40 35 76


unstyledDiv : Style a b
unstyledDiv =
    stylesheet ""
        $ div


divWidthHeight : Style a b
divWidthHeight =
    stylesheet ""
        $ div
            ~ width 32 pct
            ~ height 50 px


multiDescendent : Style CssClasses CssIds
multiDescendent =
    stylesheet ""
        $ html |$ body
            ~ boxSizing borderBox
            ~ display none

            >$ div
                ~ width 100 pct
                ~ height 100 pct

        $ h1 |$ h2
            ~ padding 0 px
            ~ margin 0 px

            >$ h3
                ~ width 100 pct

                >$ h4
                    ~ height 100 pct

        $ span
            ~ padding 10 px
            ~ margin 11 px

            >$ h2 >$ h1
                ~ width 1 px
                ~ height 2 pct


dreamwriter : Style CssClasses CssIds
dreamwriter =
    stylesheet "dreamwriter"
        $ html |$ body
            ~ width 100 pct
            ~ height 100 pct
            ~ boxSizing borderBox
            ~ padding 0 px
            ~ margin 0 px

        $ body
            ~ minWidth 1280 px
            ~ overflowX auto

            >$ div
                ~ width 100 pct
                ~ height 100 pct

        . Hidden
            ! display none

        # Page
            ~ width 100 pct
            ~ height 100 pct
            ~ boxSizing borderBox
            ~ margin 0 px
            ~ padding 8 px

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
    stylesheet "greenOnHoverStylesheet"
        $ button
            ~ color (rgb 11 22 33)
            ~= greenOnHover


mixinUnderlineOnHoverStyle : Style CssClasses CssIds
mixinUnderlineOnHoverStyle =
    stylesheet "underlineOnHoverStylesheet"
        $ a
            --~ color (rgb 128 64 32)
            ~= underlineOnHover

manualUnderlineOnHoverStyle : Style CssClasses CssIds
manualUnderlineOnHoverStyle =
    stylesheet "underlineOnHoverStylesheet"
        $ a
            ~ color (rgb 128 127 126)

            &: hover
                ~ color (rgb 23 24 25)

