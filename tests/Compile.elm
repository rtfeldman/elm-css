module Compile exposing (compileTest, dreamwriter, unstyledDiv)

import CompileFixtures
import Css.Preprocess.Resolve exposing (compileSheets)
import Expect
import Test exposing (..)
import TestUtil exposing (..)


unstyledDiv : Test
unstyledDiv =
    let
        input =
            CompileFixtures.unstyledDiv

        output =
            ""
    in
    describe "unstyled div"
        [ test "pretty prints the expected output" <|
            \() ->
                prettyPrint input
                    |> Expect.equal output
        ]


dreamwriter : Test
dreamwriter =
    let
        input =
            CompileFixtures.dreamwriter

        output =
            """
            html,body{width:100%;height:100%;box-sizing:border-box;padding:0;margin:0;}
            body{min-width:1280px;overflow-x:auto;}
            body > div{width:100%;height:100%;}
            .Hidden{display:none !important;}
            #Page{width:100%;height:100%;box-sizing:border-box;margin:0;padding:8px;background-color:rgb(100,90,128);color:rgb(40,35,76);}
        """
    in
    describe "Sample stylesheet from Dreamwriter"
        [ test "pretty prints the expected output" <|
            \() ->
                outdented (prettyPrint input)
                    |> Expect.equal (outdented output)
        ]


compileTest : Test
compileTest =
    let
        input =
            compileSheets
                [ CompileFixtures.basicStyle1
                , CompileFixtures.basicStyle2
                ]

        output =
            """
            .BasicStyle1{display:none;}
            .BasicStyle2{display:none;}
            """
    in
    describe "compiles multiple stylesheets"
        [ test "compile output" <|
            \() ->
                input
                    |> outdented
                    |> Expect.equal (outdented output)
        ]
