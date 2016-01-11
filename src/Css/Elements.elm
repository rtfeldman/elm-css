module Css.Elements (html, body, article, header, footer, h1, h2, h3, h4, nav, section, div, hr, li, main', ol, p, ul, pre, a, code, small, span, strong, img, audio, video, canvas, caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr, button, fieldset, form, input, label, legend, optgroup, option, progress, select) where

{-| Selectors for HTML elements.

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

import Css.Declaration as Declaration exposing (Declaration, Selector(TypeSelector), introduceSelector, getLastProperty, updateLastProperty, extendLastSelector, addProperty, addSelector)
import Css exposing (Snippet)
import Css.Transforms exposing (SnippetTransformType, makeSnippetFromSelector)


type alias Selector =
  () -> Snippet



{- BASIC ELEMENTS -}


makeTypeSelector : String -> Selector
makeTypeSelector str _ =
  makeSnippetFromSelector (\_ -> TypeSelector str)


{-| Selector for a html element.
-}
html : Selector
html =
  makeTypeSelector "html"


{-| Selector for a body element.
-}
body : Selector
body =
  makeTypeSelector "body"



{- CONTENT SECTIONING -}


{-| Selector for an article element.
-}
article : Selector
article =
  makeTypeSelector "article"


{-| Selector for a header element.
-}
header : Selector
header =
  makeTypeSelector "header"


{-| Selector for a footer element.
-}
footer : Selector
footer =
  makeTypeSelector "footer"


{-| Selector for an h1 element.
-}
h1 : Selector
h1 =
  makeTypeSelector "h1"


{-| Selector for an h2 element.
-}
h2 : Selector
h2 =
  makeTypeSelector "h2"


{-| Selector for an h3 element.
-}
h3 : Selector
h3 =
  makeTypeSelector "h3"


{-| Selector for an h4 element.
-}
h4 : Selector
h4 =
  makeTypeSelector "h4"


{-| Selector for a nav element.
-}
nav : Selector
nav =
  makeTypeSelector "nav"


{-| Selector for a section element.
-}
section : Selector
section =
  makeTypeSelector "section"



{- TEXT CONTENT -}


{-| Selector for a div element.
-}
div : Selector
div =
  makeTypeSelector "div"


{-| Selector for an hr element.
-}
hr : Selector
hr =
  makeTypeSelector "hr"


{-| Selector for an li element.
-}
li : Selector
li =
  makeTypeSelector "li"


{-| Selector for a main element.
-}
main' : Selector
main' =
  makeTypeSelector "main"


{-| Selector for an ol element.
-}
ol : Selector
ol =
  makeTypeSelector "ol"


{-| Selector for a p element.
-}
p : Selector
p =
  makeTypeSelector "p"


{-| Selector for a ul element.
-}
ul : Selector
ul =
  makeTypeSelector "ul"


{-| Selector for a pre element.
-}
pre : Selector
pre =
  makeTypeSelector "pre"



{- INLINE TEXT SEMANTICS -}


{-| Selector for an `<a>` element.
-}
a : Selector
a =
  makeTypeSelector "a"


{-| Selector for a code element.
-}
code : Selector
code =
  makeTypeSelector "code"


{-| Selector for a small element.
-}
small : Selector
small =
  makeTypeSelector "small"


{-| Selector for a span element.
-}
span : Selector
span =
  makeTypeSelector "span"


{-| Selector for a strong element.
-}
strong : Selector
strong =
  makeTypeSelector "strong"


{-| IMAGE AND MULTIMEDIA
-}
{-| Selector for a img element.
-}
img : Selector
img =
  makeTypeSelector "img"


{-| Selector for an audio element.
-}
audio : Selector
audio =
  makeTypeSelector "audio"


{-| Selector for a video element.
-}
video : Selector
video =
  makeTypeSelector "video"


{-| Selector for a canvas element.
-}
canvas : Selector
canvas =
  makeTypeSelector "canvas"



{- TABLE CONTENT -}


{-| Selector for a caption element.
-}
caption : Selector
caption =
  makeTypeSelector "caption"


{-| Selector for a col element.
-}
col : Selector
col =
  makeTypeSelector "col"


{-| Selector for a colgroup element.
-}
colgroup : Selector
colgroup =
  makeTypeSelector "colgroup"


{-| Selector for a table element.
-}
table : Selector
table =
  makeTypeSelector "table"


{-| Selector for a tbody element.
-}
tbody : Selector
tbody =
  makeTypeSelector "tbody"


{-| Selector for a td element.
-}
td : Selector
td =
  makeTypeSelector "td"


{-| Selector for a tfoot element.
-}
tfoot : Selector
tfoot =
  makeTypeSelector "tfoot"


{-| Selector for a th element.
-}
th : Selector
th =
  makeTypeSelector "th"


{-| Selector for a thead element.
-}
thead : Selector
thead =
  makeTypeSelector "thead"


{-| Selector for a thead element.
-}
tr : Selector
tr =
  makeTypeSelector "tr"



{- FORMS -}


{-| Selector for a button element.
-}
button : Selector
button =
  makeTypeSelector "button"


{-| Selector for a fieldset element.
-}
fieldset : Selector
fieldset =
  makeTypeSelector "fieldset"


{-| Selector for a form element.
-}
form : Selector
form =
  makeTypeSelector "form"


{-| Selector for an input element.
-}
input : Selector
input =
  makeTypeSelector "input"


{-| Selector for a label element.
-}
label : Selector
label =
  makeTypeSelector "label"


{-| Selector for a legend element.
-}
legend : Selector
legend =
  makeTypeSelector "legend"


{-| Selector for an optgroup element.
-}
optgroup : Selector
optgroup =
  makeTypeSelector "optgroup"


{-| Selector for an option element.
-}
option : Selector
option =
  makeTypeSelector "option"


{-| Selector for a progress element.
-}
progress : Selector
progress =
  makeTypeSelector "progress"


{-| Selector for a select element.
-}
select : Selector
select =
  makeTypeSelector "select"
