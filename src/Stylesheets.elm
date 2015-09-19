module Stylesheets where

{-
    Implementation notes:

    - strip out []()""'' - so:
    - toString ["html", "body"] -> "[\"html\",\"body\"]" -> "html,body"

    How would you write this?

    html, body, .foo, .bar
        width: 100%
-}


{- Tags -}

html = "html"
body = "body"
div = "div"
nowrap = "nowrap"


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
        |> autoToString
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


whiteSpaceToString : WhiteSpace -> String
whiteSpaceToString =
    (\(ExplicitWhiteSpace str) -> str)
        |> autoToString
        |> inheritToString

colorToString : Color -> String
colorToString =
    explicitColorToString
        |> autoToString
        |> inheritToString

textShadowToString : TextShadow -> String
textShadowToString =
    explicitTextShadowToString
        |> noneToString
        |> inheritToString


explicitColorToString : ExplicitColor -> String
explicitColorToString value =
    case value of
        RGB r g b ->
            "rgb(" ++ (toString r) ++ ", " ++ (toString g) ++ ", " ++ (toString b) ++ ")"

        RGBA r g b a ->
            "rgba(" ++ (toString r) ++ ", " ++ (toString g) ++ ", " ++ (toString b) ++ ", " ++ (toString a) ++ ")"

        Hex str ->
            "#" ++ str

explicitTextShadowToString : ExplicitTextShadow -> String
explicitTextShadowToString value =
    case value of
        NoTextShadow ->
            "TODO"


type InheritOr a
    = Inherit
    | NotInherit a

type AutoOr a
    = Auto
    | NotAuto a

type NoneOr a
    = None
    | NotNone a

type alias Units = InheritOr (AutoOr ExplicitUnits)
type alias BoxSizing = InheritOr ExplicitBoxSizing
type alias Overflow = InheritOr (AutoOr ExplicitOverflow)
type alias Display = InheritOr (NoneOr ExplicitDisplay)
type alias WhiteSpace = InheritOr (AutoOr ExplicitWhiteSpace)
type alias Color = InheritOr (AutoOr ExplicitColor)
type alias TextShadow = InheritOr (NoneOr ExplicitTextShadow)

type ExplicitUnits = ExplicitUnits String
type ExplicitBoxSizing = ExplicitBoxSizing String
type ExplicitOverflow = ExplicitOverflow String
type ExplicitDisplay = ExplicitDisplay String
type ExplicitWhiteSpace = ExplicitWhiteSpace String

type ExplicitColor
    = RGB Float Float Float
    | RGBA Float Float Float Float
    | Hex String

type ExplicitTextShadow
    = NoTextShadow

rgb : number -> number -> number -> Color
rgb r g b =
    RGB r g b |> NotAuto |> NotInherit

rgba : number -> number -> number -> number -> Color
rgba r g b a =
    RGBA r g b a |> NotAuto |> NotInherit

hex : String -> Color
hex str =
    Hex str |> NotAuto |> NotInherit

pct : Units
pct = "%" |> ExplicitUnits |> NotAuto |> NotInherit

em : Units
em = "em" |> ExplicitUnits |> NotAuto |> NotInherit

px : Units
px = "px" |> ExplicitUnits |> NotAuto |> NotInherit

borderBox = "border-box" |> ExplicitBoxSizing |> NotInherit

visible : Display
visible = "visible" |> ExplicitDisplay |> NotNone |> NotInherit

none : InheritOr (NoneOr a)
none = None |> NotInherit

auto : InheritOr (AutoOr a)
auto = Auto |> NotInherit

inherit : InheritOr a
inherit = Inherit

noWrap : WhiteSpace
noWrap = "no-wrap" |> ExplicitWhiteSpace |> NotAuto |> NotInherit

{- Attributes -}

attr1 name translate value =
    Attribute (name ++ ": " ++ (translate value))


attr2 name translateA translateB valueA valueB =
    Attribute (name ++ ": " ++ (translateA valueA) ++ " " ++ (translateB valueB))


display : Display -> Attribute
display =
    attr1 "display" displayToString


width : number -> Units -> Attribute
width =
    attr2 "width" toString unitsToString


minWidth : number -> Units -> Attribute
minWidth =
    attr2 "min-width" toString unitsToString


height : number -> Units -> Attribute
height =
    attr2 "height" toString unitsToString


minHeight : number -> Units -> Attribute
minHeight =
    attr2 "min-height" toString unitsToString


padding : number -> Units -> Attribute
padding =
    attr2 "padding" toString unitsToString


margin : number -> Units -> Attribute
margin =
    attr2 "margin" toString unitsToString


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

{- Types -}

type Style
    = Style String (List Attribute) (List Style)


type Attribute
    = Attribute String


stylesheet : Style
stylesheet =
    Style "" [] []


styleWithPrefix : String -> Style -> a -> Style
styleWithPrefix prefix (Style selector attrs children) childSelector =
    children ++ [ Style (prefix ++ (toString childSelector)) [] [] ]
        |> Style selector attrs


(|%) : Style -> a -> Style
(|%) (Style selector attrs children) childSelector =
    children ++ [ Style (toString childSelector) [] [] ]
        |> Style selector attrs


(|@) : Style -> a -> Style
(|@) = styleWithPrefix "@"


(|::) : Style -> a -> Style
(|::) = styleWithPrefix "::"


(|>%) : Style -> a -> Style
(|>%) = styleWithPrefix ">"


(|.) : Style -> a -> Style
(|.) = styleWithPrefix "."


(|>.) : Style -> a -> Style
(|>.) = styleWithPrefix ">."


(|!) : Style -> Attribute -> Style
(|!) (Style selector attrs children) (Attribute attrString) =
    Style selector (attrs ++ [ (Attribute (attrString ++ " !important")) ]) children


(|-) : Style -> Attribute -> Style
(|-) (Style selector attrs children) attr =
    Style selector (attrs ++ [ attr ]) children
