module Html.Styled.Internal exposing (css)

import Css
import Json.Encode as Json
import VirtualDom
import VirtualDom.Styled


css : List Css.Style -> VirtualDom.Styled.Attribute msg
css styles =
    let
        classname =
            VirtualDom.Styled.getClassname styles

        classProperty =
            VirtualDom.property "className" (Json.string classname)
    in
    VirtualDom.Styled.Attribute classProperty styles classname
