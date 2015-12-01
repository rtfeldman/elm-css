module Css.Util (..) where

import Regex
import String


toCssIdentifier : a -> String
toCssIdentifier identifier =
    identifier
        |> toString
        |> String.trim
        |> Regex.replace Regex.All (Regex.regex "\\s+") (\_ -> "-")


classToString : String -> a -> String
classToString name class =
    let
        cleanedClass : String
        cleanedClass =
            toCssIdentifier class
    in
        if String.isEmpty name then
            cleanedClass
        else
            name ++ "_" ++ cleanedClass
