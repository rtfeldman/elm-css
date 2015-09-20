module DreamwriterStyle where

import Stylesheets exposing (..)


type CssClasses
    = Hidden

type CssIds
    = Page

pageBackground = rgb 100 90 128
pageDefaultText = rgb 40 35 76

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

        -- TODO should not naively call toString here
        --|@| media [ screen, print ]
        --    |%| nowrap
        --        |-| whiteSpace noWrap

        -- TODO should output:
        -- div input, span input, button input ... { }
        --|%|... [ div, span, button, h1, h2, h3, h4, p, ol ]
        --    |%| input
        --        |-| outline 0 px solid transparent
        --        |-| boxSizing borderBox

        -- TODO should not naively call toString here
        --|::| selection
        --    |-| backgroundColor (rgb 160 171 222)
        --    |-| color inherit
        --    |-| textShadow inherit

        |#| Page
 --           |-| position relative
 --           |-| display flex
 --           |-| flexDirection row
 --           |-| justifyContent center
--            |-| alignItems stretch

            |-| width 100 pct
            |-| height 100 pct
            |-| boxSizing borderBox
            |-| margin 0 px
            |-| padding 8 px

--            |-| overflow hidden

            |-| backgroundColor pageBackground
            |-| color pageDefaultText

--        |::| inputPlaceholder
            |-| color pageDefaultText
