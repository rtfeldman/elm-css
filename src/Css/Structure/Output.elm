module Css.Structure.Output exposing (mediaQueryToString, prettyPrint, selectorToString)

import Css.String as String
import Css.Structure exposing (..)
import String


prettyPrint : Stylesheet -> String
prettyPrint { charset, imports, namespaces, declarations } =
    [ charsetToString charset
    , String.mapJoin importToString "\n" imports
    , String.mapJoin namespaceToString "\n" namespaces
    , String.mapJoin prettyPrintDeclaration "\n\n" declarations
    ]
        |> String.filterJoin (not << String.isEmpty) "\n\n"


charsetToString : Maybe String -> String
charsetToString charset =
    charset
        |> Maybe.map (\str -> "@charset \"" ++ str ++ "\"")
        |> Maybe.withDefault ""


importToString : ( String, List MediaQuery ) -> String
importToString ( name, mediaQueries ) =
    -- TODO
    String.mapJoin (importMediaQueryToString name) "\n" mediaQueries


importMediaQueryToString : String -> MediaQuery -> String
importMediaQueryToString name mediaQuery =
    "@import \"" ++ name ++ mediaQueryToString mediaQuery ++ "\""


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
                |> String.mapJoin selectorToString ", "
    in
    selectorStr
        ++ " {\n"
        ++ indentLevel
        ++ emitProperties properties
        ++ "\n"
        ++ indentLevel
        ++ "}"


prettyPrintDeclaration : Declaration -> String
prettyPrintDeclaration decl =
    case decl of
        StyleBlockDeclaration styleBlock ->
            prettyPrintStyleBlock noIndent styleBlock

        MediaRule mediaQueries styleBlocks ->
            let
                blocks =
                    String.mapJoin (indent << prettyPrintStyleBlock spaceIndent) "\n\n" styleBlocks

                query =
                    String.mapJoin mediaQueryToString ",\n" mediaQueries
            in
            "@media " ++ query ++ " {\n" ++ blocks ++ "\n}"

        SupportsRule _ _ ->
            "TODO"

        DocumentRule _ _ _ _ _ ->
            "TODO"

        PageRule _ _ ->
            "TODO"

        FontFace _ ->
            "TODO"

        Keyframes { name, declaration } ->
            "@keyframes " ++ name ++ " {\n" ++ declaration ++ "\n}"

        Viewport _ ->
            "TODO"

        CounterStyle _ ->
            "TODO"

        FontFeatureValues _ ->
            "TODO"


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
            String.mapJoin mediaExpressionToString " and " expressions

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
            str ++ String.mapJoin repeatableSimpleSelectorToString "" repeatableSimpleSelectors

        UniversalSelectorSequence repeatableSimpleSelectors ->
            if List.isEmpty repeatableSimpleSelectors then
                "*"

            else
                String.mapJoin repeatableSimpleSelectorToString "" repeatableSimpleSelectors

        CustomSelector str repeatableSimpleSelectors ->
            str ++ String.mapJoin repeatableSimpleSelectorToString "" repeatableSimpleSelectors


repeatableSimpleSelectorToString : RepeatableSimpleSelector -> String
repeatableSimpleSelectorToString repeatableSimpleSelector =
    case repeatableSimpleSelector of
        ClassSelector str ->
            "." ++ str

        IdSelector str ->
            "#" ++ str

        PseudoClassSelector str ->
            ":" ++ str

        AttributeSelector str ->
            "[" ++ str ++ "]"


selectorChainToString : ( SelectorCombinator, SimpleSelectorSequence ) -> String
selectorChainToString ( combinator, sequence ) =
    combinatorToString combinator
        ++ " "
        ++ simpleSelectorSequenceToString sequence


pseudoElementToString : PseudoElement -> String
pseudoElementToString (PseudoElement str) =
    "::" ++ str


selectorToString : Selector -> String
selectorToString (Selector simpleSelectorSequence chain pseudoElement) =
    let
        segments =
            simpleSelectorSequenceToString simpleSelectorSequence
                :: List.map selectorChainToString chain

        pseudoElementsString =
            Maybe.withDefault "" (Maybe.map pseudoElementToString pseudoElement)
    in
    String.append
        (String.filterJoin (not << String.isEmpty) " " segments)
        pseudoElementsString


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


emitProperties : List Property -> String
emitProperties properties =
    String.mapJoin (\prop -> spaceIndent ++ prop ++ ";") "\n" properties
