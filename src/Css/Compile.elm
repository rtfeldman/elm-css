module Css.Compile (..) where

import Css.Declaration exposing (..)
import Css.Declaration.Output exposing (prettyPrintDeclarations)


compile declarations =
  declarations
    |> dropEmpty
    |> prettyPrintDeclarations
    |> Ok


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
