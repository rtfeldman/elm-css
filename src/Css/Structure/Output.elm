module Css.Structure.Output exposing (prettyPrint)

import Css.Structure exposing (..)
import String


prettyPrint : Stylesheet -> String
prettyPrint { charset, imports, namespaces, declarations } =
    [ charsetToString charset
    , String.join "\n" (List.map importToString imports)
    , String.join "\n" (List.map namespaceToString namespaces)
    , String.join "\n\n" (List.map prettyPrintDeclaration declarations)
    ]
        |> List.filter (not << String.isEmpty)
        |> String.join "\n\n"


charsetToString : Maybe String -> String
charsetToString charset =
    charset
        |> Maybe.map (\str -> "@charset \"" ++ str ++ "\"")
        |> Maybe.withDefault ""


importToString : ( String, List MediaQuery ) -> String
importToString ( name, mediaQueries ) =
    -- TODO
    "@import \"" ++ name ++ toString mediaQueries ++ "\""


namespaceToString : ( String, String ) -> String
namespaceToString ( prefix, str ) =
    "@namespace "
        ++ prefix
        ++ "\""
        ++ str
        ++ "\""


prettyPrintStyleBlock : StyleBlock -> String
prettyPrintStyleBlock (StyleBlock firstSelector otherSelectors properties) =
    let
        selectorStr =
            (firstSelector :: otherSelectors)
                |> List.map selectorToString
                |> String.join ", "
    in
        selectorStr
            ++ " {\n"
            ++ (prettyPrintProperties properties)
            ++ "\n}"


prettyPrintDeclaration : Declaration -> String
prettyPrintDeclaration declaration =
    case declaration of
        StyleBlockDeclaration styleBlock ->
            prettyPrintStyleBlock styleBlock

        MediaRule mediaQueries styleBlocks ->
            let
                blocks =
                    (List.map (indent << prettyPrintStyleBlock) styleBlocks)
                        |> String.join "\n\n"

                query =
                    (List.map (\(MediaQuery str) -> str) mediaQueries)
                        |> String.join " "
            in
                "@media " ++ query ++ " {\n" ++ indent blocks ++ "\n}"

        _ ->
            Debug.crash "not yet implemented :x"


simpleSelectorSequenceToString : SimpleSelectorSequence -> String
simpleSelectorSequenceToString simpleSelectorSequence =
    case simpleSelectorSequence of
        TypeSelectorSequence (TypeSelector str) repeatableSimpleSelectors ->
            (str :: (List.map repeatableSimpleSelectorToString repeatableSimpleSelectors))
                |> String.join ""

        UniversalSelectorSequence repeatableSimpleSelectors ->
            if List.isEmpty repeatableSimpleSelectors then
                "*"
            else
                List.map repeatableSimpleSelectorToString repeatableSimpleSelectors
                    |> String.join ""

        CustomSelector str repeatableSimpleSelectors ->
            (str :: (List.map repeatableSimpleSelectorToString repeatableSimpleSelectors))
                |> String.join ""


repeatableSimpleSelectorToString : RepeatableSimpleSelector -> String
repeatableSimpleSelectorToString repeatableSimpleSelector =
    case repeatableSimpleSelector of
        ClassSelector str ->
            "." ++ str

        IdSelector str ->
            "#" ++ str

        PseudoClassSelector str ->
            ":" ++ str


selectorChainToString : ( SelectorCombinator, SimpleSelectorSequence ) -> String
selectorChainToString ( combinator, sequence ) =
    [ combinatorToString combinator
    , simpleSelectorSequenceToString sequence
    ]
        |> String.join " "


pseudoElementToString : PseudoElement -> String
pseudoElementToString (PseudoElement str) =
    "::" ++ str


selectorToString : Selector -> String
selectorToString (Selector simpleSelectorSequence chain pseudoElement) =
    let
        segments =
            [ simpleSelectorSequenceToString simpleSelectorSequence ]
                ++ List.map selectorChainToString chain

        pseudoElementsString =
            String.join "" [ Maybe.withDefault "" (Maybe.map pseudoElementToString pseudoElement) ]
    in
        segments
            |> List.filter (not << String.isEmpty)
            |> String.join " "
            |> (flip (++)) pseudoElementsString


combinatorToString : SelectorCombinator -> String
combinatorToString combinator =
    case combinator of
        AdjacentSibling ->
            "+"

        GeneralSibling ->
            "~"

        Child ->
            ">"

        Descendant ->
            ""


prettyPrintProperty : Property -> String
prettyPrintProperty { key, value, important } =
    let
        suffix =
            if important then
                " !important;"
            else
                ";"
    in
        key ++ ": " ++ value ++ suffix


indent : String -> String
indent str =
    "    " ++ str


prettyPrintProperties : List Property -> String
prettyPrintProperties properties =
    properties
        |> List.map (indent << prettyPrintProperty)
        |> String.join "\n"
