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
                        [ Selector.text """._3f6e16e1 {
    background-color: #333333;
    padding: 20px;
}"""
                        , Selector.text """._3f9bfad4 {
    margin: 12px;
    color: rgb(255, 255, 255);
}"""
                        , Selector.text """._6b223ffd {
    display: inline-block;
    padding-bottom: 12px;
}"""
                        , Selector.text """._cdb78ed8 {
    display: inline-block;
    margin-left: 150px;
    margin-right: 80px;
    vertical-align: middle;
}"""
                        , Selector.text """._d090bd45 {
    background-color: #222222;
}"""
                        , Selector.text """._dda19319 {
    padding: 16px;
    padding-left: 24px;
    padding-right: 24px;
    margin-left: 50px;
    margin-right: auto;
    color: rgb(255, 255, 255);
    background-color: rgb(27, 217, 130);
    vertical-align: middle;
}"""
                        ]
            )
        ]
