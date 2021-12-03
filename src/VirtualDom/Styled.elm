module VirtualDom.Styled exposing
    ( Attribute(..)
    , Classname
    , CssTemplate
    , Node
    , attribute
    , attributeNS
    , getCssTemplate
    , keyedNode
    , keyedNodeNS
    , lazy
    , lazy2
    , lazy3
    , lazy4
    , lazy5
    , lazy6
    , lazy7
    , makeSnippet
    , map
    , mapAttribute
    , node
    , nodeNS
    , on
    , property
    , style
    , text
    , toUnstyled
    , unstyledAttribute
    , unstyledNode
    )

import Css.Preprocess as Preprocess exposing (Style)
import Css.Preprocess.Resolve as Resolve
import Css.Structure as Structure
import Dict exposing (Dict)
import Hash
import Hex
import Json.Encode
import VirtualDom


type Node msg
    = Node String (List (Attribute msg)) (List (Node msg))
    | NodeNS String String (List (Attribute msg)) (List (Node msg))
    | KeyedNode String (List (Attribute msg)) (List ( String, Node msg ))
    | KeyedNodeNS String String (List (Attribute msg)) (List ( String, Node msg ))
    | Unstyled (VirtualDom.Node msg)


type Attribute msg
    = Attribute
        (VirtualDom.Attribute msg)
        -- Only true when this is a style node
        Bool
        CssTemplate


type alias CssTemplate =
    String


type alias Classname =
    String


classnameStandin : String
classnameStandin =
    "'''\"\"\""


node : String -> List (Attribute msg) -> List (Node msg) -> Node msg
node =
    Node


nodeNS : String -> String -> List (Attribute msg) -> List (Node msg) -> Node msg
nodeNS =
    NodeNS


keyedNode :
    String
    -> List (Attribute msg)
    -> List ( String, Node msg )
    -> Node msg
keyedNode =
    KeyedNode


keyedNodeNS : String -> String -> List (Attribute msg) -> List ( String, Node msg ) -> Node msg
keyedNodeNS =
    KeyedNodeNS


unstyledNode : VirtualDom.Node msg -> Node msg
unstyledNode =
    Unstyled


text : String -> Node msg
text str =
    Unstyled (VirtualDom.text str)


map : (a -> b) -> Node a -> Node b
map transform vdomNode =
    case vdomNode of
        Node elemType properties children ->
            Node
                elemType
                (List.map (mapAttribute transform) properties)
                (List.map (map transform) children)

        NodeNS ns elemType properties children ->
            NodeNS ns
                elemType
                (List.map (mapAttribute transform) properties)
                (List.map (map transform) children)

        KeyedNode elemType properties children ->
            KeyedNode
                elemType
                (List.map (mapAttribute transform) properties)
                (List.map (\( key, child ) -> ( key, map transform child )) children)

        KeyedNodeNS ns elemType properties children ->
            KeyedNodeNS ns
                elemType
                (List.map (mapAttribute transform) properties)
                (List.map (\( key, child ) -> ( key, map transform child )) children)

        Unstyled vdom ->
            VirtualDom.map transform vdom
                |> Unstyled


property : String -> Json.Encode.Value -> Attribute msg
property key value =
    Attribute (VirtualDom.property key value) False ""


attribute : String -> String -> Attribute msg
attribute key value =
    Attribute (VirtualDom.attribute key value) False ""


attributeNS : String -> String -> String -> Attribute msg
attributeNS namespace key value =
    Attribute (VirtualDom.attributeNS namespace key value) False ""


unstyledAttribute : VirtualDom.Attribute msg -> Attribute msg
unstyledAttribute prop =
    Attribute prop False ""


on : String -> VirtualDom.Handler msg -> Attribute msg
on eventName handler =
    Attribute (VirtualDom.on eventName handler) False ""


mapAttribute : (a -> b) -> Attribute a -> Attribute b
mapAttribute transform (Attribute prop isCssStyle cssTemplate) =
    Attribute (VirtualDom.mapAttribute transform prop) isCssStyle cssTemplate


lazy : (a -> Node msg) -> a -> Node msg
lazy fn arg =
    VirtualDom.lazy2 lazyHelp fn arg
        |> Unstyled


lazyHelp : (a -> Node msg) -> a -> VirtualDom.Node msg
lazyHelp fn arg =
    fn arg
        |> toUnstyled


lazy2 : (a -> b -> Node msg) -> a -> b -> Node msg
lazy2 fn arg1 arg2 =
    VirtualDom.lazy3 lazyHelp2 fn arg1 arg2
        |> Unstyled


lazyHelp2 : (a -> b -> Node msg) -> a -> b -> VirtualDom.Node msg
lazyHelp2 fn arg1 arg2 =
    fn arg1 arg2
        |> toUnstyled


lazy3 : (a -> b -> c -> Node msg) -> a -> b -> c -> Node msg
lazy3 fn arg1 arg2 arg3 =
    VirtualDom.lazy4 lazyHelp3 fn arg1 arg2 arg3
        |> Unstyled


lazyHelp3 : (a -> b -> c -> Node msg) -> a -> b -> c -> VirtualDom.Node msg
lazyHelp3 fn arg1 arg2 arg3 =
    fn arg1 arg2 arg3
        |> toUnstyled


lazy4 : (a -> b -> c -> d -> Node msg) -> a -> b -> c -> d -> Node msg
lazy4 fn arg1 arg2 arg3 arg4 =
    VirtualDom.lazy5 lazyHelp4 fn arg1 arg2 arg3 arg4
        |> Unstyled


lazyHelp4 : (a -> b -> c -> d -> Node msg) -> a -> b -> c -> d -> VirtualDom.Node msg
lazyHelp4 fn arg1 arg2 arg3 arg4 =
    fn arg1 arg2 arg3 arg4
        |> toUnstyled


lazy5 : (a -> b -> c -> d -> e -> Node msg) -> a -> b -> c -> d -> e -> Node msg
lazy5 fn arg1 arg2 arg3 arg4 arg5 =
    VirtualDom.lazy6 lazyHelp5 fn arg1 arg2 arg3 arg4 arg5
        |> Unstyled


lazyHelp5 : (a -> b -> c -> d -> e -> Node msg) -> a -> b -> c -> d -> e -> VirtualDom.Node msg
lazyHelp5 fn arg1 arg2 arg3 arg4 arg5 =
    fn arg1 arg2 arg3 arg4 arg5
        |> toUnstyled


lazy6 : (a -> b -> c -> d -> e -> f -> Node msg) -> a -> b -> c -> d -> e -> f -> Node msg
lazy6 fn arg1 arg2 arg3 arg4 arg5 arg6 =
    VirtualDom.lazy7 lazyHelp6 fn arg1 arg2 arg3 arg4 arg5 arg6
        |> Unstyled


lazyHelp6 : (a -> b -> c -> d -> e -> f -> Node msg) -> a -> b -> c -> d -> e -> f -> VirtualDom.Node msg
lazyHelp6 fn arg1 arg2 arg3 arg4 arg5 arg6 =
    fn arg1 arg2 arg3 arg4 arg5 arg6
        |> toUnstyled


lazy7 : (a -> b -> c -> d -> e -> f -> g -> Node msg) -> a -> b -> c -> d -> e -> f -> g -> Node msg
lazy7 fn arg1 arg2 arg3 arg4 arg5 arg6 arg7 =
    VirtualDom.lazy8 lazyHelp7 fn arg1 arg2 arg3 arg4 arg5 arg6 arg7
        |> Unstyled


lazyHelp7 : (a -> b -> c -> d -> e -> f -> g -> Node msg) -> a -> b -> c -> d -> e -> f -> g -> VirtualDom.Node msg
lazyHelp7 fn arg1 arg2 arg3 arg4 arg5 arg6 arg7 =
    fn arg1 arg2 arg3 arg4 arg5 arg6 arg7
        |> toUnstyled


toUnstyled : Node msg -> VirtualDom.Node msg
toUnstyled vdom =
    case vdom of
        Unstyled plainNode ->
            plainNode

        Node elemType properties children ->
            unstyle elemType properties children

        NodeNS ns elemType properties children ->
            unstyleNS ns elemType properties children

        KeyedNode elemType properties children ->
            unstyleKeyed elemType properties children

        KeyedNodeNS ns elemType properties children ->
            unstyleKeyedNS ns elemType properties children


getCssTemplate : List Style -> CssTemplate
getCssTemplate styles =
    case styles of
        [] ->
            ""

        otherwise ->
            [ makeSnippet styles templateSelector ]
                |> Preprocess.stylesheet
                |> Resolve.compile


templateSelector : Structure.SimpleSelectorSequence
templateSelector =
    Structure.UniversalSelectorSequence
        [ Structure.ClassSelector classnameStandin ]


makeSnippet : List Style -> Structure.SimpleSelectorSequence -> Preprocess.Snippet
makeSnippet styles sequence =
    let
        selector =
            Structure.Selector sequence [] Nothing
    in
    [ Preprocess.StyleBlockDeclaration (Preprocess.StyleBlock selector [] styles) ]
        |> Preprocess.Snippet


unstyleNS :
    String
    -> String
    -> List (Attribute msg)
    -> List (Node msg)
    -> VirtualDom.Node msg
unstyleNS ns elemType properties children =
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
            List.map (extractUnstyledAttribute styles) properties
    in
    VirtualDom.nodeNS ns
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyle :
    String
    -> List (Attribute msg)
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
            List.map (extractUnstyledAttribute styles) properties
    in
    VirtualDom.node
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyleKeyedNS :
    String
    -> String
    -> List (Attribute msg)
    -> List ( String, Node msg )
    -> VirtualDom.Node msg
unstyleKeyedNS ns elemType properties keyedChildren =
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
            List.map (extractUnstyledAttribute styles) properties
    in
    VirtualDom.keyedNodeNS
        ns
        elemType
        unstyledProperties
        (keyedStyleNode :: List.reverse keyedChildNodes)


unstyleKeyed :
    String
    -> List (Attribute msg)
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
            List.map (extractUnstyledAttribute styles) properties
    in
    VirtualDom.keyedNode
        elemType
        unstyledProperties
        (keyedStyleNode :: List.reverse keyedChildNodes)



-- INTERNAL --


accumulateStyles :
    Attribute msg
    -> Dict CssTemplate Classname
    -> Dict CssTemplate Classname
accumulateStyles (Attribute _ isCssStyles cssTemplate) styles =
    if isCssStyles then
        case Dict.get cssTemplate styles of
            Just _ ->
                styles

            Nothing ->
                Dict.insert cssTemplate (Hash.fromString cssTemplate) styles

    else
        styles


toKeyedStyleNode :
    Dict CssTemplate Classname
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


toStyleNode : Dict CssTemplate Classname -> VirtualDom.Node msg
toStyleNode styles =
    -- wrap the style node in a div to prevent `Dark Reader` from blowin up the dom.
    VirtualDom.node "span"
        []
        [ -- this <style> node will be the first child of the requested one
          toDeclaration styles
            |> VirtualDom.text
            |> List.singleton
            |> VirtualDom.node "style" []
        ]



-- INTERNAL --


stylesFromProperties : List (Attribute msg) -> Dict CssTemplate Classname
stylesFromProperties properties =
    case stylesFromPropertiesHelp Nothing properties of
        Nothing ->
            Dict.empty

        Just cssTemplate ->
            Dict.singleton cssTemplate (Hash.fromString cssTemplate)


stylesFromPropertiesHelp :
    Maybe CssTemplate
    -> List (Attribute msg)
    -> Maybe CssTemplate
stylesFromPropertiesHelp candidate properties =
    case properties of
        [] ->
            candidate

        (Attribute _ False classname) :: rest ->
            stylesFromPropertiesHelp candidate rest

        (Attribute _ True cssTemplate) :: rest ->
            stylesFromPropertiesHelp (Just cssTemplate) rest


extractUnstyledAttribute : Dict CssTemplate Classname -> Attribute msg -> VirtualDom.Attribute msg
extractUnstyledAttribute styles (Attribute val isCssStyles cssTemplate) =
    if isCssStyles then
        case Dict.get cssTemplate styles of
            Just classname ->
                VirtualDom.property "className" (Json.Encode.string classname)

            Nothing ->
                VirtualDom.property "className" (Json.Encode.string "_unstyled")

    else
        val


accumulateStyledHtml :
    Node msg
    -> ( List (VirtualDom.Node msg), Dict CssTemplate Classname )
    -> ( List (VirtualDom.Node msg), Dict CssTemplate Classname )
accumulateStyledHtml html ( nodes, styles ) =
    case html of
        Unstyled vdomNode ->
            ( vdomNode :: nodes, styles )

        Node elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateStyledHtml ( [], combinedStyles ) children

                vdomNode =
                    VirtualDom.node elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( vdomNode :: nodes, finalStyles )

        NodeNS ns elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateStyledHtml ( [], combinedStyles ) children

                vdomNode =
                    VirtualDom.nodeNS ns
                        elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( vdomNode :: nodes, finalStyles )

        KeyedNode elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedStyledHtml ( [], combinedStyles ) children

                vdomNode =
                    VirtualDom.keyedNode elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( vdomNode :: nodes, finalStyles )

        KeyedNodeNS ns elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedStyledHtml ( [], combinedStyles ) children

                vdomNode =
                    VirtualDom.keyedNodeNS ns
                        elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( vdomNode :: nodes, finalStyles )


style : String -> String -> Attribute msg
style key val =
    Attribute (VirtualDom.style key val) False ""


accumulateKeyedStyledHtml :
    ( String, Node msg )
    -> ( List ( String, VirtualDom.Node msg ), Dict CssTemplate Classname )
    -> ( List ( String, VirtualDom.Node msg ), Dict CssTemplate Classname )
accumulateKeyedStyledHtml ( key, html ) ( pairs, styles ) =
    case html of
        Unstyled vdom ->
            ( ( key, vdom ) :: pairs, styles )

        Node elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.node elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )

        NodeNS ns elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.nodeNS ns
                        elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )

        KeyedNode elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNode elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )

        KeyedNodeNS ns elemType properties children ->
            let
                combinedStyles =
                    List.foldl accumulateStyles styles properties

                ( childNodes, finalStyles ) =
                    List.foldl accumulateKeyedStyledHtml ( [], combinedStyles ) children

                vdom =
                    VirtualDom.keyedNodeNS ns
                        elemType
                        (List.map (extractUnstyledAttribute finalStyles) properties)
                        (List.reverse childNodes)
            in
            ( ( key, vdom ) :: pairs, finalStyles )


toDeclaration : Dict CssTemplate Classname -> String
toDeclaration dict =
    Dict.foldl styleToDeclaration "" dict


styleToDeclaration : CssTemplate -> Classname -> String -> String
styleToDeclaration template classname declaration =
    declaration
        ++ "\n"
        ++ String.replace classnameStandin classname template


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
