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

import Html.Styled exposing (Attribute, Html)


node :
    String
    -> List (Attribute msg)
    -> List ( String, Html msg )
    -> Html msg
node =
node elemType styles =
    case Internal.getClassname styles of
        Nothing ->
            \attrs children ->
                 Element Nothing elemType attrs children
        Just classname ->
        -- Do this hashing work before returning an anonymous function.
        -- This way, partially applying this function caches the hashing work.
        \attrs children ->
             Element (Just ( classname, styles )) elemType attrs children
