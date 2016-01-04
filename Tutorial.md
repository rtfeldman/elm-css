# Tutorial

Let's start by defining a font for our menu items.

```elm
snippet (context "homepage")
  . MenuItem
    [ fontFamily [ "Georga", "serif" ]
    , fontWeight bold
    ]
```

This will compile to the following CSS file:

```css
.homepageMenuItem {
  font-family: "Georgia", "serif";
  font-weight: bold;
}
```

There are a few things to note here. First, `. MenuItem` compiled to
`.MenuItem`. Why?

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
    , fontWeight bold
    ]
```

...it would have compiled to this instead:

```css
#homepageMenuItem {
  font-family: "Georgia", "serif";
  font-weight: bold;
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
    , fontWeight bold
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
  font-weight: bold;
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
    , fontWeight bold
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
  font-weight: bold;
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
    , fontWeight bold
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
  font-weight: bold;
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
    , fontWeight bold
    ]
  . NavLink
    [ color (rgb 0 0 128)
    , textDecoration none
    ]
  &: hover
    [ textDecoration underline ]
```
-}
