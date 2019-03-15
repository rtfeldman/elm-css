module CompileFixtures exposing (basicStyle1, basicStyle2, dreamwriter, pageBackground, pageDefaultText, unstyledDiv)

import Css exposing (..)
import Css.Global exposing (..)
import Css.Preprocess exposing (Stylesheet, stylesheet)


pageBackground : Color
pageBackground =
    rgb 100 90 128


pageDefaultText : Color
pageDefaultText =
    rgb 40 35 76


unstyledDiv : Stylesheet
unstyledDiv =
    stylesheet [ div [] ]


dreamwriter : Stylesheet
dreamwriter =
    stylesheet
        [ each [ html, body ]
            [ width (pct 100)
            , height (pct 100)
            , boxSizing borderBox
            , padding zero
            , margin zero
            ]
        , body
            [ minWidth (px 1280)
            , overflowX auto
            , children
                [ div
                    [ width (pct 100)
                    , height (pct 100)
                    ]
                ]
            ]
        , class "Hidden" [ display none |> important ]
        , id "Page"
            [ width (pct 100)
            , height (pct 100)
            , boxSizing borderBox
            , margin zero
            , padding (px 8)
            , backgroundColor pageBackground
            , color pageDefaultText
            ]
        ]


basicStyle1 : Stylesheet
basicStyle1 =
    stylesheet
        [ class "BasicStyle1"
            [ display none ]
        ]


basicStyle2 : Stylesheet
basicStyle2 =
    stylesheet
        [ class "BasicStyle2"
            [ display none ]
        ]
