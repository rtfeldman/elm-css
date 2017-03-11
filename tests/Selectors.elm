module Selectors exposing (all)

import Test exposing (..)
import Expect
import TestUtil exposing (prettyPrint)
import Css exposing (..)
import Css.Elements exposing (..)


all : Test
all =
    describe "selectors"
        [ nonElements, elements ]


nonElements : Test
nonElements =
    describe "non-elements"
        [ testSelector ".foo" (class "foo")
        , testSelector "#foo" (id "foo")
        , testSelector "div:hover" (\children -> div [ hover children ])
        , testSelector "div::before" (\children -> div [ before children ])
        , testSelector "div:visited" (\children -> div [ visited children ])
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
        , testSelector "main" main_
        , testSelector "ol" ol
        , testSelector "p" p
        , testSelector "ul" ul
        , testSelector "pre" pre
        , testSelector "a" a
        , testSelector "code" code
        , testSelector "small" Css.Elements.small
        , testSelector "span" span
        , testSelector "strong" strong
        , testSelector "i" i
        , testSelector "em" Css.Elements.em
        , testSelector "img" img
        , testSelector "audio" audio
        , testSelector "video" video
        , testSelector "canvas" canvas
        , testSelector "caption" caption
        , testSelector "col" col
        , testSelector "colgroup" colgroup
        , testSelector "table" Css.Elements.table
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
        , testSelector "progress" Css.Elements.progress
        , testSelector "select" select
        ]


testSelector : String -> (List Mixin -> Snippet) -> Test
testSelector expectedOutput applySelector =
    (test (expectedOutput ++ " selector")) <|
        \() ->
            prettyPrint (stylesheet [ applySelector [ display none ] ])
                |> Expect.equal (expectedOutput ++ " {\n    display: none;\n}")
