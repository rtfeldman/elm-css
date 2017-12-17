module Css.Transitions
    exposing
        ( background
        , backgroundColor
        , backgroundPosition
        , backgroundSize
        , border
        , borderBottom
        , borderBottomColor
        , borderBottomLeftRadius
        , borderBottomRightRadius
        , borderBottomWidth
        , borderColor
        , borderLeft
        , borderLeftColor
        , borderLeftWidth
        , borderRadius
        , borderRight
        , borderRightColor
        , borderRightWidth
        , borderTop
        , borderTopColor
        , borderTopLeftRadius
        , borderTopRightRadius
        , borderTopWidth
        , borderWidth
        , bottom
        , boxShadow
        , caretColor
        , clip
        , clipPath
        , color
        , columnCount
        , columnGap
        , columnRule
        , columnRuleColor
        , columnRuleWidth
        , columnWidth
        , columns
        , filter
        , flex
        , flexBasis
        , flexGrow
        , flexShrink
        , font
        , fontSize
        , fontSizeAdjust
        , fontStretch
        , fontVariationSettings
        , fontWeight
        , gridColumnGap
        , gridGap
        , gridRowGap
        , height
        , left
        , letterSpacing
        , lineHeight
        , margin
        , marginBottom
        , marginLeft
        , marginRight
        , marginTop
        , mask
        , maskPosition
        , maskSize
        , maxHeight
        , maxWidth
        , minHeight
        , minWidth
        , objectPosition
        , offset
        , offsetAnchor
        , offsetDistance
        , offsetPath
        , offsetRotate
        , opacity
        , order
        , outline
        , outlineColor
        , outlineOffset
        , outlineWidth
        , padding
        , paddingBottom
        , paddingLeft
        , paddingRight
        , paddingTop
        , right
        , tabSize
        , textIndent
        , textShadow
        , top
        , transform
        , transformOrigin
        , verticalAlign
        , visibility
        , width
        , wordSpacing
        , zIndex
        , transition
        , background2
        , backgroundColor2
        , backgroundPosition2
        , backgroundSize2
        , border2
        , borderBottom2
        , borderBottomColor2
        , borderBottomLeftRadius2
        , borderBottomRightRadius2
        , borderBottomWidth2
        , borderColor2
        , borderLeft2
        , borderLeftColor2
        , borderLeftWidth2
        , borderRadius2
        , borderRight2
        , borderRightColor2
        , borderRightWidth2
        , borderTop2
        , borderTopColor2
        , borderTopLeftRadius2
        , borderTopRightRadius2
        , borderTopWidth2
        , borderWidth2
        , bottom2
        , boxShadow2
        , caretColor2
        , clip2
        , clipPath2
        , color2
        , columnCount2
        , columnGap2
        , columnRule2
        , columnRuleColor2
        , columnRuleWidth2
        , columnWidth2
        , columns2
        , filter2
        , flex2
        , flexBasis2
        , flexGrow2
        , flexShrink2
        , font2
        , fontSize2
        , fontSizeAdjust2
        , fontStretch2
        , fontVariationSettings2
        , fontWeight2
        , gridColumnGap2
        , gridGap2
        , gridRowGap2
        , height2
        , left2
        , letterSpacing2
        , lineHeight2
        , margin2
        , marginBottom2
        , marginLeft2
        , marginRight2
        , marginTop2
        , mask2
        , maskPosition2
        , maskSize2
        , maxHeight2
        , maxWidth2
        , minHeight2
        , minWidth2
        , objectPosition2
        , offset2
        , offsetAnchor2
        , offsetDistance2
        , offsetPath2
        , offsetRotate2
        , opacity2
        , order2
        , outline2
        , outlineColor2
        , outlineOffset2
        , outlineWidth2
        , padding2
        , paddingBottom2
        , paddingLeft2
        , paddingRight2
        , paddingTop2
        , right2
        , tabSize2
        , textIndent2
        , textShadow2
        , top2
        , transform2
        , transformOrigin2
        , verticalAlign2
        , visibility2
        , width2
        , wordSpacing2
        , zIndex2
        , background3
        , backgroundColor3
        , backgroundPosition3
        , backgroundSize3
        , border3
        , borderBottom3
        , borderBottomColor3
        , borderBottomLeftRadius3
        , borderBottomRightRadius3
        , borderBottomWidth3
        , borderColor3
        , borderLeft3
        , borderLeftColor3
        , borderLeftWidth3
        , borderRadius3
        , borderRight3
        , borderRightColor3
        , borderRightWidth3
        , borderTop3
        , borderTopColor3
        , borderTopLeftRadius3
        , borderTopRightRadius3
        , borderTopWidth3
        , borderWidth3
        , bottom3
        , boxShadow3
        , caretColor3
        , clip3
        , clipPath3
        , color3
        , columnCount3
        , columnGap3
        , columnRule3
        , columnRuleColor3
        , columnRuleWidth3
        , columnWidth3
        , columns3
        , filter3
        , flex3
        , flexBasis3
        , flexGrow3
        , flexShrink3
        , font3
        , fontSize3
        , fontSizeAdjust3
        , fontStretch3
        , fontVariationSettings3
        , fontWeight3
        , gridColumnGap3
        , gridGap3
        , gridRowGap3
        , height3
        , left3
        , letterSpacing3
        , lineHeight3
        , margin3
        , marginBottom3
        , marginLeft3
        , marginRight3
        , marginTop3
        , mask3
        , maskPosition3
        , maskSize3
        , maxHeight3
        , maxWidth3
        , minHeight3
        , minWidth3
        , objectPosition3
        , offset3
        , offsetAnchor3
        , offsetDistance3
        , offsetPath3
        , offsetRotate3
        , opacity3
        , order3
        , outline3
        , outlineColor3
        , outlineOffset3
        , outlineWidth3
        , padding3
        , paddingBottom3
        , paddingLeft3
        , paddingRight3
        , paddingTop3
        , right3
        , tabSize3
        , textIndent3
        , textShadow3
        , top3
        , transform3
        , transformOrigin3
        , verticalAlign3
        , visibility3
        , width3
        , wordSpacing3
        , zIndex3
        , ease
        , linear
        , easeIn
        , easeOut
        , easeInOut
        , stepStart
        , stepEnd
        , cubicBezier
        )

import Css
import Time


type TimingFunction
    = Ease
    | Linear
    | EaseIn
    | EaseOut
    | EaseInOut
    | StepStart
    | StepEnd
    | CubicBezier Float Float Float Float


ease : TimingFunction
ease =
    Ease


linear : TimingFunction
linear =
    Linear


easeIn : TimingFunction
easeIn =
    EaseIn


easeOut : TimingFunction
easeOut =
    EaseOut


easeInOut : TimingFunction
easeInOut =
    EaseInOut


stepStart : TimingFunction
stepStart =
    StepStart


stepEnd : TimingFunction
stepEnd =
    StepEnd


cubicBezier : Float -> Float -> Float -> Float -> TimingFunction
cubicBezier f1 f2 f3 f4 =
    CubicBezier f1 f2 f3 f4


type alias Transition =
    ( Animatable, Time.Time, Maybe Time.Time, Maybe TimingFunction )


background3 : Time.Time -> Time.Time -> TimingFunction -> Transition
background3 duration delay timing =
    ( Background, duration, Just delay, Just timing )


backgroundColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
backgroundColor3 duration delay timing =
    ( BackgroundColor, duration, Just delay, Just timing )


backgroundPosition3 : Time.Time -> Time.Time -> TimingFunction -> Transition
backgroundPosition3 duration delay timing =
    ( BackgroundPosition, duration, Just delay, Just timing )


backgroundSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
backgroundSize3 duration delay timing =
    ( BackgroundSize, duration, Just delay, Just timing )


border3 : Time.Time -> Time.Time -> TimingFunction -> Transition
border3 duration delay timing =
    ( Border, duration, Just delay, Just timing )


borderBottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottom3 duration delay timing =
    ( BorderBottom, duration, Just delay, Just timing )


borderBottomColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomColor3 duration delay timing =
    ( BorderBottomColor, duration, Just delay, Just timing )


borderBottomLeftRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomLeftRadius3 duration delay timing =
    ( BorderBottomLeftRadius, duration, Just delay, Just timing )


borderBottomRightRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomRightRadius3 duration delay timing =
    ( BorderBottomRightRadius, duration, Just delay, Just timing )


borderBottomWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomWidth3 duration delay timing =
    ( BorderBottomRightRadius, duration, Just delay, Just timing )


borderColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderColor3 duration delay timing =
    ( BorderColor, duration, Just delay, Just timing )


borderLeft3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderLeft3 duration delay timing =
    ( BorderLeft, duration, Just delay, Just timing )


borderLeftColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderLeftColor3 duration delay timing =
    ( BorderLeftColor, duration, Just delay, Just timing )


borderLeftWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderLeftWidth3 duration delay timing =
    ( BorderLeftWidth, duration, Just delay, Just timing )


borderRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRadius3 duration delay timing =
    ( BorderRadius, duration, Just delay, Just timing )


borderRight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRight3 duration delay timing =
    ( BorderRight, duration, Just delay, Just timing )


borderRightColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRightColor3 duration delay timing =
    ( BorderRightColor, duration, Just delay, Just timing )


borderRightWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRightWidth3 duration delay timing =
    ( BorderRightWidth, duration, Just delay, Just timing )


borderTop3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTop3 duration delay timing =
    ( BorderTop, duration, Just delay, Just timing )


borderTopColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopColor3 duration delay timing =
    ( BorderTopColor, duration, Just delay, Just timing )


borderTopLeftRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopLeftRadius3 duration delay timing =
    ( BorderTopLeftRadius, duration, Just delay, Just timing )


borderTopRightRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopRightRadius3 duration delay timing =
    ( BorderTopRightRadius, duration, Just delay, Just timing )


borderTopWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopWidth3 duration delay timing =
    ( BorderTopWidth, duration, Just delay, Just timing )


borderWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderWidth3 duration delay timing =
    ( BorderWidth, duration, Just delay, Just timing )


bottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
bottom3 duration delay timing =
    ( Bottom, duration, Just delay, Just timing )


boxShadow3 : Time.Time -> Time.Time -> TimingFunction -> Transition
boxShadow3 duration delay timing =
    ( BoxShadow, duration, Just delay, Just timing )


caretColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
caretColor3 duration delay timing =
    ( CaretColor, duration, Just delay, Just timing )


clip3 : Time.Time -> Time.Time -> TimingFunction -> Transition
clip3 duration delay timing =
    ( Clip, duration, Just delay, Just timing )


clipPath3 : Time.Time -> Time.Time -> TimingFunction -> Transition
clipPath3 duration delay timing =
    ( ClipPath, duration, Just delay, Just timing )


color3 : Time.Time -> Time.Time -> TimingFunction -> Transition
color3 duration delay timing =
    ( Color, duration, Just delay, Just timing )


columnCount3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnCount3 duration delay timing =
    ( ColumnCount, duration, Just delay, Just timing )


columnGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnGap3 duration delay timing =
    ( ColumnGap, duration, Just delay, Just timing )


columnRule3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnRule3 duration delay timing =
    ( ColumnRule, duration, Just delay, Just timing )


columnRuleColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnRuleColor3 duration delay timing =
    ( ColumnRuleColor, duration, Just delay, Just timing )


columnRuleWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnRuleWidth3 duration delay timing =
    ( ColumnRuleWidth, duration, Just delay, Just timing )


columnWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnWidth3 duration delay timing =
    ( ColumnWidth, duration, Just delay, Just timing )


columns3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columns3 duration delay timing =
    ( Columns, duration, Just delay, Just timing )


filter3 : Time.Time -> Time.Time -> TimingFunction -> Transition
filter3 duration delay timing =
    ( Filter, duration, Just delay, Just timing )


flex3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flex3 duration delay timing =
    ( Flex, duration, Just delay, Just timing )


flexBasis3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flexBasis3 duration delay timing =
    ( FlexBasis, duration, Just delay, Just timing )


flexGrow3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flexGrow3 duration delay timing =
    ( FlexGrow, duration, Just delay, Just timing )


flexShrink3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flexShrink3 duration delay timing =
    ( FlexShrink, duration, Just delay, Just timing )


font3 : Time.Time -> Time.Time -> TimingFunction -> Transition
font3 duration delay timing =
    ( Font, duration, Just delay, Just timing )


fontSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontSize3 duration delay timing =
    ( FontSize, duration, Just delay, Just timing )


fontSizeAdjust3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontSizeAdjust3 duration delay timing =
    ( FontSizeAdjust, duration, Just delay, Just timing )


fontStretch3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontStretch3 duration delay timing =
    ( FontStretch, duration, Just delay, Just timing )


fontVariationSettings3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontVariationSettings3 duration delay timing =
    ( FontVariationSettings, duration, Just delay, Just timing )


fontWeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontWeight3 duration delay timing =
    ( FontWeight, duration, Just delay, Just timing )


gridColumnGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
gridColumnGap3 duration delay timing =
    ( GridColumnGap, duration, Just delay, Just timing )


gridGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
gridGap3 duration delay timing =
    ( GridGap, duration, Just delay, Just timing )


gridRowGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
gridRowGap3 duration delay timing =
    ( GridRowGap, duration, Just delay, Just timing )


height3 : Time.Time -> Time.Time -> TimingFunction -> Transition
height3 duration delay timing =
    ( Height, duration, Just delay, Just timing )


left3 : Time.Time -> Time.Time -> TimingFunction -> Transition
left3 duration delay timing =
    ( Left, duration, Just delay, Just timing )


letterSpacing3 : Time.Time -> Time.Time -> TimingFunction -> Transition
letterSpacing3 duration delay timing =
    ( LetterSpacing, duration, Just delay, Just timing )


lineHeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
lineHeight3 duration delay timing =
    ( LineHeight, duration, Just delay, Just timing )


margin3 : Time.Time -> Time.Time -> TimingFunction -> Transition
margin3 duration delay timing =
    ( Margin, duration, Just delay, Just timing )


marginBottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginBottom3 duration delay timing =
    ( MarginBottom, duration, Just delay, Just timing )


marginLeft3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginLeft3 duration delay timing =
    ( MarginLeft, duration, Just delay, Just timing )


marginRight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginRight3 duration delay timing =
    ( MarginRight, duration, Just delay, Just timing )


marginTop3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginTop3 duration delay timing =
    ( MarginTop, duration, Just delay, Just timing )


mask3 : Time.Time -> Time.Time -> TimingFunction -> Transition
mask3 duration delay timing =
    ( Mask, duration, Just delay, Just timing )


maskPosition3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maskPosition3 duration delay timing =
    ( MaskPosition, duration, Just delay, Just timing )


maskSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maskSize3 duration delay timing =
    ( MaskSize, duration, Just delay, Just timing )


maxHeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maxHeight3 duration delay timing =
    ( MaxHeight, duration, Just delay, Just timing )


maxWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maxWidth3 duration delay timing =
    ( MaxWidth, duration, Just delay, Just timing )


minHeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
minHeight3 duration delay timing =
    ( MinHeight, duration, Just delay, Just timing )


minWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
minWidth3 duration delay timing =
    ( MinWidth, duration, Just delay, Just timing )


objectPosition3 : Time.Time -> Time.Time -> TimingFunction -> Transition
objectPosition3 duration delay timing =
    ( ObjectPosition, duration, Just delay, Just timing )


offset3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offset3 duration delay timing =
    ( Offset, duration, Just delay, Just timing )


offsetAnchor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetAnchor3 duration delay timing =
    ( OffsetAnchor, duration, Just delay, Just timing )


offsetDistance3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetDistance3 duration delay timing =
    ( OffsetDistance, duration, Just delay, Just timing )


offsetPath3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetPath3 duration delay timing =
    ( OffsetPath, duration, Just delay, Just timing )


offsetRotate3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetRotate3 duration delay timing =
    ( OffsetRotate, duration, Just delay, Just timing )


opacity3 : Time.Time -> Time.Time -> TimingFunction -> Transition
opacity3 duration delay timing =
    ( Opacity, duration, Just delay, Just timing )


order3 : Time.Time -> Time.Time -> TimingFunction -> Transition
order3 duration delay timing =
    ( Order, duration, Just delay, Just timing )


outline3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outline3 duration delay timing =
    ( Outline, duration, Just delay, Just timing )


outlineColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outlineColor3 duration delay timing =
    ( OutlineColor, duration, Just delay, Just timing )


outlineOffset3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outlineOffset3 duration delay timing =
    ( OutlineOffset, duration, Just delay, Just timing )


outlineWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outlineWidth3 duration delay timing =
    ( OutlineWidth, duration, Just delay, Just timing )


padding3 : Time.Time -> Time.Time -> TimingFunction -> Transition
padding3 duration delay timing =
    ( Padding, duration, Just delay, Just timing )


paddingBottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingBottom3 duration delay timing =
    ( PaddingBottom, duration, Just delay, Just timing )


paddingLeft3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingLeft3 duration delay timing =
    ( PaddingLeft, duration, Just delay, Just timing )


paddingRight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingRight3 duration delay timing =
    ( PaddingRight, duration, Just delay, Just timing )


paddingTop3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingTop3 duration delay timing =
    ( PaddingTop, duration, Just delay, Just timing )


right3 : Time.Time -> Time.Time -> TimingFunction -> Transition
right3 duration delay timing =
    ( Right, duration, Just delay, Just timing )


tabSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
tabSize3 duration delay timing =
    ( TabSize, duration, Just delay, Just timing )


textIndent3 : Time.Time -> Time.Time -> TimingFunction -> Transition
textIndent3 duration delay timing =
    ( TextIndent, duration, Just delay, Just timing )


textShadow3 : Time.Time -> Time.Time -> TimingFunction -> Transition
textShadow3 duration delay timing =
    ( TextShadow, duration, Just delay, Just timing )


top3 : Time.Time -> Time.Time -> TimingFunction -> Transition
top3 duration delay timing =
    ( Top, duration, Just delay, Just timing )


transform3 : Time.Time -> Time.Time -> TimingFunction -> Transition
transform3 duration delay timing =
    ( Transform, duration, Just delay, Just timing )


transformOrigin3 : Time.Time -> Time.Time -> TimingFunction -> Transition
transformOrigin3 duration delay timing =
    ( TransformOrigin, duration, Just delay, Just timing )


verticalAlign3 : Time.Time -> Time.Time -> TimingFunction -> Transition
verticalAlign3 duration delay timing =
    ( VerticalAlign, duration, Just delay, Just timing )


visibility3 : Time.Time -> Time.Time -> TimingFunction -> Transition
visibility3 duration delay timing =
    ( Visibility, duration, Just delay, Just timing )


width3 : Time.Time -> Time.Time -> TimingFunction -> Transition
width3 duration delay timing =
    ( Width, duration, Just delay, Just timing )


wordSpacing3 : Time.Time -> Time.Time -> TimingFunction -> Transition
wordSpacing3 duration delay timing =
    ( WordSpacing, duration, Just delay, Just timing )


zIndex3 : Time.Time -> Time.Time -> TimingFunction -> Transition
zIndex3 duration delay timing =
    ( ZIndex, duration, Just delay, Just timing )



--------------------------------------------------------------------------------


background2 : Time.Time -> Time.Time -> Transition
background2 duration delay =
    ( Background, duration, Just delay, Nothing )


backgroundColor2 : Time.Time -> Time.Time -> Transition
backgroundColor2 duration delay =
    ( BackgroundColor, duration, Just delay, Nothing )


backgroundPosition2 : Time.Time -> Time.Time -> Transition
backgroundPosition2 duration delay =
    ( BackgroundPosition, duration, Just delay, Nothing )


backgroundSize2 : Time.Time -> Time.Time -> Transition
backgroundSize2 duration delay =
    ( BackgroundSize, duration, Just delay, Nothing )


border2 : Time.Time -> Time.Time -> Transition
border2 duration delay =
    ( Border, duration, Just delay, Nothing )


borderBottom2 : Time.Time -> Time.Time -> Transition
borderBottom2 duration delay =
    ( BorderBottom, duration, Just delay, Nothing )


borderBottomColor2 : Time.Time -> Time.Time -> Transition
borderBottomColor2 duration delay =
    ( BorderBottomColor, duration, Just delay, Nothing )


borderBottomLeftRadius2 : Time.Time -> Time.Time -> Transition
borderBottomLeftRadius2 duration delay =
    ( BorderBottomLeftRadius, duration, Just delay, Nothing )


borderBottomRightRadius2 : Time.Time -> Time.Time -> Transition
borderBottomRightRadius2 duration delay =
    ( BorderBottomRightRadius, duration, Just delay, Nothing )


borderBottomWidth2 : Time.Time -> Time.Time -> Transition
borderBottomWidth2 duration delay =
    ( BorderBottomRightRadius, duration, Just delay, Nothing )


borderColor2 : Time.Time -> Time.Time -> Transition
borderColor2 duration delay =
    ( BorderColor, duration, Just delay, Nothing )


borderLeft2 : Time.Time -> Time.Time -> Transition
borderLeft2 duration delay =
    ( BorderLeft, duration, Just delay, Nothing )


borderLeftColor2 : Time.Time -> Time.Time -> Transition
borderLeftColor2 duration delay =
    ( BorderLeftColor, duration, Just delay, Nothing )


borderLeftWidth2 : Time.Time -> Time.Time -> Transition
borderLeftWidth2 duration delay =
    ( BorderLeftWidth, duration, Just delay, Nothing )


borderRadius2 : Time.Time -> Time.Time -> Transition
borderRadius2 duration delay =
    ( BorderRadius, duration, Just delay, Nothing )


borderRight2 : Time.Time -> Time.Time -> Transition
borderRight2 duration delay =
    ( BorderRight, duration, Just delay, Nothing )


borderRightColor2 : Time.Time -> Time.Time -> Transition
borderRightColor2 duration delay =
    ( BorderRightColor, duration, Just delay, Nothing )


borderRightWidth2 : Time.Time -> Time.Time -> Transition
borderRightWidth2 duration delay =
    ( BorderRightWidth, duration, Just delay, Nothing )


borderTop2 : Time.Time -> Time.Time -> Transition
borderTop2 duration delay =
    ( BorderTop, duration, Just delay, Nothing )


borderTopColor2 : Time.Time -> Time.Time -> Transition
borderTopColor2 duration delay =
    ( BorderTopColor, duration, Just delay, Nothing )


borderTopLeftRadius2 : Time.Time -> Time.Time -> Transition
borderTopLeftRadius2 duration delay =
    ( BorderTopLeftRadius, duration, Just delay, Nothing )


borderTopRightRadius2 : Time.Time -> Time.Time -> Transition
borderTopRightRadius2 duration delay =
    ( BorderTopRightRadius, duration, Just delay, Nothing )


borderTopWidth2 : Time.Time -> Time.Time -> Transition
borderTopWidth2 duration delay =
    ( BorderTopWidth, duration, Just delay, Nothing )


borderWidth2 : Time.Time -> Time.Time -> Transition
borderWidth2 duration delay =
    ( BorderWidth, duration, Just delay, Nothing )


bottom2 : Time.Time -> Time.Time -> Transition
bottom2 duration delay =
    ( Bottom, duration, Just delay, Nothing )


boxShadow2 : Time.Time -> Time.Time -> Transition
boxShadow2 duration delay =
    ( BoxShadow, duration, Just delay, Nothing )


caretColor2 : Time.Time -> Time.Time -> Transition
caretColor2 duration delay =
    ( CaretColor, duration, Just delay, Nothing )


clip2 : Time.Time -> Time.Time -> Transition
clip2 duration delay =
    ( Clip, duration, Just delay, Nothing )


clipPath2 : Time.Time -> Time.Time -> Transition
clipPath2 duration delay =
    ( ClipPath, duration, Just delay, Nothing )


color2 : Time.Time -> Time.Time -> Transition
color2 duration delay =
    ( Color, duration, Just delay, Nothing )


columnCount2 : Time.Time -> Time.Time -> Transition
columnCount2 duration delay =
    ( ColumnCount, duration, Just delay, Nothing )


columnGap2 : Time.Time -> Time.Time -> Transition
columnGap2 duration delay =
    ( ColumnGap, duration, Just delay, Nothing )


columnRule2 : Time.Time -> Time.Time -> Transition
columnRule2 duration delay =
    ( ColumnRule, duration, Just delay, Nothing )


columnRuleColor2 : Time.Time -> Time.Time -> Transition
columnRuleColor2 duration delay =
    ( ColumnRuleColor, duration, Just delay, Nothing )


columnRuleWidth2 : Time.Time -> Time.Time -> Transition
columnRuleWidth2 duration delay =
    ( ColumnRuleWidth, duration, Just delay, Nothing )


columnWidth2 : Time.Time -> Time.Time -> Transition
columnWidth2 duration delay =
    ( ColumnWidth, duration, Just delay, Nothing )


columns2 : Time.Time -> Time.Time -> Transition
columns2 duration delay =
    ( Columns, duration, Just delay, Nothing )


filter2 : Time.Time -> Time.Time -> Transition
filter2 duration delay =
    ( Filter, duration, Just delay, Nothing )


flex2 : Time.Time -> Time.Time -> Transition
flex2 duration delay =
    ( Flex, duration, Just delay, Nothing )


flexBasis2 : Time.Time -> Time.Time -> Transition
flexBasis2 duration delay =
    ( FlexBasis, duration, Just delay, Nothing )


flexGrow2 : Time.Time -> Time.Time -> Transition
flexGrow2 duration delay =
    ( FlexGrow, duration, Just delay, Nothing )


flexShrink2 : Time.Time -> Time.Time -> Transition
flexShrink2 duration delay =
    ( FlexShrink, duration, Just delay, Nothing )


font2 : Time.Time -> Time.Time -> Transition
font2 duration delay =
    ( Font, duration, Just delay, Nothing )


fontSize2 : Time.Time -> Time.Time -> Transition
fontSize2 duration delay =
    ( FontSize, duration, Just delay, Nothing )


fontSizeAdjust2 : Time.Time -> Time.Time -> Transition
fontSizeAdjust2 duration delay =
    ( FontSizeAdjust, duration, Just delay, Nothing )


fontStretch2 : Time.Time -> Time.Time -> Transition
fontStretch2 duration delay =
    ( FontStretch, duration, Just delay, Nothing )


fontVariationSettings2 : Time.Time -> Time.Time -> Transition
fontVariationSettings2 duration delay =
    ( FontVariationSettings, duration, Just delay, Nothing )


fontWeight2 : Time.Time -> Time.Time -> Transition
fontWeight2 duration delay =
    ( FontWeight, duration, Just delay, Nothing )


gridColumnGap2 : Time.Time -> Time.Time -> Transition
gridColumnGap2 duration delay =
    ( GridColumnGap, duration, Just delay, Nothing )


gridGap2 : Time.Time -> Time.Time -> Transition
gridGap2 duration delay =
    ( GridGap, duration, Just delay, Nothing )


gridRowGap2 : Time.Time -> Time.Time -> Transition
gridRowGap2 duration delay =
    ( GridRowGap, duration, Just delay, Nothing )


height2 : Time.Time -> Time.Time -> Transition
height2 duration delay =
    ( Height, duration, Just delay, Nothing )


left2 : Time.Time -> Time.Time -> Transition
left2 duration delay =
    ( Left, duration, Just delay, Nothing )


letterSpacing2 : Time.Time -> Time.Time -> Transition
letterSpacing2 duration delay =
    ( LetterSpacing, duration, Just delay, Nothing )


lineHeight2 : Time.Time -> Time.Time -> Transition
lineHeight2 duration delay =
    ( LineHeight, duration, Just delay, Nothing )


margin2 : Time.Time -> Time.Time -> Transition
margin2 duration delay =
    ( Margin, duration, Just delay, Nothing )


marginBottom2 : Time.Time -> Time.Time -> Transition
marginBottom2 duration delay =
    ( MarginBottom, duration, Just delay, Nothing )


marginLeft2 : Time.Time -> Time.Time -> Transition
marginLeft2 duration delay =
    ( MarginLeft, duration, Just delay, Nothing )


marginRight2 : Time.Time -> Time.Time -> Transition
marginRight2 duration delay =
    ( MarginRight, duration, Just delay, Nothing )


marginTop2 : Time.Time -> Time.Time -> Transition
marginTop2 duration delay =
    ( MarginTop, duration, Just delay, Nothing )


mask2 : Time.Time -> Time.Time -> Transition
mask2 duration delay =
    ( Mask, duration, Just delay, Nothing )


maskPosition2 : Time.Time -> Time.Time -> Transition
maskPosition2 duration delay =
    ( MaskPosition, duration, Just delay, Nothing )


maskSize2 : Time.Time -> Time.Time -> Transition
maskSize2 duration delay =
    ( MaskSize, duration, Just delay, Nothing )


maxHeight2 : Time.Time -> Time.Time -> Transition
maxHeight2 duration delay =
    ( MaxHeight, duration, Just delay, Nothing )


maxWidth2 : Time.Time -> Time.Time -> Transition
maxWidth2 duration delay =
    ( MaxWidth, duration, Just delay, Nothing )


minHeight2 : Time.Time -> Time.Time -> Transition
minHeight2 duration delay =
    ( MinHeight, duration, Just delay, Nothing )


minWidth2 : Time.Time -> Time.Time -> Transition
minWidth2 duration delay =
    ( MinWidth, duration, Just delay, Nothing )


objectPosition2 : Time.Time -> Time.Time -> Transition
objectPosition2 duration delay =
    ( ObjectPosition, duration, Just delay, Nothing )


offset2 : Time.Time -> Time.Time -> Transition
offset2 duration delay =
    ( Offset, duration, Just delay, Nothing )


offsetAnchor2 : Time.Time -> Time.Time -> Transition
offsetAnchor2 duration delay =
    ( OffsetAnchor, duration, Just delay, Nothing )


offsetDistance2 : Time.Time -> Time.Time -> Transition
offsetDistance2 duration delay =
    ( OffsetDistance, duration, Just delay, Nothing )


offsetPath2 : Time.Time -> Time.Time -> Transition
offsetPath2 duration delay =
    ( OffsetPath, duration, Just delay, Nothing )


offsetRotate2 : Time.Time -> Time.Time -> Transition
offsetRotate2 duration delay =
    ( OffsetRotate, duration, Just delay, Nothing )


opacity2 : Time.Time -> Time.Time -> Transition
opacity2 duration delay =
    ( Opacity, duration, Just delay, Nothing )


order2 : Time.Time -> Time.Time -> Transition
order2 duration delay =
    ( Order, duration, Just delay, Nothing )


outline2 : Time.Time -> Time.Time -> Transition
outline2 duration delay =
    ( Outline, duration, Just delay, Nothing )


outlineColor2 : Time.Time -> Time.Time -> Transition
outlineColor2 duration delay =
    ( OutlineColor, duration, Just delay, Nothing )


outlineOffset2 : Time.Time -> Time.Time -> Transition
outlineOffset2 duration delay =
    ( OutlineOffset, duration, Just delay, Nothing )


outlineWidth2 : Time.Time -> Time.Time -> Transition
outlineWidth2 duration delay =
    ( OutlineWidth, duration, Just delay, Nothing )


padding2 : Time.Time -> Time.Time -> Transition
padding2 duration delay =
    ( Padding, duration, Just delay, Nothing )


paddingBottom2 : Time.Time -> Time.Time -> Transition
paddingBottom2 duration delay =
    ( PaddingBottom, duration, Just delay, Nothing )


paddingLeft2 : Time.Time -> Time.Time -> Transition
paddingLeft2 duration delay =
    ( PaddingLeft, duration, Just delay, Nothing )


paddingRight2 : Time.Time -> Time.Time -> Transition
paddingRight2 duration delay =
    ( PaddingRight, duration, Just delay, Nothing )


paddingTop2 : Time.Time -> Time.Time -> Transition
paddingTop2 duration delay =
    ( PaddingTop, duration, Just delay, Nothing )


right2 : Time.Time -> Time.Time -> Transition
right2 duration delay =
    ( Right, duration, Just delay, Nothing )


tabSize2 : Time.Time -> Time.Time -> Transition
tabSize2 duration delay =
    ( TabSize, duration, Just delay, Nothing )


textIndent2 : Time.Time -> Time.Time -> Transition
textIndent2 duration delay =
    ( TextIndent, duration, Just delay, Nothing )


textShadow2 : Time.Time -> Time.Time -> Transition
textShadow2 duration delay =
    ( TextShadow, duration, Just delay, Nothing )


top2 : Time.Time -> Time.Time -> Transition
top2 duration delay =
    ( Top, duration, Just delay, Nothing )


transform2 : Time.Time -> Time.Time -> Transition
transform2 duration delay =
    ( Transform, duration, Just delay, Nothing )


transformOrigin2 : Time.Time -> Time.Time -> Transition
transformOrigin2 duration delay =
    ( TransformOrigin, duration, Just delay, Nothing )


verticalAlign2 : Time.Time -> Time.Time -> Transition
verticalAlign2 duration delay =
    ( VerticalAlign, duration, Just delay, Nothing )


visibility2 : Time.Time -> Time.Time -> Transition
visibility2 duration delay =
    ( Visibility, duration, Just delay, Nothing )


width2 : Time.Time -> Time.Time -> Transition
width2 duration delay =
    ( Width, duration, Just delay, Nothing )


wordSpacing2 : Time.Time -> Time.Time -> Transition
wordSpacing2 duration delay =
    ( WordSpacing, duration, Just delay, Nothing )


zIndex2 : Time.Time -> Time.Time -> Transition
zIndex2 duration delay =
    ( ZIndex, duration, Just delay, Nothing )



--------------------------------------------------------------------------------


background : Time.Time -> Transition
background time =
    ( Background, time, Nothing, Nothing )


backgroundColor : Time.Time -> Transition
backgroundColor time =
    ( BackgroundColor, time, Nothing, Nothing )


backgroundPosition : Time.Time -> Transition
backgroundPosition time =
    ( BackgroundPosition, time, Nothing, Nothing )


backgroundSize : Time.Time -> Transition
backgroundSize time =
    ( BackgroundSize, time, Nothing, Nothing )


border : Time.Time -> Transition
border time =
    ( Border, time, Nothing, Nothing )


borderBottom : Time.Time -> Transition
borderBottom time =
    ( BorderBottom, time, Nothing, Nothing )


borderBottomColor : Time.Time -> Transition
borderBottomColor time =
    ( BorderBottomColor, time, Nothing, Nothing )


borderBottomLeftRadius : Time.Time -> Transition
borderBottomLeftRadius time =
    ( BorderBottomLeftRadius, time, Nothing, Nothing )


borderBottomRightRadius : Time.Time -> Transition
borderBottomRightRadius time =
    ( BorderBottomRightRadius, time, Nothing, Nothing )


borderBottomWidth : Time.Time -> Transition
borderBottomWidth time =
    ( BorderBottomRightRadius, time, Nothing, Nothing )


borderColor : Time.Time -> Transition
borderColor time =
    ( BorderColor, time, Nothing, Nothing )


borderLeft : Time.Time -> Transition
borderLeft time =
    ( BorderLeft, time, Nothing, Nothing )


borderLeftColor : Time.Time -> Transition
borderLeftColor time =
    ( BorderLeftColor, time, Nothing, Nothing )


borderLeftWidth : Time.Time -> Transition
borderLeftWidth time =
    ( BorderLeftWidth, time, Nothing, Nothing )


borderRadius : Time.Time -> Transition
borderRadius time =
    ( BorderRadius, time, Nothing, Nothing )


borderRight : Time.Time -> Transition
borderRight time =
    ( BorderRight, time, Nothing, Nothing )


borderRightColor : Time.Time -> Transition
borderRightColor time =
    ( BorderRightColor, time, Nothing, Nothing )


borderRightWidth : Time.Time -> Transition
borderRightWidth time =
    ( BorderRightWidth, time, Nothing, Nothing )


borderTop : Time.Time -> Transition
borderTop time =
    ( BorderTop, time, Nothing, Nothing )


borderTopColor : Time.Time -> Transition
borderTopColor time =
    ( BorderTopColor, time, Nothing, Nothing )


borderTopLeftRadius : Time.Time -> Transition
borderTopLeftRadius time =
    ( BorderTopLeftRadius, time, Nothing, Nothing )


borderTopRightRadius : Time.Time -> Transition
borderTopRightRadius time =
    ( BorderTopRightRadius, time, Nothing, Nothing )


borderTopWidth : Time.Time -> Transition
borderTopWidth time =
    ( BorderTopWidth, time, Nothing, Nothing )


borderWidth : Time.Time -> Transition
borderWidth time =
    ( BorderWidth, time, Nothing, Nothing )


bottom : Time.Time -> Transition
bottom time =
    ( Bottom, time, Nothing, Nothing )


boxShadow : Time.Time -> Transition
boxShadow time =
    ( BoxShadow, time, Nothing, Nothing )


caretColor : Time.Time -> Transition
caretColor time =
    ( CaretColor, time, Nothing, Nothing )


clip : Time.Time -> Transition
clip time =
    ( Clip, time, Nothing, Nothing )


clipPath : Time.Time -> Transition
clipPath time =
    ( ClipPath, time, Nothing, Nothing )


color : Time.Time -> Transition
color time =
    ( Color, time, Nothing, Nothing )


columnCount : Time.Time -> Transition
columnCount time =
    ( ColumnCount, time, Nothing, Nothing )


columnGap : Time.Time -> Transition
columnGap time =
    ( ColumnGap, time, Nothing, Nothing )


columnRule : Time.Time -> Transition
columnRule time =
    ( ColumnRule, time, Nothing, Nothing )


columnRuleColor : Time.Time -> Transition
columnRuleColor time =
    ( ColumnRuleColor, time, Nothing, Nothing )


columnRuleWidth : Time.Time -> Transition
columnRuleWidth time =
    ( ColumnRuleWidth, time, Nothing, Nothing )


columnWidth : Time.Time -> Transition
columnWidth time =
    ( ColumnWidth, time, Nothing, Nothing )


columns : Time.Time -> Transition
columns time =
    ( Columns, time, Nothing, Nothing )


filter : Time.Time -> Transition
filter time =
    ( Filter, time, Nothing, Nothing )


flex : Time.Time -> Transition
flex time =
    ( Flex, time, Nothing, Nothing )


flexBasis : Time.Time -> Transition
flexBasis time =
    ( FlexBasis, time, Nothing, Nothing )


flexGrow : Time.Time -> Transition
flexGrow time =
    ( FlexGrow, time, Nothing, Nothing )


flexShrink : Time.Time -> Transition
flexShrink time =
    ( FlexShrink, time, Nothing, Nothing )


font : Time.Time -> Transition
font time =
    ( Font, time, Nothing, Nothing )


fontSize : Time.Time -> Transition
fontSize time =
    ( FontSize, time, Nothing, Nothing )


fontSizeAdjust : Time.Time -> Transition
fontSizeAdjust time =
    ( FontSizeAdjust, time, Nothing, Nothing )


fontStretch : Time.Time -> Transition
fontStretch time =
    ( FontStretch, time, Nothing, Nothing )


fontVariationSettings : Time.Time -> Transition
fontVariationSettings time =
    ( FontVariationSettings, time, Nothing, Nothing )


fontWeight : Time.Time -> Transition
fontWeight time =
    ( FontWeight, time, Nothing, Nothing )


gridColumnGap : Time.Time -> Transition
gridColumnGap time =
    ( GridColumnGap, time, Nothing, Nothing )


gridGap : Time.Time -> Transition
gridGap time =
    ( GridGap, time, Nothing, Nothing )


gridRowGap : Time.Time -> Transition
gridRowGap time =
    ( GridRowGap, time, Nothing, Nothing )


height : Time.Time -> Transition
height time =
    ( Height, time, Nothing, Nothing )


left : Time.Time -> Transition
left time =
    ( Left, time, Nothing, Nothing )


letterSpacing : Time.Time -> Transition
letterSpacing time =
    ( LetterSpacing, time, Nothing, Nothing )


lineHeight : Time.Time -> Transition
lineHeight time =
    ( LineHeight, time, Nothing, Nothing )


margin : Time.Time -> Transition
margin time =
    ( Margin, time, Nothing, Nothing )


marginBottom : Time.Time -> Transition
marginBottom time =
    ( MarginBottom, time, Nothing, Nothing )


marginLeft : Time.Time -> Transition
marginLeft time =
    ( MarginLeft, time, Nothing, Nothing )


marginRight : Time.Time -> Transition
marginRight time =
    ( MarginRight, time, Nothing, Nothing )


marginTop : Time.Time -> Transition
marginTop time =
    ( MarginTop, time, Nothing, Nothing )


mask : Time.Time -> Transition
mask time =
    ( Mask, time, Nothing, Nothing )


maskPosition : Time.Time -> Transition
maskPosition time =
    ( MaskPosition, time, Nothing, Nothing )


maskSize : Time.Time -> Transition
maskSize time =
    ( MaskSize, time, Nothing, Nothing )


maxHeight : Time.Time -> Transition
maxHeight time =
    ( MaxHeight, time, Nothing, Nothing )


maxWidth : Time.Time -> Transition
maxWidth time =
    ( MaxWidth, time, Nothing, Nothing )


minHeight : Time.Time -> Transition
minHeight time =
    ( MinHeight, time, Nothing, Nothing )


minWidth : Time.Time -> Transition
minWidth time =
    ( MinWidth, time, Nothing, Nothing )


objectPosition : Time.Time -> Transition
objectPosition time =
    ( ObjectPosition, time, Nothing, Nothing )


offset : Time.Time -> Transition
offset time =
    ( Offset, time, Nothing, Nothing )


offsetAnchor : Time.Time -> Transition
offsetAnchor time =
    ( OffsetAnchor, time, Nothing, Nothing )


offsetDistance : Time.Time -> Transition
offsetDistance time =
    ( OffsetDistance, time, Nothing, Nothing )


offsetPath : Time.Time -> Transition
offsetPath time =
    ( OffsetPath, time, Nothing, Nothing )


offsetRotate : Time.Time -> Transition
offsetRotate time =
    ( OffsetRotate, time, Nothing, Nothing )


opacity : Time.Time -> Transition
opacity time =
    ( Opacity, time, Nothing, Nothing )


order : Time.Time -> Transition
order time =
    ( Order, time, Nothing, Nothing )


outline : Time.Time -> Transition
outline time =
    ( Outline, time, Nothing, Nothing )


outlineColor : Time.Time -> Transition
outlineColor time =
    ( OutlineColor, time, Nothing, Nothing )


outlineOffset : Time.Time -> Transition
outlineOffset time =
    ( OutlineOffset, time, Nothing, Nothing )


outlineWidth : Time.Time -> Transition
outlineWidth time =
    ( OutlineWidth, time, Nothing, Nothing )


padding : Time.Time -> Transition
padding time =
    ( Padding, time, Nothing, Nothing )


paddingBottom : Time.Time -> Transition
paddingBottom time =
    ( PaddingBottom, time, Nothing, Nothing )


paddingLeft : Time.Time -> Transition
paddingLeft time =
    ( PaddingLeft, time, Nothing, Nothing )


paddingRight : Time.Time -> Transition
paddingRight time =
    ( PaddingRight, time, Nothing, Nothing )


paddingTop : Time.Time -> Transition
paddingTop time =
    ( PaddingTop, time, Nothing, Nothing )


right : Time.Time -> Transition
right time =
    ( Right, time, Nothing, Nothing )


tabSize : Time.Time -> Transition
tabSize time =
    ( TabSize, time, Nothing, Nothing )


textIndent : Time.Time -> Transition
textIndent time =
    ( TextIndent, time, Nothing, Nothing )


textShadow : Time.Time -> Transition
textShadow time =
    ( TextShadow, time, Nothing, Nothing )


top : Time.Time -> Transition
top time =
    ( Top, time, Nothing, Nothing )


transform : Time.Time -> Transition
transform time =
    ( Transform, time, Nothing, Nothing )


transformOrigin : Time.Time -> Transition
transformOrigin time =
    ( TransformOrigin, time, Nothing, Nothing )


verticalAlign : Time.Time -> Transition
verticalAlign time =
    ( VerticalAlign, time, Nothing, Nothing )


visibility : Time.Time -> Transition
visibility time =
    ( Visibility, time, Nothing, Nothing )


width : Time.Time -> Transition
width time =
    ( Width, time, Nothing, Nothing )


wordSpacing : Time.Time -> Transition
wordSpacing time =
    ( WordSpacing, time, Nothing, Nothing )


zIndex : Time.Time -> Transition
zIndex time =
    ( ZIndex, time, Nothing, Nothing )


type Animatable
    = Background
    | BackgroundColor
    | BackgroundPosition
    | BackgroundSize
    | Border
    | BorderBottom
    | BorderBottomColor
    | BorderBottomLeftRadius
    | BorderBottomRightRadius
    | BorderBottomWidth
    | BorderColor
    | BorderLeft
    | BorderLeftColor
    | BorderLeftWidth
    | BorderRadius
    | BorderRight
    | BorderRightColor
    | BorderRightWidth
    | BorderTop
    | BorderTopColor
    | BorderTopLeftRadius
    | BorderTopRightRadius
    | BorderTopWidth
    | BorderWidth
    | Bottom
    | BoxShadow
    | CaretColor
    | Clip
    | ClipPath
    | Color
    | ColumnCount
    | ColumnGap
    | ColumnRule
    | ColumnRuleColor
    | ColumnRuleWidth
    | ColumnWidth
    | Columns
    | Filter
    | Flex
    | FlexBasis
    | FlexGrow
    | FlexShrink
    | Font
    | FontSize
    | FontSizeAdjust
    | FontStretch
    | FontVariationSettings
    | FontWeight
    | GridColumnGap
    | GridGap
    | GridRowGap
    | Height
    | Left
    | LetterSpacing
    | LineHeight
    | Margin
    | MarginBottom
    | MarginLeft
    | MarginRight
    | MarginTop
    | Mask
    | MaskPosition
    | MaskSize
    | MaxHeight
    | MaxWidth
    | MinHeight
    | MinWidth
    | ObjectPosition
    | Offset
    | OffsetAnchor
    | OffsetDistance
    | OffsetPath
    | OffsetRotate
    | Opacity
    | Order
    | Outline
    | OutlineColor
    | OutlineOffset
    | OutlineWidth
    | Padding
    | PaddingBottom
    | PaddingLeft
    | PaddingRight
    | PaddingTop
    | Right
    | TabSize
    | TextIndent
    | TextShadow
    | Top
    | Transform
    | TransformOrigin
    | VerticalAlign
    | Visibility
    | Width
    | WordSpacing
    | ZIndex


propToString : Animatable -> String
propToString prop =
    case prop of
        Background ->
            "background"

        BackgroundColor ->
            "background-color"

        BackgroundPosition ->
            "background-position"

        BackgroundSize ->
            "background-size"

        Border ->
            "border"

        BorderBottom ->
            "border-bottom"

        BorderBottomColor ->
            "border-bottom-color"

        BorderBottomLeftRadius ->
            "border-bottom-left-radius"

        BorderBottomRightRadius ->
            "border-bottom-right-radius"

        BorderBottomWidth ->
            "border-bottom-width"

        BorderColor ->
            "border-color"

        BorderLeft ->
            "border-left"

        BorderLeftColor ->
            "border-left-color"

        BorderLeftWidth ->
            "border-left-width"

        BorderRadius ->
            "border-radius"

        BorderRight ->
            "border-right"

        BorderRightColor ->
            "border-right-color"

        BorderRightWidth ->
            "border-right-width"

        BorderTop ->
            "border-top"

        BorderTopColor ->
            "border-top-color"

        BorderTopLeftRadius ->
            "border-left-radius"

        BorderTopRightRadius ->
            "border-top-right-radius"

        BorderTopWidth ->
            "border-top-width"

        BorderWidth ->
            "border-width"

        Bottom ->
            "bottom"

        BoxShadow ->
            "box-shadow"

        CaretColor ->
            "caret-color"

        Clip ->
            "clip"

        ClipPath ->
            "clip-path"

        Color ->
            "color"

        ColumnCount ->
            "column-count"

        ColumnGap ->
            "column-gap"

        ColumnRule ->
            "column-rule"

        ColumnRuleColor ->
            "column-rule-color"

        ColumnRuleWidth ->
            "column-rule-width"

        ColumnWidth ->
            "column-width"

        Columns ->
            "columns"

        Filter ->
            "filter"

        Flex ->
            "flex"

        FlexBasis ->
            "flex-basis"

        FlexGrow ->
            "flex-grow"

        FlexShrink ->
            "flex-shrink"

        Font ->
            "font"

        FontSize ->
            "font-size"

        FontSizeAdjust ->
            "font-size-adjust"

        FontStretch ->
            "font-stretch"

        FontVariationSettings ->
            "font-variation-settings"

        FontWeight ->
            "font-weight"

        GridColumnGap ->
            "grid-column-gap"

        GridGap ->
            "grid-gap"

        GridRowGap ->
            "grid-row-gap"

        Height ->
            "height"

        Left ->
            "left"

        LetterSpacing ->
            "letter-spacing"

        LineHeight ->
            "line-height"

        Margin ->
            "margin"

        MarginBottom ->
            "margin-bottom"

        MarginLeft ->
            "margin-left"

        MarginRight ->
            "margin-right"

        MarginTop ->
            "margin-top"

        Mask ->
            "mask"

        MaskPosition ->
            "mask-position"

        MaskSize ->
            "mask-size"

        MaxHeight ->
            "max-height"

        MaxWidth ->
            "max-width"

        MinHeight ->
            "min-height"

        MinWidth ->
            "min-width"

        ObjectPosition ->
            "object-position"

        Offset ->
            "offset"

        OffsetAnchor ->
            "offset-anchor"

        OffsetDistance ->
            "offset-distance"

        OffsetPath ->
            "offset-path"

        OffsetRotate ->
            "offset-rotate"

        Opacity ->
            "opacity"

        Order ->
            "order"

        Outline ->
            "outline"

        OutlineColor ->
            "outline-color"

        OutlineOffset ->
            "outline-offset"

        OutlineWidth ->
            "outline-width"

        Padding ->
            "padding"

        PaddingBottom ->
            "padding-bottom"

        PaddingLeft ->
            "padding-left"

        PaddingRight ->
            "padding-right"

        PaddingTop ->
            "padding-top"

        Right ->
            "right"

        TabSize ->
            "tab-size"

        TextIndent ->
            "text-indent"

        TextShadow ->
            "text-shadow"

        Top ->
            "top"

        Transform ->
            "transform"

        TransformOrigin ->
            "transform-origin"

        VerticalAlign ->
            "vertical-align"

        Visibility ->
            "visibility"

        Width ->
            "width"

        WordSpacing ->
            "word-spacing"

        ZIndex ->
            "z-index"


timeToString : Time.Time -> String
timeToString time =
    (toString time) ++ "ms"


timingFunctionToString : TimingFunction -> String
timingFunctionToString tf =
    case tf of
        Ease ->
            "ease"

        Linear ->
            "linear"

        EaseIn ->
            "ease-in"

        EaseOut ->
            "ease-out"

        EaseInOut ->
            "ease-in-out"

        StepStart ->
            "step-start"

        StepEnd ->
            "step-end"

        CubicBezier float float2 float3 float4 ->
            "cubic-bezier("
                ++ toString float
                ++ " , "
                ++ toString float2
                ++ " , "
                ++ toString float3
                ++ " , "
                ++ toString float4
                ++ ")"


transition : List Transition -> Css.Style
transition options =
    let
        v =
            List.foldl
                (\( p, duration, delay, timing ) s ->
                    s
                        ++ String.join " "
                            [ propToString p
                            , timeToString duration
                            , Maybe.map timeToString delay
                                |> Maybe.withDefault ""
                            , Maybe.map timingFunctionToString timing
                                |> Maybe.withDefault ""
                            ]
                        ++ ","
                )
                ""
                options
                |> String.slice 0 -1
    in
        Css.property "transition" v
