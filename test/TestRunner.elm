module Main where

import Signal exposing (Signal)

import ElmTest.Runner.Console exposing (runDisplay)
import IO.IO exposing (IO)
import IO.Runner exposing (Request, Response)
import IO.Runner as Run

import Tests


console : IO ()
console =
    runDisplay Tests.all


port requests : Signal Request
port requests =
    Run.run responses console


port responses : Signal Response
