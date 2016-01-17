module Css.Declaration.Output (prettyPrintDeclarations) where

import Css.Declaration exposing (..)
import String


prettyPrintDeclarations : List Declaration -> String
prettyPrintDeclarations declarations =
  declarations
    |> List.map prettyPrintDeclaration
    |> String.join "\n\n"


selectorToString : Selector -> String
selectorToString selector =
  case selector of
    TypeSelector str ->
      str

    ClassSelector str ->
      "." ++ str

    IdSelector str ->
      "#" ++ str

    CustomSelector str ->
      str


compoundSelectorToString : CompoundSelector -> String
compoundSelectorToString compoundSelector =
  case compoundSelector of
    SingleSelector selector ->
      selectorToString selector

    MultiSelector compound single ->
      (compoundSelectorToString compound)
        ++ (selectorToString single)

    AdjacentSibling selectorA selectorB ->
      (compoundSelectorToString selectorA)
        ++ " + "
        ++ (compoundSelectorToString selectorB)

    GeneralSibling selectorA selectorB ->
      (compoundSelectorToString selectorA)
        ++ " ~ "
        ++ (compoundSelectorToString selectorB)

    Child selectorA selectorB ->
      (compoundSelectorToString selectorA)
        ++ " > "
        ++ (compoundSelectorToString selectorB)

    Descendant selectorA selectorB ->
      (compoundSelectorToString selectorA)
        ++ " "
        ++ (compoundSelectorToString selectorB)

    PseudoClass str maybeSelector ->
      let
        prefix =
          case maybeSelector of
            Just selector ->
              compoundSelectorToString selector

            Nothing ->
              ""
      in
        prefix ++ ":" ++ str

    PseudoElement str maybeSelector ->
      let
        prefix =
          case maybeSelector of
            Just selector ->
              compoundSelectorToString selector

            Nothing ->
              ""
      in
        prefix ++ "::" ++ str


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


prettyPrintDeclaration : Declaration -> String
prettyPrintDeclaration declaration =
  case declaration of
    StyleBlock firstSelector extraSelectors properties ->
      let
        selectorStr =
          firstSelector
            :: extraSelectors
            |> List.map compoundSelectorToString
            |> String.join ", "
      in
        selectorStr
          ++ " {\n"
          ++ (prettyPrintProperties properties)
          ++ "\n}"

    ConditionalGroupRule rule declarations ->
      rule
        ++ " {\n"
        ++ indent (prettyPrintDeclarations declarations)
        ++ "\n}"

    StandaloneAtRule rule value ->
      rule ++ " " ++ value
