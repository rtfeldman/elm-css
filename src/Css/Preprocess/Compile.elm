module Css.Preprocess.Compile (..) where

import Css.Preprocess exposing (..)
import Css.Structure as Structure exposing (Declaration)
import Css.Structure.Output as Output


compile : Stylesheet -> { warnings : List String, css : String }
compile preprocessStylesheet =
  let
    ( structureStylesheet, warnings ) =
      toStructure preprocessStylesheet
  in
    { warnings = warnings
    , css = Output.prettyPrint (Structure.dropEmpty structureStylesheet)
    }
