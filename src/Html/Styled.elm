module Html.Styled exposing (Attribute, Html, div, fromUnstyled, map, node, text, toUnstyled)

{-| This file is organized roughly in order of popularity. The tags which you'd
expect to use frequently will be closer to the top.


# Primitives

@docs Html, Attribute, fromUnstyled, toUnstyled, text, node, map


# Tags


## Headers

@docs h1, h2, h3, h4, h5, h6


## Grouping Content

@docs div, p, hr, pre, blockquote


## Text

@docs span, a, code, em, strong, i, b, u, sub, sup, br


## Lists

@docs ol, ul, li, dl, dt, dd


## Emdedded Content

@docs img, iframe, canvas, math


## Inputs

@docs form, input, textarea, button, select, option


## Sections

@docs section, nav, article, aside, header, footer, address, main_, body


## Figures

@docs figure, figcaption


## Tables

@docs table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th


## Less Common Elements


### Less Common Inputs

@docs fieldset, legend, label, datalist, optgroup, keygen, output, progress, meter


### Audio and Video

@docs audio, video, source, track


### Embedded Objects

@docs embed, object, param


### Text Edits

@docs ins, del


### Semantic Text

@docs small, cite, dfn, abbr, time, var, samp, kbd, s, q


### Less Common Text Tags

@docs mark, ruby, rt, rp, bdi, bdo, wbr


## Interactive Elements

-}

import Css exposing (Style)
import Html.Styled.Internal as Internal exposing (Classname, InternalHtml(..))
import VirtualDom exposing (Node)


type alias Html msg =
    InternalHtml msg


type alias Attribute msg =
    VirtualDom.Property msg



-- MAKING HTML VALUES --


node : String -> List Style -> List (Attribute msg) -> List (Html msg) -> Html msg
node elemType styles =
    case Internal.getClassname styles of
        Nothing ->
            \attributes children ->
                Element Nothing elemType attributes children

        Just classname ->
            -- Do this hashing work before returning an anonymous function.
            -- This way, partially applying this function caches the hashing work.
            \attributes children ->
                Element (Just ( classname, styles )) elemType attributes children


text : String -> Html msg
text str =
    VirtualDom.text str
        |> Unstyled


map : (a -> b) -> Html a -> Html b
map transform html =
    case html of
        Element maybePair classname attributes children ->
            Element
                maybePair
                classname
                (List.map (VirtualDom.mapProperty transform) attributes)
                (List.map (map transform) children)

        KeyedElement maybePair classname attributes children ->
            KeyedElement
                maybePair
                classname
                (List.map (VirtualDom.mapProperty transform) attributes)
                (List.map (\( key, child ) -> ( key, map transform child )) children)

        Unstyled vdom ->
            VirtualDom.map transform vdom
                |> Unstyled


div : List Style -> List (Attribute msg) -> List (Html msg) -> Html msg
div =
    node "div"



-- TRANSFORMING --


toUnstyled : Html msg -> Node msg
toUnstyled html =
    case html of
        Unstyled vdom ->
            vdom

        Element maybePair elemType attributes children ->
            Internal.unstyle elemType maybePair attributes children

        KeyedElement maybePair elemType attributes children ->
            Internal.unstyleKeyed elemType maybePair attributes children


fromUnstyled : Node msg -> InternalHtml msg
fromUnstyled =
    Internal.Unstyled
