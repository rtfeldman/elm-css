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
      [ fontFamily [ "Georga", "serif" ]
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
which is why we got a `.` at the start of `.homepageMenuItem`.
2. Passing `{ name = "homepage" }` to `stylesheet` specified that `"homepage"` will be prepended to all classes, IDs, and animation names in this stylesheet. This namespacing concept comes from
[CSS Modules](https://github.com/css-modules/css-modules), and it makes your styles portable by guarding against naming collisions with other stylesheets on the page. Even if you have another stylesheet on the page with a `MenuItem` class, as long as it has a different namespace, their generated class names will not overlap.
3. Finally, `MenuItem` represents the class selector itself. Note that we used a [union type](http://elm-lang.org/guide/model-the-problem) to represent the class instead of a string like `"MenuItem"`. Using a union type for class names guards against accidental misspellings and makes it easier to refactor stylesheet code that is shared with view code.

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

Note that `rgb` is a normal Elm function, so we call it as `(rgb 0 0 128)`
in order to get the output of `rgb(0, 0, 128)`.

Let’s add another style. This one will decree that all the links across the land shalt henceforth be underlined only on hover.

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

      , with hover
          [ textDecoration underline ]
      ]
  ]
```

The `with hover` declaration means "copy the previous selector and add `:hover`",
making it a handy way to expand upon a previous selector without writing it out again.

You can also use `with` to add classes and IDs. For example:

```elm
stylesheet { name = "fancyButton" }
  [ button
      [ padding (px 5)

      , with ((.) Large)
          [ fontSize (px 24)
          , padding (px 30)
          ]

      , with ((#) SignUp)
          [ fontWeight bold
          , hex "aaffbb"
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

Note that although you can structure your code like this, it is generally a bad idea because it increases specificity. It’s best to [keep specificity as low as possible](https://css-tricks.com/strategies-keeping-css-specificity-low/), so that example would be easier to maintain if it did not mention `button` at all, and instead relied only on classes and IDs.

Let’s say we want several things to have underlines on hover only. Piece of cake!

```elm
stylesheet { name = "example" }
  [ each [ a, button, (.) UnderlineOnHover ]
      [ textDecoration none

      , with hover
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

.exampleUnderlineOnHover {
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

button:hover {
    text-decoration: underline;
}

.exampleUnderlineOnHover:hover {
    text-decoration: underline;
}
```

