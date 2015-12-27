module Properties (all) where

import ElmTest exposing (..)
import Css exposing (..)
import Css.Elements exposing (p)
import Css.File exposing (compile)
import Style exposing (Style)


all : Test
all =
    suite
        "properties"
        [ testProperty
            "box-sizing"
            [ ( boxSizing initial, "initial" )
            , ( boxSizing unset, "unset" )
            , ( boxSizing inherit, "inherit" )
            , ( boxSizing contentBox, "content-box" )
            , ( boxSizing borderBox, "border-box" )
            ]
        , testProperty
            "display"
            [ ( display initial, "initial" )
            , ( display unset, "unset" )
            , ( display inherit, "inherit" )
            , ( display none, "none" )
            , ( display inline, "inline" )
            , ( display block, "block" )
            , ( display inlineBlock, "inline-block" )
              -- TODO display: contents;
              -- TODO display: list-item;
              -- TODO display: inline-list-item;
              -- TODO display: table;
              -- TODO display: inline-table;
              -- TODO display: table-cell;
              -- TODO display: table-column;
              -- TODO display: table-column-group;
              -- TODO display: table-footer-group;
              -- TODO display: table-header-group;
              -- TODO display: table-row;
              -- TODO display: table-row-group;
              -- TODO display: flex;
              -- TODO display: inline-flex;
              -- TODO display: grid;
              -- TODO display: inline-grid;
              -- TODO display: ruby;
              -- TODO display: ruby-base;
              -- TODO display: ruby-text;
              -- TODO display: ruby-base-container;
              -- TODO display: ruby-text-container ;
              -- TODO display: run-in;
            ]
        ]


testProperty : String -> List ( Style String a b c, String ) -> Test
testProperty propertyName modifierPairs =
    suite
        (propertyName ++ " property")
        (List.map (assertPropertyWorks propertyName) modifierPairs)


assertPropertyWorks : String -> ( Style String a b c, String ) -> Test
assertPropertyWorks propertyName ( input, expectedStr ) =
    test "pretty prints the expected output"
        <| assertEqual
            (prettyPrint (stylesheet { name = "test" } $ p ~ input))
            ("p {\n    " ++ propertyName ++ ": " ++ expectedStr ++ ";\n}")


prettyPrint : Style a b c d -> String
prettyPrint style =
    case compile style of
        Ok result ->
            result

        Err message ->
            "Invalid Stylesheet: " ++ message
