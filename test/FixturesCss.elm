module FixturesCss (..) where

import Css exposing (..)
import Css.Elements exposing (..)


type CssClasses
  = Hidden


type CssIds
  = Page


type CssAnimations
  = Wobble


pageBackground : Color
pageBackground =
  rgb 100 90 128


pageDefaultText : Color
pageDefaultText =
  rgb 40 35 76


unstyledDiv : Snippet
unstyledDiv =
  snippet
    { name = "" }
    [ div ]


divWidthHeight : Snippet
divWidthHeight =
  snippet
    { name = "" }
    [ div
        ~ width (pct 32)
        ~ height (px 50)
    ]



--multiDescendent : Snippet
--multiDescendent =
--  snippet
--    { name = "" }
--    [ multi [ html, body ]
--        ~ boxSizing borderBox
--        ~ display none
--        ~ children
--            [ div
--                ~ width (pct 100)
--                ~ height (pct 100)
--            ]
--    , multi [ h1, h2 ]
--        ~ padding zero
--        ~ margin zero
--        ~ children
--            [ h3
--                ~ width (pct 100)
--                ~ children
--                    [ h4
--                        ~ height (pct 100)
--                    ]
--            ]
--    , span
--        ~ padding (px 10)
--        ~ margin (px 11)
--        ~ children
--            [ h2
--                ~ children
--                    [ h1
--                        ~ width (px 1)
--                        ~ height (pct 2)
--                    ]
--            ]
--    ]
--multiSelector : Snippet
--multiSelector =
--  snippet
--    { name = "multiSelector" }
--    [ compound [ div, (#) Page, (.) Hidden ]
--        ~ display none
--        ~ width (pct 100)
--        ~ height (pct 100)
--    , span
--        ~ padding (px 10)
--        ~ margin (px 11)
--        ~ children
--            [ h2
--                ~ children
--                    [ h1
--                        ~ width (px 1)
--                        ~ height (pct 2)
--                    ]
--            ]
--    ]
--keyValue : Snippet
--keyValue =
--  snippet
--    { name = "multiSelector" }
--    [ body
--        ~ property "-webkit-font-smoothing" "none"
--        ~ (property "-moz-font-smoothing" "none")
--        |> important
--    ]


leftRightTopBottom : Snippet
leftRightTopBottom =
  snippet
    { name = "left-right-top-bottom" }
    [ div
        ~ position absolute
        ~ top (em 2)
        ~ left (px 5)
        ~ textAlign left
        ~ verticalAlign bottom
    , a
        ~ position relative
        ~ right zero
        ~ textAlign right
        ~ bottom (em 2)
        ~ verticalAlign top
    ]


borders : Snippet
borders =
  snippet
    { name = "border-test" }
    [ button
        ~ borderLeft3 (px 5) dashed (rgb 11 14 17)
        ~ borderRight (px 7)
        ~ borderImageOutset2 (n 3) (em 4)
    , a
        ~ border2 (px 10) solid
    ]



--dreamwriter : Snippet
--dreamwriter =
--  snippet
--    { name = "dreamwriter" }
--    [ multi [ html, body ]
--        ~ width (pct 100)
--        ~ height (pct 100)
--        ~ boxSizing borderBox
--        ~ padding zero
--        ~ margin zero
--    , body
--        ~ minWidth (px 1280)
--        ~ overflowX auto
--        ~ children
--            [ div
--                ~ width (pct 100)
--                ~ height (pct 100)
--            ]
--    , (.) Hidden
--        ~ (display none)
--        |> important
--    , (#) Page
--        ~ width (pct 100)
--        ~ height (pct 100)
--        ~ boxSizing borderBox
--        ~ margin zero
--        ~ padding (px 8)
--        ~ backgroundColor pageBackground
--        ~ color pageDefaultText
--    ]
--underlineOnHover : Mixin
--underlineOnHover =
--  mixin
--    --~ textDecoration none
--    ~
--      color (rgb 128 127 126)
--    ~
--      pseudoClasses
--        [ hover
--            --~ textDecoration underline
--            ~
--              color (rgb 23 24 25)
--        ]
--greenOnHover : Mixin
--greenOnHover =
--  mixin
--    ~ pseudoClasses
--        [ hover
--            ~ color (rgb 0 0 122)
--        ]
--mixinGreenOnHoverStylesheet : Snippet
--mixinGreenOnHoverStylesheet =
--  snippet
--    { name = "greenOnHoverStylesheetsheet" }
--    [ button
--        ~ color (rgb 11 22 33)
--        ~ greenOnHover
--    ]
--mixinUnderlineOnHoverStylesheet : Snippet
--mixinUnderlineOnHoverStylesheet =
--  snippet
--    { name = "underlineOnHoverStylesheetsheet" }
--    [ a
--        --~ color (rgb 128 64 32)
--        ~
--          underlineOnHover
--    ]
--manualUnderlineOnHoverStylesheet : Snippet
--manualUnderlineOnHoverStylesheet =
--  snippet
--    { name = "underlineOnHoverStylesheetsheet" }
--    [ a
--        ~ color (rgb 128 127 126)
--        ~ pseudoClasses
--            [ hover
--                ~ color (rgb 23 24 25)
--            ]
--    ]


transformsStylesheet : Snippet
transformsStylesheet =
  snippet
    { name = "transformsStylesheet" }
    [ body
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
    ]
