module Html.Styled exposing (Attribute, Html, fromUnstyled, text, toUnstyled)

{-|

@docs Html, fromUnstyled, toUnstyled

@docs text

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


text : String -> Html msg
text str =
    VirtualDom.text str
        |> Unstyled


node : String -> List Style -> List (Attribute msg) -> List (Html msg) -> Html msg
node elemType styles attributes children =
    if List.isEmpty styles then
        Element Nothing elemType attributes children
    else
        let
            classname =
                Debug.crash "TODO hash the class etc"
        in
        Element (Just ( classname, styles )) elemType attributes children


toUnstyled : Html msg -> Node msg
toUnstyled html =
    case html of
        Unstyled node ->
            node

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

                node =
                    VirtualDom.node elemType
                        finalAttributes
                        (List.reverse childNodes)
            in
            if Dict.isEmpty allStyles then
                -- If we have no styles to speak of, don't emit a <style>
                VirtualDom.node elemType attributes childNodes
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
                VirtualDom.node elemType attributes (styleNode :: childNodes)


fromUnstyled : Node msg -> Html msg
fromUnstyled =
    Internal.Unstyled



-- INTERNAL --


resolve : Html msg -> ( List (Node msg), Dict Classname (List Style) ) -> ( List (Node msg), Dict Classname (List Style) )
resolve html ( nodes, styles ) =
    case html of
        Unstyled node ->
            ( node :: nodes, styles )

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

                node =
                    VirtualDom.node elemType
                        elemAttributes
                        (List.reverse childNodes)
            in
            ( node :: nodes, finalStyles )


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
