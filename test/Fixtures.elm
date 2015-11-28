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


multiDescendent : Style CssClasses CssIds
multiDescendent =
    stylesheet
        |%|= [ html, body ]
            |-| boxSizing borderBox
            |-| display none

            |>%| div
                |-| width 100 pct
                |-| height 100 pct

        |%|= [ h1, h2 ]
            |-| padding 0 px
            |-| margin 0 px

            |>%|= [ h3, h4 ]
                |-| width 100 pct
                |-| height 100 pct

        |%| span
            |-| padding 10 px
            |-| margin 11 px

            |>%|= [ h2, h1 ]
                |-| width 1 px
                |-| height 2 pct


dreamwriter : Style CssClasses CssIds
dreamwriter =
    stylesheet
        |%|= [ html, body ]
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
