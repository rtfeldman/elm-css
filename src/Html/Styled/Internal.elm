module Html.Styled.Internal exposing (Classname, InternalAttribute(..), InternalHtml(..), classProperty, extractProperty, getClassname, mapAttribute, unstyle, unstyleKeyed)

import Css exposing (Style)
import Dict exposing (Dict)
import Hex
import Json.Encode
import Murmur3
import VirtualDom exposing (Node, Property)


type alias Classname =
    String


type InternalHtml msg
    = Element String (List (InternalAttribute msg)) (List (InternalHtml msg))
    | KeyedElement String (List (InternalAttribute msg)) (List ( String, InternalHtml msg ))
    | Unstyled (VirtualDom.Node msg)


type InternalAttribute msg
    = InternalAttribute
        (VirtualDom.Property msg)
        (List Style)
        -- classname is "" whenever styles is []
        -- It would be nicer to model this with separate constructors, but the
        -- browser will JIT this better. We will instantiate a *lot* of these.
        Classname


getClassname : List Style -> Classname
getClassname styles =
    if List.isEmpty styles then
        ""
    else
        -- TODO Replace this comically inefficient implementation
        -- with crawling these union types and building up a hash along the way.
        styles
            |> Css.everything
            |> List.singleton
            |> Css.stylesheet
            |> List.singleton
            |> Css.compile
            |> .css
            |> Murmur3.hashString murmurSeed
            |> Hex.toString
            |> String.cons '_'


murmurSeed : Int
murmurSeed =
    15739


unstyle :
    String
    -> List (InternalAttribute msg)
    -> List (InternalHtml msg)
    -> Node msg
unstyle elemType attributes children =
    let
        initialStyles =
            List.foldl accumulateStyles Dict.empty attributes

        ( childNodes, styles ) =
            List.foldl accumulateInternalHtml
                ( [], initialStyles )
                children

        styleNode =
            toStyleNode styles

        properties =
            List.map extractProperty attributes
    in
    VirtualDom.node elemType properties (styleNode :: List.reverse childNodes)


unstyleKeyed :
    String
    -> List (InternalAttribute msg)
    -> List ( String, InternalHtml msg )
    -> Node msg
unstyleKeyed elemType attributes keyedChildren =
    let
        initialStyles =
            List.foldl accumulateStyles Dict.empty attributes

        ( keyedChildNodes, styles ) =
            List.foldl accumulateKeyedInternalHtml
                ( [], initialStyles )
                keyedChildren

        keyedStyleNode =
            toKeyedStyleNode styles keyedChildNodes

        properties =
            List.map extractProperty attributes
    in
    VirtualDom.keyedNode elemType properties (keyedStyleNode :: List.reverse keyedChildNodes)



-- INTERNAL --


toKeyedStyleNode :
    Dict Classname (List Style)
    -> List ( String, a )
    -> ( String, Node msg )
toKeyedStyleNode allStyles keyedChildNodes =
    let
        styleNodeKey =
            getUnusedKey "_" keyedChildNodes

        finalNode =
            toStyleNode allStyles
    in
    ( styleNodeKey, finalNode )


toStyleNode : Dict Classname (List Style) -> Node msg
toStyleNode styles =
    -- this <style> node will be the first child of the requested one
    toDeclaration styles
        |> VirtualDom.text
        |> List.singleton
        |> VirtualDom.node "style" []



-- INTERNAL --


accumulateStyles :
    InternalAttribute msg
    -> Dict Classname (List Style)
    -> Dict Classname (List Style)
accumulateStyles (InternalAttribute property newStyles classname) styles =
    if List.isEmpty newStyles then
        styles
    else
        Dict.insert classname newStyles styles


extractProperty : InternalAttribute msg -> VirtualDom.Property msg
extractProperty (InternalAttribute val _ _) =
    val


accumulateInternalHtml :
    InternalHtml msg
    -> ( List (Node msg), Dict Classname (List Style) )
    -> ( List (Node msg), Dict Classname (List Style) )
accumulateInternalHtml html ( nodes, styles ) =
    case html of
        Unstyled vdom ->
            ( vdom :: nodes, styles )

        Element elemType attributes children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles attributes

                ( childNodes, finalStyles ) =
                    List.foldl accumulateInternalHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        (List.map extractProperty attributes)
                        (List.reverse childNodes)
            in
            ( vdom :: nodes, finalStyles )

        KeyedElement elemType attributes children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles attributes

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedInternalHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        (List.map extractProperty attributes)
                        (List.reverse childNodes)
            in
            ( vdom :: nodes, finalStyles )


accumulateKeyedInternalHtml :
    ( String, InternalHtml msg )
    -> ( List ( String, Node msg ), Dict Classname (List Style) )
    -> ( List ( String, Node msg ), Dict Classname (List Style) )
accumulateKeyedInternalHtml ( key, html ) ( pairs, styles ) =
    case html of
        Unstyled vdom ->
            ( ( key, vdom ) :: pairs, styles )

        Element elemType attributes children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles attributes

                ( childNodes, finalStyles ) =
                    List.foldl accumulateInternalHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        (List.map extractProperty attributes)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )

        KeyedElement elemType attributes children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles attributes

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedInternalHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        (List.map extractProperty attributes)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )


class : Classname -> Property msg
class =
    Json.Encode.string >> VirtualDom.property "className"


toDeclaration : Dict Classname (List Style) -> String
toDeclaration dict =
    Dict.toList dict
        |> List.map snippetFromPair
        |> Css.stylesheet
        |> List.singleton
        |> Css.compile
        |> .css


snippetFromPair : ( Classname, List Style ) -> Css.Snippet
snippetFromPair ( classname, styles ) =
    Css.class classname styles


{-| returns a String key that is not already one of the keys in the list of
key-value pairs. We need this in order to prepend to a list of InternalHtml.Keyed
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


{-| Often used with CSS to style elements with common properties.
-}
classProperty : String -> VirtualDom.Property msg
classProperty val =
    VirtualDom.property "className" (Json.Encode.string val)


mapAttribute : (a -> b) -> InternalAttribute a -> InternalAttribute b
mapAttribute transform (InternalAttribute property styles classname) =
    InternalAttribute (VirtualDom.mapProperty transform property) styles classname
