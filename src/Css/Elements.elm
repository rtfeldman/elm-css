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

import Css exposing (Mixin(Mixin), StyleBlock(StyleBlock), DeclarationTransform)
import Css.Declaration as Declaration exposing (Declaration)


typeSelectorBlock : String -> Declaration
typeSelectorBlock str =
  Declaration.StyleBlock (Declaration.SingleSelector (Declaration.TypeSelector str)) [] []


typeSelector : String -> List Mixin -> StyleBlock
typeSelector selectorStr mixins =
  let
    transform name =
      transformWithMixins mixins (typeSelectorBlock selectorStr) name
  in
    StyleBlock transform


transformWithMixins : List Mixin -> Declaration -> DeclarationTransform
transformWithMixins mixins newDeclaration name declarations =
  applyMixins mixins name (declarations ++ [ newDeclaration ])


applyMixins : List Mixin -> DeclarationTransform
applyMixins mixins name declarations =
  List.foldl (\(Mixin transform) -> transform name) declarations mixins



{- BASIC ELEMENTS -}


{-| Selector for a html element.
-}
html : List Mixin -> StyleBlock
html =
  typeSelector "html"


{-| Selector for a body element.
-}
body : List Mixin -> StyleBlock
body =
  typeSelector "body"



{- CONTENT SECTIONING -}


{-| Selector for an article element.
-}
article : List Mixin -> StyleBlock
article =
  typeSelector "article"


{-| Selector for a header element.
-}
header : List Mixin -> StyleBlock
header =
  typeSelector "header"


{-| Selector for a footer element.
-}
footer : List Mixin -> StyleBlock
footer =
  typeSelector "footer"


{-| Selector for an h1 element.
-}
h1 : List Mixin -> StyleBlock
h1 =
  typeSelector "h1"


{-| Selector for an h2 element.
-}
h2 : List Mixin -> StyleBlock
h2 =
  typeSelector "h2"


{-| Selector for an h3 element.
-}
h3 : List Mixin -> StyleBlock
h3 =
  typeSelector "h3"


{-| Selector for an h4 element.
-}
h4 : List Mixin -> StyleBlock
h4 =
  typeSelector "h4"


{-| Selector for a nav element.
-}
nav : List Mixin -> StyleBlock
nav =
  typeSelector "nav"


{-| Selector for a section element.
-}
section : List Mixin -> StyleBlock
section =
  typeSelector "section"



{- TEXT CONTENT -}


{-| Selector for a div element.
-}
div : List Mixin -> StyleBlock
div =
  typeSelector "div"


{-| Selector for an hr element.
-}
hr : List Mixin -> StyleBlock
hr =
  typeSelector "hr"


{-| Selector for an li element.
-}
li : List Mixin -> StyleBlock
li =
  typeSelector "li"


{-| Selector for a main element.
-}
main' : List Mixin -> StyleBlock
main' =
  typeSelector "main"


{-| Selector for an ol element.
-}
ol : List Mixin -> StyleBlock
ol =
  typeSelector "ol"


{-| Selector for a p element.
-}
p : List Mixin -> StyleBlock
p =
  typeSelector "p"


{-| Selector for a ul element.
-}
ul : List Mixin -> StyleBlock
ul =
  typeSelector "ul"


{-| Selector for a pre element.
-}
pre : List Mixin -> StyleBlock
pre =
  typeSelector "pre"



{- INLINE TEXT SEMANTICS -}


{-| Selector for an `<a>` element.
-}
a : List Mixin -> StyleBlock
a =
  typeSelector "a"


{-| Selector for a code element.
-}
code : List Mixin -> StyleBlock
code =
  typeSelector "code"


{-| Selector for a small element.
-}
small : List Mixin -> StyleBlock
small =
  typeSelector "small"


{-| Selector for a span element.
-}
span : List Mixin -> StyleBlock
span =
  typeSelector "span"


{-| Selector for a strong element.
-}
strong : List Mixin -> StyleBlock
strong =
  typeSelector "strong"


{-| IMAGE AND MULTIMEDIA
-}
{-| Selector for a img element.
-}
img : List Mixin -> StyleBlock
img =
  typeSelector "img"


{-| Selector for an audio element.
-}
audio : List Mixin -> StyleBlock
audio =
  typeSelector "audio"


{-| Selector for a video element.
-}
video : List Mixin -> StyleBlock
video =
  typeSelector "video"


{-| Selector for a canvas element.
-}
canvas : List Mixin -> StyleBlock
canvas =
  typeSelector "canvas"



{- TABLE CONTENT -}


{-| Selector for a caption element.
-}
caption : List Mixin -> StyleBlock
caption =
  typeSelector "caption"


{-| Selector for a col element.
-}
col : List Mixin -> StyleBlock
col =
  typeSelector "col"


{-| Selector for a colgroup element.
-}
colgroup : List Mixin -> StyleBlock
colgroup =
  typeSelector "colgroup"


{-| Selector for a table element.
-}
table : List Mixin -> StyleBlock
table =
  typeSelector "table"


{-| Selector for a tbody element.
-}
tbody : List Mixin -> StyleBlock
tbody =
  typeSelector "tbody"


{-| Selector for a td element.
-}
td : List Mixin -> StyleBlock
td =
  typeSelector "td"


{-| Selector for a tfoot element.
-}
tfoot : List Mixin -> StyleBlock
tfoot =
  typeSelector "tfoot"


{-| Selector for a th element.
-}
th : List Mixin -> StyleBlock
th =
  typeSelector "th"


{-| Selector for a thead element.
-}
thead : List Mixin -> StyleBlock
thead =
  typeSelector "thead"


{-| Selector for a thead element.
-}
tr : List Mixin -> StyleBlock
tr =
  typeSelector "tr"



{- FORMS -}


{-| Selector for a button element.
-}
button : List Mixin -> StyleBlock
button =
  typeSelector "button"


{-| Selector for a fieldset element.
-}
fieldset : List Mixin -> StyleBlock
fieldset =
  typeSelector "fieldset"


{-| Selector for a form element.
-}
form : List Mixin -> StyleBlock
form =
  typeSelector "form"


{-| Selector for an input element.
-}
input : List Mixin -> StyleBlock
input =
  typeSelector "input"


{-| Selector for a label element.
-}
label : List Mixin -> StyleBlock
label =
  typeSelector "label"


{-| Selector for a legend element.
-}
legend : List Mixin -> StyleBlock
legend =
  typeSelector "legend"


{-| Selector for an optgroup element.
-}
optgroup : List Mixin -> StyleBlock
optgroup =
  typeSelector "optgroup"


{-| Selector for an option element.
-}
option : List Mixin -> StyleBlock
option =
  typeSelector "option"


{-| Selector for a progress element.
-}
progress : List Mixin -> StyleBlock
progress =
  typeSelector "progress"


{-| Selector for a select element.
-}
select : List Mixin -> StyleBlock
select =
  typeSelector "select"
