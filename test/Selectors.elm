module Selectors exposing (all)

import Test exposing (..)
import Expect
import TestUtil exposing (prettyPrint)
import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)


all : Test
all =
    describe "selectors"
        ([ nonElements, elements ] ++ pseudoSelectors ++ pseudoElements)


{-| Reproduces https://github.com/rtfeldman/elm-css/issues/136
-}
pseudoSelectors : List Test
pseudoSelectors =
    [ test "Multiple pseudo-selectors" <|
        \() ->
            [ a
                [ color (hex "#000000")
                , hover [ color (hex "#111111") ]
                , active [ color (hex "#222222") ]
                , disabled [ color (hex "#333333") ]
                ]
            ]
                |> stylesheet
                |> prettyPrint
                |> Expect.equal ("a {\n    color: #000000;\n}\n\na:hover {\n    color: #111111;\n}\n\na:active {\n    color: #222222;\n}\n\na:disabled {\n    color: #333333;\n}")
    , test "Pseudo-selector followed by attribute" <|
        \() ->
            [ a
                [ hover [ backgroundColor (hex "#000000") ]
                , color (hex "#111111")
                ]
            ]
                |> stylesheet
                |> prettyPrint
                |> Expect.equal ("a:hover {\n    background-color: #000000;\n}\n\na {\n    color: #111111;\n}")
    ]


pseudoElements : List Test
pseudoElements =
    [ test "Multiple pseudo-elements" <|
        \() ->
            [ a
                [ color (hex "#000000")
                , before [ color (hex "#111111") ]
                , after [ color (hex "#222222") ]
                ]
            ]
                |> stylesheet
                |> prettyPrint
                |> Expect.equal ("a {\n    color: #000000;\n}\n\na::before {\n    color: #111111;\n}\n\na::after {\n    color: #222222;\n}")
    , test "Pseudo-element followed by attribute" <|
        \() ->
            [ a
                [ before [ backgroundColor (hex "#000000") ]
                , color (hex "#111111")
                ]
            ]
                |> stylesheet
                |> prettyPrint
                |> Expect.equal ("a::before {\n    background-color: #000000;\n}\n\na {\n    color: #111111;\n}")
    ]


nonElements : Test
nonElements =
    describe "non-elements"
        [ testSelector ".foo" ((.) "foo")
        , testSelector "#foo" ((#) "foo")
        , testSelector "div:hover" (\children -> div [ hover children ])
        , testSelector "div::before" (\children -> div [ before children ])
        ]


elements : Test
elements =
    describe "selectors"
        [ testSelector "ol" ol
        , testSelector "ul" ul
        , testSelector "html" html
        , testSelector "body" body
        , testSelector "article" article
        , testSelector "header" header
        , testSelector "footer" footer
        , testSelector "h1" h1
        , testSelector "h2" h2
        , testSelector "h3" h3
        , testSelector "h4" h4
        , testSelector "h5" h5
        , testSelector "h6" h6
        , testSelector "nav" nav
        , testSelector "section" section
        , testSelector "div" div
        , testSelector "hr" hr
        , testSelector "li" li
        , testSelector "main" main'
        , testSelector "ol" ol
        , testSelector "p" p
        , testSelector "ul" ul
        , testSelector "pre" pre
        , testSelector "a" a
        , testSelector "code" code
        , testSelector "small" Css.Elements.small
        , testSelector "span" span
        , testSelector "strong" strong
        , testSelector "img" img
        , testSelector "audio" audio
        , testSelector "video" video
        , testSelector "canvas" canvas
        , testSelector "caption" caption
        , testSelector "col" col
        , testSelector "colgroup" colgroup
        , testSelector "table" table
        , testSelector "tbody" tbody
        , testSelector "td" td
        , testSelector "tfoot" tfoot
        , testSelector "th" th
        , testSelector "thead" thead
        , testSelector "tr" tr
        , testSelector "button" button
        , testSelector "fieldset" fieldset
        , testSelector "form" form
        , testSelector "input" input
        , testSelector "label" label
        , testSelector "legend" legend
        , testSelector "optgroup" optgroup
        , testSelector "option" option
        , testSelector "progress" progress
        , testSelector "select" select
        ]


testSelector : String -> (List Mixin -> Snippet) -> Test
testSelector expectedOutput applySelector =
    (test (expectedOutput ++ " selector")) <|
        \() ->
            [ applySelector [ display none ] ]
                |> stylesheet
                |> prettyPrint
                |> Expect.equal (expectedOutput ++ " {\n    display: none;\n}")
