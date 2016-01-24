module Css.Namespace (..) where

import Css.Helpers exposing (toCssIdentifier, identifierToString)
import Css.Preprocess exposing (..)


test : Stylesheet
test =
  (stylesheet << namespace "foo")
    []


namespace : a -> List Snippet -> List Snippet
namespace rawIdentifier snippets =
  List.map (applyNamespace (toCssIdentifier rawIdentifier)) snippets


applyNamespace : String -> Snippet -> Snippet
applyNamespace str declaration =
  case declaration of
    _ ->
      -- TODO
      declaration
