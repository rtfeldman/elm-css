module DEPRECATED.Css.File exposing
    ( Stylesheet, stylesheet, compile, compiler, CssFileStructure, CssCompilerProgram
    , UniqueClass, uniqueClass, UniqueSvgClass, uniqueSvgClass
    )

{-|


# DEPRECATED

Compiling to .css files is deprecated, and support is planned to be removed in a
future release (likely sometime in 2018), once [`Html.Styled`](Html-Styled) has
matured sufficiently. The design goal is for elm-css to offer One Way To Do It,
and that one way is planned to be `Html.Styled`!


## Css.File

Functions for writing CSS files from elm-css.

@docs Stylesheet, stylesheet, compile, compiler, CssFileStructure, CssCompilerProgram


## Automatically-generated unique classes

@docs UniqueClass, uniqueClass, UniqueSvgClass, uniqueSvgClass

-}

import Css.Preprocess as Preprocess exposing (Snippet, Style)
import Css.Preprocess.Resolve as Resolve


{-| A description of CSS files that will be created by elm-css.
-}
type alias CssFileStructure =
    List
        { filename : String
        , content : String
        }


{-| Compile the given stylesheets to a CSS string, or to an error
message if it could not be compiled.
-}
compile : List Stylesheet -> { css : String }
compile stylesheets =
    { css = Resolve.compile stylesheets }


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


{-| A stylesheet.

    stylesheet
        [ body
            [ width (px 960)
            , color (rgb 7 7 7)
            ]
        ]

-}
stylesheet : List Snippet -> Stylesheet
stylesheet =
    Preprocess.stylesheet
