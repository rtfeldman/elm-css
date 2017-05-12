module Css.Internal exposing (Value(Value), getValue, getCompatibility, getWarnings)


type Value compatible
    = Value String compatible


getValue : Value compatibility -> String
getValue (Value str _) =
    str


getCompatibility : Value compatibility -> compatibility
getCompatibility (Value _ compatibility) =
    compatibility


getWarnings : Value { b | warnings : a } -> a
getWarnings (Value _ { warnings }) =
    warnings
