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
  case Css.compile style of
    Ok result ->
      result

    Err errors ->
      "Invalid Stylesheet:\n" ++ (String.join "\n" errors)
