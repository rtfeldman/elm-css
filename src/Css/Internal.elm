module Css.Internal exposing (AnimationProperty(..), ColorValue, ExplicitLength, IncompatibleUnits(..), Length, LengthOrAutoOrCoverOrContain, compileKeyframes, getOverloadedProperty, lengthConverter, lengthForOverloadedProperty)

import Css.Preprocess as Preprocess exposing (Style)
import Css.Structure exposing (Compatible(..))


type IncompatibleUnits
    = IncompatibleUnits


type alias ColorValue compatible =
    { compatible | value : String, color : Compatible }


type alias LengthOrAutoOrCoverOrContain compatible =
    { compatible | value : String, lengthOrAutoOrCoverOrContain : Compatible }


type alias Length compatible units =
    { compatible
        | value : String
        , length : Compatible
        , numericValue : Float
        , units : units
        , unitLabel : String
    }


type alias ExplicitLength units =
    { value : String
    , numericValue : Float
    , units : units
    , unitLabel : String
    , length : Compatible
    , lengthOrAuto : Compatible
    , lengthOrNumber : Compatible
    , lengthOrNone : Compatible
    , lengthOrMinMaxDimension : Compatible
    , lengthOrNoneOrMinMaxDimension : Compatible
    , textIndent : Compatible
    , flexBasis : Compatible
    , absoluteLength : Compatible
    , lengthOrNumberOrAutoOrNoneOrContent : Compatible
    , fontSize : Compatible
    , lengthOrAutoOrCoverOrContain : Compatible
    , calc : Compatible
    }


type AnimationProperty
    = Property String


{-| Used only for compiling keyframes. This does not compile to valid standalone
CSS, but rather to the body of an @keyframes at-rule.

It will be up to other parts of the stystem to generate the @keyframes rule
itself, including the keyframe name. Since keyframe name is generated from a
hash of the string body, we need to be able to compile the body independently.

**NOTE:** This ignores !important, selectors (including pseudo-class and
pseudo-element selectors), and media queries, because those are not supported
in keyframe declarations.

-}
compileKeyframes : List ( Int, List AnimationProperty ) -> String
compileKeyframes tuples =
    tuples
        |> List.map printKeyframeSelector
        |> String.join "\n\n"


printKeyframeSelector : ( Int, List AnimationProperty ) -> String
printKeyframeSelector ( percentage, properties ) =
    let
        percentageStr =
            String.fromInt percentage ++ "%"

        propertiesStr =
            properties
                |> List.map (\(Property prop) -> prop ++ ";")
                |> String.join ""
    in
    percentageStr ++ " {" ++ propertiesStr ++ "}"


{-| Caution: trickery ahead!

This is for use with overloaded CSS properties like `left` that need to be keys
in some places and values in othes. You give it a Style that evaluates to the
relevant key, and then use that key as your value.

For example, `left` is a Style that takes a Length and adds a property like
"left: 3px". What this does is take `left`, pass it `zero` (to create a
"left: 0" definition), then inspects that definition that it just created to
extract the key (in this case the string "left"), then uses that key as the
value for this property.

In this way you can use this function to define textAlign, and allow textAlign
to accept `left` as a value, in which case it will construct "text-align: left"
as the end user expects.

Other notes:

`desiredKey` is the key of the property.
`functionName` is just for better error messages.

-}
getOverloadedProperty : String -> String -> Style -> Style
getOverloadedProperty functionName desiredKey style =
    case style of
        Preprocess.AppendProperty str ->
            let
                key =
                    String.split ":" str
                        |> List.head
                        |> Maybe.withDefault ""
            in
            -- Use the given style's Key as the resulting property's value.
            property desiredKey key

        Preprocess.ExtendSelector selector _ ->
            property desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-selector")

        Preprocess.NestSnippet combinator _ ->
            property desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-combinator")

        Preprocess.WithPseudoElement pseudoElement _ ->
            property desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-pseudo-element setter")

        Preprocess.WithMedia _ _ ->
            property desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-media-query")

        Preprocess.WithKeyframes _ ->
            property desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-inapplicable-Style-for-keyframes")

        Preprocess.ApplyStyles [] ->
            property desiredKey ("elm-css-error-cannot-apply-" ++ functionName ++ "-with-empty-Style")

        Preprocess.ApplyStyles (only :: []) ->
            getOverloadedProperty functionName desiredKey only

        Preprocess.ApplyStyles (first :: rest) ->
            getOverloadedProperty functionName desiredKey (Preprocess.ApplyStyles rest)


{-| Define a custom property.

    css [ property "-webkit-font-smoothing" "none" ]

...outputs

    -webkit-font-smoothing: none;

-}
property : String -> String -> Style
property key value =
    (key ++ ":" ++ value)
        |> Preprocess.AppendProperty


lengthForOverloadedProperty : ExplicitLength IncompatibleUnits
lengthForOverloadedProperty =
    lengthConverter IncompatibleUnits "" 0


lengthConverter : units -> String -> Float -> ExplicitLength units
lengthConverter units unitLabel numericValue =
    { value = String.fromFloat numericValue ++ unitLabel
    , numericValue = numericValue
    , units = units
    , unitLabel = unitLabel
    , length = Compatible
    , lengthOrAuto = Compatible
    , lengthOrNumber = Compatible
    , lengthOrNone = Compatible
    , lengthOrMinMaxDimension = Compatible
    , lengthOrNoneOrMinMaxDimension = Compatible
    , textIndent = Compatible
    , flexBasis = Compatible
    , lengthOrNumberOrAutoOrNoneOrContent = Compatible
    , fontSize = Compatible
    , absoluteLength = Compatible
    , lengthOrAutoOrCoverOrContain = Compatible
    , calc = Compatible
    }
