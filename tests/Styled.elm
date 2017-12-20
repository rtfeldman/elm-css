module Styled exposing (all)

import Html.Styled exposing (toUnstyled)
import ReadmeExample
import Test exposing (Test, describe)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


all : Test
all =
    describe "style tag output"
        [ Test.test
            "See generated css in HTML"
            (\_ ->
                Query.fromHtml (toUnstyled <| ReadmeExample.view "BUY TICKETS")
                    |> Query.has
                        [ Selector.text """._950e85ab {
    background-color:#333333;
    padding:20px;
}"""
                        , Selector.text """._9052bb8e {
    margin:12px;
    color:rgb(255, 255, 255);
}"""
                        , Selector.text """._7bfd0c7b {
    display:inline-block;
    padding-bottom:12px;
}"""
                        , Selector.text """._33aa99cc {
    display:inline-block;
    margin-left:150px;
    margin-right:80px;
    vertical-align:middle;
}"""
                        , Selector.text """._1b2cec01 {
    background-color:#222222;
}"""
                        , Selector.text """._4503f439 {
    padding:16px;
    padding-left:24px;
    padding-right:24px;
    margin-left:50px;
    margin-right:auto;
    color:rgb(255, 255, 255);
    background-color:rgb(27, 217, 130);
    vertical-align:middle;
}"""
                        ]
            )
        ]
