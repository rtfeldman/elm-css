module Css.Structure exposing (..)

{-| A representation of the structure of a stylesheet. This module is concerned
solely with representing valid stylesheets; it is not concerned with the
elm-css DSL, collecting warnings, or
-}


{-| A property consisting of a key, a value, and a flag for whether or not
the property is `!important`.
-}
type alias Property =
    { important : Bool
    , key : String
    , value : String
    }


{-| A stylesheet. Since they follow such specific rules, the following at-rules
are specified once rather than intermingled with normal declarations:

* [`@charset`](https://developer.mozilla.org/en-US/docs/Web/CSS/@charset)
* [`@import`](https://developer.mozilla.org/en-US/docs/Web/CSS/@import)
* [`@namespace`](https://developer.mozilla.org/en-US/docs/Web/CSS/@namespace)
-}
type alias Stylesheet =
    { charset : Maybe String
    , imports : List ( String, List MediaQuery )
    , namespaces : List ( String, String )
    , declarations : List Declaration
    }


{-| A Declaration, meaning either a [`StyleBlock`](#StyleBlock) declaration
or an [at-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule)
declaration. Since each at-rule works differently, the supported ones are
enumerated as follows.

* `MediaRule`: an [`@media`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media) rule.
* `SupportsRule`: an [`@supports`](https://developer.mozilla.org/en-US/docs/Web/CSS/@supports) rule.
* `DocumentRule`: an [`@document`](https://developer.mozilla.org/en-US/docs/Web/CSS/@document) rule.
* `PageRule`: an [`@page`](https://developer.mozilla.org/en-US/docs/Web/CSS/@page) rule.
* `FontFace`: an [`@font-face`](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face) rule.
* `Keyframes`: an [`@keyframes`](https://developer.mozilla.org/en-US/docs/Web/CSS/@keyframes) rule.
* `Viewport`: an [`@viewport`](https://developer.mozilla.org/en-US/docs/Web/CSS/@viewport) rule.
* `CounterStyle`: an [`@counter-style`](https://developer.mozilla.org/en-US/docs/Web/CSS/@counter-style) rule.
* `FontFeatureValues`: an [`@font-feature-values`](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-feature-values) rule.
-}
type Declaration
    = StyleBlockDeclaration StyleBlock
    | MediaRule (List MediaQuery) (List StyleBlock)
    | SupportsRule String (List Declaration)
    | DocumentRule String String String String StyleBlock
    | PageRule String (List Property)
    | FontFace (List Property)
    | Keyframes String (List KeyframeProperty)
    | Viewport (List Property)
    | CounterStyle (List Property)
    | FontFeatureValues (List ( String, List Property ))


{-| One or more selectors followed by their properties.
-}
type StyleBlock
    = StyleBlock Selector (List Selector) (List Property)


{-| A media query.
-}
type MediaQuery
    = MediaQuery String


{-| A [CSS3 Selector](https://www.w3.org/TR/css3-selectors/). All selectors
begin with either a type selector or the universal selector, and end with either
zero or one pseudo-elements. In between can be zero or more simple selectors,
separated by combinators.
-}
type Selector
    = Selector SimpleSelectorSequence (List ( SelectorCombinator, SimpleSelectorSequence )) (Maybe PseudoElement)


{-| Either the universal selector or a type selector, followed by zero or
more repeatable selectors.
-}
type SimpleSelectorSequence
    = TypeSelectorSequence TypeSelector (List RepeatableSimpleSelector)
    | UniversalSelectorSequence (List RepeatableSimpleSelector)
    | CustomSelector String (List RepeatableSimpleSelector)


{-| A selector that can appear multiple times in a simple selector. (It doesn't
make a ton of sense that the specification permits multiple id selectors, but
here we are.)
-}
type RepeatableSimpleSelector
    = ClassSelector String
    | IdSelector String
    | PseudoClassSelector String


{-| A type selector. That's what the CSS spec calls them, but it could be
better. Maybe "element selector" or "tag selector" perhaps?
-}
type TypeSelector
    = TypeSelector String


{-| A pseudo-element.
-}
type PseudoElement
    = PseudoElement String


{-| A selector combinator used to link together selector chains.
-}
type SelectorCombinator
    = AdjacentSibling
    | GeneralSibling
    | Child
    | Descendant


type alias KeyframeProperty =
    String


{-| Add a property to the last style block in the given declarations.
-}
appendProperty : Property -> List Declaration -> List Declaration
appendProperty property declarations =
    case declarations of
        [] ->
            declarations

        (StyleBlockDeclaration styleBlock) :: [] ->
            [ StyleBlockDeclaration (withPropertyAppended property styleBlock) ]

        (MediaRule mediaQueries styleBlocks) :: [] ->
            [ MediaRule mediaQueries
                (mapLast (withPropertyAppended property) styleBlocks)
            ]

        -- TODO
        _ :: [] ->
            declarations

        --| SupportsRule String (List Declaration)
        --| DocumentRule String String String String StyleBlock
        --| PageRule String (List Property)
        --| FontFace (List Property)
        --| Keyframes String (List KeyframeProperty)
        --| Viewport (List Property)
        --| CounterStyle (List Property)
        --| FontFeatureValues (List ( String, List Property ))
        first :: rest ->
            first :: appendProperty property rest


withPropertyAppended : Property -> StyleBlock -> StyleBlock
withPropertyAppended property (StyleBlock firstSelector otherSelectors properties) =
    StyleBlock firstSelector otherSelectors (properties ++ [ property ])


extendLastSelector : RepeatableSimpleSelector -> List Declaration -> List Declaration
extendLastSelector selector declarations =
    case declarations of
        [] ->
            declarations

        (StyleBlockDeclaration (StyleBlock only [] properties)) :: [] ->
            [ StyleBlockDeclaration (StyleBlock (appendRepeatableSelector selector only) [] properties) ]

        (StyleBlockDeclaration (StyleBlock first rest properties)) :: [] ->
            let
                newRest =
                    mapLast (appendRepeatableSelector selector) rest
            in
                [ StyleBlockDeclaration (StyleBlock first newRest properties) ]

        (MediaRule mediaQueries ((StyleBlock only [] properties) :: [])) :: [] ->
            let
                newStyleBlock =
                    StyleBlock (appendRepeatableSelector selector only) [] properties
            in
                [ MediaRule mediaQueries [ newStyleBlock ] ]

        (MediaRule mediaQueries ((StyleBlock first rest properties) :: [])) :: [] ->
            let
                newRest =
                    mapLast (appendRepeatableSelector selector) rest

                newStyleBlock =
                    StyleBlock first newRest properties
            in
                [ MediaRule mediaQueries [ newStyleBlock ] ]

        (MediaRule mediaQueries (first :: rest)) :: [] ->
            case extendLastSelector selector [ MediaRule mediaQueries rest ] of
                (MediaRule newMediaQueries newStyleBlocks) :: [] ->
                    [ MediaRule newMediaQueries (first :: newStyleBlocks) ]

                _ as declarations ->
                    declarations

        (SupportsRule str nestedDeclarations) :: [] ->
            [ SupportsRule str (extendLastSelector selector nestedDeclarations) ]

        (DocumentRule str1 str2 str3 str4 (StyleBlock only [] properties)) :: [] ->
            let
                newStyleBlock =
                    StyleBlock (appendRepeatableSelector selector only) [] properties
            in
                [ DocumentRule str1 str2 str3 str4 newStyleBlock ]

        (DocumentRule str1 str2 str3 str4 (StyleBlock first rest properties)) :: [] ->
            let
                newRest =
                    mapLast (appendRepeatableSelector selector) rest

                newStyleBlock =
                    StyleBlock first newRest properties
            in
                [ DocumentRule str1 str2 str3 str4 newStyleBlock ]

        (PageRule _ _) :: [] ->
            declarations

        (FontFace _) :: [] ->
            declarations

        (Keyframes _ _) :: [] ->
            declarations

        (Viewport _) :: [] ->
            declarations

        (CounterStyle _) :: [] ->
            declarations

        (FontFeatureValues _) :: [] ->
            declarations

        first :: rest ->
            first :: extendLastSelector selector rest


appendToLastSelector : (Selector -> Selector) -> StyleBlock -> List StyleBlock
appendToLastSelector f styleBlock =
    case styleBlock of
        StyleBlock only [] properties ->
            [ StyleBlock only [] properties
            , StyleBlock (f only) [] []
            ]

        StyleBlock first rest properties ->
            let
                newRest =
                    List.map f rest

                newFirst =
                    f first
            in
                [ StyleBlock first rest properties
                , StyleBlock newFirst newRest []
                ]


appendRepeatableToLastSelector : RepeatableSimpleSelector -> StyleBlock -> List StyleBlock
appendRepeatableToLastSelector selector styleBlock =
    appendToLastSelector (appendRepeatableSelector selector) styleBlock


appendPseudoElementToLastSelector : PseudoElement -> StyleBlock -> List StyleBlock
appendPseudoElementToLastSelector pseudo styleBlock =
    appendToLastSelector (applyPseudoElement pseudo) styleBlock


applyPseudoElement : PseudoElement -> Selector -> Selector
applyPseudoElement pseudo (Selector sequence selectors _) =
    Selector sequence selectors <| Just pseudo


concatMapLastStyleBlock : (StyleBlock -> List StyleBlock) -> List Declaration -> List Declaration
concatMapLastStyleBlock update declarations =
    case declarations of
        [] ->
            declarations

        (StyleBlockDeclaration styleBlock) :: [] ->
            update styleBlock
                |> List.map StyleBlockDeclaration

        (MediaRule mediaQueries (styleBlock :: [])) :: [] ->
            [ MediaRule mediaQueries (update styleBlock) ]

        (MediaRule mediaQueries (first :: rest)) :: [] ->
            case concatMapLastStyleBlock update [ MediaRule mediaQueries rest ] of
                (MediaRule newMediaQueries newStyleBlocks) :: [] ->
                    [ MediaRule newMediaQueries (first :: newStyleBlocks) ]

                _ as declarations ->
                    declarations

        (SupportsRule str nestedDeclarations) :: [] ->
            [ SupportsRule str (concatMapLastStyleBlock update nestedDeclarations) ]

        -- TODO give these more descritpive names
        (DocumentRule str1 str2 str3 str4 styleBlock) :: [] ->
            update styleBlock
                |> List.map (DocumentRule str1 str2 str3 str4)

        (PageRule _ _) :: [] ->
            declarations

        (FontFace _) :: [] ->
            declarations

        (Keyframes _ _) :: [] ->
            declarations

        (Viewport _) :: [] ->
            declarations

        (CounterStyle _) :: [] ->
            declarations

        (FontFeatureValues _) :: [] ->
            declarations

        first :: rest ->
            first :: concatMapLastStyleBlock update rest


appendRepeatableSelector : RepeatableSimpleSelector -> Selector -> Selector
appendRepeatableSelector repeatableSimpleSelector selector =
    case selector of
        Selector sequence [] pseudoElement ->
            Selector (appendRepeatable repeatableSimpleSelector sequence) [] pseudoElement

        Selector firstSelector tuples pseudoElement ->
            Selector firstSelector (appendRepeatableWithCombinator repeatableSimpleSelector tuples) pseudoElement


appendRepeatableWithCombinator : RepeatableSimpleSelector -> List ( SelectorCombinator, SimpleSelectorSequence ) -> List ( SelectorCombinator, SimpleSelectorSequence )
appendRepeatableWithCombinator selector list =
    case list of
        [] ->
            []

        ( combinator, sequence ) :: [] ->
            [ ( combinator, appendRepeatable selector sequence ) ]

        first :: rest ->
            first :: appendRepeatableWithCombinator selector rest


appendRepeatable : RepeatableSimpleSelector -> SimpleSelectorSequence -> SimpleSelectorSequence
appendRepeatable selector sequence =
    case sequence of
        TypeSelectorSequence typeSelector list ->
            TypeSelectorSequence typeSelector (list ++ [ selector ])

        UniversalSelectorSequence list ->
            UniversalSelectorSequence (list ++ [ selector ])

        CustomSelector str list ->
            CustomSelector str (list ++ [ selector ])


mapLast : (a -> a) -> List a -> List a
mapLast update list =
    case list of
        [] ->
            list

        only :: [] ->
            [ update only ]

        first :: rest ->
            first :: mapLast update rest


concatMapLast : (a -> List a) -> List a -> List a
concatMapLast update list =
    case list of
        [] ->
            list

        only :: [] ->
            update only

        first :: rest ->
            first :: concatMapLast update rest


dropEmpty : Stylesheet -> Stylesheet
dropEmpty { charset, imports, namespaces, declarations } =
    { charset = charset
    , imports = imports
    , namespaces = namespaces
    , declarations = dropEmptyDeclarations declarations
    }


dropEmptyDeclarations : List Declaration -> List Declaration
dropEmptyDeclarations declarations =
    case declarations of
        [] ->
            []

        ((StyleBlockDeclaration (StyleBlock _ _ properties)) as declaration) :: rest ->
            if List.isEmpty properties then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((MediaRule _ styleBlocks) as declaration) :: rest ->
            if List.all (\(StyleBlock _ _ properties) -> List.isEmpty properties) styleBlocks then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((SupportsRule _ otherDeclarations) as declaration) :: rest ->
            if List.isEmpty otherDeclarations then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((DocumentRule _ _ _ _ _) as declaration) :: rest ->
            declaration :: (dropEmptyDeclarations rest)

        ((PageRule _ properties) as declaration) :: rest ->
            if List.isEmpty properties then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((FontFace properties) as declaration) :: rest ->
            if List.isEmpty properties then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((Keyframes _ properties) as declaration) :: rest ->
            if List.isEmpty properties then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((Viewport properties) as declaration) :: rest ->
            if List.isEmpty properties then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((CounterStyle properties) as declaration) :: rest ->
            if List.isEmpty properties then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)

        ((FontFeatureValues tuples) as declaration) :: rest ->
            if List.all (\( _, properties ) -> List.isEmpty properties) tuples then
                dropEmptyDeclarations rest
            else
                declaration :: (dropEmptyDeclarations rest)
