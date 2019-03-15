module Css.Global exposing
    ( global, Snippet
    , class, id, selector, everything, media, mediaQuery
    , children, descendants, adjacentSiblings, generalSiblings, each, withAttribute, withClass
    , typeSelector, html, body
    , article, header, footer, h1, h2, h3, h4, h5, h6, nav, menu, section, aside, time, details, summary
    , div, hr, li, main_, ol, p, ul, pre, dl, dt, dd, blockquote
    , a, code, small, span, strong, i, em, q
    , img, audio, video, canvas
    , caption, col, colgroup, table, tbody, td, tfoot, th, thead, tr
    , button, fieldset, form, input, label, legend, optgroup, option, progress, select, textarea
    , svg, path, rect, circle, ellipse, line, polyline, polygon
    )

{-| Apply global CSS to things like foreign DOM structures (e.g. generated
from markdown) where you cannot add attributes.

This module relies on CSS selectors which are [globally scoped and
bad for maintainability](https://medium.com/seek-blog/the-end-of-global-css-90d2a4a06284),
so definitely avoid using this module except when there is no reasonable way
do to it using `Style` instead!


# Global Styles

@docs global, Snippet


# Statements

@docs class, id, selector, everything, media, mediaQuery


# Combinators

@docs children, descendants, adjacentSiblings, generalSiblings, each, withAttribute, withClass


# Basic elements

@docs typeSelector, html, body


# Content sectioning

@docs article, header, footer, h1, h2, h3, h4, h5, h6, nav, menu, section, aside, time, details, summary


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

import Css.Media exposing (MediaQuery)
import Css.Preprocess as Preprocess
    exposing
        ( Snippet(..)
        , SnippetDeclaration(..)
        , Style
        , StyleBlock(..)
        , unwrapSnippet
        )
import Css.Preprocess.Resolve as Resolve
import Css.Structure as Structure
import Html.Styled
import VirtualDom
import VirtualDom.Styled exposing (makeSnippet)


{-| Add global styles to the page. This compiles directly to a `<style>` element.
-}
global : List Snippet -> Html.Styled.Html msg
global snippets =
    snippets
        |> Preprocess.stylesheet
        |> List.singleton
        |> Resolve.compile
        |> VirtualDom.text
        |> List.singleton
        |> VirtualDom.node "style" []
        |> VirtualDom.Styled.unstyledNode


{-| -}
type alias Snippet =
    Preprocess.Snippet


{-| An [id selector](https://developer.mozilla.org/en-US/docs/Web/CSS/ID_selectors).

    global
        [ id "nav-bar"
            [ width 960 px
            , backgroundColor (rgb 123 42 208)
            ]
        ]

-}
id : String -> List Style -> Snippet
id str styles =
    [ Structure.IdSelector str ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles


{-| A [class selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Class_selectors).

    global
        [ class "login-form-button"
            [ fontWeight normal
            , color (rgb 128 64 32)
            ]
        ]

-}
class : String -> List Style -> Snippet
class str styles =
    [ Structure.ClassSelector str ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles


{-| A custom selector. Use this for things like
[attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
and [universal selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    global
        [ selector "* [lang^=en]"
            [ textDecoration underline
            , color (rgb 7 7 7)
            ]
        ]

-}
selector : String -> List Style -> Snippet
selector selectorStr styles =
    Structure.CustomSelector selectorStr []
        |> makeSnippet styles


{-| A [`*` selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).

    class "Foo"
        [ children
            [ everything
                [ color (rgb 14 15 16)
                , borderRadius (px 5)
                ]
            ]
        ]

...compiles to:

    .Foo > * {
      color: rgb(14, 15, 16);
      border-radius: 5px;
    }

-}
everything : List Style -> Snippet
everything styles =
    Structure.UniversalSelectorSequence []
        |> makeSnippet styles


{-| Combines media queries into a `@media` rule.

    global
        [ media [ only screen [ Media.minWidth (px 300) ] ]
            [ footer [ Css.maxWidth (px 300) ] ]
        ]

The above code translates into the following CSS.

```css
@media screen and (min-width: 300px) {
    footer {
        max-width: 300px;
    }
}
```

-}
media :
    List MediaQuery
    -> List Snippet
    -> Snippet
media queries snippets =
    let
        snippetDeclarations : List Preprocess.SnippetDeclaration
        snippetDeclarations =
            List.concatMap unwrapSnippet snippets

        extractStyleBlocks : List Preprocess.SnippetDeclaration -> List Preprocess.StyleBlock
        extractStyleBlocks declarations =
            case declarations of
                [] ->
                    []

                (Preprocess.StyleBlockDeclaration styleBlock) :: rest ->
                    styleBlock :: extractStyleBlocks rest

                _ :: rest ->
                    extractStyleBlocks rest

        mediaRuleFromStyleBlocks : Preprocess.SnippetDeclaration
        mediaRuleFromStyleBlocks =
            Preprocess.MediaRule queries
                (extractStyleBlocks snippetDeclarations)

        nestedMediaRules : List Preprocess.SnippetDeclaration -> List Preprocess.SnippetDeclaration
        nestedMediaRules declarations =
            case declarations of
                [] ->
                    []

                (Preprocess.StyleBlockDeclaration _) :: rest ->
                    -- These will already have been handled previously, with appropriate
                    -- bundling, so don't create duplicates here.
                    nestedMediaRules rest

                (Preprocess.MediaRule nestedMediaQueries styleBlocks) :: rest ->
                    -- nest the media queries
                    Preprocess.MediaRule (List.append queries nestedMediaQueries) styleBlocks
                        :: nestedMediaRules rest

                first :: rest ->
                    first :: nestedMediaRules rest
    in
    Preprocess.Snippet (mediaRuleFromStyleBlocks :: nestedMediaRules snippetDeclarations)


{-| Manually specify a `@media` rule using a List of strings.

    mediaQuery [ "screen and (min-width: 320px)", "screen and (max-height: 400px)" ]
        [ body [ fontSize (px 14) ] ]

The above code translates into the following CSS.

```css
@media screen and (min-width: 320px), screen and (max-height: 400px) {
    body {
        font-size: 14px;
    }
}
```

-}
mediaQuery : List String -> List Snippet -> Snippet
mediaQuery stringQueries snippets =
    media (List.map Structure.CustomQuery stringQueries) snippets


{-| Apply styles in a list of snippets to the direct children of a selector

    typeSelector "div"
        [ children
            [ typeSelector "p"
                [ fontSize (px 14)
                ]
            ]
        ]

The above code translates into the following CSS.

```css
div > p {
    font-size: 14px;
}
```

-}
children : List Snippet -> Style
children =
    Preprocess.NestSnippet Structure.Child


{-| Apply styles to the current selector plus an additional class

    typeSelector "div"
        [ fontSize (px 14)
        , withClass "is-bold"
            [ fontWeight bold
            ]
        ]

The above code translates into the following CSS.

```css
div {
    font-size: 14px;
}

div.is-bold {
    font-weight: bold;
}
```

-}
withClass : String -> List Style -> Style
withClass str =
    Preprocess.ExtendSelector (Structure.ClassSelector str)


{-| Apply styles to the current selector plus an attribute selector

    typeSelector "div"
        [ fontSize (px 14)
        , withAttribute "data-some-attribute"
            [ display none
            ]
        , withAttribute "data-hello=world"
            [ color red
            ]
        ]

The above code translates into the following CSS.

```css
div {
    font-size: 14px;
}

div[data-some-attribute] {
    display: none;
}

div[data-hello=world] {
    color: red;
}
```

-}
withAttribute : String -> List Style -> Style
withAttribute attribute =
    Preprocess.ExtendSelector (Structure.AttributeSelector attribute)


{-| Apply styles in a list of snippets to the descendants of a selector

    typeSelector "div"
        [ descendants
            [ typeSelector "p"
                [ fontSize (px 14)
                ]
            ]
        ]

The above code translates into the following CSS.

```css
div p {
    font-size: 14px;
}
```

-}
descendants : List Snippet -> Style
descendants =
    Preprocess.NestSnippet Structure.Descendant


{-| Apply styles in a list of snippets to the adjacent siblings of a selector

    typeSelector "div"
        [ adjacentSiblings
            [ typeSelector "p"
                [ fontSize (px 14)
                ]
            ]
        ]

The above code translates into the following CSS.

```css
div + p {
    font-size: 14px;
}
```

-}
adjacentSiblings : List Snippet -> Style
adjacentSiblings =
    Preprocess.NestSnippet Structure.AdjacentSibling


{-| Apply styles in a list of snippets to the general siblings of a selector

    typeSelector "div"
        [ generalSiblings
            [ typeSelector "p"
                [ fontSize (px 14)
                ]
            ]
        ]

The above code translates into the following CSS.

```css
div ~ p {
    font-size: 14px;
}
```

-}
generalSiblings : List Snippet -> Style
generalSiblings =
    Preprocess.NestSnippet Structure.GeneralSibling


{-| Apply a list of styles to multiple selectors

    each [ typeSelector "div", typeSelector "p" ]
        [ fontSize (px 14)
        ]

The above code translates into the following CSS.

```css
div {
    font-size: 14px;
}

p {
    font-size: 14px;
}
```

-}
each : List (List Style -> Snippet) -> List Style -> Snippet
each snippetCreators styles =
    let
        selectorsToSnippet selectors =
            case selectors of
                [] ->
                    Preprocess.Snippet []

                first :: rest ->
                    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock first rest styles) ]
                        |> Preprocess.Snippet
    in
    List.map ((|>) []) snippetCreators
        |> List.concatMap Preprocess.unwrapSnippet
        |> collectSelectors
        |> selectorsToSnippet


{-| Define a custom element.

    global
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

        sel =
            Structure.Selector sequence [] Nothing
    in
    [ StyleBlockDeclaration (StyleBlock sel [] styles) ]
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

    <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl>

-}
dl : List Style -> Snippet
dl =
    typeSelector "dl"


{-| Selector for a dt element.

    <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dt>

-}
dt : List Style -> Snippet
dt =
    typeSelector "dt"


{-| Selector for a dd element.

    <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dd>

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


{-| Selector for a details element.
-}
details : List Style -> Snippet
details =
    typeSelector "details"


{-| Selector for a summary element.
-}
summary : List Style -> Snippet
summary =
    typeSelector "summary"


collectSelectors : List Preprocess.SnippetDeclaration -> List Structure.Selector
collectSelectors declarations =
    case declarations of
        [] ->
            []

        (Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock firstSelector otherSelectors styles)) :: rest ->
            (unwrapSelector firstSelector styles :: otherSelectors) ++ collectSelectors rest

        _ :: rest ->
            collectSelectors rest


unwrapSelector : Structure.Selector -> List Style -> Structure.Selector
unwrapSelector (Structure.Selector sequence combinators mPseudo) styles =
    let
        unwrapSequenceSelector style s =
            case style of
                Preprocess.ExtendSelector nestedSelector evenMoreNestedStyles ->
                    List.foldr unwrapSequenceSelector (Structure.appendRepeatable nestedSelector s) evenMoreNestedStyles

                -- TODO: in order to combine sequences in `each`, we need to add branches here to accomodate them.
                _ ->
                    s

        unwrapCombinatorSelector style cs =
            case style of
                Preprocess.NestSnippet combinator snippets ->
                    List.concatMap (unwrapSnippet >> collectSelectors) snippets
                        |> List.map (\(Structure.Selector s _ _) -> ( combinator, s ))
                        |> List.append cs

                -- TODO: in order to combine selectors in `each`, we need to add branches here to accomodate them.
                _ ->
                    cs
    in
    Structure.Selector
        (List.foldr unwrapSequenceSelector sequence styles)
        (List.foldr unwrapCombinatorSelector combinators styles)
        mPseudo
