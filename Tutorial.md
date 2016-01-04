# Tutorial

## Selectors and Properties

Let's start by defining a font for our menu items.

```elm
snippet (context "homepage")
  . MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , padding (px 5)
    ]
```

This will compile to the following CSS file:

```css
.homepageMenuItem {
  font-family: "Georgia", "serif";
  padding: 5px;
}
```

There are a few things to note here.

First, note that `(px 5)` compiled to `5px`. This is because `px` is a function
that applies `px` units to a number. Because it is a normal Elm function, you
call it by placing it before the number in question.

Next, notice that `. MenuItem` compiled to `.MenuItem`. Why?

The `homepage` part of `.MenuItem` comes from the `context`
provided as the first argument to `snippet`, which specifies that all
Class selectors, ID selectors, and animation names in this CSS snippet
will be prefixed with the given context - in this case, `"homepage"`. This
lets you use concise class names without clashing with other class names on the
page.

The `.` part of `.MenuItem` comes from the `.` operator. If we had used
`#` instead, like so:

```elm
snippet (context "homepage")
  # MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , padding (px 5)
    ]
```

...it would have compiled to this instead:

```css
#homepageMenuItem {
  font-family: "Georgia", "serif";
  padding: 5px;
}
```

Finally, the `MenuItem` part of `.MenuItem` came from the `MenuItem`
that was passed to the `.` operator. `MenuItem` comes from a union type we
would have defined earlier, perhaps like so:

```elm
type HomepageClasses
  = MenuItem
  | NavBarEntry
  | FunkyButton
```

`elm-css` calls `toString` on the union type `MenuItem` before prepending
`"homepage"` from the `context` and `"."` from the `.` operator to arrive at
`.homepageMenuItem`.

Let's add another style. This one will decree that all the links across the land
shalt henceforth be green and without underlines.

```elm
snippet (context "homepage")
  . MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , padding (px 5)
    ]
  $ a
    [ color (rgb 0 0 128)
    , textDecoration none
    ]
```

The `$` operator creates an element selector. This snippet will compile to
the following.

```css
.homepageMenuItem {
  font-family: "Georgia", "serif";
  padding: 5px;
}

a {
  color: rgb(0, 0, 128);
  text-decoration: none;
}
```

Note that `rgb` is a normal Elm function, so we call it as `(rgb 0 0 128)`
in order to get the output of `rgb(0, 0, 128)`.

Next let's add a hover style to `a` that restores the underline.

```elm
snippet (context "homepage")
  . MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , padding (px 5)
    ]
  $ a
    [ color (rgb 0 0 128)
    , textDecoration none
    ]
  &: hover
    [ textDecoration underline ]
```

The `&: hover` declaration means "copy the previous selector and add `:hover`",
meaning this will create the following output.

```css
.homepageMenuItem {
  font-family: "Georgia", "serif";
  padding: 5px;
}

a {
  color: rgb(0, 0, 128);
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}
```

There are `&.` and `&#` selectors that work the same way as `&:`, so if we
wanted to style only `a` tags with the class `NavLink`, we could do it like so:

```elm
snippet (context "homepage")
  . MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , padding (px 5)
    ]
  $ a
  &. NavLink
    [ color (rgb 0 0 128)
    , textDecoration none
    ]
  &: hover
    [ textDecoration underline ]
```

The above would compile to the following:

```css
.homepageMenuItem {
  font-family: "Georgia", "serif";
  padding: 5px;
}

a.homepageNavLink {
  color: rgb(0, 0, 128);
  text-decoration: none;
}

a.homepageNavLink:hover {
  text-decoration: underline;
}
```

However, you should not do this unless you absolutely must! It is best to
[keep specificity low](https://css-tricks.com/strategies-keeping-css-specificity-low/),
and if you only want to style your nav links, then make sure they have a
unique class and write the stylesheet without the `a` selectors:

```elm
snippet (context "homepage")
  . MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , padding (px 5)
    ]
  . NavLink
    [ color (rgb 0 0 128)
    , textDecoration none
    ]
  &: hover
    [ textDecoration underline ]
```

Finally, suppose that we want to define multiple selectors at once

```elm
snippet (context "homepage")
  $ html
  |+ (or $ body)
  |+ (or $ ul)
  |+ (or . NavLink)
    [ padding zero
    , margin2 (pct 10) auto
    ]
```

This will compile to the following.

```elm
html, body, ul, .homepageNavLink {
  padding: 0;
  margin: 10% auto;
}
```

Note that `(pct 10)` compiles to `10%`, and that `margin` accepts `auto` instead
of a number with units associated. If you try to pass `auto` to `padding`,
however, you will get a type error; `auto` is not a legal value for `padding`
according to the CSS specification.

Also note that `zero` compiles to `0` with no units. The `padding` function
is ordinarily expecting a value with units associated, but `zero` works too.
You could also have passed `(px 0)` to generate `padding: 0px;` instead of
`padding: 0;`, but you could not have passed `0` because the `padding`
function does not accept raw numbers; the compiler would have given a type error.

Next note that we called `margin2`, not `margin`. This is the convention for
handling CSS properties that accept different numbers of arguments. In addition
to `margin2`, there is also `margin` (e.g. `margin (em 2)` would compile to
`margin: 2em;`) as well as `margin3` and `margin4`.

Finally note the syntax for combining multiple selectors:

```elm
$ html
|+ (or $ body)
|+ (or $ ul)
|+ (or . NavLink)
```

`|+` and `or` together function like a comma in a CSS multiple selector.

## Mixins

## Sharing Contexts
-}
