module Html.Styled.Internal exposing (css)

import Css
import VirtualDom
import VirtualDom.Styled


css : List Css.Style -> VirtualDom.Styled.Attribute msg
css styles =
    let
        classname =
            VirtualDom.Styled.getClassname styles

        classAttr =
            -- It's important to use (attribute "class") over
            -- (property "className"). The latter stacks, which can cause
            -- problems with elm-css if you pass a `styled` element to `styled`
            -- again. The "class" attribute does *not* stack, meaning this will
            -- blow away the entire class. Although this might be inconvenient
            -- if you want to specify other classes, at least it will work
            -- reliably.
            VirtualDom.attribute "class" classname
    in
    VirtualDom.Styled.Attribute classAttr styles classname
