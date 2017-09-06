module Html.Styled.Internal exposing (Classname, InternalHtml(..))

import Css exposing (Style)
import VirtualDom


type alias Classname =
    String


type InternalHtml msg
    = Element (Maybe ( Classname, List Style )) String (List (VirtualDom.Property msg)) (List (InternalHtml msg))
    | Unstyled (VirtualDom.Node msg)
