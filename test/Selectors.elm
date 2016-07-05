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
        [ nonElements, elements ]


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
        ]


testSelector : String -> (List Mixin -> Snippet) -> Test
testSelector expectedOutput applySelector =
    (test (expectedOutput ++ " selector")) <|
        \() ->
            prettyPrint (stylesheet [ applySelector [ display none ] ])
                |> Expect.equal (expectedOutput ++ " {\n    display: none;\n}")
