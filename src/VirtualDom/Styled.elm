module VirtualDom.Styled
    exposing
        ( Classname
        , Node
        , Property(Property)
        , attribute
        , attributeNS
        , getClassname
        , keyedNode
        , lazy
        , lazy2
        , lazy3
        , makeSnippet
        , map
        , mapProperty
        , node
        , on
        , onWithOptions
        , property
        , text
        , toUnstyled
        , unstyledNode
        , unstyledProperty
        )

import Css.Preprocess as Preprocess exposing (Style)
import Css.Preprocess.Resolve as Resolve
import Css.Structure as Structure
import Dict exposing (Dict)
import Hex
import Json.Decode
import Json.Encode
import Murmur3
import VirtualDom


type Node msg
    = Element String (List (Property msg)) (List (Node msg))
    | KeyedElement String (List (Property msg)) (List ( String, Node msg ))
    | Unstyled (VirtualDom.Node msg)


type Property msg
    = Property
        (VirtualDom.Property msg)
        (List Preprocess.Style)
        -- classname is "" whenever styles is []
        -- It would be nicer to model this with separate constructors, but the
        -- browser will JIT this better. We will instantiate a *lot* of these.
        Classname


type alias Classname =
    String


node : String -> List (Property msg) -> List (Node msg) -> Node msg
node =
    Element


keyedNode :
    String
    -> List (Property msg)
    -> List ( String, Node msg )
    -> Node msg
keyedNode =
    KeyedElement


unstyledNode : VirtualDom.Node msg -> Node msg
unstyledNode =
    Unstyled


text : String -> Node msg
text =
    VirtualDom.text >> Unstyled


map : (a -> b) -> Node a -> Node b
map transform node =
    case node of
        Element elemType properties children ->
            Element
                elemType
                (List.map (mapProperty transform) properties)
                (List.map (map transform) children)

        KeyedElement elemType properties children ->
            KeyedElement
                elemType
                (List.map (mapProperty transform) properties)
                (List.map (\( key, child ) -> ( key, map transform child )) children)

        Unstyled vdom ->
            VirtualDom.map transform vdom
                |> Unstyled


property : String -> Json.Encode.Value -> Property msg
property key value =
    Property (VirtualDom.property key value) [] ""


attribute : String -> String -> Property msg
attribute key value =
    Property (VirtualDom.attribute key value) [] ""


attributeNS : String -> String -> String -> Property msg
attributeNS namespace key value =
    Property (VirtualDom.attributeNS namespace key value) [] ""


unstyledProperty : VirtualDom.Property msg -> Property msg
unstyledProperty prop =
    Property prop [] ""


on : String -> Json.Decode.Decoder msg -> Property msg
on eventName decoder =
    Property (VirtualDom.on eventName decoder) [] ""


onWithOptions :
    String
    -> VirtualDom.Options
    -> Json.Decode.Decoder msg
    -> Property msg
onWithOptions eventName options decoder =
    Property (VirtualDom.onWithOptions eventName options decoder) [] ""


mapProperty : (a -> b) -> Property a -> Property b
mapProperty transform (Property property styles classname) =
    Property (VirtualDom.mapProperty transform property) styles classname


lazy : (a -> VirtualDom.Node msg) -> a -> Node msg
lazy fn arg =
    VirtualDom.lazy fn arg
        |> Unstyled


lazy2 : (a -> b -> VirtualDom.Node msg) -> a -> b -> Node msg
lazy2 fn arg1 arg2 =
    VirtualDom.lazy2 fn arg1 arg2
        |> Unstyled


lazy3 : (a -> b -> c -> VirtualDom.Node msg) -> a -> b -> c -> Node msg
lazy3 fn arg1 arg2 arg3 =
    VirtualDom.lazy3 fn arg1 arg2 arg3
        |> Unstyled


toUnstyled : Node msg -> VirtualDom.Node msg
toUnstyled node =
    case node of
        Unstyled vdom ->
            vdom

        Element elemType properties children ->
            unstyle elemType properties children

        KeyedElement elemType properties children ->
            unstyleKeyed elemType properties children


getClassname : List Style -> Classname
getClassname styles =
    if List.isEmpty styles then
        ""
    else
        -- TODO Replace this comically inefficient implementation
        -- with crawling these union types and building up a hash along the way.
        Structure.UniversalSelectorSequence []
            |> makeSnippet styles
            |> List.singleton
            |> Preprocess.stylesheet
            |> List.singleton
            |> Resolve.compile
            |> .css
            |> Murmur3.hashString murmurSeed
            |> Hex.toString
            |> String.cons '_'


makeSnippet : List Style -> Structure.SimpleSelectorSequence -> Preprocess.Snippet
makeSnippet styles sequence =
    let
        selector =
            Structure.Selector sequence [] Nothing
    in
    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock selector [] styles) ]
        |> Preprocess.Snippet


murmurSeed : Int
murmurSeed =
    15739


unstyle :
    String
    -> List (Property msg)
    -> List (Node msg)
    -> VirtualDom.Node msg
unstyle elemType properties children =
    let
        initialStyles =
            stylesFromProperties properties

        ( childNodes, styles ) =
            List.foldl accumulateStyledHtml
                ( [], initialStyles )
                children

        styleNode =
            toStyleNode styles

        unstyledProperties =
            List.map extractUnstyledProperty properties
    in
    VirtualDom.node
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyleKeyed :
    String
    -> List (Property msg)
    -> List ( String, Node msg )
    -> VirtualDom.Node msg
unstyleKeyed elemType properties keyedChildren =
    let
        initialStyles =
            stylesFromProperties properties

        ( keyedChildNodes, styles ) =
            List.foldl accumulateKeyedStyledHtml
                ( [], initialStyles )
                keyedChildren

        keyedStyleNode =
            toKeyedStyleNode styles keyedChildNodes

        unstyledProperties =
            List.map extractUnstyledProperty properties
    in
    VirtualDom.keyedNode
        elemType
        unstyledProperties
        (keyedStyleNode :: List.reverse keyedChildNodes)



-- INTERNAL --


toKeyedStyleNode :
    Dict Classname (List Style)
    -> List ( String, a )
    -> ( String, VirtualDom.Node msg )
toKeyedStyleNode allStyles keyedChildNodes =
    let
        styleNodeKey =
            getUnusedKey "_" keyedChildNodes

        finalNode =
            toStyleNode allStyles
    in
    ( styleNodeKey, finalNode )


toStyleNode : Dict Classname (List Style) -> VirtualDom.Node msg
toStyleNode styles =
    -- this <style> node will be the first child of the requested one
    toDeclaration styles
        |> VirtualDom.text
        |> List.singleton
        |> VirtualDom.node "style" []



-- INTERNAL --


stylesFromProperties : List (Property msg) -> Dict Classname (List Style)
stylesFromProperties properties =
    case stylesFromPropertiesHelp Nothing properties of
        Nothing ->
            Dict.empty

        Just ( classname, styles ) ->
            Dict.singleton classname styles


stylesFromPropertiesHelp :
    Maybe ( Classname, List Style )
    -> List (Property msg)
    -> Maybe ( Classname, List Style )
stylesFromPropertiesHelp candidate properties =
    case properties of
        [] ->
            candidate

        (Property _ styles classname) :: rest ->
            stylesFromPropertiesHelp (Just ( classname, styles )) rest


extractUnstyledProperty : Property msg -> VirtualDom.Property msg
extractUnstyledProperty (Property val _ _) =
    val


accumulateStyledHtml :
    Node msg
    -> ( List (VirtualDom.Node msg), Dict Classname (List Style) )
    -> ( List (VirtualDom.Node msg), Dict Classname (List Style) )
accumulateStyledHtml html ( nodes, styles ) =
    case html of
        Unstyled vdom ->
            ( vdom :: nodes, styles )

        Element elemType properties children ->
            let
                combinedStyles =
                    stylesFromProperties properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        (List.map extractUnstyledProperty properties)
                        (List.reverse childNodes)
            in
            ( vdom :: nodes, finalStyles )

        KeyedElement elemType properties children ->
            let
                combinedStyles =
                    stylesFromProperties properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        (List.map extractUnstyledProperty properties)
                        (List.reverse childNodes)
            in
            ( vdom :: nodes, finalStyles )


accumulateKeyedStyledHtml :
    ( String, Node msg )
    -> ( List ( String, VirtualDom.Node msg ), Dict Classname (List Style) )
    -> ( List ( String, VirtualDom.Node msg ), Dict Classname (List Style) )
accumulateKeyedStyledHtml ( key, html ) ( pairs, styles ) =
    case html of
        Unstyled vdom ->
            ( ( key, vdom ) :: pairs, styles )

        Element elemType properties children ->
            let
                combinedStyles =
                    stylesFromProperties properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        (List.map extractUnstyledProperty properties)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )

        KeyedElement elemType properties children ->
            let
                combinedStyles =
                    stylesFromProperties properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        (List.map extractUnstyledProperty properties)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )


toDeclaration : Dict Classname (List Style) -> String
toDeclaration dict =
    Dict.toList dict
        |> List.map snippetFromPair
        |> Preprocess.stylesheet
        |> List.singleton
        |> Resolve.compile
        |> .css


snippetFromPair : ( Classname, List Style ) -> Preprocess.Snippet
snippetFromPair ( classname, styles ) =
    [ Structure.ClassSelector classname ]
        |> Structure.UniversalSelectorSequence
        |> makeSnippet styles


{-| returns a String key that is not already one of the keys in the list of
key-value pairs. We need this in order to prepend to a list of StyledHtml.Keyed
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
