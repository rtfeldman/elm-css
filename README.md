# elm-css [![Version](https://img.shields.io/npm/v/elm-css.svg)](https://www.npmjs.com/package/elm-css) [![Travis build Status](https://travis-ci.org/rtfeldman/elm-css.svg?branch=master)](http://travis-ci.org/rtfeldman/elm-css) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/0j7x0mpggmtu6mms/branch/master?svg=true)](https://ci.appveyor.com/project/rtfeldman/elm-css/branch/master)

A CSS preprocessor where you write [Elm](http://elm-lang.org) code and get .css files. Inspired by the excellent [Sass](http://sass-lang.com/), [Stylus](http://stylus-lang.com/), and [CSS Modules](http://glenmaddern.com/articles/css-modules).

(This is a BETA release, so please be careful! The [documentation](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/) in particular
is very much a work in progress.)

Try it out! (make sure you already have [elm](http://elm-lang.org) installed, e.g. with `npm install -g elm`)

```
$ npm install -g elm-css
$ git clone https://github.com/rtfeldman/elm-css.git
$ cd elm-css/examples
$ elm-css src/Stylesheets.elm
$ less homepage.css
```

Isn't it a pain when you want to rename a CSS class or ID, but can't be sure that the rename wouldn't break things?
Or when it turns out the reason something wasn't displaying as expected was that you had a typo in the class name?
How about when you load multiple stylesheets onto the same page and some of the
class names overlap?

Wouldn't it be sweet if those problems went away?

`elm-css` lets you:

1. Write Elm code and get out a .css file
2. Share code between your render logic and your CSS stylesheets (including any inline styles, which you can also write in elm-css), so you can easily keep identifier names and URLs synchronized
3. Use union types instead of strings for class names, IDs, and animation names, so typos will result in compile errors instead of bugs
4. Automatically namespace all your classes, ids, and animation names to avoid name conflicts between stylesheets.
5. Assemble your stylesheets by writing normal Elm code, so you have access to your full suite of programming tools. `elm-css` doesn't need a special notion of "parameterized mixins" because you can already write arbitrary Elm functions...and not just to parameterize mixins, but to parameterize anything!


### Examples

There are a few examples to check out!

- [json-to-elm](https://github.com/eeue56/json-to-elm) which can see be seen live [here](https://noredink.github.io/json-to-elm)
- the examples folder contains a working project with a readme
- the example below:


Here's how to use `elm-css` in your projects:

#### Generating CSS

You will need to install both the node module and the Elm library:

    npm install -g elm-css
    elm package install rtfeldman/elm-css

Then define CSS in Elm:

```elm
module MyCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)


type CssClasses
    = NavBar


type CssIds
    = Page


css =
    (stylesheet << namespace "dreamwriter")
    [ body
        [ overflowX auto
        , minWidth (px 1280)
        ]
    , (#) Page
        [ backgroundColor (rgb 200 128 64)
        , color (hex "CCFFFF")
        , width (pct 100)
        , height (pct 100)
        , boxSizing borderBox
        , padding (px 8)
        , margin zero
        ]
    , (.) NavBar
        [ margin zero
        , padding zero
        , children
            [ li
                [ (display inlineBlock) |> important
                , color primaryAccentColor
                ]
            ]
        ]
    ]


primaryAccentColor =
    hex "ccffaa"
```

The above is vanilla Elm code. `NavBar` and `Page` are backed by union types, so
if they get out of sync with your view code, you'll get a nice build error.
`$`, `#`, `~`, and the like are custom operators.

To generate CSS, you'll need a special module with a port for elm-css to access:

```elm
port module Stylesheets exposing (..)

import Css.File exposing (..)
import MyCss
import Html exposing (div)
import Html.App as Html


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
    toFileStructure [ ( "styles.css", compile MyCss.css ) ]


main : Program Never
main =
    Html.program
        { init = ( (), files cssFiles )
        , view = \_ -> (div [] [])
        , update = \_ _ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
```

Run `elm-css` on the file containing this `Stylesheets` module.
Then include that css file in your web page.

The above `elm-css` stylesheet compiles to the following .css file:

```css
body {
    overflow-x: auto;
    min-width: 1280px;
}

#dreamwriterPage {
    background-color: rgb(200, 128, 64);
    color: #CCFFFF;
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    padding: 8px;
    margin: 0;
}

.dreamwriterNavBar {
    margin: 0;
    padding: 0;
}

.dreamwriterNavBar > li {
    display: inline-block !important;
    color: #ccffaa;
}
```

#### Coupling elm-css and Elm code

In your Elm code, use the same union types to represent classes and ids. Then they can't get out of sync with your CSS. To do this, you'll need special versions the of `id`, `class`, and `classList` functions from `elm-html`.

Install the handy package that combines `elm-html` and `elm-css`:

     elm package install rtfeldman/elm-css-helpers

The `Elm.CssHelpers.withNamespace` returns a record full of handy functions. Use that, and then construct Html using classes and ids defined in your union types. For example:

```elm
module MyView exposing (..)


import Html.CssHelpers
import MyCss


{ id, class, classList } =
    Html.CssHelpers.withNamespace "dreamwriter"


view =
    Html.div []
        [ Html.div [ class [ MyCss.NavBar ] ] [ Html.text "this has the NavBar class" ]
        , Html.div [ id [ MyCss.Page ] ] [ Html.text "this has the Page id" ]
        ]

```

#### Inline elm-css

You can also use elm-css for inline styles with the `asPairs` function, like so:

    styles =
        Css.asPairs >> Html.Attributes.style

    button [ styles [ position absolute, left (px 5) ] ]
        [ text "Whee!" ]

## Releases
| Version | Notes |
| ------- | ----- |
| [**3.1.2**](https://github.com/rtfeldman/elm-css/tree/3.1.2) | Fix extraneous space in pseudo-element output
| [**3.1.1**](https://github.com/rtfeldman/elm-css/tree/3.1.1) | Fix missing pseudo-element implementation
| [**3.1.0**](https://github.com/rtfeldman/elm-css/tree/3.1.0) | Fix bug where namespace was getting applied to ID selectors, add letterSpacing, h5, h6
| [**3.0.0**](https://github.com/rtfeldman/elm-css/tree/3.0.0) | Upgrade for Elm 0.17
| [**2.2.0**](https://github.com/rtfeldman/elm-css/tree/2.2.0) | Expose more types
| [**1.1.0**](https://github.com/rtfeldman/elm-css/tree/1.1.0) | Add Helpers
| [**1.0.0**](https://github.com/rtfeldman/elm-css/tree/1.0.0) | Initial Release
