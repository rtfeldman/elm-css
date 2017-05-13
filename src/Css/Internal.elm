module Css.Internal exposing (Value(Value), EmittedValue(..), getValue, getWarnings, emittedValueToString)


type Value compatible
    = Value (List String) EmittedValue compatible


type EmittedValue
    = EmittedString String
    | EmittedNumber Float String


getValue : Value compatibility -> String
getValue (Value _ emittedValue _) =
    emittedValueToString emittedValue


emittedValueToString : EmittedValue -> String
emittedValueToString emittedValue =
    case emittedValue of
        EmittedNumber num unitLabel ->
            toString num ++ unitLabel

        EmittedString str ->
            str


getWarnings : Value compatibility -> List String
getWarnings (Value warnings _ _) =
    warnings
