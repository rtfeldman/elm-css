module Css.Internal exposing (..)

{-| Compatibilities for all CSS properties.
-}


type Value cursor color
    = Value String


type CalcValue
    = PlainValue String
    | CalcValue CalcValue CalcOperation CalcValue


type alias Warning =
    String


type CalcOperation
    = Minus
    | Plus


calcValueToString : CalcValue -> String
calcValueToString value =
    case value of
        PlainValue str ->
            str

        CalcValue first operation second ->
            [ calcValueToString first
            , calcOperationToSring operation
            , calcValueToString second
            ]
                |> String.join " "
                |> List.singleton
                |> cssFunction "calc"


valueToProperty :
    String
    -> Value a b
    ->
        { key : String
        , value : String
        , important : Bool
        , warnings : List String
        }
valueToProperty key (Value val) =
    { key = key
    , value = val
    , important = False

    -- TODO warnings is now dead code - remove it!
    , warnings = []
    }


withPrecedingHash : String -> String
withPrecedingHash str =
    if String.startsWith "#" str then
        str
    else
        String.cons '#' str


type ColorDescriptor
    = HexColor String
    | RgbColor Int Int Int
    | RgbaColor Int Int Int Float
    | HslaColor Float Float Float Float
    | HslColor Float Float Float
    | InvalidColor String


cssFunction : String -> List String -> String
cssFunction funcName args =
    funcName
        ++ "("
        ++ String.join ", " args
        ++ ")"


numberToString : number -> String
numberToString num =
    toString (num + 0)


numericalPercentageToString : number -> String
numericalPercentageToString value =
    value |> (*) 100 |> numberToString |> flip (++) "%"


calcOperationToSring : CalcOperation -> String
calcOperationToSring operation =
    case operation of
        Plus ->
            "+"

        Minus ->
            "-"
