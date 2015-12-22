module Emitter (..) where

import Css exposing (..)
import NameOfSourceModuleGoesHere as SourceModule


port cssOutput : CompilerOutput
port cssOutput =
    Css.prettyPrint SourceModule.css
        |> outputToPort


{-| Record type for converting a Result to something consumable in Node
-}
type alias CompilerOutput =
    { success : Bool
    , content : String
    }


{-| Converts a Result emitted by prettyPrint to a CompilerOutput

    port output =
        outputToPort (prettyPrint css)

    css =
        stylsheet { name = "example" }
            $ body
                ~ margin 0 px
-}
outputToPort : Result String String -> CompilerOutput
outputToPort result =
    case result of
        Ok styleString ->
            CompilerOutput True styleString

        Err message ->
            CompilerOutput False message
