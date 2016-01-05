module Css.Elements
    ( Tag, tagToString
    , html, body
    , article, header, footer, h1, h2, h3, h4, nav, section
    , div, hr, li, main', ol, p, ul, pre
    , a, code, small, span, strong
    , img, audio, video, canvas
    , caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr
    , button, fieldset, form, input, label, legend, optgroup, option, progress, select
    ) where

{-| Selectors for HTML elements.

@docs Tag, tagToString

# Basic elements
@docs html, body

# Content sectioning
@docs article, header, footer, h1, h2, h3, h4, nav, section

# Text content
@docs div, hr, li, main', ol, p, ul, pre

# Inline text semantics
@docs a, code, small, span, strong

# Image and multimedia
@docs img, audio, video, canvas

# Table content
@docs caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr

# Forms
@docs button, fieldset, form, input, label, legend, optgroup, option, progress, select
-}


{-| Selector for an HTML tag.
-}
type Tag
    = Tag String


{-| Converts an HTML tag selector to its underlying String representation.
-}
tagToString : Tag -> String
tagToString (Tag str) =
    str


{- BASIC ELEMENTS -}

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


{- CONTENT SECTIONING -}


{-| Selector for an article element.
-}
article : Tag
article =
    Tag "article"


{-| Selector for a header element.
-}
header : Tag
header =
    Tag "header"


{-| Selector for a footer element.
-}
footer : Tag
footer =
    Tag "footer"


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


{-| Selector for a nav element.
-}
nav : Tag
nav =
    Tag "nav"


{-| Selector for a section element.
-}
section : Tag
section =
    Tag "section"


{- TEXT CONTENT -}


{-| Selector for a div element.
-}
div : Tag
div =
    Tag "div"


{-| Selector for an hr element.
-}
hr : Tag
hr =
    Tag "hr"


{-| Selector for an li element.
-}
li : Tag
li =
    Tag "li"


{-| Selector for a main element.
-}
main' : Tag
main' =
    Tag "main"


{-| Selector for an ol element.
-}
ol : Tag
ol =
    Tag "ol"


{-| Selector for a p element.
-}
p : Tag
p =
    Tag "p"


{-| Selector for a ul element.
-}
ul : Tag
ul =
    Tag "ul"


{-| Selector for a pre element.
-}
pre : Tag
pre =
    Tag "pre"

{- INLINE TEXT SEMANTICS -}



{-| Selector for an `<a>` element.
-}
a : Tag
a =
    Tag "a"


{-| Selector for a code element.
-}
code : Tag
code =
    Tag "code"


{-| Selector for a small element.
-}
small : Tag
small =
    Tag "small"


{-| Selector for a span element.
-}
span : Tag
span =
    Tag "span"


{-| Selector for a strong element.
-}
strong : Tag
strong =
    Tag "strong"


{-| IMAGE AND MULTIMEDIA -}


{-| Selector for a img element.
-}
img : Tag
img =
    Tag "img"


{-| Selector for an audio element.
-}
audio : Tag
audio =
    Tag "audio"


{-| Selector for a video element.
-}
video : Tag
video =
    Tag "video"


{-| Selector for a canvas element.
-}
canvas : Tag
canvas =
    Tag "canvas"



{- TABLE CONTENT -}


{-| Selector for a caption element.
-}
caption : Tag
caption =
    Tag "caption"


{-| Selector for a col element.
-}
col : Tag
col =
    Tag "col"


{-| Selector for a colgroup element.
-}
colgroup : Tag
colgroup =
    Tag "colgroup"


{-| Selector for a table element.
-}
table : Tag
table =
    Tag "table"


{-| Selector for a tbody element.
-}
tbody : Tag
tbody =
    Tag "tbody"


{-| Selector for a td element.
-}
td : Tag
td =
    Tag "td"


{-| Selector for a tfoot element.
-}
tfoot : Tag
tfoot =
    Tag "tfoot"


{-| Selector for a th element.
-}
th : Tag
th =
    Tag "th"


{-| Selector for a thead element.
-}
thead : Tag
thead =
    Tag "thead"


{-| Selector for a thead element.
-}
tr : Tag
tr =
    Tag "tr"


{- FORMS -}


{-| Selector for a button element.
-}
button : Tag
button =
    Tag "button"


{-| Selector for a fieldset element.
-}
fieldset : Tag
fieldset =
    Tag "fieldset"


{-| Selector for a form element.
-}
form : Tag
form =
    Tag "form"


{-| Selector for an input element.
-}
input : Tag
input =
    Tag "input"


{-| Selector for a label element.
-}
label : Tag
label =
    Tag "label"


{-| Selector for a legend element.
-}
legend : Tag
legend =
    Tag "legend"


{-| Selector for an optgroup element.
-}
optgroup : Tag
optgroup =
    Tag "optgroup"


{-| Selector for an option element.
-}
option : Tag
option =
    Tag "option"


{-| Selector for a progress element.
-}
progress : Tag
progress =
    Tag "progress"


{-| Selector for a select element.
-}
select : Tag
select =
    Tag "select"
