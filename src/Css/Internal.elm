module Css.Internal exposing (..)

{-| Compatibilities for all CSS properties.
-}


{-| Compatible
-}
type Auto_
    = Auto_


{-| Compatible
-}
type None_
    = None_


{-| Compatible
-}
type Cursor_
    = Cursor_


{-| Incompatible
-}
type X
    = X


type Value none auto cursor color
    = StringValue String
    | NumberValue Float String
    | ColorValue ColorDescriptor
    | CalcValue (Value none auto cursor color) CalcOperation (Value none auto cursor color)
    | Warnings (List String) (Value none auto cursor color)
    | InvalidValue String


type alias CursorValue =
    Value Auto_ None_ Cursor_ X


type alias Warning =
    String


type CalcOperation
    = Minus
    | Plus


warnings : Value a b c d -> List String
warnings value =
    case value of
        Warnings warningList rest ->
            warningList ++ warnings rest

        CalcValue first _ second ->
            warnings first ++ warnings second

        _ ->
            []


valueToString : Value a b c d -> String
valueToString value =
    case value of
        NumberValue num unitLabel ->
            numberToString num ++ unitLabel

        StringValue str ->
            str

        CalcValue first operation second ->
            [ valueToString first
            , calcOperationToSring operation
            , valueToString second
            ]
                |> String.join " "
                |> List.singleton
                |> cssFunction "calc"

        ColorValue descriptor ->
            case descriptor of
                HexColor str ->
                    withPrecedingHash str

                RgbColor red green blue ->
                    cssFunction "rgb" (List.map numberToString [ red, green, blue ])

                RgbaColor red green blue alpha ->
                    cssFunction "rgba" (List.map numberToString [ red, green, blue ] ++ [ numberToString alpha ])

                HslColor hue saturation lightness ->
                    cssFunction "hsl"
                        [ numberToString hue
                        , numericalPercentageToString saturation
                        , numericalPercentageToString lightness
                        ]

                HslaColor hue saturation lightness alpha ->
                    cssFunction "hsla"
                        [ numberToString hue
                        , numericalPercentageToString saturation
                        , numericalPercentageToString lightness
                        , numberToString alpha
                        ]

                InvalidColor str ->
                    "Invalid color :" ++ str

        Warnings _ rest ->
            valueToString rest

        InvalidValue str ->
            -- TODO make it so this never compiles!
            str


valueToProperty :
    String
    -> Value a b c d
    ->
        { key : String
        , value : String
        , important : Bool
        , warnings : List String
        }
valueToProperty key val =
    { key = key
    , value = valueToString val
    , important = False
    , warnings = warnings val
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
