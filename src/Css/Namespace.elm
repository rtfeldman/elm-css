module Css.Namespace (..) where

import Css.Helpers exposing (toCssIdentifier, identifierToString)
import Css.Preprocess exposing (..)


test : Stylesheet
test =
  (stylesheet << namespace "foo")
    []


namespace : a -> List Declaration -> List Declaration
namespace rawIdentifier declarations =
  List.map (applyNamespace (toCssIdentifier rawIdentifier)) declarations


applyNamespace : String -> Declaration -> Declaration
applyNamespace str declaration =
  case declaration of
    _ ->
      -- TODO
      declaration
