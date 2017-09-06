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
import Dict exposing (Dict)
import Html.Styled.Internal as Internal exposing (Classname, InternalHtml(..))
import Json.Encode
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
            let
                ( styles, finalAttributes ) =
                    case maybePair of
                        Just ( classname, style ) ->
                            ( Dict.singleton classname style
                            , class classname :: attributes
                            )

                        Nothing ->
                            ( Dict.empty
                            , attributes
                            )

                ( childNodes, allStyles ) =
                    List.foldl resolve ( [], styles ) children
            in
            if Dict.isEmpty allStyles then
                -- If we have no styles to speak of, don't emit a <style>
                VirtualDom.node elemType
                    finalAttributes
                    (List.reverse childNodes)
            else
                let
                    declaration =
                        toDeclaration allStyles

                    classname =
                        -- TODO hash declaration here
                        declaration

                    -- this <style> node will be the first child of the requested one
                    styleNode =
                        [ ".", classname, "{\n", declaration, "\n}" ]
                            |> String.join ""
                            |> VirtualDom.text
                            |> List.singleton
                            |> VirtualDom.node "style" []
                in
                VirtualDom.node
                    elemType
                    attributes
                    (styleNode :: List.reverse childNodes)

        KeyedElement maybePair elemType attributes children ->
            let
                ( styles, finalAttributes, classname ) =
                    case maybePair of
                        Just ( classnameFromPair, style ) ->
                            ( Dict.singleton classnameFromPair style
                            , class classnameFromPair :: attributes
                            , classnameFromPair
                            )

                        Nothing ->
                            ( Dict.empty
                            , attributes
                            , ""
                            )

                ( childNodes, allStyles ) =
                    List.foldl resolveKeyed ( [], styles ) children
            in
            if Dict.isEmpty allStyles then
                -- If we have no styles to speak of, don't emit a <style>
                VirtualDom.keyedNode elemType
                    finalAttributes
                    (List.reverse childNodes)
            else
                let
                    declaration =
                        toDeclaration allStyles

                    -- this <style> node will be the first child of the requested one
                    styleNode =
                        [ ".", classname, "{\n", declaration, "\n}" ]
                            |> String.join ""
                            |> VirtualDom.text
                            |> List.singleton
                            |> VirtualDom.node "style" []

                    finalChildNodes =
                        List.reverse childNodes
                in
                let
                    styleNodeKey =
                        getUnusedKey "_" finalChildNodes
                in
                VirtualDom.keyedNode
                    elemType
                    attributes
                    (( styleNodeKey, styleNode ) :: finalChildNodes)


fromUnstyled : Node msg -> Html msg
fromUnstyled =
    Internal.Unstyled



-- INTERNAL --


resolve :
    Html msg
    -> ( List (Node msg), Dict Classname (List Style) )
    -> ( List (Node msg), Dict Classname (List Style) )
resolve html ( nodes, styles ) =
    case html of
        Unstyled vdom ->
            ( vdom :: nodes, styles )

        Element maybePair elemType attributes children ->
            let
                ( combinedStyles, elemAttributes ) =
                    case maybePair of
                        Just ( classname, style ) ->
                            ( Dict.insert classname style styles
                            , class classname :: attributes
                            )

                        Nothing ->
                            ( styles
                            , attributes
                            )

                ( childNodes, finalStyles ) =
                    List.foldl resolve ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        elemAttributes
                        (List.reverse childNodes)
            in
            ( vdom :: nodes, finalStyles )

        KeyedElement maybePair elemType attributes children ->
            let
                ( combinedStyles, elemAttributes ) =
                    case maybePair of
                        Just ( classname, style ) ->
                            ( Dict.insert classname style styles
                            , class classname :: attributes
                            )

                        Nothing ->
                            ( styles
                            , attributes
                            )

                ( childNodes, finalStyles ) =
                    List.foldl resolveKeyed ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        elemAttributes
                        (List.reverse childNodes)
            in
            ( vdom :: nodes, finalStyles )


resolveKeyed :
    ( String, Html msg )
    -> ( List ( String, Node msg ), Dict Classname (List Style) )
    -> ( List ( String, Node msg ), Dict Classname (List Style) )
resolveKeyed ( key, html ) ( pairs, styles ) =
    case html of
        Unstyled vdom ->
            ( ( key, vdom ) :: pairs, styles )

        Element maybePair elemType attributes children ->
            let
                ( combinedStyles, elemAttributes ) =
                    case maybePair of
                        Just ( classname, style ) ->
                            ( Dict.insert classname style styles
                            , class classname :: attributes
                            )

                        Nothing ->
                            ( styles
                            , attributes
                            )

                ( childNodes, finalStyles ) =
                    List.foldl resolve ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        elemAttributes
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )

        KeyedElement maybePair elemType attributes children ->
            let
                ( combinedStyles, elemAttributes ) =
                    case maybePair of
                        Just ( classname, style ) ->
                            ( Dict.insert classname style styles
                            , class classname :: attributes
                            )

                        Nothing ->
                            ( styles
                            , attributes
                            )

                ( childNodes, finalStyles ) =
                    List.foldl resolveKeyed ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        elemAttributes
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )


class : Classname -> Attribute msg
class =
    Json.Encode.string >> VirtualDom.property "class"


toDeclaration : Dict Classname (List Style) -> String
toDeclaration dict =
    Dict.toList dict
        |> List.map toDeclarationHelp
        |> String.join ""


toDeclarationHelp : ( Classname, List Style ) -> String
toDeclarationHelp ( classname, styles ) =
    Css.class classname styles
        |> Debug.crash "TODO convert from Style to String"


{-| returns a String key that is not already one of the keys in the list of
key-value pairs. We need this in order to prepend to a list of Html.Keyed
nodes with a guaranteed-unique key.
-}
getUnusedKey : String -> List ( String, a ) -> String
getUnusedKey default pairs =
    case pairs of
        [] ->
            default

        ( firstKey, _ ) :: rest ->
            let
                newKey =
                    "_" ++ firstKey
            in
            if containsKey newKey rest then
                getUnusedKey newKey rest
            else
                newKey


containsKey : String -> List ( String, a ) -> Bool
containsKey key pairs =
    case pairs of
        [] ->
            False

        ( str, _ ) :: rest ->
            if key == str then
                True
            else
                containsKey key rest
