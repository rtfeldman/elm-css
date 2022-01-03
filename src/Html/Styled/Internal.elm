module Html.Styled.Internal exposing (css)

import Css
import VirtualDom
import VirtualDom.Styled


css : List Css.Style -> VirtualDom.Styled.Attribute msg
css styles =
    let
        cssTemplate =
            VirtualDom.Styled.getCssTemplate styles

        classProperty =
            -- Will never be used
            VirtualDom.attribute "" ""
    in
    VirtualDom.Styled.Attribute classProperty True cssTemplate
