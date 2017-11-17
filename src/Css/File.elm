module Css.File exposing (CssCompilerProgram, CssFileStructure, UniqueClass, UniqueSvgClass, compile, compiler, toFileStructure, uniqueClass, uniqueSvgClass)

{-| Functions for writing CSS files from elm-css.

@docs compile, compiler, toFileStructure, CssFileStructure, CssCompilerProgram


## Automatically-generated unique classes

@docs UniqueClass, uniqueClass, UniqueSvgClass, uniqueSvgClass

-}

import Css exposing (Style, Stylesheet)


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


{-| Styles scoped under an automatically-generated class.
-}
type UniqueClass
    = UniqueClass (List Style)


{-| Styles scoped under an automatically-generated class. Use these for <svg>
elements, as they use a different
-}
type UniqueSvgClass
    = UniqueSvgClass (List Style)


{-| Create a style scoped under an automatically-generated class that is
guaranteed to be unique - at least relative to other class names generated
using this function!

Note: Use [`uniqueSvgClass`](#uniqueSvgClass) for classes that will be used
with SVG elements. These will not work with them!

-}
uniqueClass : List Style -> UniqueClass
uniqueClass =
    UniqueClass


{-| Create a style scoped under an automatically-generated class that is
guaranteed to be unique - at least relative to other class names generated
using this function!

Note: Use [`uniqueClass`](#uniqueClass) for classes that will be used with
SVG elements. These will only work with SVGs!

-}
uniqueSvgClass : List Style -> UniqueSvgClass
uniqueSvgClass =
    UniqueSvgClass
