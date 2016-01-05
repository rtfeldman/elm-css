module Css.Elements (element, tagToString, a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input) where

{-| Selectors for HTML elements.

@docs element, tagToString

# Elements
@docs a, html, body, header, nav, div, span, img, nowrap, button, h1, h2, h3, h4, p, ol, input
-}

import Css.Declaration (..) where

{- elements -}

element : String -> DeclarationTransform
element =
    TypeSelector >> introduceSelector >> Ok



{-| Selector for a html element.
-}
html : DeclarationTransform
html =
    element "html"


{-| Selector for a body element.
-}
body : DeclarationTransform
body =
    element "body"


{-| Selector for a header element.
-}
header : DeclarationTransform
header =
    element "header"


{-| Selector for an `<a>` element.
-}
a : DeclarationTransform
a =
    element "a"


{-| Selector for a nav element.
-}
nav : DeclarationTransform
nav =
    element "nav"


{-| Selector for a div element.
-}
div : DeclarationTransform
div =
    element "div"


{-| Selector for a span element.
-}
span : DeclarationTransform
span =
    element "span"


{-| Selector for a img element.
-}
img : DeclarationTransform
img =
    element "img"


{-| Selector for a nowrap element.
-}
nowrap : DeclarationTransform
nowrap =
    element "nowrap"


{-| Selector for a button element.
-}
button : DeclarationTransform
button =
    element "button"


{-| Selector for an h1 element.
-}
h1 : DeclarationTransform
h1 =
    element "h1"


{-| Selector for an h2 element.
-}
h2 : DeclarationTransform
h2 =
    element "h2"


{-| Selector for an h3 element.
-}
h3 : DeclarationTransform
h3 =
    element "h3"


{-| Selector for an h4 element.
-}
h4 : DeclarationTransform
h4 =
    element "h4"


{-| Selector for a p element.
-}
p : DeclarationTransform
p =
    element "p"


{-| Selector for an ol element.
-}
ol : DeclarationTransform
ol =
    element "ol"


{-| Selector for an input element.
-}
input : DeclarationTransform
input =
    element "input"

