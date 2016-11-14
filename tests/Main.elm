port module Main exposing (..)

import Test.Runner.Node exposing (run, TestProgram)
import Tests
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit Tests.all


port emit : ( String, Value ) -> Cmd msg
