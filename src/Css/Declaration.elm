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
    | PseudoClass String CompoundSelector
    | PseudoElement String CompoundSelector


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


updateLastProperty : String -> (Property -> Property) -> List Declaration -> Result String (List Declaration)
updateLastProperty functionName update declarations =
    case declarations of
        [] ->
            Err ("`" ++ functionName ++ "` cannot update an empty list of declarations.")

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
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err ("`" ++ functionName ++ "` cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err ("`" ++ functionName ++ "` cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case updateLastProperty functionName update rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


addProperty : String -> Property -> List Declaration -> Result String (List Declaration)
addProperty functionName property declarations =
    case declarations of
        [] ->
            Err ("`" ++ functionName ++ "` cannot be used as the first declaration.")

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
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err ("`~` cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err ("`~` cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case addProperty functionName property rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


extendLastSelector : String -> (CompoundSelector -> CompoundSelector) -> List Declaration -> Result String (List Declaration)
extendLastSelector operatorName update declarations =
    case declarations of
        [] ->
            Err (operatorName ++ " cannot be used as the first declaration.")

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
                        Ok newDeclarations

                ConditionalGroupRule _ _ ->
                    Err (operatorName ++ " cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err (operatorName ++ " cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case extendLastSelector operatorName update rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err


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


addSelector : String -> CompoundSelector -> List Declaration -> Result String (List Declaration)
addSelector operatorName newSelector declarations =
    case declarations of
        [] ->
            Err (operatorName ++ " cannot be used as the first declaration.")

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
                        Ok [ newDeclaration ]

                ConditionalGroupRule _ _ ->
                    Err (operatorName ++ " cannot modify a conditional group rule (such as an at-rule). See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule#Conditional_Group_Rules for more information on conditional group rules.")

                StandaloneAtRule _ _ ->
                    Err (operatorName ++ " cannot modify an at-rule. See https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule for more information on at-rules.")

        first :: rest ->
            case addSelector operatorName newSelector rest of
                Ok result ->
                    Ok (first :: result)

                (Err _) as err ->
                    err
