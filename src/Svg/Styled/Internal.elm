module Svg.Styled.Internal exposing (css, svgNamespace)

import Css
import Json.Encode as Json
import VirtualDom
import VirtualDom.Styled


css : List Css.Style -> VirtualDom.Styled.Attribute msg
css styles =
    let
        classname =
            VirtualDom.Styled.getClassname styles

        classAttribute =
            VirtualDom.attribute "class" classname
    in
    VirtualDom.Styled.Attribute classAttribute styles classname


svgNamespace : VirtualDom.Styled.Attribute msg
svgNamespace =
    VirtualDom.Styled.property "namespace"
        (Json.string "http://www.w3.org/2000/svg")
