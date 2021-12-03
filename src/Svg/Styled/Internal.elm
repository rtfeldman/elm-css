module Svg.Styled.Internal exposing (css, svgNamespace)

import Css
import Json.Encode as Json
import VirtualDom
import VirtualDom.Styled


css : List Css.Style -> VirtualDom.Styled.Attribute msg
css styles =
    let
        cssTemplate =
            VirtualDom.Styled.getCssTemplate styles

        classAttribute =
            -- Will be discarded
            VirtualDom.attribute "" ""
    in
    VirtualDom.Styled.Attribute classAttribute True cssTemplate


svgNamespace : VirtualDom.Styled.Attribute msg
svgNamespace =
    VirtualDom.Styled.property "namespace"
        (Json.string "http://www.w3.org/2000/svg")
