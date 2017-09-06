module Html.Styled.Internal exposing (Classname, InternalHtml(..), getClassname)

import Css exposing (Style)
import VirtualDom


type alias Classname =
    String


type InternalHtml msg
    = Element (Maybe ( Classname, List Style )) String (List (VirtualDom.Property msg)) (List (InternalHtml msg))
    | KeyedElement (Maybe ( Classname, List Style )) String (List (VirtualDom.Property msg)) (List ( String, InternalHtml msg ))
    | Unstyled (VirtualDom.Node msg)


getClassname : List Style -> Maybe String
getClassname styles =
    Debug.crash "TODO hash the class etc"
