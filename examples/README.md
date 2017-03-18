### Example

```
elm-make --output=elm.js src/HomepageView.elm --yes
elm-css src/Stylesheets.elm
elm-reactor
```

Now open `index.html` in elm-reactor!

### How does this example work?

For any `elm-css` project, you will need a minimum of:

- An `elm-html` view
- An `elm-css` file with the style rules within

If you are using the CLI tool to generate pure CSS from the `elm-css` files, then you will also need an entry point file. This file will contain a `port files : CssFileStructure` which will tell the CLI tool which files to create.

It's a good idea to use a union type for your classes, so the compiler can
tell you if you make mistakes with them.

Inside you'll find 4 files.

- `SharedStyles` contains the union type for your style classes. This union type needs to be accessed by the CSS file to apply the styles to the tag name. The view file will also use it for giving the divs the correct class, aided by the namespace creator.
- `HomepageCss` contains the `elm-css`
- `HomepageView` contains the views
- `Stylesheets.elm` is only the entry point, for use with the `elm-css` cli tool! It contains no styling, but instead links the Css files with their expected output filenames.
