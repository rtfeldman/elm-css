module DreamwriterStyle where

import Stylesheets exposing (..)


type CssClasses = Hidden
type CssIds = Page

pageBackground = rgb 100 90 128
pageDefaultText = rgb 40 35 76


exports : Style CssClasses CssIds
exports =
    stylesheet
        |%| ( html ++ body )
            [ width 100 pct
            , height 100 pct
            , boxSizing borderBox
            , padding 0 px
            , margin 0 px
            ]

        |%| body
            [ minWidth 1280 px
            , overflowX auto

            , directDescendent |%| div
                [ width 100 pct
                , height 100 pct
                ]
            ]

        --|%| body |>| div
        --|%| div |.| Hidden

        |.| Hidden
            [ important (display none) ]

        |#| Page
            [ width 100 pct
            , height 100 pct
            , boxSizing borderBox
            , margin 0 px
            , padding 8 px

            , backgroundColor pageBackground
            , color pageDefaultText
            ]
