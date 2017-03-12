module Fixtures exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = Hidden


type CssIds
    = Page


type CssAnimations
    = Wobble


unstyledDiv : Stylesheet
unstyledDiv =
    stylesheet [ div [] ]


divWidthHeight : Stylesheet
divWidthHeight =
    stylesheet
        [ div
            [ width (pct 32)
            , height (px 50)
            ]
        ]


atRule : Stylesheet
atRule =
    (stylesheet << namespace "homepage")
        [ body [ padding zero ]
        , (media [ print ]) [ body [ margin (Css.em 2) ] ]
        , mediaQuery "screen and ( max-width: 600px )"
            [ body [ margin (Css.em 3) ] ]
        , button [ margin auto ]
        ]


nestedAtRule : Stylesheet
nestedAtRule =
    (stylesheet << namespace "homepage")
        [ button [ padding zero ]
        , body
            [ margin auto
            , (withMedia [ print ]) [ margin (Css.em 2) ]
            ]
        , a [ textDecoration none ]
        ]


bug99 : Stylesheet
bug99 =
    stylesheet
        [ article
            [ margin zero
            , children
                [ header [ margin (Css.em 1) ]
                , section [ margin (px 2) ]
                , nav [ margin (pct 3) ]
                ]
            ]
        ]


bug140 : Stylesheet
bug140 =
    stylesheet
        [ each [ input, select, selector "textarea" ]
            [ focus
                [ borderColor (hex "#000000")
                ]
            , after
                [ color (hex "#aaaaaa")
                ]
            ]
        ]


simpleEach : Stylesheet
simpleEach =
    stylesheet
        [ span
            [ width (px 30)
            , height (Css.em 2)
            ]
        , (each [ html, body ])
            [ boxSizing borderBox
            , display none
            ]
        , button
            [ color (rgb 22 23 24)
            , padding zero
            ]
        ]


multiDescendent : Stylesheet
multiDescendent =
    stylesheet
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
                        [ h4 [ height (pct 100) ]
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


universal : Stylesheet
universal =
    (stylesheet << namespace "universal")
        [ everything
            [ display none
            , children
                [ everything
                    [ width (pct 100)
                    , height (pct 100)
                    ]
                ]
            ]
        , span
            [ children [ everything [ margin (px 11) ] ]
            ]
        ]


multiSelector : Stylesheet
multiSelector =
    (stylesheet << namespace "multiSelector")
        [ div
            [ (withClass Page)
                [ (withClass Hidden)
                    [ display none
                    , width (pct 100)
                    , height (pct 100)
                    ]
                ]
            ]
        , span
            [ padding (px 10)
            , margin (px 11)
            ]
        ]


keyValue : Stylesheet
keyValue =
    stylesheet
        [ body
            [ property "-webkit-font-smoothing" "none"
            , (property "-moz-font-smoothing" "none") |> important
            ]
        ]


leftRightTopBottom : Stylesheet
leftRightTopBottom =
    (stylesheet << namespace "left-right-top-bottom")
        [ div
            [ position absolute
            , top (Css.em 2)
            , left (px 5)
            , textAlign left
            , verticalAlign bottom
            ]
        , a
            [ position relative
            , right zero
            , textAlign right
            , bottom (Css.em 2)
            , verticalAlign top
            ]
        ]


borders : Stylesheet
borders =
    (stylesheet << namespace "border-test")
        [ button
            [ borderLeft3 (px 5) dashed (rgb 11 14 17)
            , borderRight (px 7)
            , borderImageOutset2 (int 3) (Css.em 4)
            ]
        , a [ border2 (px 10) solid ]
        ]


underlineOnHover : Mixin
underlineOnHover =
    mixin
        --~ textDecoration none
        [ color (rgb 128 127 126)
        , hover
            --[ textDecoration underline ]
            [ color (rgb 23 24 25) ]
        ]


greenOnHover : Mixin
greenOnHover =
    mixin
        [ hover [ color (rgb 0 0 122) ]
        ]


mixinGreenOnHoverStylesheet : Stylesheet
mixinGreenOnHoverStylesheet =
    (stylesheet << namespace "greenOnHoverStylesheetsheet")
        [ button
            [ color (rgb 11 22 33)
            , greenOnHover
            ]
        ]


mixinUnderlineOnHoverStylesheet : Stylesheet
mixinUnderlineOnHoverStylesheet =
    (stylesheet << namespace "underlineOnHoverStylesheetsheet")
        [ a
            --[ color (rgb 128 64 32) ]
            [ underlineOnHover ]
        ]


manualUnderlineOnHoverStylesheet : Stylesheet
manualUnderlineOnHoverStylesheet =
    (stylesheet << namespace "underlineOnHoverStylesheetsheet")
        [ a
            [ color (rgb 128 127 126)
            , hover [ color (rgb 23 24 25) ]
            ]
        ]


transformsStylesheet : Stylesheet
transformsStylesheet =
    (stylesheet << namespace "transformsStylesheet")
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


fontStylesheet : Stylesheet
fontStylesheet =
    (stylesheet << namespace "fontStylesheet")
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
            , fontWeight (int 100)
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
    (stylesheet << namespace "fontWeightWarning") [ body [ fontWeight (int 22) ] ]


colorHexWarning : Stylesheet
colorHexWarning =
    (stylesheet << namespace "colorHexWarning") [ body [ color (hex "ababah") ] ]


colorHexAbbrWarning : Stylesheet
colorHexAbbrWarning =
    (stylesheet << namespace "colorHexAbbrWarning") [ body [ color (hex "#00i") ] ]


pseudoElementStylesheet : Stylesheet
pseudoElementStylesheet =
    (stylesheet << namespace "pseudoElements")
        [ id Page
            [ margin (px 10)
            , before
                [ color (hex "#fff") ]
            , after
                [ color (hex "#000") ]
            , pseudoElement "-webkit-scrollbar"
                [ display none ]
            , color (hex "#aaa")
            ]
        ]


pseudoClassStylesheet : Stylesheet
pseudoClassStylesheet =
    (stylesheet << namespace "pseudoClasses")
        [ id Page
            [ color (hex "#fff")
            , hover
                [ marginTop (px 10)
                , focus
                    [ color (hex "#000") ]
                ]
            , first
                [ fontSize (Css.em 3) ]
            , disabled
                [ marginTop (px 20) ]
            , pseudoClass "any-link"
                [ color (hex "f00") ]
            , backgroundColor (hex "#aaa")
            ]
        ]


backgrounds : Stylesheet
backgrounds =
    (stylesheet << namespace "background-test")
        [ div
            [ backgroundColor (rgb 128 127 126)
            , backgroundRepeat repeatX
            , backgroundRepeat repeatY
            , backgroundRepeat2 repeat noRepeat
            , backgroundRepeat2 space Css.round
            , backgroundAttachment local
            , backgroundAttachment scroll
            , backgroundAttachment fixed
            , backgroundBlendMode color
            , backgroundBlendMode screenBlendMode
            , backgroundBlendMode multiply
            , backgroundBlendMode overlay
            , backgroundBlendMode darken
            , backgroundBlendMode lighten
            , backgroundBlendMode colorDodge
            , backgroundBlendMode colorBurn
            , backgroundBlendMode hardLight
            , backgroundBlendMode softLight
            , backgroundBlendMode difference
            , backgroundBlendMode exclusion
            , backgroundBlendMode hue
            , backgroundBlendMode saturation
            , backgroundBlendMode luminosity
            , backgroundClip borderBox
            , backgroundClip paddingBox
            , backgroundClip contentBox
            , backgroundImage (url "http://example.com/elm.png")
            , backgroundOrigin borderBox
            , backgroundOrigin paddingBox
            , backgroundOrigin contentBox
            , backgroundSize cover
            , backgroundSize contain
            , backgroundSize (px 50)
            , backgroundSize2 auto (px 20)
            , backgroundPosition center
            , backgroundPosition2 (pct 10) zero
            ]
        ]
