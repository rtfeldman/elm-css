module Css.Compile (..) where

import Css.Declaration exposing (..)
import Css.Declaration.Output exposing (prettyPrintDeclarations)


compile : List Declaration -> Result (List String) String
compile declarations =
  declarations
    |> dropEmpty
    |> prettyPrint


prettyPrint : List Declaration -> Result (List String) String
prettyPrint declarations =
  case collectErrors declarations of
    [] ->
      Ok (prettyPrintDeclarations declarations)

    errors ->
      Err errors


collectErrors : List Declaration -> List String
collectErrors declarations =
  malformedColorErrors declarations


malformedColorErrors : List Declaration -> List String
malformedColorErrors declarations =
  case declarations of
    [] ->
      []

    (StyleBlock _ _ properties) :: rest ->
      colorErrorsHelp properties ++ malformedColorErrors rest

    (ConditionalGroupRule _ ruleDeclarations) :: rest ->
      malformedColorErrors ruleDeclarations

    (StandaloneAtRule _ _) :: rest ->
      malformedColorErrors rest


colorErrorsHelp : List Property -> List String
colorErrorsHelp properties =
  []


dropEmpty : List Declaration -> List Declaration
dropEmpty declarations =
  case declarations of
    [] ->
      []

    ((StyleBlock _ _ properties) as declaration) :: rest ->
      -- Drop style blocks with no properties
      if List.isEmpty properties then
        dropEmpty rest
      else
        declaration :: (dropEmpty rest)

    ((ConditionalGroupRule ruleStr ruleDeclarations) as declaration) :: rest ->
      let
        pruned =
          dropEmpty ruleDeclarations
      in
        -- Drop the rule if none of its declarations survived dropEmpty
        if List.isEmpty pruned then
          dropEmpty rest
        else
          (ConditionalGroupRule ruleStr pruned) :: dropEmpty rest

    ((StandaloneAtRule _ _) as rule) :: rest ->
      rule :: dropEmpty rest
