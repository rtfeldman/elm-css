module Fixtures (..) where

import Css exposing (..)
import Css.Elements exposing (..)


type CssClasses
  = Hidden


type CssIds
  = Page


type CssAnimations
  = Wobble


unstyledDiv : Stylesheet
unstyledDiv =
  stylesheet
    { name = "" }
    [ div [] ]


divWidthHeight : Stylesheet
divWidthHeight =
  stylesheet
    { name = "" }
    [ div
        [ width (pct 32)
        , height (px 50)
        ]
    ]


atRule : Stylesheet
atRule =
  stylesheet
    { name = "homepage" }
    [ body
        [ padding zero ]
    , (media "print")
        [ body [ margin (em 2) ] ]
    , button
        [ margin auto ]
    ]


nestedAtRule : Stylesheet
nestedAtRule =
  stylesheet
    { name = "homepage" }
    [ button [ padding zero ]
    , body
        [ margin auto
        , with
            (media "print")
            [ margin (em 2) ]
        ]
    , a [ textDecoration none ]
    ]


multiDescendent : Stylesheet
multiDescendent =
  stylesheet
    { name = "" }
    [ (each [ html, body ])
        [ boxSizing borderBox
        , display none
        , children
            [ div
                [ width (pct 100)
                , height (pct 100)
                ]
            ]
        ]
    , (each [ h1, h2 ])
        [ padding zero
        , margin zero
        , children
            [ h3
                [ width (pct 100)
                , children
                    [ h4
                        [ height (pct 100) ]
                    ]
                ]
            ]
        ]
    , span
        [ padding (px 10)
        , margin (px 11)
        , children
            [ h2
                [ children
                    [ h1
                        [ width (px 1)
                        , height (pct 2)
                        ]
                    ]
                ]
            ]
        ]
    ]


multiSelector : Stylesheet
multiSelector =
  stylesheet
    { name = "multiSelector" }
    [ (div &# Page &. Hidden)
        [ display none
        , width (pct 100)
        , height (pct 100)
        ]
    , span
        [ padding (px 10)
        , margin (px 11)
        ]
    ]


keyValue : Stylesheet
keyValue =
  stylesheet
    { name = "keyValue" }
    [ body
        [ property "-webkit-font-smoothing" "none"
        , (property "-moz-font-smoothing" "none") |> important
        ]
    ]


leftRightTopBottom : Stylesheet
leftRightTopBottom =
  stylesheet
    { name = "left-right-top-bottom" }
    [ div
        [ position absolute
        , top (em 2)
        , left (px 5)
        , textAlign left
        , verticalAlign bottom
        ]
    , a
        [ position relative
        , right zero
        , textAlign right
        , bottom (em 2)
        , verticalAlign top
        ]
    ]


borders : Stylesheet
borders =
  stylesheet
    { name = "border-test" }
    [ button
        [ borderLeft3 (px 5) dashed (rgb 11 14 17)
        , borderRight (px 7)
        , borderImageOutset2 (n 3) (em 4)
        ]
    , a
        [ border2 (px 10) solid ]
    ]


underlineOnHover : Mixin
underlineOnHover =
  mixin
    --~ textDecoration none
    [ color (rgb 128 127 126)
    , (with hover)
        --[ textDecoration underline ]
        [ color (rgb 23 24 25) ]
    ]


greenOnHover : Mixin
greenOnHover =
  mixin
    [ (with hover)
        [ color (rgb 0 0 122) ]
    ]


mixinGreenOnHoverStylesheet : Stylesheet
mixinGreenOnHoverStylesheet =
  stylesheet
    { name = "greenOnHoverStylesheetsheet" }
    [ button
        [ color (rgb 11 22 33)
        , greenOnHover
        ]
    ]


mixinUnderlineOnHoverStylesheet : Stylesheet
mixinUnderlineOnHoverStylesheet =
  stylesheet
    { name = "underlineOnHoverStylesheetsheet" }
    [ a
        --[ color (rgb 128 64 32) ]
        [ underlineOnHover ]
    ]


manualUnderlineOnHoverStylesheet : Stylesheet
manualUnderlineOnHoverStylesheet =
  stylesheet
    { name = "underlineOnHoverStylesheetsheet" }
    [ a
        [ color (rgb 128 127 126)
        , (with hover)
            [ color (rgb 23 24 25) ]
        ]
    ]


transformsStylesheet : Stylesheet
transformsStylesheet =
  stylesheet
    { name = "transformsStylesheet" }
    [ body
        [ transforms []
        , transforms
            [ matrix 1 2 3 4 5 6
            , matrix3d 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
            ]
        , transform (perspective 1)
        , transforms
            [ rotate (deg 90)
            , rotateX (rad 3.14)
            , rotateY (grad 3.14)
            , rotateZ (turn 1)
            , rotate3d 1 1 1 (deg 90)
            ]
        , transforms
            [ scale 1
            , scale2 1 1
            , scaleX 1
            , scaleY 1
            , scale3d 1 1 1
            ]
        , transforms
            [ skew (deg 90)
            , skew2 (deg 90) (deg 90)
            , skewX (deg 90)
            , skewY (deg 90)
            ]
        , transforms
            [ translate (px 1)
            , translate2 (px 1) (px 1)
            , translateX (px 1)
            , translateY (px 1)
            , translate3d (px 1) (px 1) (px 1)
            ]
        , transformBox viewBox
        , transformStyle preserve3d
        ]
    ]


standaloneAt : Stylesheet
standaloneAt =
      stylesheet
        { name = "standaloneAt" }
        [ (@) (charset "utf-8") []
        , (@) (import' (url "fineprint.css")) []
        ]


fontStylesheet : Stylesheet
fontStylesheet =
      stylesheet
        { name = "fontStylesheet" }
        [ body
            [ lineHeight (px 14)
            , fontFamily serif
            , fontFamilies
              [ qt "Gill Sans Extrabold"
              , "Helvetica"
              , .value sansSerif
              ]
            , fontSize xSmall
            , fontStyle italic
            , fontWeight bold
            , fontWeight (n 100)
            , fontVariant smallCaps
            , fontVariant2 commonLigatures slashedZero
            , fontVariantNumerics
              [ oldstyleNums
              , tabularNums
              , stackedFractions
              , ordinal
              , slashedZero
              ]
            ]
        ]


fontWeightWarning : Stylesheet
fontWeightWarning =
      stylesheet
        { name = "fontWeightWarning" }
        [ body [ fontWeight (n 22) ]]
