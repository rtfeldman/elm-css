module Css.Util (toCssIdentifier, identifierToString) where

{-| Utility functions for elm-css. Exposed for the benefit of external
 helper modules.

@docs toCssIdentifier, identifierToString
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


{-| Converts an arbitrary identifier to a valid CSS identifier, then prepends
the given namespace.
-}
identifierToString : a -> b -> String
identifierToString name identifier =
    (toCssIdentifier name) ++ (toCssIdentifier identifier)
