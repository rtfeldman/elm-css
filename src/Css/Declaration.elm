module Css.Declaration (..) where


type Selector
  = TypeSelector String
  | ClassSelector String
  | IdSelector String
  | CustomSelector String


type CompoundSelector
  = SingleSelector Selector
  | MultiSelector CompoundSelector Selector
  | AdjacentSibling CompoundSelector CompoundSelector
  | GeneralSibling CompoundSelector CompoundSelector
  | Child CompoundSelector CompoundSelector
  | Descendant CompoundSelector CompoundSelector
  | PseudoClass String (Maybe CompoundSelector)
  | PseudoElement String (Maybe CompoundSelector)


type alias Property =
  { important : Bool
  , key : String
  , value : String
  }


type Declaration
  = StyleBlock CompoundSelector (List CompoundSelector) (List Property)
  | ConditionalGroupRule String (List Declaration)
  | StandaloneAtRule String String


introduceSelector : Selector -> List Declaration -> List Declaration
introduceSelector selector declarations =
  case declarations of
    [] ->
      [ StyleBlock (SingleSelector selector) [] [] ]

    -- If there are no properties declared, then we have a situation
    --   like `Bar` in the following:
    --       stylesheet "homepage"
    --           . Foo . Bar
    --               ~ fontWeight bold
    -- ...as opposed to:
    --       stylesheet "homepage"
    --           . Foo
    --               ~ fontWeight bold
    -- In this case, we don't make a new declaration, but rather add
    -- the new selector to the existing list of selectors.
    (StyleBlock firstSelector otherSelectors []) :: [] ->
      case lastSelectorToMulti selector (firstSelector :: otherSelectors) of
        [] ->
          [ StyleBlock (SingleSelector selector) [] [] ]

        first :: rest ->
          [ StyleBlock first rest [] ]

    -- Here the most recent declaration had properties defined, meaning
    -- this must be a new top-level declaration, like `Bar` in the following:
    --    stylesheet "homepage"
    --        . Foo
    --            ~ fontWeight normal
    --        . Bar
    --            ~ fontWeight bold
    lastDeclaration :: [] ->
      lastDeclaration :: [ StyleBlock (SingleSelector selector) [] [] ]

    {- We haven't reached the last declaration yet, so recurse. -}
    firstDeclaration :: otherDeclarations ->
      firstDeclaration :: (introduceSelector selector otherDeclarations)


{-| Concatenate the given selector to the end of the last selector in the given list, e.g. ".foo#bar"
-}
lastSelectorToMulti : Selector -> List CompoundSelector -> List CompoundSelector
lastSelectorToMulti selector otherSelectors =
  case otherSelectors of
    [] ->
      [ SingleSelector selector ]

    compoundSelector :: [] ->
      [ MultiSelector compoundSelector selector ]

    first :: rest ->
      first :: (lastSelectorToMulti selector rest)


getLastProperty : List Declaration -> Maybe Property
getLastProperty declarations =
  case declarations of
    [] ->
      Nothing

    (StyleBlock _ _ properties) :: [] ->
      getLast properties

    first :: rest ->
      getLastProperty rest


mapProperties : (Property -> Property) -> Declaration -> Declaration
mapProperties update declaration =
  case declaration of
    StyleBlock firstSelector extraSelectors properties ->
      StyleBlock firstSelector extraSelectors (List.map update properties)

    ConditionalGroupRule _ _ ->
      declaration

    StandaloneAtRule _ _ ->
      declaration


updateLastProperty : (Property -> Property) -> List Declaration -> List Declaration
updateLastProperty update declarations =
  case declarations of
    [] ->
      []

    declaration :: [] ->
      case declaration of
        StyleBlock firstSelector extraSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                firstSelector
                extraSelectors
                (updateLast update properties)
          in
            [ newDeclaration ]

        ConditionalGroupRule _ _ ->
          [ declaration ]

        StandaloneAtRule _ _ ->
          [ declaration ]

    first :: rest ->
      first :: updateLastProperty update rest


addProperty : String -> Property -> List Declaration -> List Declaration
addProperty functionName property declarations =
  case declarations of
    [] ->
      []

    declaration :: [] ->
      case declaration of
        StyleBlock firstSelector extraSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                firstSelector
                extraSelectors
                (properties ++ [ property ])
          in
            [ newDeclaration ]

        _ ->
          []

    first :: rest ->
      first :: addProperty functionName property rest


extendLastSelector : String -> (CompoundSelector -> CompoundSelector) -> List Declaration -> List Declaration
extendLastSelector operatorName update declarations =
  case declarations of
    [] ->
      []

    declaration :: [] ->
      case declaration of
        StyleBlock firstSelector extraSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                (update firstSelector)
                (List.map update extraSelectors)
                []

            newDeclarations =
              if List.isEmpty properties then
                -- Don't bother keeping empty declarations.
                [ newDeclaration ]
              else
                [ declaration, newDeclaration ]
          in
            newDeclarations

        _ ->
          []

    first :: rest ->
      first :: extendLastSelector operatorName update rest


updateLast : (a -> a) -> List a -> List a
updateLast update list =
  case list of
    [] ->
      list

    singleton :: [] ->
      [ update singleton ]

    first :: rest ->
      first :: updateLast update rest


getLast : List a -> Maybe a
getLast list =
  case list of
    [] ->
      Nothing

    elem :: [] ->
      Just elem

    first :: rest ->
      getLast rest


addSelector : String -> CompoundSelector -> List Declaration -> List Declaration
addSelector operatorName newSelector declarations =
  case declarations of
    [] ->
      []

    declaration :: [] ->
      case declaration of
        StyleBlock firstSelector extraSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                firstSelector
                (extraSelectors ++ [ newSelector ])
                properties
          in
            [ newDeclaration ]

        _ ->
          []

    first :: rest ->
      first :: addSelector operatorName newSelector rest


mapSelectors : List (CompoundSelector -> CompoundSelector) -> List Declaration -> List Declaration
mapSelectors updates =
  let
    apply : Declaration -> (CompoundSelector -> CompoundSelector) -> List Declaration
    apply declaration update =
      case declaration of
        StyleBlock firstSelector otherSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                (update firstSelector)
                (List.map update otherSelectors)
                []
          in
            if List.isEmpty properties then
              [ newDeclaration ]
            else
              declaration :: [ newDeclaration ]

        ConditionalGroupRule rule declarations ->
          [ ConditionalGroupRule rule (List.concatMap ((flip apply) update) declarations) ]

        StandaloneAtRule _ _ ->
          [ declaration ]
  in
    List.concatMap (\declaration -> List.concatMap (apply declaration) updates)


extractSelectors : List Declaration -> List CompoundSelector
extractSelectors declarations =
  case declarations of
    [] ->
      []

    StyleBlock firstSelector otherSelectors _ :: rest ->
      (firstSelector :: otherSelectors) ++ (extractSelectors rest)

    ConditionalGroupRule _ _ :: rest ->
      extractSelectors rest

    StandaloneAtRule _ _ :: rest ->
      extractSelectors rest


mergeSelectors : CompoundSelector -> CompoundSelector -> CompoundSelector
mergeSelectors originalSelector newSelector =
  case originalSelector of
    SingleSelector _ ->
      originalSelector

    MultiSelector _ _ ->
      originalSelector

    AdjacentSibling _ _ ->
      AdjacentSibling originalSelector newSelector

    GeneralSibling _ _ ->
      GeneralSibling originalSelector newSelector

    Child _ _ ->
      Child originalSelector newSelector

    Descendant _ _ ->
      Descendant originalSelector newSelector

    PseudoClass str _ ->
      PseudoClass str (Just newSelector)

    PseudoElement str _ ->
      PseudoElement str (Just newSelector)
