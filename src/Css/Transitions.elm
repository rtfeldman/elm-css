module Css.Transitions
    exposing
        ( Transition
        , background
        , background2
        , background3
        , backgroundColor
        , backgroundColor2
        , backgroundColor3
        , backgroundPosition
        , backgroundPosition2
        , backgroundPosition3
        , backgroundSize
        , backgroundSize2
        , backgroundSize3
        , border
        , border2
        , border3
        , borderBottom
        , borderBottom2
        , borderBottom3
        , borderBottomColor
        , borderBottomColor2
        , borderBottomColor3
        , borderBottomLeftRadius
        , borderBottomLeftRadius2
        , borderBottomLeftRadius3
        , borderBottomRightRadius
        , borderBottomRightRadius2
        , borderBottomRightRadius3
        , borderBottomWidth
        , borderBottomWidth2
        , borderBottomWidth3
        , borderColor
        , borderColor2
        , borderColor3
        , borderLeft
        , borderLeft2
        , borderLeft3
        , borderLeftColor
        , borderLeftColor2
        , borderLeftColor3
        , borderLeftWidth
        , borderLeftWidth2
        , borderLeftWidth3
        , borderRadius
        , borderRadius2
        , borderRadius3
        , borderRight
        , borderRight2
        , borderRight3
        , borderRightColor
        , borderRightColor2
        , borderRightColor3
        , borderRightWidth
        , borderRightWidth2
        , borderRightWidth3
        , borderTop
        , borderTop2
        , borderTop3
        , borderTopColor
        , borderTopColor2
        , borderTopColor3
        , borderTopLeftRadius
        , borderTopLeftRadius2
        , borderTopLeftRadius3
        , borderTopRightRadius
        , borderTopRightRadius2
        , borderTopRightRadius3
        , borderTopWidth
        , borderTopWidth2
        , borderTopWidth3
        , borderWidth
        , borderWidth2
        , borderWidth3
        , bottom
        , bottom2
        , bottom3
        , boxShadow
        , boxShadow2
        , boxShadow3
        , caretColor
        , caretColor2
        , caretColor3
        , clip
        , clip2
        , clip3
        , clipPath
        , clipPath2
        , clipPath3
        , color
        , color2
        , color3
        , columnCount
        , columnCount2
        , columnCount3
        , columnGap
        , columnGap2
        , columnGap3
        , columnRule
        , columnRule2
        , columnRule3
        , columnRuleColor
        , columnRuleColor2
        , columnRuleColor3
        , columnRuleWidth
        , columnRuleWidth2
        , columnRuleWidth3
        , columnWidth
        , columnWidth2
        , columnWidth3
        , columns
        , columns2
        , columns3
        , cubicBezier
        , ease
        , easeIn
        , easeInOut
        , easeOut
        , filter
        , filter2
        , filter3
        , flex
        , flex2
        , flex3
        , flexBasis
        , flexBasis2
        , flexBasis3
        , flexGrow
        , flexGrow2
        , flexGrow3
        , flexShrink
        , flexShrink2
        , flexShrink3
        , font
        , font2
        , font3
        , fontSize
        , fontSize2
        , fontSize3
        , fontSizeAdjust
        , fontSizeAdjust2
        , fontSizeAdjust3
        , fontStretch
        , fontStretch2
        , fontStretch3
        , fontVariationSettings
        , fontVariationSettings2
        , fontVariationSettings3
        , fontWeight
        , fontWeight2
        , fontWeight3
        , gridColumnGap
        , gridColumnGap2
        , gridColumnGap3
        , gridGap
        , gridGap2
        , gridGap3
        , gridRowGap
        , gridRowGap2
        , gridRowGap3
        , height
        , height2
        , height3
        , left
        , left2
        , left3
        , letterSpacing
        , letterSpacing2
        , letterSpacing3
        , lineHeight
        , lineHeight2
        , lineHeight3
        , linear
        , margin
        , margin2
        , margin3
        , marginBottom
        , marginBottom2
        , marginBottom3
        , marginLeft
        , marginLeft2
        , marginLeft3
        , marginRight
        , marginRight2
        , marginRight3
        , marginTop
        , marginTop2
        , marginTop3
        , mask
        , mask2
        , mask3
        , maskPosition
        , maskPosition2
        , maskPosition3
        , maskSize
        , maskSize2
        , maskSize3
        , maxHeight
        , maxHeight2
        , maxHeight3
        , maxWidth
        , maxWidth2
        , maxWidth3
        , minHeight
        , minHeight2
        , minHeight3
        , minWidth
        , minWidth2
        , minWidth3
        , objectPosition
        , objectPosition2
        , objectPosition3
        , offset
        , offset2
        , offset3
        , offsetAnchor
        , offsetAnchor2
        , offsetAnchor3
        , offsetDistance
        , offsetDistance2
        , offsetDistance3
        , offsetPath
        , offsetPath2
        , offsetPath3
        , offsetRotate
        , offsetRotate2
        , offsetRotate3
        , opacity
        , opacity2
        , opacity3
        , order
        , order2
        , order3
        , outline
        , outline2
        , outline3
        , outlineColor
        , outlineColor2
        , outlineColor3
        , outlineOffset
        , outlineOffset2
        , outlineOffset3
        , outlineWidth
        , outlineWidth2
        , outlineWidth3
        , padding
        , padding2
        , padding3
        , paddingBottom
        , paddingBottom2
        , paddingBottom3
        , paddingLeft
        , paddingLeft2
        , paddingLeft3
        , paddingRight
        , paddingRight2
        , paddingRight3
        , paddingTop
        , paddingTop2
        , paddingTop3
        , right
        , right2
        , right3
        , stepEnd
        , stepStart
        , tabSize
        , tabSize2
        , tabSize3
        , textIndent
        , textIndent2
        , textIndent3
        , textShadow
        , textShadow2
        , textShadow3
        , top
        , top2
        , top3
        , transform
        , transform2
        , transform3
        , transformOrigin
        , transformOrigin2
        , transformOrigin3
        , transition
        , verticalAlign
        , verticalAlign2
        , verticalAlign3
        , visibility
        , visibility2
        , visibility3
        , width
        , width2
        , width3
        , wordSpacing
        , wordSpacing2
        , wordSpacing3
        , zIndex
        , zIndex2
        , zIndex3
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


type Transition
    = Transition
        { animation : Animatable
        , duration : Time.Time
        , delay : Maybe Time.Time
        , timing : Maybe TimingFunction
        }


background3 : Time.Time -> Time.Time -> TimingFunction -> Transition
background3 =
    fullTransition Background


backgroundColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
backgroundColor3 =
    fullTransition BackgroundColor


backgroundPosition3 : Time.Time -> Time.Time -> TimingFunction -> Transition
backgroundPosition3 =
    fullTransition BackgroundPosition


backgroundSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
backgroundSize3 =
    fullTransition BackgroundSize


border3 : Time.Time -> Time.Time -> TimingFunction -> Transition
border3 =
    fullTransition Border


borderBottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottom3 =
    fullTransition BorderBottom


borderBottomColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomColor3 =
    fullTransition BorderBottomColor


borderBottomLeftRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomLeftRadius3 =
    fullTransition BorderBottomLeftRadius


borderBottomRightRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomRightRadius3 =
    fullTransition BorderBottomRightRadius


borderBottomWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderBottomWidth3 =
    fullTransition BorderBottomRightRadius


borderColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderColor3 =
    fullTransition BorderColor


borderLeft3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderLeft3 =
    fullTransition BorderLeft


borderLeftColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderLeftColor3 =
    fullTransition BorderLeftColor


borderLeftWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderLeftWidth3 =
    fullTransition BorderLeftWidth


borderRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRadius3 =
    fullTransition BorderRadius


borderRight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRight3 =
    fullTransition BorderRight


borderRightColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRightColor3 =
    fullTransition BorderRightColor


borderRightWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderRightWidth3 =
    fullTransition BorderRightWidth


borderTop3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTop3 =
    fullTransition BorderTop


borderTopColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopColor3 =
    fullTransition BorderTopColor


borderTopLeftRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopLeftRadius3 =
    fullTransition BorderTopLeftRadius


borderTopRightRadius3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopRightRadius3 =
    fullTransition BorderTopRightRadius


borderTopWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderTopWidth3 =
    fullTransition BorderTopWidth


borderWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
borderWidth3 =
    fullTransition BorderWidth


bottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
bottom3 =
    fullTransition Bottom


boxShadow3 : Time.Time -> Time.Time -> TimingFunction -> Transition
boxShadow3 =
    fullTransition BoxShadow


caretColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
caretColor3 =
    fullTransition CaretColor


clip3 : Time.Time -> Time.Time -> TimingFunction -> Transition
clip3 =
    fullTransition Clip


clipPath3 : Time.Time -> Time.Time -> TimingFunction -> Transition
clipPath3 =
    fullTransition ClipPath


color3 : Time.Time -> Time.Time -> TimingFunction -> Transition
color3 =
    fullTransition Color


columnCount3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnCount3 =
    fullTransition ColumnCount


columnGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnGap3 =
    fullTransition ColumnGap


columnRule3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnRule3 =
    fullTransition ColumnRule


columnRuleColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnRuleColor3 =
    fullTransition ColumnRuleColor


columnRuleWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnRuleWidth3 =
    fullTransition ColumnRuleWidth


columnWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columnWidth3 =
    fullTransition ColumnWidth


columns3 : Time.Time -> Time.Time -> TimingFunction -> Transition
columns3 =
    fullTransition Columns


filter3 : Time.Time -> Time.Time -> TimingFunction -> Transition
filter3 =
    fullTransition Filter


flex3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flex3 =
    fullTransition Flex


flexBasis3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flexBasis3 =
    fullTransition FlexBasis


flexGrow3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flexGrow3 =
    fullTransition FlexGrow


flexShrink3 : Time.Time -> Time.Time -> TimingFunction -> Transition
flexShrink3 =
    fullTransition FlexShrink


font3 : Time.Time -> Time.Time -> TimingFunction -> Transition
font3 =
    fullTransition Font


fontSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontSize3 =
    fullTransition FontSize


fontSizeAdjust3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontSizeAdjust3 =
    fullTransition FontSizeAdjust


fontStretch3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontStretch3 =
    fullTransition FontStretch


fontVariationSettings3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontVariationSettings3 =
    fullTransition FontVariationSettings


fontWeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
fontWeight3 =
    fullTransition FontWeight


gridColumnGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
gridColumnGap3 =
    fullTransition GridColumnGap


gridGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
gridGap3 =
    fullTransition GridGap


gridRowGap3 : Time.Time -> Time.Time -> TimingFunction -> Transition
gridRowGap3 =
    fullTransition GridRowGap


height3 : Time.Time -> Time.Time -> TimingFunction -> Transition
height3 =
    fullTransition Height


left3 : Time.Time -> Time.Time -> TimingFunction -> Transition
left3 =
    fullTransition Left


letterSpacing3 : Time.Time -> Time.Time -> TimingFunction -> Transition
letterSpacing3 =
    fullTransition LetterSpacing


lineHeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
lineHeight3 =
    fullTransition LineHeight


margin3 : Time.Time -> Time.Time -> TimingFunction -> Transition
margin3 =
    fullTransition Margin


marginBottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginBottom3 =
    fullTransition MarginBottom


marginLeft3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginLeft3 =
    fullTransition MarginLeft


marginRight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginRight3 =
    fullTransition MarginRight


marginTop3 : Time.Time -> Time.Time -> TimingFunction -> Transition
marginTop3 =
    fullTransition MarginTop


mask3 : Time.Time -> Time.Time -> TimingFunction -> Transition
mask3 =
    fullTransition Mask


maskPosition3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maskPosition3 =
    fullTransition MaskPosition


maskSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maskSize3 =
    fullTransition MaskSize


maxHeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maxHeight3 =
    fullTransition MaxHeight


maxWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
maxWidth3 =
    fullTransition MaxWidth


minHeight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
minHeight3 =
    fullTransition MinHeight


minWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
minWidth3 =
    fullTransition MinWidth


objectPosition3 : Time.Time -> Time.Time -> TimingFunction -> Transition
objectPosition3 =
    fullTransition ObjectPosition


offset3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offset3 =
    fullTransition Offset


offsetAnchor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetAnchor3 =
    fullTransition OffsetAnchor


offsetDistance3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetDistance3 =
    fullTransition OffsetDistance


offsetPath3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetPath3 =
    fullTransition OffsetPath


offsetRotate3 : Time.Time -> Time.Time -> TimingFunction -> Transition
offsetRotate3 =
    fullTransition OffsetRotate


opacity3 : Time.Time -> Time.Time -> TimingFunction -> Transition
opacity3 =
    fullTransition Opacity


order3 : Time.Time -> Time.Time -> TimingFunction -> Transition
order3 =
    fullTransition Order


outline3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outline3 =
    fullTransition Outline


outlineColor3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outlineColor3 =
    fullTransition OutlineColor


outlineOffset3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outlineOffset3 =
    fullTransition OutlineOffset


outlineWidth3 : Time.Time -> Time.Time -> TimingFunction -> Transition
outlineWidth3 =
    fullTransition OutlineWidth


padding3 : Time.Time -> Time.Time -> TimingFunction -> Transition
padding3 =
    fullTransition Padding


paddingBottom3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingBottom3 =
    fullTransition PaddingBottom


paddingLeft3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingLeft3 =
    fullTransition PaddingLeft


paddingRight3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingRight3 =
    fullTransition PaddingRight


paddingTop3 : Time.Time -> Time.Time -> TimingFunction -> Transition
paddingTop3 =
    fullTransition PaddingTop


right3 : Time.Time -> Time.Time -> TimingFunction -> Transition
right3 =
    fullTransition Right


tabSize3 : Time.Time -> Time.Time -> TimingFunction -> Transition
tabSize3 =
    fullTransition TabSize


textIndent3 : Time.Time -> Time.Time -> TimingFunction -> Transition
textIndent3 =
    fullTransition TextIndent


textShadow3 : Time.Time -> Time.Time -> TimingFunction -> Transition
textShadow3 =
    fullTransition TextShadow


top3 : Time.Time -> Time.Time -> TimingFunction -> Transition
top3 =
    fullTransition Top


transform3 : Time.Time -> Time.Time -> TimingFunction -> Transition
transform3 =
    fullTransition Transform


transformOrigin3 : Time.Time -> Time.Time -> TimingFunction -> Transition
transformOrigin3 =
    fullTransition TransformOrigin


verticalAlign3 : Time.Time -> Time.Time -> TimingFunction -> Transition
verticalAlign3 =
    fullTransition VerticalAlign


visibility3 : Time.Time -> Time.Time -> TimingFunction -> Transition
visibility3 =
    fullTransition Visibility


width3 : Time.Time -> Time.Time -> TimingFunction -> Transition
width3 =
    fullTransition Width


wordSpacing3 : Time.Time -> Time.Time -> TimingFunction -> Transition
wordSpacing3 =
    fullTransition WordSpacing


zIndex3 : Time.Time -> Time.Time -> TimingFunction -> Transition
zIndex3 =
    fullTransition ZIndex



--------------------------------------------------------------------------------


background2 : Time.Time -> Time.Time -> Transition
background2 =
    durationDelayTransition Background


backgroundColor2 : Time.Time -> Time.Time -> Transition
backgroundColor2 =
    durationDelayTransition BackgroundColor


backgroundPosition2 : Time.Time -> Time.Time -> Transition
backgroundPosition2 =
    durationDelayTransition BackgroundPosition


backgroundSize2 : Time.Time -> Time.Time -> Transition
backgroundSize2 =
    durationDelayTransition BackgroundSize


border2 : Time.Time -> Time.Time -> Transition
border2 =
    durationDelayTransition Border


borderBottom2 : Time.Time -> Time.Time -> Transition
borderBottom2 =
    durationDelayTransition BorderBottom


borderBottomColor2 : Time.Time -> Time.Time -> Transition
borderBottomColor2 =
    durationDelayTransition BorderBottomColor


borderBottomLeftRadius2 : Time.Time -> Time.Time -> Transition
borderBottomLeftRadius2 =
    durationDelayTransition BorderBottomLeftRadius


borderBottomRightRadius2 : Time.Time -> Time.Time -> Transition
borderBottomRightRadius2 =
    durationDelayTransition BorderBottomRightRadius


borderBottomWidth2 : Time.Time -> Time.Time -> Transition
borderBottomWidth2 =
    durationDelayTransition BorderBottomRightRadius


borderColor2 : Time.Time -> Time.Time -> Transition
borderColor2 =
    durationDelayTransition BorderColor


borderLeft2 : Time.Time -> Time.Time -> Transition
borderLeft2 =
    durationDelayTransition BorderLeft


borderLeftColor2 : Time.Time -> Time.Time -> Transition
borderLeftColor2 =
    durationDelayTransition BorderLeftColor


borderLeftWidth2 : Time.Time -> Time.Time -> Transition
borderLeftWidth2 =
    durationDelayTransition BorderLeftWidth


borderRadius2 : Time.Time -> Time.Time -> Transition
borderRadius2 =
    durationDelayTransition BorderRadius


borderRight2 : Time.Time -> Time.Time -> Transition
borderRight2 =
    durationDelayTransition BorderRight


borderRightColor2 : Time.Time -> Time.Time -> Transition
borderRightColor2 =
    durationDelayTransition BorderRightColor


borderRightWidth2 : Time.Time -> Time.Time -> Transition
borderRightWidth2 =
    durationDelayTransition BorderRightWidth


borderTop2 : Time.Time -> Time.Time -> Transition
borderTop2 =
    durationDelayTransition BorderTop


borderTopColor2 : Time.Time -> Time.Time -> Transition
borderTopColor2 =
    durationDelayTransition BorderTopColor


borderTopLeftRadius2 : Time.Time -> Time.Time -> Transition
borderTopLeftRadius2 =
    durationDelayTransition BorderTopLeftRadius


borderTopRightRadius2 : Time.Time -> Time.Time -> Transition
borderTopRightRadius2 =
    durationDelayTransition BorderTopRightRadius


borderTopWidth2 : Time.Time -> Time.Time -> Transition
borderTopWidth2 =
    durationDelayTransition BorderTopWidth


borderWidth2 : Time.Time -> Time.Time -> Transition
borderWidth2 =
    durationDelayTransition BorderWidth


bottom2 : Time.Time -> Time.Time -> Transition
bottom2 =
    durationDelayTransition Bottom


boxShadow2 : Time.Time -> Time.Time -> Transition
boxShadow2 =
    durationDelayTransition BoxShadow


caretColor2 : Time.Time -> Time.Time -> Transition
caretColor2 =
    durationDelayTransition CaretColor


clip2 : Time.Time -> Time.Time -> Transition
clip2 =
    durationDelayTransition Clip


clipPath2 : Time.Time -> Time.Time -> Transition
clipPath2 =
    durationDelayTransition ClipPath


color2 : Time.Time -> Time.Time -> Transition
color2 =
    durationDelayTransition Color


columnCount2 : Time.Time -> Time.Time -> Transition
columnCount2 =
    durationDelayTransition ColumnCount


columnGap2 : Time.Time -> Time.Time -> Transition
columnGap2 =
    durationDelayTransition ColumnGap


columnRule2 : Time.Time -> Time.Time -> Transition
columnRule2 =
    durationDelayTransition ColumnRule


columnRuleColor2 : Time.Time -> Time.Time -> Transition
columnRuleColor2 =
    durationDelayTransition ColumnRuleColor


columnRuleWidth2 : Time.Time -> Time.Time -> Transition
columnRuleWidth2 =
    durationDelayTransition ColumnRuleWidth


columnWidth2 : Time.Time -> Time.Time -> Transition
columnWidth2 =
    durationDelayTransition ColumnWidth


columns2 : Time.Time -> Time.Time -> Transition
columns2 =
    durationDelayTransition Columns


filter2 : Time.Time -> Time.Time -> Transition
filter2 =
    durationDelayTransition Filter


flex2 : Time.Time -> Time.Time -> Transition
flex2 =
    durationDelayTransition Flex


flexBasis2 : Time.Time -> Time.Time -> Transition
flexBasis2 =
    durationDelayTransition FlexBasis


flexGrow2 : Time.Time -> Time.Time -> Transition
flexGrow2 =
    durationDelayTransition FlexGrow


flexShrink2 : Time.Time -> Time.Time -> Transition
flexShrink2 =
    durationDelayTransition FlexShrink


font2 : Time.Time -> Time.Time -> Transition
font2 =
    durationDelayTransition Font


fontSize2 : Time.Time -> Time.Time -> Transition
fontSize2 =
    durationDelayTransition FontSize


fontSizeAdjust2 : Time.Time -> Time.Time -> Transition
fontSizeAdjust2 =
    durationDelayTransition FontSizeAdjust


fontStretch2 : Time.Time -> Time.Time -> Transition
fontStretch2 =
    durationDelayTransition FontStretch


fontVariationSettings2 : Time.Time -> Time.Time -> Transition
fontVariationSettings2 =
    durationDelayTransition FontVariationSettings


fontWeight2 : Time.Time -> Time.Time -> Transition
fontWeight2 =
    durationDelayTransition FontWeight


gridColumnGap2 : Time.Time -> Time.Time -> Transition
gridColumnGap2 =
    durationDelayTransition GridColumnGap


gridGap2 : Time.Time -> Time.Time -> Transition
gridGap2 =
    durationDelayTransition GridGap


gridRowGap2 : Time.Time -> Time.Time -> Transition
gridRowGap2 =
    durationDelayTransition GridRowGap


height2 : Time.Time -> Time.Time -> Transition
height2 =
    durationDelayTransition Height


left2 : Time.Time -> Time.Time -> Transition
left2 =
    durationDelayTransition Left


letterSpacing2 : Time.Time -> Time.Time -> Transition
letterSpacing2 =
    durationDelayTransition LetterSpacing


lineHeight2 : Time.Time -> Time.Time -> Transition
lineHeight2 =
    durationDelayTransition LineHeight


margin2 : Time.Time -> Time.Time -> Transition
margin2 =
    durationDelayTransition Margin


marginBottom2 : Time.Time -> Time.Time -> Transition
marginBottom2 =
    durationDelayTransition MarginBottom


marginLeft2 : Time.Time -> Time.Time -> Transition
marginLeft2 =
    durationDelayTransition MarginLeft


marginRight2 : Time.Time -> Time.Time -> Transition
marginRight2 =
    durationDelayTransition MarginRight


marginTop2 : Time.Time -> Time.Time -> Transition
marginTop2 =
    durationDelayTransition MarginTop


mask2 : Time.Time -> Time.Time -> Transition
mask2 =
    durationDelayTransition Mask


maskPosition2 : Time.Time -> Time.Time -> Transition
maskPosition2 =
    durationDelayTransition MaskPosition


maskSize2 : Time.Time -> Time.Time -> Transition
maskSize2 =
    durationDelayTransition MaskSize


maxHeight2 : Time.Time -> Time.Time -> Transition
maxHeight2 =
    durationDelayTransition MaxHeight


maxWidth2 : Time.Time -> Time.Time -> Transition
maxWidth2 =
    durationDelayTransition MaxWidth


minHeight2 : Time.Time -> Time.Time -> Transition
minHeight2 =
    durationDelayTransition MinHeight


minWidth2 : Time.Time -> Time.Time -> Transition
minWidth2 =
    durationDelayTransition MinWidth


objectPosition2 : Time.Time -> Time.Time -> Transition
objectPosition2 =
    durationDelayTransition ObjectPosition


offset2 : Time.Time -> Time.Time -> Transition
offset2 =
    durationDelayTransition Offset


offsetAnchor2 : Time.Time -> Time.Time -> Transition
offsetAnchor2 =
    durationDelayTransition OffsetAnchor


offsetDistance2 : Time.Time -> Time.Time -> Transition
offsetDistance2 =
    durationDelayTransition OffsetDistance


offsetPath2 : Time.Time -> Time.Time -> Transition
offsetPath2 =
    durationDelayTransition OffsetPath


offsetRotate2 : Time.Time -> Time.Time -> Transition
offsetRotate2 =
    durationDelayTransition OffsetRotate


opacity2 : Time.Time -> Time.Time -> Transition
opacity2 =
    durationDelayTransition Opacity


order2 : Time.Time -> Time.Time -> Transition
order2 =
    durationDelayTransition Order


outline2 : Time.Time -> Time.Time -> Transition
outline2 =
    durationDelayTransition Outline


outlineColor2 : Time.Time -> Time.Time -> Transition
outlineColor2 =
    durationDelayTransition OutlineColor


outlineOffset2 : Time.Time -> Time.Time -> Transition
outlineOffset2 =
    durationDelayTransition OutlineOffset


outlineWidth2 : Time.Time -> Time.Time -> Transition
outlineWidth2 =
    durationDelayTransition OutlineWidth


padding2 : Time.Time -> Time.Time -> Transition
padding2 =
    durationDelayTransition Padding


paddingBottom2 : Time.Time -> Time.Time -> Transition
paddingBottom2 =
    durationDelayTransition PaddingBottom


paddingLeft2 : Time.Time -> Time.Time -> Transition
paddingLeft2 =
    durationDelayTransition PaddingLeft


paddingRight2 : Time.Time -> Time.Time -> Transition
paddingRight2 =
    durationDelayTransition PaddingRight


paddingTop2 : Time.Time -> Time.Time -> Transition
paddingTop2 =
    durationDelayTransition PaddingTop


right2 : Time.Time -> Time.Time -> Transition
right2 =
    durationDelayTransition Right


tabSize2 : Time.Time -> Time.Time -> Transition
tabSize2 =
    durationDelayTransition TabSize


textIndent2 : Time.Time -> Time.Time -> Transition
textIndent2 =
    durationDelayTransition TextIndent


textShadow2 : Time.Time -> Time.Time -> Transition
textShadow2 =
    durationDelayTransition TextShadow


top2 : Time.Time -> Time.Time -> Transition
top2 =
    durationDelayTransition Top


transform2 : Time.Time -> Time.Time -> Transition
transform2 =
    durationDelayTransition Transform


transformOrigin2 : Time.Time -> Time.Time -> Transition
transformOrigin2 =
    durationDelayTransition TransformOrigin


verticalAlign2 : Time.Time -> Time.Time -> Transition
verticalAlign2 =
    durationDelayTransition VerticalAlign


visibility2 : Time.Time -> Time.Time -> Transition
visibility2 =
    durationDelayTransition Visibility


width2 : Time.Time -> Time.Time -> Transition
width2 =
    durationDelayTransition Width


wordSpacing2 : Time.Time -> Time.Time -> Transition
wordSpacing2 =
    durationDelayTransition WordSpacing


zIndex2 : Time.Time -> Time.Time -> Transition
zIndex2 =
    durationDelayTransition ZIndex



--------------------------------------------------------------------------------


background : Time.Time -> Transition
background =
    durationTransition Background


backgroundColor : Time.Time -> Transition
backgroundColor =
    durationTransition BackgroundColor


backgroundPosition : Time.Time -> Transition
backgroundPosition =
    durationTransition BackgroundPosition


backgroundSize : Time.Time -> Transition
backgroundSize =
    durationTransition BackgroundSize


border : Time.Time -> Transition
border =
    durationTransition Border


borderBottom : Time.Time -> Transition
borderBottom =
    durationTransition BorderBottom


borderBottomColor : Time.Time -> Transition
borderBottomColor =
    durationTransition BorderBottomColor


borderBottomLeftRadius : Time.Time -> Transition
borderBottomLeftRadius =
    durationTransition BorderBottomLeftRadius


borderBottomRightRadius : Time.Time -> Transition
borderBottomRightRadius =
    durationTransition BorderBottomRightRadius


borderBottomWidth : Time.Time -> Transition
borderBottomWidth =
    durationTransition BorderBottomRightRadius


borderColor : Time.Time -> Transition
borderColor =
    durationTransition BorderColor


borderLeft : Time.Time -> Transition
borderLeft =
    durationTransition BorderLeft


borderLeftColor : Time.Time -> Transition
borderLeftColor =
    durationTransition BorderLeftColor


borderLeftWidth : Time.Time -> Transition
borderLeftWidth =
    durationTransition BorderLeftWidth


borderRadius : Time.Time -> Transition
borderRadius =
    durationTransition BorderRadius


borderRight : Time.Time -> Transition
borderRight =
    durationTransition BorderRight


borderRightColor : Time.Time -> Transition
borderRightColor =
    durationTransition BorderRightColor


borderRightWidth : Time.Time -> Transition
borderRightWidth =
    durationTransition BorderRightWidth


borderTop : Time.Time -> Transition
borderTop =
    durationTransition BorderTop


borderTopColor : Time.Time -> Transition
borderTopColor =
    durationTransition BorderTopColor


borderTopLeftRadius : Time.Time -> Transition
borderTopLeftRadius =
    durationTransition BorderTopLeftRadius


borderTopRightRadius : Time.Time -> Transition
borderTopRightRadius =
    durationTransition BorderTopRightRadius


borderTopWidth : Time.Time -> Transition
borderTopWidth =
    durationTransition BorderTopWidth


borderWidth : Time.Time -> Transition
borderWidth =
    durationTransition BorderWidth


bottom : Time.Time -> Transition
bottom =
    durationTransition Bottom


boxShadow : Time.Time -> Transition
boxShadow =
    durationTransition BoxShadow


caretColor : Time.Time -> Transition
caretColor =
    durationTransition CaretColor


clip : Time.Time -> Transition
clip =
    durationTransition Clip


clipPath : Time.Time -> Transition
clipPath =
    durationTransition ClipPath


color : Time.Time -> Transition
color =
    durationTransition Color


columnCount : Time.Time -> Transition
columnCount =
    durationTransition ColumnCount


columnGap : Time.Time -> Transition
columnGap =
    durationTransition ColumnGap


columnRule : Time.Time -> Transition
columnRule =
    durationTransition ColumnRule


columnRuleColor : Time.Time -> Transition
columnRuleColor =
    durationTransition ColumnRuleColor


columnRuleWidth : Time.Time -> Transition
columnRuleWidth =
    durationTransition ColumnRuleWidth


columnWidth : Time.Time -> Transition
columnWidth =
    durationTransition ColumnWidth


columns : Time.Time -> Transition
columns =
    durationTransition Columns


filter : Time.Time -> Transition
filter =
    durationTransition Filter


flex : Time.Time -> Transition
flex =
    durationTransition Flex


flexBasis : Time.Time -> Transition
flexBasis =
    durationTransition FlexBasis


flexGrow : Time.Time -> Transition
flexGrow =
    durationTransition FlexGrow


flexShrink : Time.Time -> Transition
flexShrink =
    durationTransition FlexShrink


font : Time.Time -> Transition
font =
    durationTransition Font


fontSize : Time.Time -> Transition
fontSize =
    durationTransition FontSize


fontSizeAdjust : Time.Time -> Transition
fontSizeAdjust =
    durationTransition FontSizeAdjust


fontStretch : Time.Time -> Transition
fontStretch =
    durationTransition FontStretch


fontVariationSettings : Time.Time -> Transition
fontVariationSettings =
    durationTransition FontVariationSettings


fontWeight : Time.Time -> Transition
fontWeight =
    durationTransition FontWeight


gridColumnGap : Time.Time -> Transition
gridColumnGap =
    durationTransition GridColumnGap


gridGap : Time.Time -> Transition
gridGap =
    durationTransition GridGap


gridRowGap : Time.Time -> Transition
gridRowGap =
    durationTransition GridRowGap


height : Time.Time -> Transition
height =
    durationTransition Height


left : Time.Time -> Transition
left =
    durationTransition Left


letterSpacing : Time.Time -> Transition
letterSpacing =
    durationTransition LetterSpacing


lineHeight : Time.Time -> Transition
lineHeight =
    durationTransition LineHeight


margin : Time.Time -> Transition
margin =
    durationTransition Margin


marginBottom : Time.Time -> Transition
marginBottom =
    durationTransition MarginBottom


marginLeft : Time.Time -> Transition
marginLeft =
    durationTransition MarginLeft


marginRight : Time.Time -> Transition
marginRight =
    durationTransition MarginRight


marginTop : Time.Time -> Transition
marginTop =
    durationTransition MarginTop


mask : Time.Time -> Transition
mask =
    durationTransition Mask


maskPosition : Time.Time -> Transition
maskPosition =
    durationTransition MaskPosition


maskSize : Time.Time -> Transition
maskSize =
    durationTransition MaskSize


maxHeight : Time.Time -> Transition
maxHeight =
    durationTransition MaxHeight


maxWidth : Time.Time -> Transition
maxWidth =
    durationTransition MaxWidth


minHeight : Time.Time -> Transition
minHeight =
    durationTransition MinHeight


minWidth : Time.Time -> Transition
minWidth =
    durationTransition MinWidth


objectPosition : Time.Time -> Transition
objectPosition =
    durationTransition ObjectPosition


offset : Time.Time -> Transition
offset =
    durationTransition Offset


offsetAnchor : Time.Time -> Transition
offsetAnchor =
    durationTransition OffsetAnchor


offsetDistance : Time.Time -> Transition
offsetDistance =
    durationTransition OffsetDistance


offsetPath : Time.Time -> Transition
offsetPath =
    durationTransition OffsetPath


offsetRotate : Time.Time -> Transition
offsetRotate =
    durationTransition OffsetRotate


opacity : Time.Time -> Transition
opacity =
    durationTransition Opacity


order : Time.Time -> Transition
order =
    durationTransition Order


outline : Time.Time -> Transition
outline =
    durationTransition Outline


outlineColor : Time.Time -> Transition
outlineColor =
    durationTransition OutlineColor


outlineOffset : Time.Time -> Transition
outlineOffset =
    durationTransition OutlineOffset


outlineWidth : Time.Time -> Transition
outlineWidth =
    durationTransition OutlineWidth


padding : Time.Time -> Transition
padding =
    durationTransition Padding


paddingBottom : Time.Time -> Transition
paddingBottom =
    durationTransition PaddingBottom


paddingLeft : Time.Time -> Transition
paddingLeft =
    durationTransition PaddingLeft


paddingRight : Time.Time -> Transition
paddingRight =
    durationTransition PaddingRight


paddingTop : Time.Time -> Transition
paddingTop =
    durationTransition PaddingTop


right : Time.Time -> Transition
right =
    durationTransition Right


tabSize : Time.Time -> Transition
tabSize =
    durationTransition TabSize


textIndent : Time.Time -> Transition
textIndent =
    durationTransition TextIndent


textShadow : Time.Time -> Transition
textShadow =
    durationTransition TextShadow


top : Time.Time -> Transition
top =
    durationTransition Top


transform : Time.Time -> Transition
transform =
    durationTransition Transform


transformOrigin : Time.Time -> Transition
transformOrigin =
    durationTransition TransformOrigin


verticalAlign : Time.Time -> Transition
verticalAlign =
    durationTransition VerticalAlign


visibility : Time.Time -> Transition
visibility =
    durationTransition Visibility


width : Time.Time -> Transition
width =
    durationTransition Width


wordSpacing : Time.Time -> Transition
wordSpacing =
    durationTransition WordSpacing


zIndex : Time.Time -> Transition
zIndex =
    durationTransition ZIndex


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
    toString time ++ "ms"


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
                (\(Transition { animation, duration, delay, timing }) s ->
                    s
                        ++ String.join " "
                            [ propToString animation
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



-- INTERNAL HELPERS --


fullTransition : Animatable -> Time.Time -> Time.Time -> TimingFunction -> Transition
fullTransition animation duration delay timing =
    Transition
        { animation = animation
        , duration = duration
        , delay = Just delay
        , timing = Just timing
        }


durationDelayTransition : Animatable -> Time.Time -> Time.Time -> Transition
durationDelayTransition animation duration delay =
    Transition
        { animation = animation
        , duration = duration
        , delay = Just delay
        , timing = Nothing
        }


durationTransition : Animatable -> Time.Time -> Transition
durationTransition animation duration =
    Transition
        { animation = animation
        , duration = duration
        , delay = Nothing
        , timing = Nothing
        }
