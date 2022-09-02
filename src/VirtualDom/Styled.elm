module VirtualDom.Styled exposing
    ( Attribute(..)
    , Classname
    , CssTemplate
    , Node
    , Nonce
    , attribute
    , attributeNS
    , getCssTemplate
    , keyedLazy
    , keyedLazy2
    , keyedLazy3
    , keyedLazy4
    , keyedLazy5
    , keyedLazy6
    , keyedLazy7
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
    , toNonceUnstyled
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
    "\u{0007}"


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


type Scope
    = Scope String


encodeScope : Scope -> Json.Encode.Value
encodeScope (Scope scope) =
    Json.Encode.string scope


uncurry : (a -> b -> c) -> ( a, b ) -> c
uncurry f ( a, b ) =
    f a b


{-| Like map, but allows specifying an initial list to build on top of.
-}
mapOnto : (a -> b) -> List a -> List b -> List b
mapOnto f xs init =
    List.foldr (\x acc -> f x :: acc) init xs


keyedLazy : (a -> ( String, Node msg )) -> a -> Node msg
keyedLazy fn arg =
    keyedLazyHelp fn arg
        |> Unstyled


keyedLazyHelp : (a -> ( String, Node msg )) -> a -> VirtualDom.Node msg
keyedLazyHelp =
    VirtualDom.lazy2
        (\fn arg ->
            fn arg
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


keyedLazy2 : (a -> b -> ( String, Node msg )) -> a -> b -> Node msg
keyedLazy2 fn arg1 arg2 =
    keyedLazy2Help fn arg1 arg2
        |> Unstyled


keyedLazy2Help : (a -> b -> ( String, Node msg )) -> a -> b -> VirtualDom.Node msg
keyedLazy2Help =
    VirtualDom.lazy3
        (\fn arg1 arg2 ->
            fn arg1 arg2
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


keyedLazy3 : (a -> b -> c -> ( String, Node msg )) -> a -> b -> c -> Node msg
keyedLazy3 fn arg1 arg2 arg3 =
    keyedLazy3Help fn arg1 arg2 arg3
        |> Unstyled


keyedLazy3Help : (a -> b -> c -> ( String, Node msg )) -> a -> b -> c -> VirtualDom.Node msg
keyedLazy3Help =
    VirtualDom.lazy4
        (\fn arg1 arg2 arg3 ->
            fn arg1 arg2 arg3
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


keyedLazy4 : (a -> b -> c -> d -> ( String, Node msg )) -> a -> b -> c -> d -> Node msg
keyedLazy4 fn arg1 arg2 arg3 arg4 =
    keyedLazy4Help fn arg1 arg2 arg3 arg4
        |> Unstyled


keyedLazy4Help : (a -> b -> c -> d -> ( String, Node msg )) -> a -> b -> c -> d -> VirtualDom.Node msg
keyedLazy4Help =
    VirtualDom.lazy5
        (\fn arg1 arg2 arg3 arg4 ->
            fn arg1 arg2 arg3 arg4
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


keyedLazy5 : (a -> b -> c -> d -> e -> ( String, Node msg )) -> a -> b -> c -> d -> e -> Node msg
keyedLazy5 fn arg1 arg2 arg3 arg4 arg5 =
    keyedLazy5Help fn arg1 arg2 arg3 arg4 arg5
        |> Unstyled


keyedLazy5Help : (a -> b -> c -> d -> e -> ( String, Node msg )) -> a -> b -> c -> d -> e -> VirtualDom.Node msg
keyedLazy5Help =
    VirtualDom.lazy6
        (\fn arg1 arg2 arg3 arg4 arg5 ->
            fn arg1 arg2 arg3 arg4 arg5
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


keyedLazy6 : (a -> b -> c -> d -> e -> f -> ( String, Node msg )) -> a -> b -> c -> d -> e -> f -> Node msg
keyedLazy6 fn arg1 arg2 arg3 arg4 arg5 arg6 =
    keyedLazy6Help fn arg1 arg2 arg3 arg4 arg5 arg6
        |> Unstyled


keyedLazy6Help : (a -> b -> c -> d -> e -> f -> ( String, Node msg )) -> a -> b -> c -> d -> e -> f -> VirtualDom.Node msg
keyedLazy6Help =
    VirtualDom.lazy7
        (\fn arg1 arg2 arg3 arg4 arg5 arg6 ->
            fn arg1 arg2 arg3 arg4 arg5 arg6
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


keyedLazy7 : (a -> b -> c -> d -> e -> f -> g -> ( String, Node msg )) -> a -> b -> c -> d -> e -> f -> g -> Node msg
keyedLazy7 fn arg1 arg2 arg3 arg4 arg5 arg6 arg7 =
    keyedLazy7Help fn arg1 arg2 arg3 arg4 arg5 arg6 arg7
        |> Unstyled


keyedLazy7Help : (a -> b -> c -> d -> e -> f -> g -> ( String, Node msg )) -> a -> b -> c -> d -> e -> f -> g -> VirtualDom.Node msg
keyedLazy7Help =
    VirtualDom.lazy8
        (\fn arg1 arg2 arg3 arg4 arg5 arg6 arg7 ->
            fn arg1 arg2 arg3 arg4 arg5 arg6 arg7
                |> Tuple.mapFirst Scope
                |> uncurry toScopedUnstyled
        )


toUnstyled : Node msg -> VirtualDom.Node msg
toUnstyled vdom =
    case vdom of
        Unstyled plainNode ->
            plainNode

        Node elemType properties children ->
            unstyle Nothing elemType properties children

        NodeNS ns elemType properties children ->
            unstyleNS Nothing ns elemType properties children

        KeyedNode elemType properties children ->
            unstyleKeyed Nothing elemType properties children

        KeyedNodeNS ns elemType properties children ->
            unstyleKeyedNS Nothing ns elemType properties children


toScopedUnstyled : Scope -> Node msg -> VirtualDom.Node msg
toScopedUnstyled scope vdom =
    case vdom of
        Unstyled plainNode ->
            plainNode

        Node elemType properties children ->
            unstyleScoped Nothing scope elemType properties children

        NodeNS ns elemType properties children ->
            unstyleScopedNS Nothing scope ns elemType properties children

        KeyedNode elemType properties children ->
            unstyleScopedKeyed Nothing scope elemType properties children

        KeyedNodeNS ns elemType properties children ->
            unstyleScopedKeyedNS Nothing scope ns elemType properties children


type Nonce
    = Nonce String


toNonceUnstyled : String -> Node msg -> VirtualDom.Node msg
toNonceUnstyled unwrappedNonce vdom =
    let
        nonce : Maybe Nonce
        nonce =
            Just (Nonce unwrappedNonce)
    in
    case vdom of
        Unstyled plainNode ->
            plainNode

        Node elemType properties children ->
            unstyle nonce elemType properties children

        NodeNS ns elemType properties children ->
            unstyleNS nonce ns elemType properties children

        KeyedNode elemType properties children ->
            unstyleKeyed nonce elemType properties children

        KeyedNodeNS ns elemType properties children ->
            unstyleKeyedNS nonce ns elemType properties children


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
    Maybe Nonce
    -> String
    -> String
    -> List (Attribute msg)
    -> List (Node msg)
    -> VirtualDom.Node msg
unstyleNS maybeNonce ns elemType properties children =
    let
        initialStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( childNodes, styles ) =
            List.foldl accumulateStyledHtml
                ( [], initialStyles )
                children

        styleNode =
            toStyleNode maybeNonce (UnscopedStyles styles)

        unstyledProperties =
            List.map (extractUnstyledAttributeNS styles) properties
    in
    VirtualDom.nodeNS ns
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyleScopedNS :
    Maybe Nonce
    -> Scope
    -> String
    -> String
    -> List (Attribute msg)
    -> List (Node msg)
    -> VirtualDom.Node msg
unstyleScopedNS maybeNonce scope ns elemType properties children =
    let
        rootStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( childNodes, descendantStyles ) =
            List.foldl accumulateStyledHtml
                ( [], Dict.empty )
                children

        styleNode =
            toStyleNode maybeNonce (ScopedStyles scope rootStyles descendantStyles)

        -- Ensure that our embedded id is the last property on the root node.  This should be less confusing if the user accidentally specifies their own id.
        unstyledProperties =
            mapOnto (extractUnstyledAttributeNS rootStyles) properties [ VirtualDom.property "id" (encodeScope scope) ]
    in
    VirtualDom.nodeNS ns
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyle :
    Maybe Nonce
    -> String
    -> List (Attribute msg)
    -> List (Node msg)
    -> VirtualDom.Node msg
unstyle maybeNonce elemType properties children =
    let
        initialStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( childNodes, styles ) =
            List.foldl accumulateStyledHtml
                ( [], initialStyles )
                children

        styleNode =
            toStyleNode maybeNonce (UnscopedStyles styles)

        unstyledProperties =
            List.map (extractUnstyledAttribute styles) properties
    in
    VirtualDom.node
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyleScoped :
    Maybe Nonce
    -> Scope
    -> String
    -> List (Attribute msg)
    -> List (Node msg)
    -> VirtualDom.Node msg
unstyleScoped maybeNonce scope elemType properties children =
    let
        rootStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( childNodes, descendantStyles ) =
            List.foldl accumulateStyledHtml
                ( [], Dict.empty )
                children

        styleNode =
            toStyleNode maybeNonce (ScopedStyles scope rootStyles descendantStyles)

        -- Ensure that our embedded id is the last property on the root node.  This should be less confusing if the user accidentally specifies their own id.
        unstyledProperties =
            mapOnto (extractUnstyledAttribute rootStyles) properties [ VirtualDom.property "id" (encodeScope scope) ]
    in
    VirtualDom.node
        elemType
        unstyledProperties
        (styleNode :: List.reverse childNodes)


unstyleKeyedNS :
    Maybe Nonce
    -> String
    -> String
    -> List (Attribute msg)
    -> List ( String, Node msg )
    -> VirtualDom.Node msg
unstyleKeyedNS maybeNonce ns elemType properties keyedChildren =
    let
        initialStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( keyedChildNodes, styles ) =
            List.foldl accumulateKeyedStyledHtml
                ( [], initialStyles )
                keyedChildren

        keyedStyleNode =
            toKeyedStyleNode maybeNonce (UnscopedStyles styles) keyedChildNodes

        unstyledProperties =
            List.map (extractUnstyledAttributeNS styles) properties
    in
    VirtualDom.keyedNodeNS
        ns
        elemType
        unstyledProperties
        (keyedStyleNode :: List.reverse keyedChildNodes)


unstyleScopedKeyedNS :
    Maybe Nonce
    -> Scope
    -> String
    -> String
    -> List (Attribute msg)
    -> List ( String, Node msg )
    -> VirtualDom.Node msg
unstyleScopedKeyedNS maybeNonce scope ns elemType properties keyedChildren =
    let
        rootStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( keyedChildNodes, descendantStyles ) =
            List.foldl accumulateKeyedStyledHtml
                ( [], Dict.empty )
                keyedChildren

        keyedStyleNode =
            toKeyedStyleNode maybeNonce (ScopedStyles scope rootStyles descendantStyles) keyedChildNodes

        -- Ensure that our embedded id is the last property on the root node.  This should be less confusing if the user accidentally specifies their own id.
        unstyledProperties =
            mapOnto (extractUnstyledAttributeNS rootStyles) properties [ VirtualDom.property "id" (encodeScope scope) ]
    in
    VirtualDom.keyedNodeNS
        ns
        elemType
        unstyledProperties
        (keyedStyleNode :: List.reverse keyedChildNodes)


unstyleKeyed :
    Maybe Nonce
    -> String
    -> List (Attribute msg)
    -> List ( String, Node msg )
    -> VirtualDom.Node msg
unstyleKeyed maybeNonce elemType properties keyedChildren =
    let
        initialStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( keyedChildNodes, styles ) =
            List.foldl accumulateKeyedStyledHtml
                ( [], initialStyles )
                keyedChildren

        keyedStyleNode =
            toKeyedStyleNode maybeNonce (UnscopedStyles styles) keyedChildNodes

        unstyledProperties =
            List.map (extractUnstyledAttribute styles) properties
    in
    VirtualDom.keyedNode
        elemType
        unstyledProperties
        (keyedStyleNode :: List.reverse keyedChildNodes)


unstyleScopedKeyed :
    Maybe Nonce
    -> Scope
    -> String
    -> List (Attribute msg)
    -> List ( String, Node msg )
    -> VirtualDom.Node msg
unstyleScopedKeyed maybeNonce scope elemType properties keyedChildren =
    let
        rootStyles =
            List.foldl accumulateStyles Dict.empty properties

        ( keyedChildNodes, descendantStyles ) =
            List.foldl accumulateKeyedStyledHtml
                ( [], Dict.empty )
                keyedChildren

        keyedStyleNode =
            toKeyedStyleNode maybeNonce (ScopedStyles scope rootStyles descendantStyles) keyedChildNodes

        -- Ensure that our embedded id is the last property on the root node.  This should be less confusing if the user accidentally specifies their own id.
        unstyledProperties =
            mapOnto (extractUnstyledAttribute rootStyles) properties [ VirtualDom.property "id" (encodeScope scope) ]
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


type AccumulatedStyles
    = UnscopedStyles (Dict CssTemplate Classname)
    | ScopedStyles Scope (Dict CssTemplate Classname) (Dict CssTemplate Classname)


toKeyedStyleNode : Maybe Nonce -> AccumulatedStyles -> List ( String, a ) -> ( String, VirtualDom.Node msg )
toKeyedStyleNode maybeNonce accumulatedStyles keyedChildNodes =
    let
        styleNodeKey =
            getUnusedKey "_" keyedChildNodes

        finalNode =
            toStyleNode maybeNonce accumulatedStyles
    in
    ( styleNodeKey, finalNode )


toStyleNode : Maybe Nonce -> AccumulatedStyles -> VirtualDom.Node msg
toStyleNode maybeNonce accumulatedStyles =
    let
        cssText =
            case accumulatedStyles of
                UnscopedStyles allStyles ->
                    toDeclaration allStyles

                ScopedStyles (Scope scope) rootStyles descendantStyles ->
                    toScopedDeclaration scope rootStyles ++ "\n" ++ toScopedDeclaration (scope ++ " ") descendantStyles
    in
    -- wrap the style node in a div to prevent `Dark Reader` from blowin up the dom.
    VirtualDom.node "span"
        [ VirtualDom.attribute "style" "display: none;"
        , VirtualDom.attribute "class" "elm-css-style-wrapper"
        ]
        [ -- this <style> node will be the first child of the requested one
          cssText
            |> VirtualDom.text
            |> List.singleton
            |> VirtualDom.node "style"
                (case maybeNonce of
                    Just (Nonce nonce) ->
                        [ VirtualDom.attribute "nonce" nonce ]

                    Nothing ->
                        []
                )
        ]



-- INTERNAL --


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


extractUnstyledAttributeNS : Dict CssTemplate Classname -> Attribute msg -> VirtualDom.Attribute msg
extractUnstyledAttributeNS styles (Attribute val isCssStyles cssTemplate) =
    if isCssStyles then
        case Dict.get cssTemplate styles of
            Just classname ->
                VirtualDom.attribute "class" classname

            Nothing ->
                VirtualDom.attribute "class" "_unstyled"

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
                        (List.map (extractUnstyledAttributeNS finalStyles) properties)
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
                        (List.map (extractUnstyledAttributeNS finalStyles) properties)
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



-- We want this to be slightly different for the root node?


toDeclaration : Dict CssTemplate Classname -> String
toDeclaration dict =
    Dict.foldl styleToDeclaration "" dict


styleToDeclaration : CssTemplate -> Classname -> String -> String
styleToDeclaration template classname declaration =
    declaration
        ++ "\n"
        ++ String.replace classnameStandin classname template


toScopedDeclaration : String -> Dict CssTemplate Classname -> String
toScopedDeclaration scopingPrefix dict =
    Dict.foldl
        (\template classname declaration ->
            declaration
                ++ "\n"
                ++ String.replace ("." ++ classnameStandin) ("#" ++ scopingPrefix ++ "." ++ classname) template
        )
        ""
        dict


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
