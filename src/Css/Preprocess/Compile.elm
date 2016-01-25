module Css.Preprocess.Compile (..) where

import Css.Preprocess exposing (..)
import Css.Structure as Structure exposing (Declaration)
import Css.Structure.Output as Output


compile : Stylesheet -> { warnings : List String, css : String }
compile sheet =
  let
    ( structureStylesheet, warnings ) =
      toStructure sheet
  in
    { warnings = warnings
    , css = Output.prettyPrint (Structure.dropEmpty structureStylesheet)
    }
