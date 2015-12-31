module Css.File (toFileStructure, CssFileStructure) where

{-| Functions for writing CSS files from elm-css.

@docs compile, toFileStructure, CssFileStructure
-}

import Css.Declaration.Output exposing (prettyPrintDeclarations)
import Css.Declaration exposing (DeclarationTransform)


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
