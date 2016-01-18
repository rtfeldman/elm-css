module Css.Declaration (..) where


type SimpleSelector
  = TypeSelector String
  | ClassSelector String
  | IdSelector String
  | MultiSelector SimpleSelector SimpleSelector
  | CustomSelector String


type ComplexSelector
  = SingleSelector SimpleSelector
  | AdjacentSibling ComplexSelector ComplexSelector
  | GeneralSibling ComplexSelector ComplexSelector
  | Child ComplexSelector ComplexSelector
  | Descendant ComplexSelector ComplexSelector
  | PseudoClass String (Maybe SimpleSelector)
  | PseudoElement String (Maybe SimpleSelector)


type alias Property =
  { important : Bool
  , key : String
  , value : String
  }


type Declaration
  = StyleBlock ComplexSelector (List ComplexSelector) (List Property)
  | ConditionalGroupRule String (List Declaration)
  | StandaloneAtRule String String


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
    StyleBlock firstSelector extraSimpleSelectors properties ->
      StyleBlock firstSelector extraSimpleSelectors (List.map update properties)

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
        StyleBlock firstSelector extraSimpleSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                firstSelector
                extraSimpleSelectors
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
        StyleBlock firstSelector extraSimpleSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                firstSelector
                extraSimpleSelectors
                (properties ++ [ property ])
          in
            [ newDeclaration ]

        _ ->
          []

    first :: rest ->
      first :: addProperty functionName property rest


extendLastSelector : String -> (ComplexSelector -> ComplexSelector) -> List Declaration -> List Declaration
extendLastSelector operatorName update declarations =
  case declarations of
    [] ->
      []

    declaration :: [] ->
      case declaration of
        StyleBlock firstSelector extraSimpleSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                (update firstSelector)
                (List.map update extraSimpleSelectors)
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


addSelector : String -> ComplexSelector -> List Declaration -> List Declaration
addSelector operatorName newSelector declarations =
  case declarations of
    [] ->
      []

    declaration :: [] ->
      case declaration of
        StyleBlock firstSelector extraSimpleSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                firstSelector
                (extraSimpleSelectors ++ [ newSelector ])
                properties
          in
            [ newDeclaration ]

        _ ->
          []

    first :: rest ->
      first :: addSelector operatorName newSelector rest


mapSelectors : List (ComplexSelector -> ComplexSelector) -> List Declaration -> List Declaration
mapSelectors updates =
  let
    apply : Declaration -> (ComplexSelector -> ComplexSelector) -> List Declaration
    apply declaration update =
      case declaration of
        StyleBlock firstSelector otherSimpleSelectors properties ->
          let
            newDeclaration =
              StyleBlock
                (update firstSelector)
                (List.map update otherSimpleSelectors)
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


extractSelectors : List Declaration -> List ComplexSelector
extractSelectors declarations =
  case declarations of
    [] ->
      []

    (StyleBlock firstSelector otherSimpleSelectors _) :: rest ->
      (firstSelector :: otherSimpleSelectors) ++ (extractSelectors rest)

    (ConditionalGroupRule _ _) :: rest ->
      extractSelectors rest

    (StandaloneAtRule _ _) :: rest ->
      extractSelectors rest


mergeSelectors : ComplexSelector -> ComplexSelector -> ComplexSelector
mergeSelectors originalSelector newSelector =
  case originalSelector of
    SingleSelector _ ->
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
      case newSelector of
        SingleSelector simpleSelector ->
          PseudoClass str (Just simpleSelector)

        _ ->
          originalSelector

    PseudoElement str _ ->
      case newSelector of
        SingleSelector simpleSelector ->
          PseudoElement str (Just simpleSelector)

        _ ->
          originalSelector


mapSingleSelectors : (SimpleSelector -> SimpleSelector) -> ComplexSelector -> ComplexSelector
mapSingleSelectors update complexSelector =
  case complexSelector of
    SingleSelector simpleSelector ->
      SingleSelector (update simpleSelector)

    AdjacentSibling parent child ->
      AdjacentSibling (mapSingleSelectors update parent) (mapSingleSelectors update child)

    GeneralSibling parent child ->
      GeneralSibling (mapSingleSelectors update parent) (mapSingleSelectors update child)

    Child parent child ->
      Child (mapSingleSelectors update parent) (mapSingleSelectors update child)

    Descendant parent child ->
      Descendant (mapSingleSelectors update parent) (mapSingleSelectors update child)

    PseudoClass _ Nothing ->
      complexSelector

    PseudoElement _ Nothing ->
      complexSelector

    PseudoClass str (Just simpleSelector) ->
      PseudoClass str (Just (update simpleSelector))

    PseudoElement str (Just simpleSelector) ->
      PseudoElement str (Just (update simpleSelector))
