port module Main exposing (..)

import Test.Runner.Node exposing (run)
import Tests
import Json.Encode exposing (Value)


main : Program Never
main =
    run emit Tests.all


port emit : ( String, Value ) -> Cmd msg
