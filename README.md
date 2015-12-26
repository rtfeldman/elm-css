# elm-css [![Version](https://img.shields.io/npm/v/elm-css.svg)](https://www.npmjs.com/package/elm-css) [![Travis build Status](https://travis-ci.org/rtfeldman/elm-css.svg?branch=master)](http://travis-ci.org/rtfeldman/elm-css) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/0j7x0mpggmtu6mms/branch/master?svg=true)](https://ci.appveyor.com/project/rtfeldman/elm-css/branch/master)

A CSS preprocessor where you write [Elm](http://elm-lang.org) code and get .css files. Inspired by the excellent [Sass](http://sass-lang.com/), [Stylus](http://stylus-lang.com/), and [CSS Modules](http://glenmaddern.com/articles/css-modules) tools.

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

`elm-css` is a CSS preprocessor where you write Elm code and get out `.css` stylesheets.

It lets you:

1. Share code between your render logic and your CSS stylesheets, so you can easily keep names synchronized
2. Use union types instead of strings for class names and IDs, so typos will result in compile errors instead of bugs
3. Automatically namespace all your classes to avoid name conflicts between stylesheets.
4. Assemble your stylesheets by writing normal Elm code, so you have access to your full suite of programming tools. elm-css doesn't need a special notion of "parameterized mixins" because you can already write arbitrary Elm functions...and not just to parameterize mixins, but to parameterize anything!

Here's an example:

```elm
dreamwriter =
    stylesheet { name = "dreamwriter" }
        $ body
            ~ overflowX auto
            ~ minWidth (px 1280)

        . Hidden
            ! display none

        # Page
            ~ backgroundColor (rgb 200 128 64)
            ~ color (hex "CCFFFF")

            ~ width (pct 100)
            ~ height (pct 100)
            ~ boxSizing borderBox
            ~ padding (px 8)
            ~ margin zero

        $ ul . NavBar
            ~ margin zero
            ~ padding zero

            >$ li
                ~ display inlineBlock
                ~ color primaryAccentColor

primaryAccentColor =
    hex "ccffaa"
```

The above is vanilla Elm code. `Hidden` and `Page` are backed by union types, so
if they get out of sync with your view code, you'll get a nice build error.
`$`, `#`, `~`, and the like are custom operators.

The above `elm-css` stylesheet compiles to the following .css file:

```css
body {
  overflow-x: auto;
  min-width: 1280px;
}

.dreamwriter_Hidden {
  display: none !important;
}

#Page {
  background-color: rgb(200, 128, 64);
  color: #CCFFFF;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  padding: 8px;
  margin: 0;
}

ul.dreamwriter_NavBar {
  margin: 0;
  padding: 0;
}

ul.dreamwriter_NavBar > li {
  display: inline-block;
  color: #ccffaa;
}
```

## Development

To get your environment working, just install the dependencies and head to [http://localhost:8000/app/index.html](http://localhost:8000/app/index.html).

```console
$ elm-package install
```
