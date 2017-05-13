module Css.Internal exposing (Value(Value), EmittedValue(..), ColorDescriptor(..), getValue, getWarnings, emittedValueToString, cssFunction, numberToString)


type Value compatible
    = Value (List String) EmittedValue compatible


type EmittedValue
    = EmittedString String
    | EmittedNumber Float String
    | EmittedColor ColorDescriptor
    | InvalidValue String


getValue : Value compatibility -> String
getValue (Value _ emittedValue _) =
    emittedValueToString emittedValue


emittedValueToString : EmittedValue -> String
emittedValueToString emittedValue =
    case emittedValue of
        EmittedNumber num unitLabel ->
            numberToString num ++ unitLabel

        EmittedString str ->
            str

        EmittedColor descriptor ->
            case descriptor of
                HexColor str ->
                    withPrecedingHash str

                RgbColor red green blue ->
                    cssFunction "rgb" (List.map numberToString [ red, green, blue ])

                RgbaColor red green blue alpha ->
                    cssFunction "rgba" ((List.map numberToString [ red, green, blue ]) ++ [ numberToString alpha ])

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

        InvalidValue str ->
            -- TODO make it so this never compiles!
            str


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


getWarnings : Value compatibility -> List String
getWarnings (Value warnings _ _) =
    warnings


cssFunction : String -> List String -> String
cssFunction funcName args =
    funcName
        ++ "("
        ++ (String.join ", " args)
        ++ ")"


numberToString : number -> String
numberToString num =
    toString (num + 0)


numericalPercentageToString : number -> String
numericalPercentageToString value =
    value |> (*) 100 |> numberToString |> (flip (++)) "%"
