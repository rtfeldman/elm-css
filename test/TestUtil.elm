module TestUtil (..) where

import String
import Css
import Css.Declaration exposing (Declaration)


outdented : String -> String
outdented str =
  str
    |> String.split "\n"
    |> List.map String.trim
    |> String.join "\n"
    |> String.trim


prettyPrint : List Declaration -> String
prettyPrint style =
  let
    { warnings, css } =
      Css.compile style
  in
    if List.isEmpty warnings then
      css
    else
      "Invalid Stylesheet:\n" ++ (String.join "\n" warnings)
