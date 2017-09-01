module Css.File exposing (CssCompilerProgram, CssFileStructure, compile, compiler, toFileStructure)

{-| Functions for writing CSS files from elm-css.

@docs compile, compiler, toFileStructure, CssFileStructure, CssCompilerProgram

-}

import Css exposing (Stylesheet)


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


{-| DEPRECATED.
-}
compiler : (CssFileStructure -> Cmd Never) -> (() -> CssFileStructure) -> CssCompilerProgram
compiler filesPort getStructure =
    -- Note: This must take flags so that `getStructure` is not evaluated on
    -- startup. We need it to be delayed by 1 tick so we have a chance for
    -- hack-main.js to take effect first!
    Platform.programWithFlags
        { init = \flags -> ( (), filesPort (getStructure ()) )
        , update = \_ _ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        }


{-| A prorgam that compiles a CSS file.

See [`compiler`](#compiler).

-}
type alias CssCompilerProgram =
    Program () () Never
