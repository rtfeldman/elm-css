# Tutorial

## Selectors and Properties

Let’s start by defining a width and padding for our `<body>` element.

```elm
stylesheet { name = "homepage" }
  [ body
      [ padding (px 30)
      , width (pct 100)
      ]
  ]
```

This will compile to the following CSS.

```css
body {
    padding: 30px;
    width: 100%;
}
```

Note that `(px 30)` compiled to `30px`. This is because `px` is a function
that applies `px` units to a number. Because it is a normal Elm function, you
call it by placing it before the number in question. Similarly, `(pct 100)`
compiles to `100%` because the `pct` function applies `%` units to a number.

Next let’s define a font for our menu items.

```elm
type CssClasses = MenuItem | Thumbnail | Sidebar

stylesheet { name = "homepage" }
  [ body
      [ padding (px 30)
      , width (pct 100)
      ]

  , (.) MenuItem
      [ fontFamilies [ "Georga", "serif" ]
      , fontWeight bold
      ]
  ]
```

This will compile to the following CSS:

```css
body {
    padding: 30px;
    width: 100%;
}

.homepageMenuItem {
    font-family: "Georgia", "serif";
    font-weight: bold;
}
```

There are a few things to note here.

First, notice that `(.) MenuItem` compiled to `.homepageMenuItem`. This breaks
down into three pieces: the selector `.`, the namespace `homepage`, and the
class name `MenuItem`.

1. The `(.)` represents a [class selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors),
which is where the `.` at the start of `.homepageMenuItem` came from.
2. Passing `{ name = "homepage" }` to `stylesheet` specified that `"homepage"` will be prepended to all classes, IDs, and animation names in this stylesheet. This namespacing concept comes from
[CSS Modules](https://github.com/css-modules/css-modules), and it makes your styles portable by guarding against naming collisions with other stylesheets. Even if you have another stylesheet on the page with a `MenuItem` class, as long as it has a different namespace, their generated class names will not overlap.
3. Finally, `MenuItem` represents the class selector itself. Note that we used a [union type](http://elm-lang.org/guide/model-the-problem) to represent the class instead of a string like `"MenuItem"`. Using a union type for class names means accidental misspellings will result in compiler errors, and makes it easier to refactor stylesheet code that is shared with view code.

Let’s add an [ID selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors) next.

```elm
type CssClasses = MenuItem | Thumbnail | Sidebar

type CssIds = Welcome | Footer | Hero

stylesheet { name = "homepage" }
  [ body
      [ padding (px 30)
      , width (pct 100)
      ]

  , (.) MenuItem
      [ fontFamily [ "Georga", "serif" ]
      , fontWeight bold
      ]

  , (#) Welcome
      [ textAlign center
      , color (rgb 10 11 12)
      ]
  ]
```

This will compile to the following CSS:

```css
body {
    padding: 30px;
    width: 100%;
}

.homepageMenuItem {
    font-family: "Georgia", "serif";
    font-weight: bold;
}

#homepageWelcome {
    text-align: center;
    color: rgb(10, 11, 12);
}
```

As with `(.) MenuItem`, when you use `(#) Welcome`, `elm-css` calls `toString` on the union type `Welcome` before prepending `"homepage"` from the `namespace` and `"#"` from the `#` operator to arrive at `#homepageMenuItem`.

Note that `rgb` is a normal Elm function, so you call it as `(rgb 10 11 12)`
in order to get the output of `rgb(10, 11, 12)`.

Let’s add another style. This one declares that links have underlines only on hover.

```elm
type CssClasses = MenuItem | Thumbnail | Sidebar

type CssIds = Welcome | Footer | Hero

stylesheet { name = "homepage" }
  [ body
      [ padding (px 30)
      , width (pct 100)
      ]

  , (.) MenuItem
      [ fontFamily [ "Georga", "serif" ]
      , color (rgb 10 11 12)
      ]

  , (#) Welcome
      [ textAlign center ]

  , a
      [ textDecoration none

      , hover
          [ textDecoration underline ]
      ]
  ]
```

The `hover` declaration means "copy the previous selector and add `:hover`",
making it a handy way to expand upon a previous selector without writing it out again.

```css
body {
    padding: 30px;
    width: 100%;
}

.homepageMenuItem {
    font-family: "Georgia", "serif";
    font-weight: bold;
}

#homepageWelcome {
    text-align: center;
    color: rgb(10, 11, 12);
}

a {
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
```

You can also use `withClass` to add classes. For example:

```elm
stylesheet { name = "fancyButton" }
  [ button
      [ padding (px 5)

      , withClass Large
          [ fontSize (px 24)
          , padding (px 30)
          ]
      ]
  ]
```

The above compiles to:

```css
button {
    padding: 5px;
}

button.fancyButtonLarge {
    font-size: 24px;
    padding: 30px;
}

button#fancyButtonSignUp {
    font-weight: bold;
    color: #aaffbb;
}
```

Note that although you *can* structure your styles like this, it is generally a bad idea because it increases specificity.

It’s best to [keep specificity as low as possible](https://css-tricks.com/strategies-keeping-css-specificity-low/); the above example would be easier to maintain if it did not mention `button` at all, and instead declared only class selectors and ID selectors.

Now let’s say we want several things to have underlines on hover only. Piece of cake!

```elm
stylesheet { name = "example" }
  [ each [ a, button, (.) FancyThing ]
      [ textDecoration none

      , hover
          [ textDecoration underline ]
      ]
  ]
```

This will compile to the following CSS:

```css
a {
    text-decoration: none;
}

button {
    text-decoration: none;
}

.exampleFancyThing {
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

button:hover {
    text-decoration: underline;
}

.exampleFancyThing:hover {
    text-decoration: underline;
}
```

Now let’s take things up a notch or two.

```elm
stylesheet { name = "homepage" }
  [ withMedia [ print ]
      [ body
          [ width (px 1280) ]
      ]

  , mediaQuery "screen and ( max-width: 600px )"
      [ body
          [ backgroundColor (hex "FF00FF" ) ]
      ]
  , ul
      [ padding zero

      , withMedia [ print ]
          [ margin2 (em 1) auto ]

      , children
          [ li
              [ fontSize (pt 12) ]
          ]
      ]
  ]
```

The above fanciness compiles to the following:

```css
@media print {
    body {
        width: 1280px;
    }
}

@media screen and ( max-width: 600px ) {
    body {
        background-color: #FF00FF;
    }
}

ul {
    padding: 0;
}

@media print {
    ul {
        margin: 1em auto;
    }
}

ul > li {
    font-size: 12pt;
}
```

This demonstrates two different ways to do a media query. First, at the top level just like you would in CSS, with `media "print"` followed by a `body` selector and some styles. Second, using `with` to nest a media query within a `ul` selector. In either case, you end up with a top-level `@media` declaration in the compiled CSS.

This also introduces how to use selector combinators: in this case the [child combinator](https://developer.mozilla.org/en-US/docs/Web/CSS/Child_selectors), represented in CSS as the `>` operator and in `elm-css` as the `children` function. (By design, there is no operator equivalent in `elm-css`) There is also a `descendants`  function, an `adjacentSiblings` function, and so on.

Note that `zero` compiles to `0` with no units. The `padding` function
is ordinarily expecting a value with units associated, but `zero` works too.
You could also have passed `(px 0)` to generate `padding: 0px;` instead of
`padding: 0;`, but you could not have passed `0` because the `padding`
function does not accept raw numbers; the compiler would have given a type error.

Also note that we called `margin2`, not `margin`. This is the convention for
handling CSS properties that accept different numbers of arguments. In addition
to `margin2`, there is also `margin` (e.g. `margin (em 2)` would compile to
`margin: 2em;`) as well as `margin3` and `margin4`.

Finally, note that `margin` accepts `auto` instead of a number with units associated. If you try to pass `auto` to `padding`, however, you will get a type error; according to the CSS specification, `auto` is a legal value for `margin` but not for `padding`, and `elm-css` is aware of this.

## Mixins

## Sharing Namespaces with the View
-}
