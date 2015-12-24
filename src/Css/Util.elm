module Css.Util (toCssIdentifier, classToString) where

{-| Utility functions for elm-css. Exposed for the benefit of external
 helper modules.

@docs toCssIdentifier, classToString
-}

import Regex
import String


{-| Converts an arbitrary value to a valid CSS identifier by calling
`toString` on it, trimming it, replacing chunks of whitespace with `-`,
and stripping out invalid characters.
-}
toCssIdentifier : a -> String
toCssIdentifier identifier =
    identifier
        |> toString
        |> String.trim
        |> Regex.replace Regex.All (Regex.regex "\\s+") (\_ -> "-")
        |> Regex.replace Regex.All (Regex.regex "[^a-zA-Z0-9_-]") (\_ -> "")


{-| Converts an arbitrary class value to a valid CSS identifier, then prepends
the given namespace (if it is non-empty), along with an `_` character.
-}
classToString : a -> b -> String
classToString name class =
    let
        cleanedClass : String
        cleanedClass =
            toCssIdentifier class
    in
        case toCssIdentifier name of
            "" ->
                cleanedClass

            prefix ->
                prefix ++ "_" ++ cleanedClass
