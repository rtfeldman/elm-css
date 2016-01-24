module Css.Structure.Output (prettyPrint) where

import Css.Structure exposing (..)
import String


prettyPrint : Stylesheet -> String
prettyPrint { charset, imports, namespaces, declarations } =
  (String.join "\n\n")
    [ charsetToString charset
    , String.join "\n" (List.map importToString imports)
    , String.join "\n" (List.map namespaceToString namespaces)
    , prettyPrintDeclarations declarations
    ]


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


prettyPrintDeclarations : List Declaration -> String
prettyPrintDeclarations declarations =
  declarations
    |>
      List.map toString
    -- prettyPrintDeclaration
    |>
      String.join "\n\n"



--simpleSelectorToString : SimpleSelector -> String
--simpleSelectorToString selector =
--  case selector of
--    TypeSelector str ->
--      str
--    ClassSelector str ->
--      "." ++ str
--    IdSelector str ->
--      "#" ++ str
--    MultiSelector first second ->
--      (simpleSelectorToString first) ++ (simpleSelectorToString second)
--    CustomSelector str ->
--      str
--complexSelectorToString : ComplexSelector -> String
--complexSelectorToString complexSelector =
--  case complexSelector of
--    SingleSelector selector ->
--      simpleSelectorToString selector
--    AdjacentSibling selectorA selectorB ->
--      (complexSelectorToString selectorA)
--        ++ " + "
--        ++ (complexSelectorToString selectorB)
--    GeneralSibling selectorA selectorB ->
--      (complexSelectorToString selectorA)
--        ++ " ~ "
--        ++ (complexSelectorToString selectorB)
--    Child selectorA selectorB ->
--      (complexSelectorToString selectorA)
--        ++ " > "
--        ++ (complexSelectorToString selectorB)
--    Descendant selectorA selectorB ->
--      (complexSelectorToString selectorA)
--        ++ " "
--        ++ (complexSelectorToString selectorB)
--    PseudoClass str maybeSelector ->
--      let
--        prefix =
--          case maybeSelector of
--            Just selector ->
--              simpleSelectorToString selector
--            Nothing ->
--              ""
--      in
--        prefix ++ ":" ++ str
--    PseudoElement str maybeSelector ->
--      let
--        prefix =
--          case maybeSelector of
--            Just selector ->
--              simpleSelectorToString selector
--            Nothing ->
--              ""
--      in
--        prefix ++ "::" ++ str
--prettyPrintProperty : Property -> String
--prettyPrintProperty { key, value, important } =
--  let
--    suffix =
--      if important then
--        " !important;"
--      else
--        ";"
--  in
--    key ++ ": " ++ value ++ suffix
--indent : String -> String
--indent str =
--  "    " ++ str
--prettyPrintProperties : List Property -> String
--prettyPrintProperties properties =
--  properties
--    |> List.map (indent << prettyPrintProperty)
--    |> String.join "\n"
--prettyPrintDeclaration : Declaration -> String
--prettyPrintDeclaration declaration =
--  case declaration of
--    StyleBlock firstSelector extraSelectors properties ->
--      let
--        selectorStr =
--          firstSelector
--            :: extraSelectors
--            |> List.map complexSelectorToString
--            |> String.join ", "
--      in
--        selectorStr
--          ++ " {\n"
--          ++ (prettyPrintProperties properties)
--          ++ "\n}"
--    ConditionalGroupRule rule declarations ->
--      rule
--        ++ " {\n"
--        ++ indent (prettyPrintDeclarations declarations)
--        ++ "\n}"
--    StandaloneAtRule rule value ->
--      rule ++ " " ++ value
