module Fixtures where

import Stylesheets exposing (..)


type CssClasses = Hidden
type CssIds = Page

pageBackground = rgb 100 90 128
pageDefaultText = rgb 40 35 76


divWidthHeight : Style a b
divWidthHeight =
    stylesheet
        |%| div
            |-| width 32 pct
            |-| height 50 px


exports : Style CssClasses CssIds
exports =
    stylesheet
        |%|... [ html, body ]
            |-| width 100 pct
            |-| height 100 pct
            |-| boxSizing borderBox
            |-| padding 0 px
            |-| margin 0 px

        |%| body
            |-| minWidth 1280 px
            |-| overflowX auto

            |>%| div
                |-| width 100 pct
                |-| height 100 pct

        |.| Hidden
            |!| display none

        |#| Page
            |-| width 100 pct
            |-| height 100 pct
            |-| boxSizing borderBox
            |-| margin 0 px
            |-| padding 8 px

            |-| backgroundColor pageBackground
            |-| color pageDefaultText
