module Css.File exposing (compile, toFileStructure, program, CssFileStructure)

{-| Functions for writing CSS files from elm-css.

@docs compile, toFileStructure, program, CssFileStructure
-}

import Css exposing (Stylesheet)
import VirtualDom


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
toFileStructure : List ( String, { css : String, warnings : List String } ) -> CssFileStructure
toFileStructure stylesheets =
    let
        asTuple ( filename, { css, warnings } ) =
            { success = List.isEmpty warnings, filename = filename, content = css }
    in
        List.map asTuple stylesheets


{-| Convenience re-export of Css.compile
-}
compile : List Stylesheet -> { css : String, warnings : List String }
compile =
    Css.compile


{-| Write a file structure out for the elm-css CLI to use

    port write : CssFileStructure -> Cmd msg

    cssFiles : CssFileStructure
    cssFiles =
        -- ...

    main : Program Never
    main =
        Css.File.program write <| cssFiles
-}
program : (CssFileStructure -> Cmd msg) -> CssFileStructure -> Program Never
program write fileStructure =
    VirtualDom.programWithFlags
        { view = \_ -> VirtualDom.text ""
        , subscriptions = \_ -> Sub.none
        , update = \_ _ -> ( (), Cmd.none )
        , init = \_ -> ( (), write fileStructure )
        }
