# elm-css

Isn't it a pain when you want to rename a CSS class or ID, but can't be sure that the rename wouldn't break things?  
Or when it turns out the reason something wasn't displaying as expected was that you had a typo in the class name?
How about when you load multiple stylesheets onto the same page and some of the
class names overlap?

Wouldn't it be sweet if those problems went away?

`elm-css` is a CSS preprocessor where you write Elm code and get out `.css` stylesheets.

It lets you:

1. Share code between your render logic and your CSS stylesheets, so you can easily keep names synchronized
2. Use union types instead of strings for class names and IDs, so typos will result in compile errors instead of bugs
3. Assemble your stylesheets by writing normal Elm code, so you have access to your full suite of programming logic tools instead of the limited set that typical preprocessors ship with.
4. Automatically namespace all your classes to avoid name conflicts between stylesheets.

Here's an example:

```elm
dreamwriter =
    stylesheet "dreamwriter"
        $ html
            ~ width 100 pct
            ~ height 100 pct
            ~ boxSizing borderBox
            ~ padding 0 px
            ~ margin 0 px

        $ body
            ~ minWidth 1280 px
            ~ overflowX auto

            >$ div
                ~ width 100 pct
                ~ height 100 pct

        . Hidden
            ! display none

        # Page
            ~ width 100 pct
            ~ height 100 pct
            ~ boxSizing borderBox
            ~ margin 0 px
            ~ padding 8 px

            ~ backgroundColor pageBackground
            ~ color pageDefaultText
```

The above is vanilla Elm code. `Hidden` and `Page` are backed by union types, so
if they get out of sync with your view code, you'll get a nice build error.
`$`, `#`, `~`, and the like are custom operators.

The above `elm-css` stylesheet compiles to the following .css file:

```css
html {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  padding: 0px;
  margin: 0px;
}

body {
  min-width: 1280px;
  overflow-x: auto;
}

body > div {
  width: 100%;
  height: 100%;
}

.dreamwriter_Hidden {
  display: none !important;
}

#Page {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  margin: 0px;
  padding: 8px;
  background-color: rgb(100, 90, 128);
  color: rgb(40, 35, 76);
}
```

## Development

To get your environment working, just install the dependencies and head to [http://localhost:8000/app/index.html](http://localhost:8000/app/index.html).

```console
$ elm-package install
```
