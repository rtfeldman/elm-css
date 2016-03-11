module Html.CssHelpers (namespace) where

{-| Helper functions for using elm-css with elm-html.

@docs namespace
-}
import Css.Helpers exposing (toCssIdentifier, identifierToString)
import Css.Namespace
import Html exposing (Attribute)
import Html.Attributes as Attr
import String


type alias Helpers class id =
  { class : List class -> Attribute
  , classList : List ( class, Bool ) -> Attribute
  , id : id -> Attribute
  }


type alias Namespace name class id =
  { class : List class -> Attribute
  , classList : List ( class, Bool ) -> Attribute
  , id : id -> Attribute
  , name : name
  , rules : List Snippet -> List Snippet
  }


{-| Takes a namespace and returns helper functions for `id`, `class`, and
`classList` which work just like their equivalents in `elm-html` except that
they accept union types and automatically incorporate the given namespace. Also
note that `class` accepts a `List` instead of a single element; this is so you
can specify multiple classes without having to call `classList` passing tuples
that all end in `True`. Also returns `rules`, which you can use to namespace a
list of rules.

    -- Put this before your view code to specify a namespace.
    { id, class, classList } = namespace "homepage"

    view =
        h1 [ id Hero, class [ Fancy ] ] [ text "Hello, World!" ]

    type HomepageIds = Hero | SomethingElse | AnotherId
    type HomepageClasses = Fancy | AnotherClass | SomeOtherClass

The above would generate this DOM element:

    <h1 id="Hero" class="homepage_Fancy">Hello, World!</h1>
-}
namespace : name -> Namespace name class id
namespace name =
  { class = namespacedClass name
  , classList = namespacedClassList name
  , id = toCssIdentifier >> Attr.id
  , name = name
  , rules = Css.Namespace.namespace name
  }


helpers : Helpers class id
helpers =
  { class = class
  , classList = classList
  , id = toCssIdentifier >> Attr.id
  }


namespacedClassList : name -> List ( class, Bool ) -> Attribute
namespacedClassList name list =
  list
    |> List.filter snd
    |> List.map fst
    |> namespacedClass name


classList : List ( class, Bool ) -> Attribute
classList list =
  list
    |> List.filter snd
    |> List.map fst
    |> class


namespacedClass : name -> List class -> Attribute
namespacedClass name list =
  list
    |> List.map (identifierToString name)
    |> String.join " "
    |> Attr.class


class : List class -> Attribute
class =
  namespacedClass ""
