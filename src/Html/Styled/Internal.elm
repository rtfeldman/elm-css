module Html.Styled.Internal exposing (Classname, InternalHtml(..), getClassname, unstyle, unstyleKeyed)

import Css exposing (Style)
import Dict exposing (Dict)
import Json.Encode
import VirtualDom exposing (Node, Property)


type alias Classname =
    String


type InternalHtml msg
    = Element (Maybe ( Classname, List Style )) String (List (VirtualDom.Property msg)) (List (InternalHtml msg))
    | KeyedElement (Maybe ( Classname, List Style )) String (List (VirtualDom.Property msg)) (List ( String, InternalHtml msg ))
    | Unstyled (VirtualDom.Node msg)


getClassname : List Style -> Maybe String
getClassname styles =
    Debug.crash "TODO hash the class etc"


unstyle :
    String
    -> Maybe ( Classname, List Style )
    -> List (Property msg)
    -> List (InternalHtml msg)
    -> Node msg
unstyle =
    unstyleWith
        resolve
        VirtualDom.node
        finishNode


unstyleKeyed :
    String
    -> Maybe ( Classname, List Style )
    -> List (Property msg)
    -> List ( String, InternalHtml msg )
    -> Node msg
unstyleKeyed =
    unstyleWith
        resolveKeyed
        VirtualDom.keyedNode
        finishKeyedNode



-- INTERNAL --


finishNode :
    String
    -> Dict Classname (List Style)
    -> a
    -> Node msg
finishNode classname allStyles _ =
    getStyleNode classname allStyles


finishKeyedNode :
    String
    -> Dict Classname (List Style)
    -> List ( String, a )
    -> ( String, Node msg )
finishKeyedNode classname allStyles finalChildNodes =
    let
        styleNodeKey =
            getUnusedKey "_" finalChildNodes

        finalNode =
            getStyleNode classname allStyles
    in
    ( styleNodeKey, finalNode )


getStyleNode : String -> Dict Classname (List Style) -> Node msg
getStyleNode classname styles =
    -- this <style> node will be the first child of the requested one
    [ ".", classname, "{\n", toDeclaration styles, "\n}" ]
        |> String.join ""
        |> VirtualDom.text
        |> List.singleton
        |> VirtualDom.node "style" []



-- INTERNAL --


unstyleWith :
    (keyedOrHtml2 -> ( List keyedOrHtml, Dict Classname (List Style) ) -> ( List keyedOrHtml, Dict Classname (List Style) ))
    -> (String -> List (Property msg) -> List keyedOrHtml -> keyedOrHtml3)
    -> (String -> Dict Classname (List Style) -> List keyedOrHtml -> keyedOrHtml)
    -> String
    -> Maybe ( Classname, List Style )
    -> List (Property msg)
    -> List keyedOrHtml2
    -> keyedOrHtml3
unstyleWith resolver toNode finishNode elemType maybePair attributes children =
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
            List.foldl resolver ( [], styles ) children

        finalChildNodes =
            List.reverse childNodes
    in
    if Dict.isEmpty allStyles then
        -- If we have no styles to speak of, don't emit a <style>
        toNode elemType finalAttributes finalChildNodes
    else
        let
            finalNode =
                finishNode classname allStyles finalChildNodes
        in
        toNode
            elemType
            attributes
            (finalNode :: finalChildNodes)


resolve :
    InternalHtml msg
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
    ( String, InternalHtml msg )
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


class : Classname -> Property msg
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
