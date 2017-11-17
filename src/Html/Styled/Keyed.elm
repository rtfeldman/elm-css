module Html.Styled.Keyed exposing (node, ol, ul)

{-| A keyed node helps optimize cases where children are getting added, moved,
removed, etc. Common examples include:

  - The user can delete items from a list.
  - The user can create new items in a list.
  - You can sort a list based on name or date or whatever.
    When you use a keyed node, every child is paired with a string identifier. This
    makes it possible for the underlying diffing algorithm to reuse nodes more
    efficiently.


# Keyed Nodes

@docs node


# Commonly Keyed Nodes

@docs ol, ul

-}

import Css exposing (Style)
import Html.Styled exposing (Attribute, Html)
import Html.Styled.Internal as Internal exposing (InternalHtml(..))


{-| Works just like `Html.node`, but you add a unique identifier to each child
node. You want this when you have a list of nodes that is changing: adding
nodes, removing nodes, etc. In these cases, the unique identifiers help make
the DOM modifications more efficient.
-}
node :
    String
    -> List Style
    -> List (Attribute msg)
    -> List ( String, Html msg )
    -> Html msg
node elemType styles =
    case Internal.getClassname styles of
        Nothing ->
            \attrs children ->
                KeyedElement Nothing elemType attrs children

        Just classname ->
            -- Do this hashing work before returning an anonymous function.
            -- This way, partially applying this function caches the hashing work.
            \attrs children ->
                KeyedElement (Just ( classname, styles )) elemType attrs children


{-| -}
ol : List Style -> List (Attribute msg) -> List ( String, Html msg ) -> Html msg
ol =
    node "ol"


{-| -}
ul : List Style -> List (Attribute msg) -> List ( String, Html msg ) -> Html msg
ul =
    node "ul"
