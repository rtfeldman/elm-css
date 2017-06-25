module Css.Elements exposing (a, article, aside, audio, blockquote, body, button, canvas, caption, circle, code, col, colgroup, dd, div, dl, dt, ellipse, em, fieldset, footer, form, h1, h2, h3, h4, h5, h6, header, hr, html, i, img, input, label, legend, li, line, main_, menu, nav, ol, optgroup, option, p, path, polygon, polyline, pre, progress, q, rect, section, select, small, span, strong, svg, table, tbody, td, textarea, tfoot, th, thead, time, tr, typeSelector, ul, video)

{-| Selectors for HTML elements.


# Basic elements

@docs typeSelector, html, body


# Content sectioning

@docs article, header, footer, h1, h2, h3, h4, h5, h6, nav, menu, section, aside, time


# Text content

@docs div, hr, li, main_, ol, p, ul, pre, dl, dt, dd, blockquote


# Inline text semantics

@docs a, code, small, span, strong, i, em, q


# Image and multimedia

@docs img, audio, video, canvas


# Table content

@docs caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr


# Forms

@docs button, fieldset, form, input, label, legend, optgroup, option, progress, select, textarea


# SVG

@docs svg, path, rect, circle, ellipse, line, polyline, polygon

-}

import Css.Preprocess exposing (Snippet(Snippet), SnippetDeclaration(StyleBlockDeclaration), Style, StyleBlock(StyleBlock))
import Css.Structure as Structure


{-| Define a custom element.

    stylesheet
      [ typeSelector "aside" [ display block ]
      ]

...outputs

    aside {
        display: block;
    }

-}
typeSelector : String -> List Style -> Snippet
typeSelector selectorStr styles =
    let
        sequence =
            Structure.TypeSelectorSequence (Structure.TypeSelector selectorStr) []

        selector =
            Structure.Selector sequence [] Nothing
    in
    [ StyleBlockDeclaration (StyleBlock selector [] styles) ]
        |> Snippet



{- BASIC ELEMENTS -}


{-| Selector for a html element.
-}
html : List Style -> Snippet
html =
    typeSelector "html"


{-| Selector for a body element.
-}
body : List Style -> Snippet
body =
    typeSelector "body"



{- CONTENT SECTIONING -}


{-| Selector for an article element.
-}
article : List Style -> Snippet
article =
    typeSelector "article"


{-| Selector for a header element.
-}
header : List Style -> Snippet
header =
    typeSelector "header"


{-| Selector for a footer element.
-}
footer : List Style -> Snippet
footer =
    typeSelector "footer"


{-| Selector for an h1 element.
-}
h1 : List Style -> Snippet
h1 =
    typeSelector "h1"


{-| Selector for an h2 element.
-}
h2 : List Style -> Snippet
h2 =
    typeSelector "h2"


{-| Selector for an h3 element.
-}
h3 : List Style -> Snippet
h3 =
    typeSelector "h3"


{-| Selector for an h4 element.
-}
h4 : List Style -> Snippet
h4 =
    typeSelector "h4"


{-| Selector for an h5 element.
-}
h5 : List Style -> Snippet
h5 =
    typeSelector "h5"


{-| Selector for an h6 element.
-}
h6 : List Style -> Snippet
h6 =
    typeSelector "h6"


{-| Selector for a nav element.
-}
nav : List Style -> Snippet
nav =
    typeSelector "nav"


{-| Selector for a [menu](https://developer.mozilla.org/en/docs/Web/HTML/Element/menu) element.
-}
menu : List Style -> Snippet
menu =
    typeSelector "menu"


{-| Selector for a section element.
-}
section : List Style -> Snippet
section =
    typeSelector "section"


{-| Selector for a [aside](https://developer.mozilla.org/en/docs/Web/HTML/Element/aside) element.
-}
aside : List Style -> Snippet
aside =
    typeSelector "aside"


{-| Selector for a [time](https://developer.mozilla.org/en/docs/Web/HTML/Element/time) element.
-}
time : List Style -> Snippet
time =
    typeSelector "time"



{- TEXT CONTENT -}


{-| Selector for a div element.
-}
div : List Style -> Snippet
div =
    typeSelector "div"


{-| Selector for an hr element.
-}
hr : List Style -> Snippet
hr =
    typeSelector "hr"


{-| Selector for an li element.
-}
li : List Style -> Snippet
li =
    typeSelector "li"


{-| Selector for a main element.
-}
main_ : List Style -> Snippet
main_ =
    typeSelector "main"


{-| Selector for an ol element.
-}
ol : List Style -> Snippet
ol =
    typeSelector "ol"


{-| Selector for a p element.
-}
p : List Style -> Snippet
p =
    typeSelector "p"


{-| Selector for a ul element.
-}
ul : List Style -> Snippet
ul =
    typeSelector "ul"


{-| Selector for a pre element.
-}
pre : List Style -> Snippet
pre =
    typeSelector "pre"


{-| Selector for a dl element.

    https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl

-}
dl : List Style -> Snippet
dl =
    typeSelector "dl"


{-| Selector for a dt element.

    https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dt

-}
dt : List Style -> Snippet
dt =
    typeSelector "dt"


{-| Selector for a dd element.

    https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dd

-}
dd : List Style -> Snippet
dd =
    typeSelector "dd"



{- INLINE TEXT SEMANTICS -}


{-| Selector for an `<a>` element.
-}
a : List Style -> Snippet
a =
    typeSelector "a"


{-| Selector for a code element.
-}
code : List Style -> Snippet
code =
    typeSelector "code"


{-| Selector for a small element.
-}
small : List Style -> Snippet
small =
    typeSelector "small"


{-| Selector for a span element.
-}
span : List Style -> Snippet
span =
    typeSelector "span"


{-| Selector for a strong element.
-}
strong : List Style -> Snippet
strong =
    typeSelector "strong"


{-| Selector for a i element.
-}
i : List Style -> Snippet
i =
    typeSelector "i"


{-| Selector for a em element.
-}
em : List Style -> Snippet
em =
    typeSelector "em"


{-| Selector for a [q](https://developer.mozilla.org/en/docs/Web/HTML/Element/q) element.
-}
q : List Style -> Snippet
q =
    typeSelector "q"



{- IMAGE AND MULTIMEDIA -}


{-| Selector for a img element.
-}
img : List Style -> Snippet
img =
    typeSelector "img"


{-| Selector for an audio element.
-}
audio : List Style -> Snippet
audio =
    typeSelector "audio"


{-| Selector for a video element.
-}
video : List Style -> Snippet
video =
    typeSelector "video"


{-| Selector for a canvas element.
-}
canvas : List Style -> Snippet
canvas =
    typeSelector "canvas"



{- TABLE CONTENT -}


{-| Selector for a caption element.
-}
caption : List Style -> Snippet
caption =
    typeSelector "caption"


{-| Selector for a col element.
-}
col : List Style -> Snippet
col =
    typeSelector "col"


{-| Selector for a colgroup element.
-}
colgroup : List Style -> Snippet
colgroup =
    typeSelector "colgroup"


{-| Selector for a table element.
-}
table : List Style -> Snippet
table =
    typeSelector "table"


{-| Selector for a tbody element.
-}
tbody : List Style -> Snippet
tbody =
    typeSelector "tbody"


{-| Selector for a td element.
-}
td : List Style -> Snippet
td =
    typeSelector "td"


{-| Selector for a tfoot element.
-}
tfoot : List Style -> Snippet
tfoot =
    typeSelector "tfoot"


{-| Selector for a th element.
-}
th : List Style -> Snippet
th =
    typeSelector "th"


{-| Selector for a thead element.
-}
thead : List Style -> Snippet
thead =
    typeSelector "thead"


{-| Selector for a tr element.
-}
tr : List Style -> Snippet
tr =
    typeSelector "tr"



{- FORMS -}


{-| Selector for a button element.
-}
button : List Style -> Snippet
button =
    typeSelector "button"


{-| Selector for a fieldset element.
-}
fieldset : List Style -> Snippet
fieldset =
    typeSelector "fieldset"


{-| Selector for a form element.
-}
form : List Style -> Snippet
form =
    typeSelector "form"


{-| Selector for an input element.
-}
input : List Style -> Snippet
input =
    typeSelector "input"


{-| Selector for a label element.
-}
label : List Style -> Snippet
label =
    typeSelector "label"


{-| Selector for a legend element.
-}
legend : List Style -> Snippet
legend =
    typeSelector "legend"


{-| Selector for an optgroup element.
-}
optgroup : List Style -> Snippet
optgroup =
    typeSelector "optgroup"


{-| Selector for an option element.
-}
option : List Style -> Snippet
option =
    typeSelector "option"


{-| Selector for a progress element.
-}
progress : List Style -> Snippet
progress =
    typeSelector "progress"


{-| Selector for a select element.
-}
select : List Style -> Snippet
select =
    typeSelector "select"


{-| Selector for a textarea element.
-}
textarea : List Style -> Snippet
textarea =
    typeSelector "textarea"


{-| Selector for a blockquote element.
-}
blockquote : List Style -> Snippet
blockquote =
    typeSelector "blockquote"


{-| Selector for a svg element.
-}
svg : List Style -> Snippet
svg =
    typeSelector "svg"


{-| Selector for a path element.
-}
path : List Style -> Snippet
path =
    typeSelector "path"


{-| Selector for a rect element.
-}
rect : List Style -> Snippet
rect =
    typeSelector "rect"


{-| Selector for a circle element.
-}
circle : List Style -> Snippet
circle =
    typeSelector "circle"


{-| Selector for a ellipse element.
-}
ellipse : List Style -> Snippet
ellipse =
    typeSelector "ellipse"


{-| Selector for a line element.
-}
line : List Style -> Snippet
line =
    typeSelector "line"


{-| Selector for a polyline element.
-}
polyline : List Style -> Snippet
polyline =
    typeSelector "polyline"


{-| Selector for a polygon element.
-}
polygon : List Style -> Snippet
polygon =
    typeSelector "polygon"
