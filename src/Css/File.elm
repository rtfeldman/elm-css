module Css.File (compile, toFileStructure, CssFileStructure) where

{-| Functions for writing CSS files from elm-css.

@docs toFileStructure, CssFileStructure
-}

import Style exposing (Style(..))
import Css.Declaration.Output exposing (prettyPrintDeclarations)


{-| A description of CSS files that will be created by elm-css.
-}
type alias CssFileStructure =
    List
        { filename : String
        , content : String
        , success : Bool
        }


{-| Translate a list of filenames and [`prettyPrint`](#prettyPrint) results
to a list of tuples suitable for being sent to a port in a Stylesheets.elm file.
-}
toFileStructure : List ( String, Result String String ) -> CssFileStructure
toFileStructure stylesheets =
    let
        asTuple ( filename, result ) =
            case result of
                Ok content ->
                    { success = True, filename = filename, content = content }

                Err msg ->
                    { success = False, filename = filename, content = msg }
    in
        List.map asTuple stylesheets


{-| Compiles the given stylesheet into either a string of css declarations
that can be written directly to a CSS file, or an error message string.
-}
compile : Style class id -> Result String String
compile style =
    case style of
        NamespacedStyle _ declarations ->
            declarations
                |> prettyPrintDeclarations
                |> Ok

        Mixin _ ->
            Err ("Cannot translate mixin to CSS directly. Use `~=` to apply it to a stylesheet instead!")

        InvalidStyle message ->
            Err message
