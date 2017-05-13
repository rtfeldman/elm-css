module Css.Internal exposing (Value(Value), getValue, getWarnings)


type Value compatible
    = Value (List String) String compatible


getValue : Value compatibility -> String
getValue (Value _ str _) =
    str


getWarnings : Value compatibility -> List String
getWarnings (Value warnings _ _) =
    warnings
