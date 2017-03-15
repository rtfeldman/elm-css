module Css.Elements exposing (html, body, article, header, footer, h1, h2, h3, h4, h5, h6, nav, section, div, hr, li, main_, ol, p, ul, pre, a, code, small, span, strong, i, em, img, audio, video, canvas, caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr, button, fieldset, form, input, label, legend, optgroup, option, progress, select, textarea, blockquote, svg, path, rect, circle, ellipse, line, polyline, polygon)

{-| Selectors for HTML elements.

# Basic elements
@docs html, body

# Content sectioning
@docs article, header, footer, h1, h2, h3, h4, h5, h6, nav, section

# Text content
@docs div, hr, li, main_, ol, p, ul, pre, blockquote

# Inline text semantics
@docs a, code, small, span, strong, i, em

# Image and multimedia
@docs img, audio, video, canvas

# Table content
@docs caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr

# Forms
@docs button, fieldset, form, input, label, legend, optgroup, option, progress, select, textarea

# SVG
@docs svg, path, rect, circle, ellipse, line, polyline, polygon
-}

import Css.Preprocess exposing (Mixin, Snippet(Snippet), StyleBlock(StyleBlock), SnippetDeclaration(StyleBlockDeclaration))
import Css.Structure as Structure


typeSelector : String -> List Mixin -> Snippet
typeSelector selectorStr mixins =
    let
        sequence =
            Structure.TypeSelectorSequence (Structure.TypeSelector selectorStr) []

        selector =
            Structure.Selector sequence [] Nothing
    in
        [ StyleBlockDeclaration (StyleBlock selector [] mixins) ]
            |> Snippet



{- BASIC ELEMENTS -}


{-| Selector for a html element.
-}
html : List Mixin -> Snippet
html =
    typeSelector "html"


{-| Selector for a body element.
-}
body : List Mixin -> Snippet
body =
    typeSelector "body"



{- CONTENT SECTIONING -}


{-| Selector for an article element.
-}
article : List Mixin -> Snippet
article =
    typeSelector "article"


{-| Selector for a header element.
-}
header : List Mixin -> Snippet
header =
    typeSelector "header"


{-| Selector for a footer element.
-}
footer : List Mixin -> Snippet
footer =
    typeSelector "footer"


{-| Selector for an h1 element.
-}
h1 : List Mixin -> Snippet
h1 =
    typeSelector "h1"


{-| Selector for an h2 element.
-}
h2 : List Mixin -> Snippet
h2 =
    typeSelector "h2"


{-| Selector for an h3 element.
-}
h3 : List Mixin -> Snippet
h3 =
    typeSelector "h3"


{-| Selector for an h4 element.
-}
h4 : List Mixin -> Snippet
h4 =
    typeSelector "h4"


{-| Selector for an h5 element.
-}
h5 : List Mixin -> Snippet
h5 =
    typeSelector "h5"


{-| Selector for an h6 element.
-}
h6 : List Mixin -> Snippet
h6 =
    typeSelector "h6"


{-| Selector for a nav element.
-}
nav : List Mixin -> Snippet
nav =
    typeSelector "nav"


{-| Selector for a section element.
-}
section : List Mixin -> Snippet
section =
    typeSelector "section"



{- TEXT CONTENT -}


{-| Selector for a div element.
-}
div : List Mixin -> Snippet
div =
    typeSelector "div"


{-| Selector for an hr element.
-}
hr : List Mixin -> Snippet
hr =
    typeSelector "hr"


{-| Selector for an li element.
-}
li : List Mixin -> Snippet
li =
    typeSelector "li"


{-| Selector for a main element.
-}
main_ : List Mixin -> Snippet
main_ =
    typeSelector "main"


{-| Selector for an ol element.
-}
ol : List Mixin -> Snippet
ol =
    typeSelector "ol"


{-| Selector for a p element.
-}
p : List Mixin -> Snippet
p =
    typeSelector "p"


{-| Selector for a ul element.
-}
ul : List Mixin -> Snippet
ul =
    typeSelector "ul"


{-| Selector for a pre element.
-}
pre : List Mixin -> Snippet
pre =
    typeSelector "pre"



{- INLINE TEXT SEMANTICS -}


{-| Selector for an `<a>` element.
-}
a : List Mixin -> Snippet
a =
    typeSelector "a"


{-| Selector for a code element.
-}
code : List Mixin -> Snippet
code =
    typeSelector "code"


{-| Selector for a small element.
-}
small : List Mixin -> Snippet
small =
    typeSelector "small"


{-| Selector for a span element.
-}
span : List Mixin -> Snippet
span =
    typeSelector "span"


{-| Selector for a strong element.
-}
strong : List Mixin -> Snippet
strong =
    typeSelector "strong"


{-| Selector for a i element.
-}
i : List Mixin -> Snippet
i =
    typeSelector "i"


{-| Selector for a em element.
-}
em : List Mixin -> Snippet
em =
    typeSelector "em"



{- IMAGE AND MULTIMEDIA -}


{-| Selector for a img element.
-}
img : List Mixin -> Snippet
img =
    typeSelector "img"


{-| Selector for an audio element.
-}
audio : List Mixin -> Snippet
audio =
    typeSelector "audio"


{-| Selector for a video element.
-}
video : List Mixin -> Snippet
video =
    typeSelector "video"


{-| Selector for a canvas element.
-}
canvas : List Mixin -> Snippet
canvas =
    typeSelector "canvas"



{- TABLE CONTENT -}


{-| Selector for a caption element.
-}
caption : List Mixin -> Snippet
caption =
    typeSelector "caption"


{-| Selector for a col element.
-}
col : List Mixin -> Snippet
col =
    typeSelector "col"


{-| Selector for a colgroup element.
-}
colgroup : List Mixin -> Snippet
colgroup =
    typeSelector "colgroup"


{-| Selector for a table element.
-}
table : List Mixin -> Snippet
table =
    typeSelector "table"


{-| Selector for a tbody element.
-}
tbody : List Mixin -> Snippet
tbody =
    typeSelector "tbody"


{-| Selector for a td element.
-}
td : List Mixin -> Snippet
td =
    typeSelector "td"


{-| Selector for a tfoot element.
-}
tfoot : List Mixin -> Snippet
tfoot =
    typeSelector "tfoot"


{-| Selector for a th element.
-}
th : List Mixin -> Snippet
th =
    typeSelector "th"


{-| Selector for a thead element.
-}
thead : List Mixin -> Snippet
thead =
    typeSelector "thead"


{-| Selector for a tr element.
-}
tr : List Mixin -> Snippet
tr =
    typeSelector "tr"



{- FORMS -}


{-| Selector for a button element.
-}
button : List Mixin -> Snippet
button =
    typeSelector "button"


{-| Selector for a fieldset element.
-}
fieldset : List Mixin -> Snippet
fieldset =
    typeSelector "fieldset"


{-| Selector for a form element.
-}
form : List Mixin -> Snippet
form =
    typeSelector "form"


{-| Selector for an input element.
-}
input : List Mixin -> Snippet
input =
    typeSelector "input"


{-| Selector for a label element.
-}
label : List Mixin -> Snippet
label =
    typeSelector "label"


{-| Selector for a legend element.
-}
legend : List Mixin -> Snippet
legend =
    typeSelector "legend"


{-| Selector for an optgroup element.
-}
optgroup : List Mixin -> Snippet
optgroup =
    typeSelector "optgroup"


{-| Selector for an option element.
-}
option : List Mixin -> Snippet
option =
    typeSelector "option"


{-| Selector for a progress element.
-}
progress : List Mixin -> Snippet
progress =
    typeSelector "progress"


{-| Selector for a select element.
-}
select : List Mixin -> Snippet
select =
    typeSelector "select"


{-| Selector for a textarea element.
-}
textarea : List Mixin -> Snippet
textarea =
    typeSelector "textarea"


{-| Selector for a blockquote element.
-}
blockquote : List Mixin -> Snippet
blockquote =
    typeSelector "blockquote"


{-| Selector for a svg element.
-}
svg : List Mixin -> Snippet
svg =
    typeSelector "svg"


{-| Selector for a path element.
-}
path : List Mixin -> Snippet
path =
    typeSelector "path"


{-| Selector for a rect element.
-}
rect : List Mixin -> Snippet
rect =
    typeSelector "rect"


{-| Selector for a circle element.
-}
circle : List Mixin -> Snippet
circle =
    typeSelector "circle"


{-| Selector for a ellipse element.
-}
ellipse : List Mixin -> Snippet
ellipse =
    typeSelector "ellipse"


{-| Selector for a line element.
-}
line : List Mixin -> Snippet
line =
    typeSelector "line"


{-| Selector for a polyline element.
-}
polyline : List Mixin -> Snippet
polyline =
    typeSelector "polyline"


{-| Selector for a polygon element.
-}
polygon : List Mixin -> Snippet
polygon =
    typeSelector "polygon"
