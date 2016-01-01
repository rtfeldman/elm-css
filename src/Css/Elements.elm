module Css.Elements (Tag, tagToString, a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input) where

{-| Selectors for HTML elements.

@docs Tag, tagToString

# Elements
@docs a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input
-}

{- Tags -}


{-| Selector for a html element.
-}
html : Tag
html =
    Tag "html"


{-| Selector for a body element.
-}
body : Tag
body =
    Tag "body"


{-| Selector for a header element.
-}
header : Tag
header =
    Tag "header"


{-| Selector for an `<a>` element.
-}
a : Tag
a =
    Tag "a"


{-| Selector for a nav element.
-}
nav : Tag
nav =
    Tag "nav"


{-| Selector for a div element.
-}
div : Tag
div =
    Tag "div"


{-| Selector for a span element.
-}
span : Tag
span =
    Tag "span"


{-| Selector for a img element.
-}
img : Tag
img =
    Tag "img"


{-| Selector for a nowrap element.
-}
nowrap : Tag
nowrap =
    Tag "nowrap"


{-| Selector for a button element.
-}
button : Tag
button =
    Tag "button"


{-| Selector for an h1 element.
-}
h1 : Tag
h1 =
    Tag "h1"


{-| Selector for an h2 element.
-}
h2 : Tag
h2 =
    Tag "h2"


{-| Selector for an h3 element.
-}
h3 : Tag
h3 =
    Tag "h3"


{-| Selector for an h4 element.
-}
h4 : Tag
h4 =
    Tag "h4"


{-| Selector for a p element.
-}
p : Tag
p =
    Tag "p"


{-| Selector for an ol element.
-}
ol : Tag
ol =
    Tag "ol"


{-| Selector for an input element.
-}
input : Tag
input =
    Tag "input"


{-| Selector for an HTML tag.
-}
type Tag
    = Tag String


{-| Converts an HTML tag selector to its underlying String representation.
-}
tagToString : Tag -> String
tagToString (Tag str) =
    str
