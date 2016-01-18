module TestUtil (..) where

import String

outdented : String -> String
outdented str =
  str
    |> String.split "\n"
    |> List.map String.trim
    |> String.join "\n"
    |> String.trim
