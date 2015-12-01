module Css.Declaration (..) where


type Selector
    = TypeSelector String
    | ClassSelector String
    | IdSelector String
    | CustomSelector String
    | PseudoClass String Selector
    | PseudoElement String Selector


type CompoundSelector
    = SingleSelector Selector
    | AdjacentSibling CompoundSelector CompoundSelector
    | GeneralSibling CompoundSelector CompoundSelector
    | Child CompoundSelector CompoundSelector
    | Descendant CompoundSelector CompoundSelector


type alias Property =
    { important : Bool
    , key : String
    , value : String
    }


type Declaration
    = StyleBlock CompoundSelector (List CompoundSelector) (List Property)
    | ConditionalGroupRule String (List Declaration)
    | StandaloneAtRule String String
