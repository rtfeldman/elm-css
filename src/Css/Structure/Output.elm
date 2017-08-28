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


prettyPrintStyleBlock : String -> StyleBlock -> String
prettyPrintStyleBlock indentLevel (StyleBlock firstSelector otherSelectors properties) =
    let
        selectorStr =
            (firstSelector :: otherSelectors)
                |> List.map selectorToString
                |> String.join ", "
    in
    String.join ""
        [ selectorStr
        , " {\n"
        , indentLevel
        , prettyPrintProperties properties
        , "\n"
        , indentLevel
        , "}"
        ]


prettyPrintDeclaration : Declaration -> String
prettyPrintDeclaration declaration =
    case declaration of
        StyleBlockDeclaration styleBlock ->
            prettyPrintStyleBlock noIndent styleBlock

        MediaRule mediaQueries styleBlocks ->
            let
                blocks =
                    List.map (indent << prettyPrintStyleBlock spaceIndent) styleBlocks
                        |> String.join "\n\n"

                query =
                    List.map mediaQueryToString mediaQueries
                        |> String.join ",\n"
            in
            "@media " ++ query ++ " {\n" ++ blocks ++ "\n}"

        _ ->
            Debug.crash "not yet implemented :x"


mediaQueryToString : MediaQuery -> String
mediaQueryToString mediaQuery =
    let
        prefixWith : String -> MediaType -> List MediaExpression -> String
        prefixWith str mediaType expressions =
            str
                ++ " "
                ++ String.join " and "
                    (mediaTypeToString mediaType
                        :: List.map mediaExpressionToString expressions
                    )
    in
    case mediaQuery of
        AllQuery expressions ->
            expressions
                |> List.map mediaExpressionToString
                |> String.join " and "

        OnlyQuery mediaType expressions ->
            prefixWith "only" mediaType expressions

        NotQuery mediaType expressions ->
            prefixWith "not" mediaType expressions

        CustomQuery str ->
            str


mediaTypeToString : MediaType -> String
mediaTypeToString mediaType =
    case mediaType of
        Print ->
            "print"

        Screen ->
            "screen"

        Speech ->
            "speech"


mediaExpressionToString : MediaExpression -> String
mediaExpressionToString expression =
    "("
        ++ expression.feature
        ++ (expression.value
                |> Maybe.map ((++) ": ")
                |> Maybe.withDefault ""
           )
        ++ ")"


simpleSelectorSequenceToString : SimpleSelectorSequence -> String
simpleSelectorSequenceToString simpleSelectorSequence =
    case simpleSelectorSequence of
        TypeSelectorSequence (TypeSelector str) repeatableSimpleSelectors ->
            (str :: List.map repeatableSimpleSelectorToString repeatableSimpleSelectors)
                |> String.join ""

        UniversalSelectorSequence repeatableSimpleSelectors ->
            if List.isEmpty repeatableSimpleSelectors then
                "*"
            else
                List.map repeatableSimpleSelectorToString repeatableSimpleSelectors
                    |> String.join ""

        CustomSelector str repeatableSimpleSelectors ->
            (str :: List.map repeatableSimpleSelectorToString repeatableSimpleSelectors)
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
        |> flip (++) pseudoElementsString


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


{-| Indent the given string with 4 spaces
-}
indent : String -> String
indent str =
    spaceIndent ++ str


spaceIndent : String
spaceIndent =
    "    "


noIndent : String
noIndent =
    ""


prettyPrintProperties : List Property -> String
prettyPrintProperties properties =
    properties
        |> List.map (indent << prettyPrintProperty)
        |> String.join "\n"
