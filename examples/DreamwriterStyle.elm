module DreamwriterStyle where

import Stylesheets exposing (..)


type CssClasses
    = Hidden

exports : Style CssClasses
exports =
    stylesheet
        |% [ html, body ]
            |- width 100 pct
            |- height 100 pct
            |- boxSizing borderBox
            |- padding 0 px
            |- margin 0 px

        |% body
            |- minWidth 1280 px
            |- overflowX auto

            |>% div
                |- width 100 pct
                |- height 100 pct

        |. Hidden
            |! display none

        |@ media [ screen, print ]
            |% nowrap
                |- whiteSpace noWrap
    {-

        |% [div, span, button, h1, h2, h3, h4, p, ol]
            |% input
                |- outline 0 solid transparent
                |- boxSizing borderBox

    -}

        |:: selection
            |- backgroundColor (rgb 160 171 222)
            |- color inherit
            |- textShadow inherit
