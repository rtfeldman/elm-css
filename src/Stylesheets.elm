module Stylesheets where

{-
    Implementation notes:

    - strip out []()""'' - so:
    - toString ["html", "body"] -> "[\"html\",\"body\"]" -> "html,body"

    How would you write this?

    html, body, .foo, .bar
        width: 100%
-}

import String

prettyPrint : Int -> Style class id -> String
prettyPrint =
    prettyPrintHelp 0


prettyPrintHelp : Int -> Int -> Style class id -> String
prettyPrintHelp indentLevel indentSpaces (Style selectors attributes children) =
    if (indentLevel == 0) && (String.isEmpty (Maybe.withDefault "" (List.head selectors))) then
        children
            |> List.map (prettyPrintHelp indentLevel indentSpaces)
            |> String.join "\n\n"
    else
        let
            indentStr =
                String.repeat (indentSpaces * indentLevel) " "

            subIndentStr =
                indentStr ++ String.repeat (indentSpaces) " "

            attrsStr =
                if List.isEmpty attributes then
                    ""
                else
                    attributes
                        |> List.map attributeToString
                        |> String.join subIndentStr
                        |> (++) subIndentStr

            prettyPrintChild =
                prettyPrintHelp (indentLevel + 1) indentSpaces

            childrenStr =
                if List.isEmpty children then
                    ""
                else
                    children
                        |> List.map prettyPrintChild
                        |> String.join subIndentStr
                        |> (++) subIndentStr

            selectorStr =
                selectors
                    |> String.join ", "
        in
            indentStr ++ selectorStr ++ " {\n"
                ++ attrsStr
                ++ childrenStr
                ++ "}"


attributeToString : Attribute -> String
attributeToString (Attribute str) =
    str ++ ";\n"


{- Tags -}

html = Tag "html"
body = Tag "body"
header = Tag "header"
nav = Tag "nav"
div = Tag "div"
span = Tag "span"
img = Tag "img"
nowrap = Tag "nowrap"
button = Tag "button"
h1 = Tag "h1"
h2 = Tag "h2"
h3 = Tag "h3"
h4 = Tag "h4"
p = Tag "p"
ol = Tag "ol"
input = Tag "input"

tagToString (Tag str) = str


-- TODO these are just for @media - maybe improve type guarantees?
screen = "screen"
print = "print"

-- TODO this is just for ::selection - maybe improve type guarantees?
selection = "selection"


{- Units -}

inheritToString : (a -> String) -> InheritOr a -> String
inheritToString translate value =
    case value of
        Inherit ->
            "inherit"

        NotInherit notInherit ->
            translate notInherit


autoToString : (a -> String) -> AutoOr a -> String
autoToString translate value =
    case value of
        Auto ->
            "auto"

        NotAuto notAuto ->
            translate notAuto

noneToString : (a -> String) -> NoneOr a -> String
noneToString translate value =
    case value of
        None ->
            "none"

        NotNone notNone ->
            translate notNone


unitsToString : Units -> String
unitsToString =
    (\(ExplicitUnits str) -> str)
        |> inheritToString


boxSizingToString : BoxSizing -> String
boxSizingToString =
    (\(ExplicitBoxSizing str) -> str)
        |> inheritToString


overflowToString : Overflow -> String
overflowToString =
    (\(ExplicitOverflow str) -> str)
        |> autoToString
        |> inheritToString


displayToString : Display -> String
displayToString =
    (\(ExplicitDisplay str) -> str)
        |> noneToString
        |> inheritToString


verticalAlignToString : VerticalAlign -> String
verticalAlignToString =
    (\(ExplicitVerticalAlign str) -> str)
        |> inheritToString


whiteSpaceToString : WhiteSpace -> String
whiteSpaceToString =
    (\(ExplicitWhiteSpace str) -> str)
        |> autoToString
        |> inheritToString

colorToString : Color -> String
colorToString =
    (\(ExplicitColor str) -> str)
        |> autoToString
        |> inheritToString


numberToString : number -> String
numberToString num =
    toString (num + 0)


textShadowToString : TextShadow -> String
textShadowToString =
    explicitTextShadowToString
        |> noneToString
        |> inheritToString


explicitTextShadowToString : ExplicitTextShadow -> String
explicitTextShadowToString value =
    case value of
        NoTextShadow ->
            "TODO"

outlineStyleToString : OutlineStyle -> String
outlineStyleToString (OutlineStyle str) = str


opacityStyleToString : OpacityStyle -> String
opacityStyleToString (OpacityStyle str) = str


type Tag
    = Tag String

type InheritOr a
    = Inherit
    | NotInherit a

type AutoOr a
    = Auto
    | NotAuto a

type NoneOr a
    = None
    | NotNone a

type alias BoxSizing = InheritOr ExplicitBoxSizing
type alias Overflow = InheritOr (AutoOr ExplicitOverflow)
type alias Display = InheritOr (NoneOr ExplicitDisplay)
type alias WhiteSpace = InheritOr (AutoOr ExplicitWhiteSpace)
type alias Color = InheritOr (AutoOr ExplicitColor)
type alias TextShadow = InheritOr (NoneOr ExplicitTextShadow)
type alias Outline = InheritOr ExplicitOutline
type alias Units = InheritOr ExplicitUnits
type alias VerticalAlign = InheritOr ExplicitVerticalAlign

type ExplicitUnits = ExplicitUnits String
type ExplicitBoxSizing = ExplicitBoxSizing String
type ExplicitOverflow = ExplicitOverflow String
type ExplicitDisplay = ExplicitDisplay String
type ExplicitWhiteSpace = ExplicitWhiteSpace String
type ExplicitColor = ExplicitColor String
type ExplicitVerticalAlign = ExplicitVerticalAlign String

type ExplicitOutline
    = ExplicitOutline Float ExplicitUnits OutlineStyle OpacityStyle

type OutlineStyle
    = OutlineStyle String

type OpacityStyle
    = OpacityStyle String

type ExplicitTextShadow
    = NoTextShadow

solid : OutlineStyle
solid = OutlineStyle "solid"

transparent : OpacityStyle
transparent = OpacityStyle "transparent"

rgb : number -> number -> number -> Color
rgb r g b =
    ExplicitColor ("rgb(" ++ (numberToString r) ++ ", " ++ (numberToString g) ++ ", " ++ (numberToString b) ++ ")")
        |> NotAuto |> NotInherit


rgba : number -> number -> number -> number -> Color
rgba r g b a =
    ExplicitColor ("rgba(" ++ (numberToString r) ++ ", " ++ (numberToString g) ++ ", " ++ (numberToString b) ++ ", " ++ (numberToString a) ++ ")")
        |> NotAuto |> NotInherit


hex : String -> Color
hex str =
    ExplicitColor ("#" ++ str)
        |> NotAuto |> NotInherit

pct : Units
pct = "%" |> ExplicitUnits |> NotInherit

em : Units
em = "em" |> ExplicitUnits |> NotInherit

px : Units
px = "px" |> ExplicitUnits |> NotInherit

borderBox = "border-box" |> ExplicitBoxSizing |> NotInherit

visible : Display
visible = "visible" |> ExplicitDisplay |> NotNone |> NotInherit

block : Display
block = "block" |> ExplicitDisplay |> NotNone |> NotInherit

inlineBlock : Display
inlineBlock = "inline-block" |> ExplicitDisplay |> NotNone |> NotInherit

inline : Display
inline = "inline" |> ExplicitDisplay |> NotNone |> NotInherit

none : InheritOr (NoneOr a)
none = None |> NotInherit

auto : InheritOr (AutoOr a)
auto = Auto |> NotInherit

inherit : InheritOr a
inherit = Inherit

noWrap : WhiteSpace
noWrap = "no-wrap" |> ExplicitWhiteSpace |> NotAuto |> NotInherit

top : VerticalAlign
top = "top" |> ExplicitVerticalAlign |> NotInherit

middle : VerticalAlign
middle = "middle" |> ExplicitVerticalAlign |> NotInherit

bottom : VerticalAlign
bottom = "bottom" |> ExplicitVerticalAlign |> NotInherit


{- Attributes -}

attr1 name translate value =
    Attribute (name ++ ": " ++ (translate value))


attr2 name translateA translateB valueA valueB =
    Attribute (name ++ ": " ++ (translateA valueA) ++ (translateB valueB))


attr3 name translateA translateB translateC valueA valueB valueC =
    Attribute (name ++ ": " ++ (translateA valueA) ++ (translateB valueB) ++ (translateC valueC))


attr4 name translateA translateB translateC translateD valueA valueB valueC valueD =
    Attribute (name ++ ": " ++ (translateA valueA) ++ (translateB valueB) ++ (translateC valueC) ++ (translateD valueD))


attr5 name translateA translateB translateC translateD translateE valueA valueB valueC valueD valueE =
    Attribute (name ++ ": " ++ (translateA valueA) ++ (translateB valueB) ++ (translateC valueC) ++ (translateD valueD) ++ (translateE valueE))


verticalAlign : VerticalAlign -> Attribute
verticalAlign =
    attr1 "vertical-align" verticalAlignToString


display : Display -> Attribute
display =
    attr1 "display" displayToString


opacity : OpacityStyle -> Attribute
opacity =
    attr1 "opacity" toString


width : number -> Units -> Attribute
width =
    attr2 "width" numberToString unitsToString


minWidth : number -> Units -> Attribute
minWidth =
    attr2 "min-width" numberToString unitsToString


height : number -> Units -> Attribute
height =
    attr2 "height" numberToString unitsToString


minHeight : number -> Units -> Attribute
minHeight =
    attr2 "min-height" numberToString unitsToString


padding : number -> Units -> Attribute
padding =
    attr2 "padding" numberToString unitsToString

paddingTop : number -> Units -> Attribute
paddingTop =
    attr2 "padding-top" numberToString unitsToString

paddingBottom : number -> Units -> Attribute
paddingBottom =
    attr2 "padding-bottom" numberToString unitsToString

paddingRight : number -> Units -> Attribute
paddingRight =
    attr2 "padding-right" numberToString unitsToString

paddingLeft : number -> Units -> Attribute
paddingLeft =
    attr2 "padding-left" numberToString unitsToString

margin : number -> Units -> Attribute
margin =
    attr2 "margin" numberToString unitsToString

marginTop : number -> Units -> Attribute
marginTop =
    attr2 "margin-top" numberToString unitsToString

marginBottom : number -> Units -> Attribute
marginBottom =
    attr2 "margin-bottom" numberToString unitsToString

marginRight : number -> Units -> Attribute
marginRight =
    attr2 "margin-right" numberToString unitsToString

marginLeft : number -> Units -> Attribute
marginLeft =
    attr2 "margin-left" numberToString unitsToString

boxSizing : BoxSizing -> Attribute
boxSizing =
    attr1 "box-sizing" boxSizingToString


overflowX : Overflow -> Attribute
overflowX =
    attr1 "overflow-x" overflowToString


overflowY : Overflow -> Attribute
overflowY =
    attr1 "overflow-y" overflowToString


whiteSpace : WhiteSpace -> Attribute
whiteSpace =
    attr1 "white-space" whiteSpaceToString





backgroundColor : Color -> Attribute
backgroundColor =
    attr1 "background-color" colorToString


color : Color -> Attribute
color =
    attr1 "color" colorToString


media : a -> String
media value =
    "media " ++ (toString value)
    -- TODO

textShadow : TextShadow -> Attribute
textShadow =
    attr1 "text-shadow" textShadowToString


outline : Float -> Units -> OutlineStyle -> OpacityStyle -> Attribute
outline =
    attr4
        "outline"
            toString unitsToString
            (\str -> " " ++ outlineStyleToString str ++ " ")
            opacityStyleToString


{- Types -}

type Style class id
    = Style (List String) (List Attribute) (List (Style class id))


type Attribute
    = Attribute String


stylesheet : Style class id
stylesheet =
    Style [] [] []


styleWithPrefix : String -> Style class id -> a -> Style class id
styleWithPrefix prefix (Style selectors attrs children) childSelector =
    children ++ [ Style [ prefix ++ (toString childSelector) ] [] [] ]
        |> Style selectors attrs


(|%|) : Style class id -> Tag -> Style class id
(|%|) (Style selectors attrs children) tag =
    children ++ [ Style [ tagToString tag ] [] [] ]
        |> Style selectors attrs


(|%|=) : Style class id -> List Tag -> Style class id
(|%|=) (Style selectors attrs children) tags =
    children ++ [ Style (List.map tagToString tags) [] [] ]
        |> Style selectors attrs


(|@|) : Style class id -> a -> Style class id
(|@|) = styleWithPrefix "@"


(|::|) : Style class id -> a -> Style class id
(|::|) = styleWithPrefix "::"


-- TODO take "tags" instead of "tag" and have |>%|= call this too!
--descendentFromSelector tags selector =
--    Style (selector ++ " > " ++ tagToString tag) [] []
--        |> Style selectors attrs


--(|&>%|) : Style class id -> Tag -> Style class id
--(|&>%|) (Style selectors attrs children) tag =
--    let
--        childSelectors =
--            case splitStartLast children of
--                ( _, Nothing ) ->
--                    selectors

--                ( start, Just (Style activeSelectors _ _) ) ->
--                    activeSelectors
--    in
--        children ++ (List.map (descendentFromSelector tag) childSelectors)
--            |> Style selectors attrs


(|&>%|=) : Style class id -> List Tag -> Style class id
(|&>%|=) (Style selectors attrs children) tags =
    let
        childFromSelector selector =
            Style (selector ++ " > " ++ tagToString tag) [] []
                |> Style selectors attrs

        selectorFromTag tag =
            case splitStartLast children of
                ( _, Nothing ) ->
                    selector ++ " > " ++ tagToString tag

                ( start, Just (Style activeSelector _ _) ) ->
                    activeSelector ++ " > " ++ tagToString tag

        childSelector =
            tags
                |> List.map selectorFromTag
                |> String.join ", "
    in
        children ++ [ Style childSelector [] [] ]
            |> Style selectors attrs


(|.|) : Style class id -> class -> Style class id
(|.|) = styleWithPrefix "."


(|#|) : Style class id -> id -> Style class id
(|#|) = styleWithPrefix "#"


(|>.|) : Style class id -> a -> Style class id
(|>.|) = styleWithPrefix ">."


(|!|) : Style class id -> Attribute -> Style class id
(|!|) style (Attribute attrString) =
    transformActiveChild (addAttr (Attribute (attrString ++ " !important"))) style


(|-|) : Style class id -> Attribute -> Style class id
(|-|) style attr =
    transformActiveChild (addAttr attr) style


addAttr : Attribute -> Style a b -> Style a b
addAttr attr (Style selectors attrs children) =
    Style selectors (attrs ++ [ attr ]) children


transformActiveChild : (Style a b -> Style a b) -> Style a b -> Style a b
transformActiveChild transform (( Style selectors attrs children ) as style) =
    case splitStartLast children of
        ( _, Nothing ) ->
            transform style

        ( inactiveChildren, Just activeChild ) ->
            Style
                selectors
                attrs
                (inactiveChildren ++ [ transform activeChild ])


splitStartLast : List a -> (List a, Maybe a)
splitStartLast list =
    case list of
        [] ->
            ( [], Nothing )

        elem :: [] ->
            ( [], Just elem )

        elem :: rest ->
            let
                ( start, last ) =
                    splitStartLast rest
            in
                ( elem :: start, last )

