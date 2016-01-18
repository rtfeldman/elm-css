module TestUtil (..) where

import ElmTest exposing (..)
import String
import Css
import Css.Declaration exposing (Declaration)
import Check.Test
import Check.Investigator as Investigator exposing (..)
import Random exposing (Seed, Generator, initialSeed)


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


seed : Seed
seed =
  initialSeed 42


runCount : Int
runCount =
  100


it : String -> (a -> b) -> (a -> b) -> Investigator a -> Test
it description expected actual investigator =
  Check.Test.test description actual expected investigator runCount seed
