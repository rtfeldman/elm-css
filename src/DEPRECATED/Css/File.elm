module DEPRECATED.Css.File exposing (CssCompilerProgram, CssFileStructure, Stylesheet, compile, compiler, toFileStructure)

{-|


# DEPRECATED

Compiling to .css files is deprecated, and support is planned to be removed in a
future release (likely sometime in 2018), once [`Html.Styled`](Html-Styled) has
matured sufficiently. The design goal is for elm-css to offer One Way To Do It,
and that one way is planned to be `Html.Styled`!


## Css.File

Functions for writing CSS files from elm-css.

@docs Stylesheet, compile, compiler, toFileStructure, CssFileStructure, CssCompilerProgram

-}

import Css.Preprocess as Preprocess exposing (Style, unwrapSnippet)
import Css.Preprocess.Resolve as Resolve


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


{-| Compile the given stylesheets to a CSS string, or to an error
message if it could not be compiled.
-}
compile : List Stylesheet -> { css : String, warnings : List String }
compile =
    Resolve.compile


{-| Create a program that compiles an elm-css stylesheet to a CSS file.

    import Css.File exposing (CssCompilerProgram, CssFileStructure)
    import HomepageCss as Homepage

    port files : CssFileStructure -> Cmd msg

    fileStructure : CssFileStructure
    fileStructure =
        Css.File.toFileStructure
            [ ( "homepage.css", Css.File.compile [ Homepage.css ] ) ]

    main : CssCompilerProgram
    main =
        Css.File.compiler files fileStructure

-}
compiler : (CssFileStructure -> Cmd Never) -> CssFileStructure -> CssCompilerProgram
compiler filesPort structure =
    Platform.program
        { init = ( (), filesPort structure )
        , update = \_ _ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        }


{-| A prorgam that compiles a CSS file.

See [`compiler`](#compiler).

-}
type alias CssCompilerProgram =
    Program Never () Never


{-| -}
type alias Stylesheet =
    Preprocess.Stylesheet
