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
