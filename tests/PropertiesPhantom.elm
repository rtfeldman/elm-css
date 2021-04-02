module PropertiesPhantom exposing (all)

import Css exposing (..)
import Css.Preprocess exposing (stylesheet, toPropertyStrings)
import Expect
import Test exposing (Test)
import TestUtil exposing (prettyPrint)


all : Test
all =
    Test.concat
        [ testProperty1 boxSizing
            { functionName = "boxSizing", property = "box-sizing" }
            [ ( contentBox, "content-box" )
            , ( borderBox, "border-box" )
            ]
        , testProperty1 borderStyle
            { functionName = "borderStyle", property = "border-style" }
            testLineStyle
        , testProperty1 borderWidth
            { functionName = "borderWidth", property = "border-width" }
            testLineWidth
        , testProperty { functionName = "borderWidth2", property = "border-width" }
            ([ ( borderWidth2 thin medium, "thin medium" )
             , ( borderWidth2 medium thick, "medium thick" )
             , ( borderWidth2 thick thin, "thick thin" )
             ]
                ++ testLength2 borderWidth2
            )
        , testProperty { functionName = "borderWidth3", property = "border-width" }
            ([ ( borderWidth3 thin medium thick, "thin medium thick" )
             , ( borderWidth3 medium thick thin, "medium thick thin" )
             , ( borderWidth3 thick thin medium, "thick thin medium" )
             ]
                ++ testLength3 borderWidth3
            )
        , testProperty { functionName = "borderWidth4", property = "border-width" }
            ([ ( borderWidth4 thin medium thick thin, "thin medium thick thin" )
             , ( borderWidth4 medium thick thin thick, "medium thick thin thick" )
             , ( borderWidth4 thick thin medium medium, "thick thin medium medium" )
             ]
                ++ testLength4 borderWidth4
            )
        , testProperty1 width
            { functionName = "width", property = "width" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( pct 90, "90%" )
             ]
                ++ testLength
            )
        , testProperty1 minWidth
            { functionName = "minWidth", property = "min-width" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( pct 90, "90%" )
             ]
                ++ testLength
            )
        , testProperty1 maxWidth
            { functionName = "maxWidth", property = "max-width" }
            ([ ( none, "none" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( pct 90, "90%" )
             ]
                ++ testLength
            )
        , testProperty1 height
            { functionName = "height", property = "height" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( pct 90, "90%" )
             ]
                ++ testLength
            )
        , testProperty1 minHeight
            { functionName = "minHeight", property = "min-height" }
            ([ ( auto, "auto" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( pct 90, "90%" )
             ]
                ++ testLength
            )
        , testProperty1 maxHeight
            { functionName = "maxHeight", property = "max-height" }
            ([ ( none, "none" )
             , ( maxContent, "max-content" )
             , ( minContent, "min-content" )
             , ( fitContent, "fit-content" )
             , ( pct 90, "90%" )
             ]
                ++ testLength
            )
        , testProperty1 textIndent
            { functionName = "textIndent", property = "text-indent" }
            (( pct 17.5, "17.5%" )
                :: testLength
            )
        , testProperty { functionName = "textIndent2", property = "text-indent" }
            [ ( textIndent2 (ch 3) hanging, "3ch hanging" )
            , ( textIndent2 (cm 2) eachLine, "2cm each-line" )
            , ( textIndent2 (em 0.625) hanging, "0.625em hanging" )
            , ( textIndent2 (ex 3.14) eachLine, "3.14ex each-line" )
            , ( textIndent2 (inches 2.54) hanging, "2.54in hanging" )
            , ( textIndent2 (mm 12.345) eachLine, "12.345mm each-line" )
            , ( textIndent2 (pc 7.7) hanging, "7.7pc hanging" )
            , ( textIndent2 (pt 65.4) eachLine, "65.4pt each-line" )
            , ( textIndent2 (px 1.5) hanging, "1.5px hanging" )
            , ( textIndent2 (q 3) hanging, "3Q hanging" )
            , ( textIndent2 (rem 5.3) eachLine, "5.3rem each-line" )
            , ( textIndent2 (vh 99.54) hanging, "99.54vh hanging" )
            , ( textIndent2 (vw 33.333) eachLine, "33.333vw each-line" )
            , ( textIndent2 (vmax 4.73) hanging, "4.73vmax hanging" )
            , ( textIndent2 (vmin 12.7) eachLine, "12.7vmin each-line" )
            , ( textIndent2 zero hanging, "0 hanging" )
            , ( textIndent2 (calc (rem 3.2) (minus (px 5.5))) eachLine, "calc(3.2rem - 5.5px) each-line" )
            ]
        , testProperty1 textDecoration
            { functionName = "textDecoration", property = "text-decoration" }
            ([ ( none, "none" )
             , ( underline, "underline" )
             , ( overline, "overline" )
             , ( lineThrough, "line-through" )
             , ( solid, "solid" )
             , ( double, "double" )
             , ( dotted, "dotted" )
             , ( dashed, "dashed" )
             , ( wavy, "wavy" )
             ]
                ++ testColor
            )
        , testProperty { functionName = "textDecoration2", property = "text-decoration" }
            [ ( textDecoration2 none solid, "none solid" )
            , ( textDecoration2 underline double, "underline double" )
            , ( textDecoration2 underline dotted, "underline dotted" )
            , ( textDecoration2 lineThrough dashed, "line-through dashed" )
            , ( textDecoration2 overline wavy, "overline wavy" )
            ]
        , testProperty { functionName = "textDecoration3", property = "text-decoration" }
            [ ( textDecoration3 none solid (rgb 11 22 33), "none solid rgb(11,22,33)" )
            , ( textDecoration3 underline double (hex "3c84"), "underline double #3c84" )
            , ( textDecoration3 underline dotted (hsl 23 0.5 0.2), "underline dotted hsl(23,50%,20%)" )
            , ( textDecoration3 lineThrough dashed (hsla 11 0.22 0.33 0.44), "line-through dashed hsla(11,22%,33%,0.44)" )
            , ( textDecoration3 overline wavy (rgba 11 22 33 0.44), "overline wavy rgba(11,22,33,0.44)" )
            , ( textDecoration3 underline dotted currentcolor, "underline dotted currentcolor" )
            ]
        , testProperty1 textDecorationLine
            { functionName = "textDecorationLine", property = "text-decoration-line" }
            [ ( none, "none" )
            , ( underline, "underline" )
            , ( overline, "overline" )
            , ( lineThrough, "line-through" )
            ]
        , testProperty { functionName = "textDecorationLine2", property = "text-decoration-line" }
            [ ( textDecorationLine2 underline overline, "underline overline" )
            , ( textDecorationLine2 lineThrough underline, "line-through underline" )
            , ( textDecorationLine2 overline lineThrough, "overline line-through" )
            ]
        , testProperty { functionName = "textDecorationLine3", property = "text-decoration-line" }
            [ ( textDecorationLine3 underline overline lineThrough, "underline overline line-through" ) ]
        , testProperty1 textDecorationStyle
            { functionName = "textDecorationStyle", property = "text-decoration-style" }
            [ ( solid, "solid" )
            , ( double, "double" )
            , ( dotted, "dotted" )
            , ( dashed, "dashed" )
            , ( wavy, "wavy" )
            ]
        , testProperty1 textDecorationColor
            { functionName = "textDecorationColor", property = "text-decoration-color" }
            testColor
        , testProperty1 textTransform
            { functionName = "textTransform", property = "text-transform" }
            [ ( capitalize, "capitalize" )
            , ( uppercase, "uppercase" )
            , ( lowercase, "lowercase" )
            , ( none, "none" )
            , ( fullWidth, "full-width" )
            , ( fullSizeKana, "full-size-kana" )
            ]
        , testProperty1 lineHeight
            { functionName = "lineHeight", property = "line-height" }
            ([ ( normal, "normal" )
             , ( pct 10, "10%" )
             , ( num 1.8, "1.8" )
             , ( calc (px 5) (plus (pct 1)), "calc(5px + 1%)" )
             , ( calc (em 5.5) (minus (pt 1)), "calc(5.5em - 1pt)" )
             , ( calc (px 5) (plus (calc (pct 5) (plus (vh 3)))), "calc(5px + (5% + 3vh))" )
             , ( calc (px 5) (plus (calc (pct 5) (minus (vh 3)))), "calc(5px + (5% - 3vh))" )
             , ( calc (px 5) (minus (calc (pct 5) (plus (vh 3)))), "calc(5px - (5% + 3vh))" )
             , ( calc (px 5) (minus (calc (pct 5) (minus (vh 3)))), "calc(5px - (5% - 3vh))" )
             , ( calc (calc (pct 5) (plus (vh 3))) (plus (px 5)), "calc((5% + 3vh) + 5px)" )
             , ( calc (calc (pct 5) (minus (vh 3))) (plus (px 5)), "calc((5% - 3vh) + 5px)" )
             , ( calc (calc (pct 5) (plus (vh 3))) (minus (px 5)), "calc((5% + 3vh) - 5px)" )
             , ( calc (calc (pct 5) (minus (vh 3))) (minus (px 5)), "calc((5% - 3vh) - 5px)" )
             ]
                ++ testLength
            )
        , testProperty1 overflowX
            { functionName = "overflowX", property = "overflow-x" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            ]
        , testProperty1 overflowY
            { functionName = "overflowY", property = "overflow-y" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            ]
        , testProperty1 overflowWrap
            { functionName = "overflowWrap", property = "overflow-wrap" }
            [ ( normal, "normal" )
            , ( anywhere, "anywhere" )
            , ( breakWord, "break-word" )
            ]
        , testProperty1 overflow
            { functionName = "overflow", property = "overflow" }
            [ ( auto, "auto" )
            , ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( scroll, "scroll" )
            ]
        , testProperty1 visibility
            { functionName = "visibility", property = "visibility" }
            [ ( visible, "visible" )
            , ( hidden, "hidden" )
            , ( collapse, "collapse" )
            ]
        , testProperty1 textRendering
            { functionName = "textRendering", property = "text-rendering" }
            [ ( auto, "auto" )
            , ( optimizeSpeed, "optimizeSpeed" )
            , ( optimizeLegibility, "optimizeLegibility" )
            , ( geometricPrecision, "geometricPrecision" )
            ]
        , testProperty1 display
            { functionName = "display", property = "display" }
            [ ( none, "none" )
            , ( contents, "contents" )
            , ( inline, "inline" )
            , ( block, "block" )
            , ( listItem, "list-item" )
            , ( inlineBlock, "inline-block" )
            , ( inlineFlex, "inline-flex" )
            , ( inlineGrid, "inline-grid" )
            , ( inlineTable, "inline-table" )
            , ( flex_, "flex" )
            , ( flow, "flow" )
            , ( flowRoot, "flow-root" )
            , ( grid, "grid" )
            , ( table, "table" )
            , ( ruby, "ruby" )
            , ( rubyBase, "ruby-base" )
            , ( rubyBaseContainer, "ruby-base-container" )
            , ( rubyText, "ruby-text" )
            , ( rubyTextContainer, "ruby-text-container" )
            , ( runIn, "run-in" )
            , ( tableCaption, "table-caption" )
            , ( tableCell, "table-cell" )
            , ( tableColumn, "table-column" )
            , ( tableColumnGroup, "table-column-group" )
            , ( tableFooterGroup, "table-footer-group" )
            , ( tableHeaderGroup, "table-header-group" )
            , ( tableRow, "table-row" )
            , ( tableRowGroup, "table-row-group" )
            ]
        , testProperty { functionName = "display2", property = "display" }
            [ ( display2 inline flow, "inline flow" )
            , ( display2 block flowRoot, "block flow-root" )
            , ( display2 block table, "block table" )
            , ( display2 runIn flex_, "run-in flex" )
            , ( display2 inline grid, "inline grid" )
            , ( display2 runIn ruby, "run-in ruby" )
            ]
        , testProperty { functionName = "displayListItem2", property = "display" }
            [ ( displayListItem2 block, "list-item block" )
            , ( displayListItem2 inline, "list-item inline" )
            , ( displayListItem2 runIn, "list-item run-in" )
            , ( displayListItem2 flow, "list-item flow" )
            , ( displayListItem2 flowRoot, "list-item flow-root" )
            ]
        , testProperty { functionName = "displayListItem3", property = "display" }
            [ ( displayListItem3 block flow, "list-item block flow" )
            , ( displayListItem3 inline flowRoot, "list-item inline flow-root" )
            , ( displayListItem3 runIn flow, "list-item run-in flow" )
            ]
        , testProperty1 pointerEvents
            { functionName = "pointerEvents", property = "pointer-events" }
            [ ( auto, "auto" )
            , ( none, "none" )
            , ( visiblePainted, "visiblePainted" )
            , ( visibleFill, "visibleFill" )
            , ( visibleStroke, "visibleStroke" )
            , ( visible, "visible" )
            , ( painted, "painted" )
            , ( fill_, "fill" )
            , ( stroke, "stroke" )
            , ( all_, "all" )
            ]
        , testProperty1 flex
            { functionName = "flex", property = "flex" }
            ([ ( auto, "auto" )
             , ( content, "content" )
             , ( minContent, "min-content" )
             , ( maxContent, "max-content" )
             , ( fitContent, "fit-content" )
             , ( none, "none" )
             , ( num 2.3, "2.3" )
             ]
                ++ testLength
            )
        , testProperty { functionName = "flex2", property = "flex" }
            [ ( flex2 (num 1) (num 2), "1 2" )
            , ( flex2 zero zero, "0 0" )
            , ( flex2 (calc (num 3) (minus (num 2))) (calc (pct 100) (minus (rem 2.3))), "calc(3 - 2) calc(100% - 2.3rem)" )
            , ( flex2 (num 2) auto, "2 auto" )
            , ( flex2 (num 2) content, "2 content" )
            , ( flex2 (num 2) maxContent, "2 max-content" )
            , ( flex2 (num 2) minContent, "2 min-content" )
            , ( flex2 (num 2) fitContent, "2 fit-content" )
            , ( flex2 (num 2) (ch 2.3), "2 2.3ch" )
            , ( flex2 (num 2) (cm 3.2), "2 3.2cm" )
            , ( flex2 (num 2) (em 1), "2 1em" )
            , ( flex2 (num 2) (ex 2), "2 2ex" )
            , ( flex2 (num 2) (inches 0.75), "2 0.75in" )
            , ( flex2 (num 2) (mm 3.4), "2 3.4mm" )
            , ( flex2 (num 2) (pc 10), "2 10pc" )
            , ( flex2 (num 2) (pt 16), "2 16pt" )
            , ( flex2 (num 2) (px 45), "2 45px" )
            , ( flex2 (num 2) (q 32), "2 32Q" )
            , ( flex2 (num 2) (rem 2.05), "2 2.05rem" )
            , ( flex2 (num 2) (vh 33.33), "2 33.33vh" )
            , ( flex2 (num 2) (vw 10), "2 10vw" )
            , ( flex2 (num 2) (vmax 50), "2 50vmax" )
            , ( flex2 (num 2) (vmin 100), "2 100vmin" )
            , ( flex2 (num 2) (pct 26), "2 26%" )
            ]
        , testProperty { functionName = "flex3", property = "flex" }
            [ ( flex3 zero zero zero, "0 0 0" )
            , ( flex3
                    (calc (num 3) (minus (num 2)))
                    (calc (num 16) (dividedBy (num 7)))
                    (calc (pct 100) (minus (rem 2.3)))
              , "calc(3 - 2) calc(16 / 7) calc(100% - 2.3rem)"
              )
            , ( flex3 (num 2) (num 3) auto, "2 3 auto" )
            , ( flex3 (num 2) (num 3) content, "2 3 content" )
            , ( flex3 (num 2) (num 3) maxContent, "2 3 max-content" )
            , ( flex3 (num 2) (num 3) minContent, "2 3 min-content" )
            , ( flex3 (num 2) (num 3) fitContent, "2 3 fit-content" )
            , ( flex3 (num 2) (num 3) (ch 2.3), "2 3 2.3ch" )
            , ( flex3 (num 2) (num 3) (cm 3.2), "2 3 3.2cm" )
            , ( flex3 (num 2) (num 3) (em 1), "2 3 1em" )
            , ( flex3 (num 2) (num 3) (ex 2), "2 3 2ex" )
            , ( flex3 (num 2) (num 3) (inches 0.75), "2 3 0.75in" )
            , ( flex3 (num 2) (num 3) (mm 3.4), "2 3 3.4mm" )
            , ( flex3 (num 2) (num 3) (pc 10), "2 3 10pc" )
            , ( flex3 (num 2) (num 3) (pt 16), "2 3 16pt" )
            , ( flex3 (num 2) (num 3) (px 45), "2 3 45px" )
            , ( flex3 (num 2) (num 3) (q 32), "2 3 32Q" )
            , ( flex3 (num 2) (num 3) (rem 2.05), "2 3 2.05rem" )
            , ( flex3 (num 2) (num 3) (vh 33.33), "2 3 33.33vh" )
            , ( flex3 (num 2) (num 3) (vw 10), "2 3 10vw" )
            , ( flex3 (num 2) (num 3) (vmax 50), "2 3 50vmax" )
            , ( flex3 (num 2) (num 3) (vmin 100), "2 3 100vmin" )
            , ( flex3 (num 2) (num 3) (pct 26), "2 3 26%" )
            ]
        , testProperty1 flexBasis
            { functionName = "flexBasis", property = "flex-basis" }
            ([ ( auto, "auto" )
             , ( content, "content" )
             , ( minContent, "min-content" )
             , ( maxContent, "max-content" )
             , ( fitContent, "fit-content" )
             ]
                ++ testLength
            )
        , testProperty1 flexWrap
            { functionName = "flexWrap", property = "flex-wrap" }
            [ ( wrap, "wrap" )
            , ( nowrap, "nowrap" )
            , ( wrapReverse, "wrap-reverse" )
            ]
        , testProperty1 flexGrow
            { functionName = "flexGrow", property = "flex-grow" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( calc (num 2) (times (num 4)), "calc(2 * 4)" )
            ]
        , testProperty1 flexShrink
            { functionName = "flexShrink", property = "flex-shrink" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( calc (num 2) (times (num 4)), "calc(2 * 4)" )
            ]
        , testProperty1 flexDirection
            { functionName = "flexDirection", property = "flex-direction" }
            [ ( row, "row" )
            , ( rowReverse, "row-reverse" )
            , ( column, "column" )
            , ( columnReverse, "column-reverse" )
            ]
        , testProperty1 flexFlow
            { functionName = "flexFlow", property = "flex-flow" }
            [ ( row, "row" )
            , ( rowReverse, "row-reverse" )
            , ( column, "column" )
            , ( columnReverse, "column-reverse" )
            , ( nowrap, "nowrap" )
            , ( wrap, "wrap" )
            , ( wrapReverse, "wrap-reverse" )
            ]
        , testProperty { functionName = "flexFlow2", property = "flex-flow" }
            [ ( flexFlow2 row wrap, "row wrap" )
            , ( flexFlow2 row nowrap, "row nowrap" )
            , ( flexFlow2 row wrapReverse, "row wrap-reverse" )
            , ( flexFlow2 rowReverse wrap, "row-reverse wrap" )
            , ( flexFlow2 rowReverse nowrap, "row-reverse nowrap" )
            , ( flexFlow2 rowReverse wrapReverse, "row-reverse wrap-reverse" )
            , ( flexFlow2 column wrap, "column wrap" )
            , ( flexFlow2 column nowrap, "column nowrap" )
            , ( flexFlow2 column wrapReverse, "column wrap-reverse" )
            , ( flexFlow2 columnReverse wrap, "column-reverse wrap" )
            , ( flexFlow2 columnReverse nowrap, "column-reverse nowrap" )
            , ( flexFlow2 columnReverse wrapReverse, "column-reverse wrap-reverse" )
            ]
        , testProperty1 order
            { functionName = "order", property = "order" }
            [ ( int 1, "1" )
            , ( int -4, "-4" )
            ]
        , testProperty1 fontWeight
            { functionName = "fontWeight", property = "font-weight" }
            [ ( bold, "bold" )
            , ( normal, "normal" )
            , ( bolder, "bolder" )
            , ( lighter, "lighter" )
            , ( int 100, "100" )
            , ( int 200, "200" )
            , ( int 300, "300" )
            , ( int 400, "400" )
            , ( int 500, "500" )
            , ( int 600, "600" )
            , ( int 700, "700" )
            , ( int 800, "800" )
            , ( int 900, "900" )
            ]
        , testProperty1 fontStyle
            { functionName = "fontStyle", property = "font-style" }
            [ ( normal, "normal" )
            , ( italic, "italic" )
            , ( oblique, "oblique" )
            ]
        , testProperty1 fontFeatureSettings
            { functionName = "fontFeatureSettings", property = "font-feature-settings" }
            [ ( featureTag "smcp", "\"smcp\"" )
            , ( featureTag2 "liga" 0, "\"liga\" 0" )
            , ( normal, "normal" )
            ]
        , testProperty { functionName = "fontFeatureSettingsList", property = "font-feature-settings" }
            [ ( fontFeatureSettingsList (featureTag2 "liga" 0) [ featureTag2 "swsh" 2 ], "\"liga\" 0,\"swsh\" 2" )
            , ( fontFeatureSettingsList (featureTag "ss13") [], "\"ss13\"" )
            ]
        , testProperty1 alignContent
            { functionName = "alignContent", property = "align-content" }
            [ ( normal, "normal" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( spaceBetween, "space-between" )
            , ( spaceAround, "space-around" )
            , ( spaceEvenly, "space-evenly" )
            , ( stretch, "stretch" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            ]
        , testProperty { functionName = "alignContent2", property = "align-content" }
            [ ( alignContent2 safe center, "safe center" )
            , ( alignContent2 unsafe start, "unsafe start" )
            , ( alignContent2 safe end, "safe end" )
            , ( alignContent2 unsafe flexStart, "unsafe flex-start" )
            , ( alignContent2 safe flexEnd, "safe flex-end" )
            ]
        , testProperty1 alignItems
            { functionName = "alignItems", property = "align-items" }
            [ ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            ]
        , testProperty { functionName = "alignItems2", property = "align-items" }
            [ ( alignItems2 safe center, "safe center" )
            , ( alignItems2 unsafe start, "unsafe start" )
            , ( alignItems2 safe end, "safe end" )
            , ( alignItems2 unsafe flexStart, "unsafe flex-start" )
            , ( alignItems2 safe flexEnd, "safe flex-end" )
            , ( alignItems2 unsafe selfStart, "unsafe self-start" )
            , ( alignItems2 safe selfEnd, "safe self-end" )
            ]
        , testProperty1 alignSelf
            { functionName = "alignSelf", property = "align-self" }
            [ ( auto, "auto" )
            , ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            ]
        , testProperty { functionName = "alignSelf2", property = "align-self" }
            [ ( alignSelf2 safe center, "safe center" )
            , ( alignSelf2 unsafe start, "unsafe start" )
            , ( alignSelf2 safe end, "safe end" )
            , ( alignSelf2 unsafe flexStart, "unsafe flex-start" )
            , ( alignSelf2 safe flexEnd, "safe flex-end" )
            , ( alignSelf2 unsafe selfStart, "unsafe self-start" )
            , ( alignSelf2 safe selfEnd, "safe self-end" )
            ]
        , testProperty1 justifyContent
            { functionName = "justifyContent", property = "justify-content" }
            [ ( normal, "normal" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( spaceAround, "space-around" )
            , ( spaceBetween, "space-between" )
            , ( spaceEvenly, "space-evenly" )
            , ( stretch, "stretch" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]
        , testProperty { functionName = "justifyContent2", property = "justify-content" }
            [ ( justifyContent2 safe center, "safe center" )
            , ( justifyContent2 unsafe start, "unsafe start" )
            , ( justifyContent2 safe end, "safe end" )
            , ( justifyContent2 unsafe flexStart, "unsafe flex-start" )
            , ( justifyContent2 safe flexEnd, "safe flex-end" )
            ]
        , testProperty1 justifyItems
            { functionName = "justifyItems", property = "justify-items" }
            [ ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            , ( left_, "left" )
            , ( right_, "right" )
            , ( legacy, "legacy" )
            , ( legacyLeft, "legacy left" )
            , ( legacyRight, "legacy right" )
            , ( legacyCenter, "legacy center" )
            ]
        , testProperty { functionName = "justifyItems2", property = "justify-items" }
            [ ( justifyItems2 safe center, "safe center" )
            , ( justifyItems2 unsafe start, "unsafe start" )
            , ( justifyItems2 safe end, "safe end" )
            , ( justifyItems2 unsafe flexStart, "unsafe flex-start" )
            , ( justifyItems2 safe flexEnd, "safe flex-end" )
            , ( justifyItems2 unsafe selfStart, "unsafe self-start" )
            , ( justifyItems2 safe selfEnd, "safe self-end" )
            , ( justifyItems2 unsafe left_, "unsafe left" )
            , ( justifyItems2 safe right_, "safe right" )
            ]
        , testProperty1 justifySelf
            { functionName = "justifySelf", property = "justify-self" }
            [ ( auto, "auto" )
            , ( normal, "normal" )
            , ( stretch, "stretch" )
            , ( baseline, "baseline" )
            , ( firstBaseline, "first baseline" )
            , ( lastBaseline, "last baseline" )
            , ( center, "center" )
            , ( start, "start" )
            , ( end, "end" )
            , ( flexStart, "flex-start" )
            , ( flexEnd, "flex-end" )
            , ( selfStart, "self-start" )
            , ( selfEnd, "self-end" )
            , ( left_, "left" )
            , ( right_, "right" )
            ]
        , testProperty { functionName = "justifySelf2", property = "justify-self" }
            [ ( justifySelf2 safe center, "safe center" )
            , ( justifySelf2 unsafe start, "unsafe start" )
            , ( justifySelf2 safe end, "safe end" )
            , ( justifySelf2 unsafe flexStart, "unsafe flex-start" )
            , ( justifySelf2 safe flexEnd, "safe flex-end" )
            , ( justifySelf2 unsafe selfStart, "unsafe self-start" )
            , ( justifySelf2 safe selfEnd, "safe self-end" )
            , ( justifySelf2 unsafe left_, "unsafe left" )
            , ( justifySelf2 safe right_, "safe right" )
            ]
        , testProperty1 opacity
            { functionName = "opacity", property = "opacity" }
            [ ( num 0.2, "0.2" )
            , ( zero, "0" )
            , ( pct 23.4, "23.4%" )
            ]
        , testProperty1 color
            { functionName = "color", property = "color" }
            testColor
        , testProperty1 cursor
            { functionName = "cursor", property = "cursor" }
            [ ( pointer, "pointer" )
            , ( crosshair, "crosshair" )
            , ( contextMenu, "context-menu" )
            , ( help, "help" )
            , ( Css.progress, "progress" )
            , ( wait, "wait" )
            , ( cell, "cell" )
            , ( text, "text" )
            , ( verticalText, "vertical-text" )
            , ( alias, "alias" )
            , ( copy, "copy" )
            , ( move, "move" )
            , ( noDrop, "no-drop" )
            , ( notAllowed, "not-allowed" )
            , ( eResize, "e-resize" )
            , ( nResize, "n-resize" )
            , ( neResize, "ne-resize" )
            , ( nwResize, "nw-resize" )
            , ( sResize, "s-resize" )
            , ( seResize, "se-resize" )
            , ( swResize, "sw-resize" )
            , ( wResize, "w-resize" )
            , ( ewResize, "ew-resize" )
            , ( nsResize, "ns-resize" )
            , ( neswResize, "nesw-resize" )
            , ( nwseResize, "nwse-resize" )
            , ( colResize, "col-resize" )
            , ( rowResize, "row-resize" )
            , ( allScroll, "all-scroll" )
            , ( zoomIn, "zoom-in" )
            , ( zoomOut, "zoom-out" )
            , ( grab, "grab" )
            , ( grabbing, "grabbing" )
            , ( default, "default" )
            , ( auto, "auto" )
            , ( none, "none" )
            ]
        , testProperty { functionName = "cursor2", property = "cursor" }
            [ ( cursor2 (url "https://example.com") nwseResize, "url(https://example.com),nwse-resize" ) ]
        , testProperty { functionName = "cursor4", property = "cursor" }
            [ ( cursor4 (url "https://example.com") (num 4.3) zero zoomIn, "url(https://example.com) 4.3 0,zoom-in" )
            , ( cursor4 (url "https://example.com") zero (num 100) zoomIn, "url(https://example.com) 0 100,zoom-in" )
            ]
        , testProperty1 outline
            { functionName = "outline", property = "outline" }
            (( auto, "auto" )
                :: testLength
                ++ testColor
                ++ testLineStyle
            )
        , testProperty { functionName = "outline3", property = "outline" }
            [ ( outline3 (px 10) none (hsl 120 0.5 0.5), "10px none hsl(120,50%,50%)" )
            , ( outline3 (ch 2.3) auto (hsla 10 0.2 0.3 0.95), "2.3ch auto hsla(10,20%,30%,0.95)" )
            , ( outline3 (cm 3.1) solid (rgb 112 22 75), "3.1cm solid rgb(112,22,75)" )
            , ( outline3 (em 0.2) dotted (rgba 112 22 75 0.1), "0.2em dotted rgba(112,22,75,0.1)" )
            , ( outline3 (ex 10.5) dashed (hex "fadffe"), "10.5ex dashed #fadffe" )
            , ( outline3 (inches 1) hidden (hex "eef"), "1in hidden #eef" )
            , ( outline3 (mm 2.54) double (hex "#ddfead99"), "2.54mm double #ddfead99" )
            , ( outline3 (pc 8.7) groove (hex "#356265"), "8.7pc groove #356265" )
            , ( outline3 (pt 15.5) ridge (hex "#feda"), "15.5pt ridge #feda" )
            , ( outline3 (q 5) ridge currentcolor, "5Q ridge currentcolor" )
            , ( outline3 (rem 1.1) inset (hex "844c"), "1.1rem inset #844c" )
            , ( outline3 (vh 1.2) outset (hex "ef5f7e9f"), "1.2vh outset #ef5f7e9f" )
            , ( outline3 (vw 2.1) solid (rgb 112 22 75), "2.1vw solid rgb(112,22,75)" )
            , ( outline3 (vmax 3.5) solid (rgb 112 22 75), "3.5vmax solid rgb(112,22,75)" )
            , ( outline3 (vmin 4.2) solid (rgb 112 22 75), "4.2vmin solid rgb(112,22,75)" )
            , ( outline3 zero solid (rgb 112 22 75), "0 solid rgb(112,22,75)" )
            , ( outline3 (calc (rem 3.2) (minus (px 5.5))) solid (rgb 112 22 75), "calc(3.2rem - 5.5px) solid rgb(112,22,75)" )
            ]
        , testProperty1 outlineWidth
            { functionName = "outlineWidth", property = "outline-width" }
            testLineWidth
        , testProperty1 outlineColor
            { functionName = "outlineColor", property = "outline-color" }
            (( invert, "invert" ) :: testColor)
        , testProperty1 outlineStyle
            { functionName = "outlineStyle", property = "outline-style" }
            (( auto, "auto" ) :: testLineStyle)
        , testProperty1 outlineOffset
            { functionName = "outlineOffset", property = "outline-offset" }
            testLength
        , testProperty1 listStyleType
            { functionName = "listStyleType", property = "list-style-type" }
            testListStyleType
        , testProperty1 listStylePosition
            { functionName = "listStylePosition", property = "list-style-position" }
            [ ( inside, "inside" )
            , ( outside, "outside" )
            ]
        , testProperty1 listStyle
            { functionName = "listStyle", property = "list-style" }
            ([ ( inside, "inside" )
             , ( outside, "outside" )
             ]
                ++ testListStyleType
                ++ testImage
            )
        , testProperty { functionName = "listStyle2", property = "list-style" }
            [ ( listStyle2 none inside, "none inside" )
            , ( listStyle2 (string "arbitrary\n\"\\") outside, "\"arbitrary\\A \\\"\\\\\" outside" )
            , ( listStyle2 (customIdent "hello-world") inside, "hello-world inside" )
            , ( listStyle2 arabicIndic outside, "arabic-indic outside" )
            , ( listStyle2 armenian inside, "armenian inside" )
            , ( listStyle2 bengali outside, "bengali outside" )
            , ( listStyle2 cambodian inside, "cambodian inside" )
            , ( listStyle2 circle outside, "circle outside" )
            , ( listStyle2 cjkDecimal inside, "cjk-decimal inside" )
            , ( listStyle2 cjkEarthlyBranch outside, "cjk-earthly-branch outside" )
            , ( listStyle2 cjkHeavenlyStem inside, "cjk-heavenly-stem inside" )
            , ( listStyle2 cjkIdeographic outside, "cjk-ideographic outside" )
            , ( listStyle2 decimal inside, "decimal inside" )
            , ( listStyle2 decimalLeadingZero outside, "decimal-leading-zero outside" )
            , ( listStyle2 devanagari inside, "devanagari inside" )
            , ( listStyle2 disc outside, "disc outside" )
            , ( listStyle2 disclosureClosed inside, "disclosure-closed inside" )
            , ( listStyle2 disclosureOpen outside, "disclosure-open outside" )
            , ( listStyle2 ethiopicNumeric inside, "ethiopic-numeric inside" )
            , ( listStyle2 georgian outside, "georgian outside" )
            , ( listStyle2 gujarati inside, "gujarati inside" )
            , ( listStyle2 gurmukhi outside, "gurmukhi outside" )
            , ( listStyle2 hebrew inside, "hebrew inside" )
            , ( listStyle2 hiragana outside, "hiragana outside" )
            , ( listStyle2 hiraganaIroha inside, "hiragana-iroha inside" )
            , ( listStyle2 japaneseFormal outside, "japanese-formal outside" )
            , ( listStyle2 japaneseInformal inside, "japanese-informal inside" )
            , ( listStyle2 kannada outside, "kannada outside" )
            , ( listStyle2 katakana inside, "katakana inside" )
            , ( listStyle2 katakanaIroha outside, "katakana-iroha outside" )
            , ( listStyle2 khmer inside, "khmer inside" )
            , ( listStyle2 koreanHangulFormal outside, "korean-hangul-formal outside" )
            , ( listStyle2 koreanHanjaFormal inside, "korean-hanja-formal inside" )
            , ( listStyle2 koreanHanjaInformal outside, "korean-hanja-informal outside" )
            , ( listStyle2 lao inside, "lao inside" )
            , ( listStyle2 lowerAlpha outside, "lower-alpha outside" )
            , ( listStyle2 lowerArmenian inside, "lower-armenian inside" )
            , ( listStyle2 lowerGreek outside, "lower-greek outside" )
            , ( listStyle2 lowerLatin inside, "lower-latin inside" )
            , ( listStyle2 lowerRoman outside, "lower-roman outside" )
            , ( listStyle2 malayalam inside, "malayalam inside" )
            , ( listStyle2 myanmar outside, "myanmar outside" )
            , ( listStyle2 oriya inside, "oriya inside" )
            , ( listStyle2 persian outside, "persian outside" )
            , ( listStyle2 simpChineseFormal inside, "simp-chinese-formal inside" )
            , ( listStyle2 simpChineseInformal outside, "simp-chinese-informal outside" )
            , ( listStyle2 square inside, "square inside" )
            , ( listStyle2 tamil outside, "tamil outside" )
            , ( listStyle2 telugu inside, "telugu inside" )
            , ( listStyle2 thai outside, "thai outside" )
            , ( listStyle2 tibetan inside, "tibetan inside" )
            , ( listStyle2 tradChineseFormal outside, "trad-chinese-formal outside" )
            , ( listStyle2 tradChineseInformal inside, "trad-chinese-informal inside" )
            , ( listStyle2 upperAlpha outside, "upper-alpha outside" )
            , ( listStyle2 upperArmenian inside, "upper-armenian inside" )
            , ( listStyle2 upperLatin outside, "upper-latin outside" )
            , ( listStyle2 upperRoman inside, "upper-roman inside" )
            ]
        , testProperty { functionName = "listStyle3", property = "list-style" }
            [ ( listStyle3 none inside (url "https://example.com"), "none inside url(https://example.com)" )
            , ( listStyle3 (string "arbitrary\n\"\\") outside (linearGradient (stop <| hex "111") (stop <| hex "aaa") []), "\"arbitrary\\A \\\"\\\\\" outside linear-gradient(#111,#aaa)" )
            , ( listStyle3 (customIdent "hello-world") inside none, "hello-world inside none" )
            , ( listStyle3 arabicIndic outside none, "arabic-indic outside none" )
            , ( listStyle3 armenian inside none, "armenian inside none" )
            , ( listStyle3 bengali outside none, "bengali outside none" )
            , ( listStyle3 cambodian inside none, "cambodian inside none" )
            , ( listStyle3 circle outside none, "circle outside none" )
            , ( listStyle3 cjkDecimal inside none, "cjk-decimal inside none" )
            , ( listStyle3 cjkEarthlyBranch outside none, "cjk-earthly-branch outside none" )
            , ( listStyle3 cjkHeavenlyStem inside none, "cjk-heavenly-stem inside none" )
            , ( listStyle3 cjkIdeographic outside none, "cjk-ideographic outside none" )
            , ( listStyle3 decimal inside none, "decimal inside none" )
            , ( listStyle3 decimalLeadingZero outside none, "decimal-leading-zero outside none" )
            , ( listStyle3 devanagari inside none, "devanagari inside none" )
            , ( listStyle3 disc outside none, "disc outside none" )
            , ( listStyle3 disclosureClosed inside none, "disclosure-closed inside none" )
            , ( listStyle3 disclosureOpen outside none, "disclosure-open outside none" )
            , ( listStyle3 ethiopicNumeric inside none, "ethiopic-numeric inside none" )
            , ( listStyle3 georgian outside none, "georgian outside none" )
            , ( listStyle3 gujarati inside none, "gujarati inside none" )
            , ( listStyle3 gurmukhi outside none, "gurmukhi outside none" )
            , ( listStyle3 hebrew inside none, "hebrew inside none" )
            , ( listStyle3 hiragana outside none, "hiragana outside none" )
            , ( listStyle3 hiraganaIroha inside none, "hiragana-iroha inside none" )
            , ( listStyle3 japaneseFormal outside none, "japanese-formal outside none" )
            , ( listStyle3 japaneseInformal inside none, "japanese-informal inside none" )
            , ( listStyle3 kannada outside none, "kannada outside none" )
            , ( listStyle3 katakana inside none, "katakana inside none" )
            , ( listStyle3 katakanaIroha outside none, "katakana-iroha outside none" )
            , ( listStyle3 khmer inside none, "khmer inside none" )
            , ( listStyle3 koreanHangulFormal outside none, "korean-hangul-formal outside none" )
            , ( listStyle3 koreanHanjaFormal inside none, "korean-hanja-formal inside none" )
            , ( listStyle3 koreanHanjaInformal outside none, "korean-hanja-informal outside none" )
            , ( listStyle3 lao inside none, "lao inside none" )
            , ( listStyle3 lowerAlpha outside none, "lower-alpha outside none" )
            , ( listStyle3 lowerArmenian inside none, "lower-armenian inside none" )
            , ( listStyle3 lowerGreek outside none, "lower-greek outside none" )
            , ( listStyle3 lowerLatin inside none, "lower-latin inside none" )
            , ( listStyle3 lowerRoman outside none, "lower-roman outside none" )
            , ( listStyle3 malayalam inside none, "malayalam inside none" )
            , ( listStyle3 myanmar outside none, "myanmar outside none" )
            , ( listStyle3 oriya inside none, "oriya inside none" )
            , ( listStyle3 persian outside none, "persian outside none" )
            , ( listStyle3 simpChineseFormal inside none, "simp-chinese-formal inside none" )
            , ( listStyle3 simpChineseInformal outside none, "simp-chinese-informal outside none" )
            , ( listStyle3 square inside none, "square inside none" )
            , ( listStyle3 tamil outside none, "tamil outside none" )
            , ( listStyle3 telugu inside none, "telugu inside none" )
            , ( listStyle3 thai outside none, "thai outside none" )
            , ( listStyle3 tibetan inside none, "tibetan inside none" )
            , ( listStyle3 tradChineseFormal outside none, "trad-chinese-formal outside none" )
            , ( listStyle3 tradChineseInformal inside none, "trad-chinese-informal inside none" )
            , ( listStyle3 upperAlpha outside none, "upper-alpha outside none" )
            , ( listStyle3 upperArmenian inside none, "upper-armenian inside none" )
            , ( listStyle3 upperLatin outside none, "upper-latin outside none" )
            , ( listStyle3 upperRoman inside none, "upper-roman inside none" )
            ]
        , testProperty1 boxShadow
            { functionName = "boxShadow", property = "box-shadow" }
            [ ( none, "none" ) ]
        , testProperty { functionName = "boxShadows", property = "box-shadow" }
            [ ( boxShadows [], "none" )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                      }
                    ]
              , "1px 2px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , color = Just <| hex "#333"
                      }
                    ]
              , "1px 2px #333"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                      }
                    ]
              , "1px 2px 3px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , spreadRadius = Just <| px 3
                      }
                    ]
              , "1px 2px 0 3px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , inset = True
                      }
                    ]
              , "inset 2px 3px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , color = Just <| hex "333"
                      }
                    ]
              , "1px 2px 3px #333"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px #333"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                      }
                    ]
              , "1px 2px 3px 4px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , blurRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 4px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , spreadRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 0 4px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                        , color = Just <| hex "333"
                      }
                    ]
              , "1px 2px 3px 4px #333"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 1
                        , offsetY = px 2
                        , blurRadius = Just <| px 3
                        , spreadRadius = Just <| px 4
                        , inset = True
                      }
                    ]
              , "inset 1px 2px 3px 4px"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , blurRadius = Just <| px 4
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 4px #333"
              )
            , ( boxShadows
                    [ { defaultBoxShadow
                        | offsetX = px 2
                        , offsetY = px 3
                        , spreadRadius = Just <| px 4
                        , color = Just <| hex "333"
                        , inset = True
                      }
                    ]
              , "inset 2px 3px 0 4px #333"
              )
            , ( boxShadows
                    [ { offsetX = px 1
                      , offsetY = px 2
                      , blurRadius = Just <| px 3
                      , spreadRadius = Just <| px 4
                      , color = Just <| hex "333"
                      , inset = True
                      }
                    ]
              , "inset 1px 2px 3px 4px #333"
              )
            , ( boxShadows
                    [ { offsetX = px 1
                      , offsetY = px 2
                      , blurRadius = Just <| px 3
                      , spreadRadius = Just <| px 4
                      , color = Just <| hex "333"
                      , inset = True
                      }
                    , { defaultBoxShadow
                        | offsetX = pt 3
                        , offsetY = rem 2.8
                      }
                    ]
              , "inset 1px 2px 3px 4px #333, 3pt 2.8rem"
              )
            ]
        , testProperty1 zIndex
            { functionName = "zIndex", property = "z-index" }
            [ ( auto, "auto" )
            , ( int 5, "5" )
            ]
        , testProperty1 backgroundImage
            { functionName = "backgroundImage", property = "background-image" }
            (( none, "none" )
                :: testImage
            )
        , testProperty1 backgroundPosition
            { functionName = "backgroundPosition", property = "background-position" }
            ([ ( left_, "left" )
             , ( right_, "right" )
             , ( top_, "top" )
             , ( bottom_, "bottom" )
             , ( center, "center" )
             , ( pct 23, "23%" )
             ]
                ++ testLength
            )
        , testProperty { functionName = "backgroundPosition2", property = "background-position" }
            ([ ( backgroundPosition2 left_ top_, "left top" )
             , ( backgroundPosition2 right_ bottom_, "right bottom" )
             , ( backgroundPosition2 center center, "center center" )
             , ( backgroundPosition2 (pct 10) (pct 23), "10% 23%" )
             , ( backgroundPosition2 (px 2) top_, "2px top" )
             , ( backgroundPosition2 left_ (pct 5), "left 5%" )
             ]
                ++ testLength2 backgroundPosition2
            )
        , testProperty { functionName = "backgroundPosition3", property = "background-position" }
            [ ( backgroundPosition3 left_ (pct 10) center, "left 10% center" )
            , ( backgroundPosition3 left_ (ch 1) center, "left 1ch center" )
            , ( backgroundPosition3 right_ (cm 1) center, "right 1cm center" )
            , ( backgroundPosition3 top_ (em 1) center, "top 1em center" )
            , ( backgroundPosition3 bottom_ (ex 1) center, "bottom 1ex center" )
            , ( backgroundPosition3 left_ (inches 1) center, "left 1in center" )
            , ( backgroundPosition3 right_ (mm 1) center, "right 1mm center" )
            , ( backgroundPosition3 top_ (pc 1) center, "top 1pc center" )
            , ( backgroundPosition3 bottom_ (pt 1) center, "bottom 1pt center" )
            , ( backgroundPosition3 left_ (px 1) center, "left 1px center" )
            , ( backgroundPosition3 right_ (q 1) center, "right 1Q center" )
            , ( backgroundPosition3 top_ (rem 1) center, "top 1rem center" )
            , ( backgroundPosition3 bottom_ (vh 1) center, "bottom 1vh center" )
            , ( backgroundPosition3 left_ (vw 1) center, "left 1vw center" )
            , ( backgroundPosition3 right_ (vmax 1) center, "right 1vmax center" )
            , ( backgroundPosition3 top_ (vmin 1) center, "top 1vmin center" )
            , ( backgroundPosition3 bottom_ zero center, "bottom 0 center" )
            , ( backgroundPosition3 left_ (calc (rem 3) (plus (pct 2))) center, "left calc(3rem + 2%) center" )
            ]
        , testProperty { functionName = "backgroundPosition4", property = "background-position" }
            [ ( backgroundPosition4 left_ (pct 10) bottom_ (pt 20), "left 10% bottom 20pt" )
            , ( backgroundPosition4 left_ (ch 1) top_ (ch 2), "left 1ch top 2ch" )
            , ( backgroundPosition4 right_ (cm 1) top_ (cm 2), "right 1cm top 2cm" )
            , ( backgroundPosition4 left_ (em 1) bottom_ (em 2), "left 1em bottom 2em" )
            , ( backgroundPosition4 right_ (ex 1) bottom_ (ex 2), "right 1ex bottom 2ex" )
            , ( backgroundPosition4 left_ (inches 1) top_ (inches 2), "left 1in top 2in" )
            , ( backgroundPosition4 right_ (mm 1) top_ (mm 2), "right 1mm top 2mm" )
            , ( backgroundPosition4 left_ (pc 1) bottom_ (pc 2), "left 1pc bottom 2pc" )
            , ( backgroundPosition4 right_ (pt 1) bottom_ (pt 2), "right 1pt bottom 2pt" )
            , ( backgroundPosition4 left_ (px 1) top_ (px 2), "left 1px top 2px" )
            , ( backgroundPosition4 right_ (q 1) top_ (q 2), "right 1Q top 2Q" )
            , ( backgroundPosition4 left_ (rem 1) bottom_ (rem 2), "left 1rem bottom 2rem" )
            , ( backgroundPosition4 right_ (vh 1) bottom_ (vh 2), "right 1vh bottom 2vh" )
            , ( backgroundPosition4 left_ (vw 1) top_ (vw 2), "left 1vw top 2vw" )
            , ( backgroundPosition4 right_ (vmax 1) top_ (vmax 2), "right 1vmax top 2vmax" )
            , ( backgroundPosition4 left_ (vmin 1) bottom_ (vmin 2), "left 1vmin bottom 2vmin" )
            , ( backgroundPosition4 right_ (ex 1) bottom_ zero, "right 1ex bottom 0" )
            , ( backgroundPosition4 right_ zero bottom_ (em 2), "right 0 bottom 2em" )
            , ( backgroundPosition4 left_ (calc (rem 3) (plus (pct 2))) top_ (calc (vh 10) (dividedBy (num 3))), "left calc(3rem + 2%) top calc(10vh / 3)" )
            ]
        , testProperty1 borderRadius
            { functionName = "borderRadius", property = "border-radius" }
            (( pct 2, "2%" ) :: testLength)
        , testProperty { functionName = "borderRadius2", property = "border-radius" }
            (( borderRadius2 (pct 2) (pct 1), "2% 1%" ) :: testLength2 borderRadius2)
        , testProperty { functionName = "borderRadius3", property = "border-radius" }
            (( borderRadius3 (pct 1) (pct 2) (pct 3), "1% 2% 3%" ) :: testLength3 borderRadius3)
        , testProperty { functionName = "borderRadius4", property = "border-radius" }
            (( borderRadius4 (pct 1) (pct 2) (pct 3) (pct 4), "1% 2% 3% 4%" ) :: testLength4 borderRadius4)
        , testProperty { functionName = "important", property = "background-color" }
            [ ( backgroundColor (rgb 129 20 100) |> important, "rgb(129,20,100) !important" )
            , ( property "background-color" "#234 !IMPORTANT", "#234 !IMPORTANT" )
            ]
        , testProperty { functionName = "whiteSpace", property = "white-space" }
            [ ( whiteSpace initial, "initial" )
            , ( whiteSpace unset, "unset" )
            , ( whiteSpace inherit, "inherit" )
            , ( whiteSpace normal, "normal" )
            , ( whiteSpace nowrap, "nowrap" )
            , ( whiteSpace pre, "pre" )
            , ( whiteSpace preWrap, "pre-wrap" )
            , ( whiteSpace preLine, "pre-line" )
            ]
        , testProperty { functionName = "tableLayout", property = "table-layout" }
            [ ( tableLayout inherit, "inherit" )
            , ( tableLayout initial, "initial" )
            , ( tableLayout unset, "unset" )
            , ( tableLayout auto, "auto" )
            , ( tableLayout fixed, "fixed" )
            ]
        , testProperty1 animationName
            { functionName = "animationName", property = "animation-name" }
            [ ( none, "none" )
            , ( string "hi\\\"", "\"hi\\\\\\\"\"" )
            , ( customIdent "hello-world", "hello-world" )

            -- for animationName tests with keyframes, see the Keyframes module
            ]
        , testProperty { functionName = "animationNames", property = "animation-name" }
            [ ( animationNames (customIdent "hello-world") [ none, string "pulse" ], "hello-world,none,\"pulse\"" )
            , ( animationNames none [ customIdent "pulse" ], "none,pulse" )
            , ( animationNames (string "pulse") [], "\"pulse\"" )
            ]
        , testProperty1 animationDuration
            { functionName = "animationDuration", property = "animation-duration" }
            testTime
        , testProperty { functionName = "animationDurations", property = "animation-duration" }
            [ ( animationDurations (s 1) [ s 2.5, ms 10.3 ], "1s,2.5s,10.3ms" )
            , ( animationDurations (ms 310) [ s 3 ], "310ms,3s" )
            , ( animationDurations (ms 50) [], "50ms" )
            ]
        , testProperty1 animationTimingFunction
            { functionName = "animationTimingFunction", property = "animation-timing-function" }
            [ ( linear, "linear" )
            , ( ease, "ease" )
            , ( easeIn, "ease-in" )
            , ( easeOut, "ease-out" )
            , ( easeInOut, "ease-in-out" )
            , ( cubicBezier 0.3 2 0.8 5, "cubic-bezier(0.3,2,0.8,5)" )
            , ( stepStart, "step-start" )
            , ( stepEnd, "step-end" )
            , ( steps 4, "steps(4)" )
            , ( steps2 4 jumpStart, "steps(4,jump-start)" )
            , ( steps2 4 jumpEnd, "steps(4,jump-end)" )
            , ( steps2 4 jumpNone, "steps(4,jump-none)" )
            , ( steps2 4 jumpBoth, "steps(4,jump-both)" )
            , ( steps2 4 start, "steps(4,start)" )
            , ( steps2 4 end, "steps(4,end)" )
            ]
        , testProperty { functionName = "animationTimingFunctions", property = "animation-timing-function" }
            [ ( animationTimingFunctions linear [ ease, stepEnd ], "linear,ease,step-end" )
            , ( animationTimingFunctions ease [ steps2 4 end ], "ease,steps(4,end)" )
            , ( animationTimingFunctions easeIn [ cubicBezier 0.3 0 1 1 ], "ease-in,cubic-bezier(0.3,0,1,1)" )
            , ( animationTimingFunctions easeOut [ stepStart, stepEnd, steps 4 ], "ease-out,step-start,step-end,steps(4)" )
            , ( animationTimingFunctions easeInOut [ linear, easeIn, easeOut ], "ease-in-out,linear,ease-in,ease-out" )
            , ( animationTimingFunctions (cubicBezier 0.3 2 0.8 5) [], "cubic-bezier(0.3,2,0.8,5)" )
            , ( animationTimingFunctions stepStart [ steps2 4 start, steps2 3 jumpBoth ], "step-start,steps(4,start),steps(3,jump-both)" )
            , ( animationTimingFunctions stepEnd [ steps 5 ], "step-end,steps(5)" )
            , ( animationTimingFunctions (steps 4) [ linear, steps2 5 jumpStart, steps2 2 jumpEnd, steps2 10 jumpNone ], "steps(4),linear,steps(5,jump-start),steps(2,jump-end),steps(10,jump-none)" )
            , ( animationTimingFunctions (steps2 4 jumpStart) [], "steps(4,jump-start)" )
            ]
        , testProperty1 animationIterationCount
            { functionName = "animationIterationCount", property = "animation-iteration-count" }
            [ ( infinite, "infinite" )
            , ( num 3, "3" )
            , ( num 4.5, "4.5" )
            , ( zero, "0" )
            , ( calc (num 1) (dividedBy (num 3)), "calc(1 / 3)" )
            ]
        , testProperty { functionName = "animationIterationCounts", property = "animation-iteration-count" }
            [ ( animationIterationCounts infinite [ num 3, zero ], "infinite,3,0" )
            , ( animationIterationCounts zero [ infinite ], "0,infinite" )
            , ( animationIterationCounts (num 2) [ calc (num 4) (times (num 3)) ], "2,calc(4 * 3)" )
            , ( animationIterationCounts (calc (num 3) (plus <| num 4)) [], "calc(3 + 4)" )
            ]
        , testProperty1 animationDirection
            { functionName = "animationDirection", property = "animation-direction" }
            [ ( normal, "normal" )
            , ( reverse, "reverse" )
            , ( alternate, "alternate" )
            , ( alternateReverse, "alternate-reverse" )
            ]
        , testProperty { functionName = "animationDirections", property = "animation-direction" }
            [ ( animationDirections normal [ alternate, reverse ], "normal,alternate,reverse" )
            , ( animationDirections reverse [ normal, normal ], "reverse,normal,normal" )
            , ( animationDirections alternate [ alternateReverse ], "alternate,alternate-reverse" )
            , ( animationDirections alternateReverse [], "alternate-reverse" )
            ]
        , testProperty1 animationPlayState
            { functionName = "animationPlayState", property = "animation-play-state" }
            [ ( running, "running" )
            , ( paused, "paused" )
            ]
        , testProperty
            { functionName = "animationPlayStates", property = "animation-play-state" }
            [ ( animationPlayStates running [ running, running, paused, running ], "running,running,running,paused,running" )
            , ( animationPlayStates paused [ running ], "paused,running" )
            , ( animationPlayStates paused [], "paused" )
            ]
        , testProperty1 animationDelay
            { functionName = "animationDelay", property = "animation-delay" }
            testTime
        , testProperty { functionName = "animationDelays", property = "animation-delay" }
            [ ( animationDelays (s 1) [ s 2.5, ms 10.3 ], "1s,2.5s,10.3ms" )
            , ( animationDelays (ms 310) [ s 3 ], "310ms,3s" )
            , ( animationDelays (ms 50) [], "50ms" )
            ]
        , testProperty1 animationFillMode
            { functionName = "animationFillMode", property = "animation-fill-mode" }
            [ ( none, "none" )
            , ( forwards, "forwards" )
            , ( backwards, "backwards" )
            , ( both, "both" )
            ]
        , testProperty { functionName = "animationFillModes", property = "animation-fill-mode" }
            [ ( animationFillModes none [ forwards ], "none,forwards" )
            , ( animationFillModes forwards [ backwards, both ], "forwards,backwards,both" )
            , ( animationFillModes backwards [ none ], "backwards,none" )
            , ( animationFillModes both [], "both" )
            ]
        ]


type alias PropertyDescription =
    { functionName : String, property : String }


testProperty1 :
    (Value { provides | initial : Supported, inherit : Supported, unset : Supported, revert : Supported } -> Style)
    -> PropertyDescription
    -> List ( Value { provides | initial : Supported, inherit : Supported, unset : Supported, revert : Supported }, String )
    -> Test
testProperty1 propertyUnderTest description valuePairs =
    testProperty
        description
        (List.map (\( value, expected ) -> ( propertyUnderTest value, expected )) valuePairs
            ++ testCssWideValues propertyUnderTest
        )


testProperty : PropertyDescription -> List ( Style, String ) -> Test
testProperty { functionName, property } modifierPairs =
    Test.describe functionName
        (List.map (expectPropertyWorks property) modifierPairs)


expectPropertyWorks : String -> ( Style, String ) -> Test
expectPropertyWorks propertyName ( style, expectedStr ) =
    Test.describe (propertyName ++ ": " ++ expectedStr)
        [ Test.test "emitted as expected" <|
            \() ->
                toPropertyStrings [ style ]
                    |> Expect.equal [ propertyName ++ ":" ++ expectedStr ]
        ]



{- <https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Values_and_Units> -}


testCssWideValues :
    (Value
        { provides
            | initial : Supported
            , inherit : Supported
            , unset : Supported
            , revert : Supported
        }
     -> Style
    )
    -> List ( Style, String )
testCssWideValues propertyUnderTest =
    [ ( propertyUnderTest initial, "initial" )
    , ( propertyUnderTest inherit, "inherit" )
    , ( propertyUnderTest unset, "unset" )
    , ( propertyUnderTest revert, "revert" )
    ]


testLength :
    List
        ( Value
            { supported
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
        , String
        )
testLength =
    [ ( ch 2.3, "2.3ch" )
    , ( cm 13.3, "13.3cm" )
    , ( em 0.625, "0.625em" )
    , ( ex 3.14, "3.14ex" )
    , ( inches 2.54, "2.54in" )
    , ( mm 12.345, "12.345mm" )
    , ( pc 7.7, "7.7pc" )
    , ( pt 65.4, "65.4pt" )
    , ( px 1.5, "1.5px" )
    , ( q 8.4, "8.4Q" )
    , ( rem 5.3, "5.3rem" )
    , ( vh 99.54, "99.54vh" )
    , ( vw 33.333, "33.333vw" )
    , ( vmax 4.73, "4.73vmax" )
    , ( vmin 12.7, "12.7vmin" )
    , ( zero, "0" )
    , ( calc (rem 3.2) (minus (px 5.5)), "calc(3.2rem - 5.5px)" )
    ]


testLength2 :
    (Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
        }
     ->
        Value
            { value2
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     -> Style
    )
    -> List ( Style, String )
testLength2 propertyUnderTest =
    [ ( propertyUnderTest (ch 2.3) (ch 4.5), "2.3ch 4.5ch" )
    , ( propertyUnderTest (cm 13.3) (cm 2.8), "13.3cm 2.8cm" )
    , ( propertyUnderTest (em 0.625) (em 1), "0.625em 1em" )
    , ( propertyUnderTest (ex 3.14) (ex 4.3), "3.14ex 4.3ex" )
    , ( propertyUnderTest (inches 2.54) (inches 0.5), "2.54in 0.5in" )
    , ( propertyUnderTest (mm 12.345) (mm 2.54), "12.345mm 2.54mm" )
    , ( propertyUnderTest (pc 7.7) (pc 3), "7.7pc 3pc" )
    , ( propertyUnderTest (pt 65.4) (pt 12), "65.4pt 12pt" )
    , ( propertyUnderTest (px 1.5) (px 25), "1.5px 25px" )
    , ( propertyUnderTest (q 8.4) (q 24), "8.4Q 24Q" )
    , ( propertyUnderTest (rem 5.3) (rem 2), "5.3rem 2rem" )
    , ( propertyUnderTest (vh 99.54) (vh 20), "99.54vh 20vh" )
    , ( propertyUnderTest (vw 33.333) (vw 14), "33.333vw 14vw" )
    , ( propertyUnderTest (vmax 4.73) (vmax 3), "4.73vmax 3vmax" )
    , ( propertyUnderTest (vmin 12.7) (vmin 5.4), "12.7vmin 5.4vmin" )
    , ( propertyUnderTest zero zero, "0 0" )
    , ( propertyUnderTest (calc (rem 3.2) (minus (px 5.5))) (calc (pt 12.5) (plus (ex 2))), "calc(3.2rem - 5.5px) calc(12.5pt + 2ex)" )
    ]


testLength3 :
    (Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
        }
     ->
        Value
            { value2
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     ->
        Value
            { value3
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     -> Style
    )
    -> List ( Style, String )
testLength3 propertyUnderTest =
    [ ( propertyUnderTest (ch 2.3) (ch 4.5) (ch 26), "2.3ch 4.5ch 26ch" )
    , ( propertyUnderTest (cm 13.3) (cm 2.8) (cm 4.2), "13.3cm 2.8cm 4.2cm" )
    , ( propertyUnderTest (em 0.625) (em 1) (em 3.4), "0.625em 1em 3.4em" )
    , ( propertyUnderTest (ex 3.14) (ex 4.3) (ex 7), "3.14ex 4.3ex 7ex" )
    , ( propertyUnderTest (inches 2.54) (inches 0.5) (inches 1.3), "2.54in 0.5in 1.3in" )
    , ( propertyUnderTest (mm 12.345) (mm 2.54) (mm 4), "12.345mm 2.54mm 4mm" )
    , ( propertyUnderTest (pc 7.7) (pc 3) (pc 5), "7.7pc 3pc 5pc" )
    , ( propertyUnderTest (pt 65.4) (pt 12) (pt 5), "65.4pt 12pt 5pt" )
    , ( propertyUnderTest (px 1.5) (px 25) (px 100), "1.5px 25px 100px" )
    , ( propertyUnderTest (q 8.4) (q 24) (q 1.8), "8.4Q 24Q 1.8Q" )
    , ( propertyUnderTest (rem 5.3) (rem 2) (rem 7), "5.3rem 2rem 7rem" )
    , ( propertyUnderTest (vh 99.54) (vh 20) (vh 4), "99.54vh 20vh 4vh" )
    , ( propertyUnderTest (vw 33.333) (vw 14) (vw 6), "33.333vw 14vw 6vw" )
    , ( propertyUnderTest (vmax 4.73) (vmax 3) (vmax 8), "4.73vmax 3vmax 8vmax" )
    , ( propertyUnderTest (vmin 12.7) (vmin 5.4) (vmin 5), "12.7vmin 5.4vmin 5vmin" )
    , ( propertyUnderTest zero zero zero, "0 0 0" )
    , ( propertyUnderTest
            (calc (rem 3.2) (minus (px 5.5)))
            (calc (pt 12.5) (plus (ex 2)))
            (calc (vh 1) (times (num 3)))
      , "calc(3.2rem - 5.5px) calc(12.5pt + 2ex) calc(1vh * 3)"
      )
    ]


testLength4 :
    (Value
        { value1
            | ch : Supported
            , cm : Supported
            , em : Supported
            , ex : Supported
            , inches : Supported
            , mm : Supported
            , pc : Supported
            , pt : Supported
            , px : Supported
            , q : Supported
            , rem : Supported
            , vh : Supported
            , vw : Supported
            , vmax : Supported
            , vmin : Supported
            , zero : Supported
            , calc : Supported
        }
     ->
        Value
            { value2
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     ->
        Value
            { value3
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     ->
        Value
            { value4
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
            }
     -> Style
    )
    -> List ( Style, String )
testLength4 propertyUnderTest =
    [ ( propertyUnderTest (ch 2.3) (ch 4.5) (ch 26) (ch 1), "2.3ch 4.5ch 26ch 1ch" )
    , ( propertyUnderTest (cm 13.3) (cm 2.8) (cm 4.2) (cm 1), "13.3cm 2.8cm 4.2cm 1cm" )
    , ( propertyUnderTest (em 0.625) (em 1) (em 3.4) (em 1), "0.625em 1em 3.4em 1em" )
    , ( propertyUnderTest (ex 3.14) (ex 4.3) (ex 7) (ex 1), "3.14ex 4.3ex 7ex 1ex" )
    , ( propertyUnderTest (inches 2.54) (inches 0.5) (inches 1.3) (inches 1), "2.54in 0.5in 1.3in 1in" )
    , ( propertyUnderTest (mm 12.345) (mm 2.54) (mm 4) (mm 1), "12.345mm 2.54mm 4mm 1mm" )
    , ( propertyUnderTest (pc 7.7) (pc 3) (pc 5) (pc 1), "7.7pc 3pc 5pc 1pc" )
    , ( propertyUnderTest (pt 65.4) (pt 12) (pt 5) (pt 1), "65.4pt 12pt 5pt 1pt" )
    , ( propertyUnderTest (px 1.5) (px 25) (px 100) (px 1), "1.5px 25px 100px 1px" )
    , ( propertyUnderTest (q 8.4) (q 24) (q 1.8) (q 1), "8.4Q 24Q 1.8Q 1Q" )
    , ( propertyUnderTest (rem 5.3) (rem 2) (rem 7) (rem 1), "5.3rem 2rem 7rem 1rem" )
    , ( propertyUnderTest (vh 99.54) (vh 20) (vh 4) (vh 1), "99.54vh 20vh 4vh 1vh" )
    , ( propertyUnderTest (vw 33.333) (vw 14) (vw 6) (vw 1), "33.333vw 14vw 6vw 1vw" )
    , ( propertyUnderTest (vmax 4.73) (vmax 3) (vmax 8) (vmax 1), "4.73vmax 3vmax 8vmax 1vmax" )
    , ( propertyUnderTest (vmin 12.7) (vmin 5.4) (vmin 5) (vmin 1), "12.7vmin 5.4vmin 5vmin 1vmin" )
    , ( propertyUnderTest zero zero zero zero, "0 0 0 0" )
    , ( propertyUnderTest
            (calc (rem 3.2) (minus (px 5.5)))
            (calc (pt 12.5) (plus (ex 2)))
            (calc (vh 1) (times (num 3)))
            (calc (pt 16) (dividedBy (num 2.3)))
      , "calc(3.2rem - 5.5px) calc(12.5pt + 2ex) calc(1vh * 3) calc(16pt / 2.3)"
      )
    ]


testLineWidth :
    List
        ( Value
            { supported
                | ch : Supported
                , cm : Supported
                , em : Supported
                , ex : Supported
                , inches : Supported
                , mm : Supported
                , pc : Supported
                , pt : Supported
                , px : Supported
                , q : Supported
                , rem : Supported
                , vh : Supported
                , vw : Supported
                , vmax : Supported
                , vmin : Supported
                , zero : Supported
                , calc : Supported
                , thin : Supported
                , medium : Supported
                , thick : Supported
            }
        , String
        )
testLineWidth =
    testLength
        ++ [ ( thin, "thin" )
           , ( medium, "medium" )
           , ( thick, "thick" )
           ]


testLineStyle :
    List
        ( Value
            { provides
                | none : Supported
                , solid : Supported
                , dotted : Supported
                , dashed : Supported
                , hidden : Supported
                , double : Supported
                , groove : Supported
                , ridge : Supported
                , inset : Supported
                , outset : Supported
            }
        , String
        )
testLineStyle =
    [ ( none, "none" )
    , ( solid, "solid" )
    , ( dotted, "dotted" )
    , ( dashed, "dashed" )
    , ( hidden, "hidden" )
    , ( double, "double" )
    , ( groove, "groove" )
    , ( ridge, "ridge" )
    , ( inset, "inset" )
    , ( outset, "outset" )
    ]


testColor :
    List
        ( Value
            { provides
                | hsl : Supported
                , hsla : Supported
                , rgb : Supported
                , rgba : Supported
                , hex : Supported
                , currentcolor : Supported
            }
        , String
        )
testColor =
    [ ( hsl 120 0.5 0.5, "hsl(120,50%,50%)" )
    , ( hsla 120 0.5 0.5 0.5, "hsla(120,50%,50%,0.5)" )
    , ( rgb 255 230 211, "rgb(255,230,211)" )
    , ( rgba 12 2 33 0.95, "rgba(12,2,33,0.95)" )
    , ( hex "fff", "#fff" )
    , ( hex "#14ac34", "#14ac34" )
    , ( hex "#000c", "#000c" )
    , ( hex "00112233", "#00112233" )
    , ( currentcolor, "currentcolor" )
    ]


testImage :
    List
        ( Value
            { provides
                | url : Supported
                , linearGradient : Supported
                , radialGradient : Supported
                , repeatingLinearGradient : Supported
                , repeatingRadialGradient : Supported
            }
        , String
        )
testImage =
    [ ( url "https://example.com", "url(https://example.com)" )
    , ( linearGradient (stop <| hex "111") (stop <| hex "222") [], "linear-gradient(#111,#222)" )

    --TODO radialGradient
    --TODO repeatingLinearGradient
    --TODO repeatingRadialGradient
    ]


testListStyleType :
    List
        ( Value
            { supported
                | customIdent : Supported
                , string : Supported
                , none : Supported
                , arabicIndic : Supported
                , armenian : Supported
                , bengali : Supported
                , cambodian : Supported
                , circle : Supported
                , cjkDecimal : Supported
                , cjkEarthlyBranch : Supported
                , cjkHeavenlyStem : Supported
                , cjkIdeographic : Supported
                , decimal : Supported
                , decimalLeadingZero : Supported
                , devanagari : Supported
                , disc : Supported
                , disclosureClosed : Supported
                , disclosureOpen : Supported
                , ethiopicNumeric : Supported
                , georgian : Supported
                , gujarati : Supported
                , gurmukhi : Supported
                , hebrew : Supported
                , hiragana : Supported
                , hiraganaIroha : Supported
                , japaneseFormal : Supported
                , japaneseInformal : Supported
                , kannada : Supported
                , katakana : Supported
                , katakanaIroha : Supported
                , khmer : Supported
                , koreanHangulFormal : Supported
                , koreanHanjaFormal : Supported
                , koreanHanjaInformal : Supported
                , lao : Supported
                , lowerAlpha : Supported
                , lowerArmenian : Supported
                , lowerGreek : Supported
                , lowerLatin : Supported
                , lowerRoman : Supported
                , malayalam : Supported
                , monogolian : Supported
                , myanmar : Supported
                , oriya : Supported
                , persian : Supported
                , simpChineseFormal : Supported
                , simpChineseInformal : Supported
                , square : Supported
                , tamil : Supported
                , telugu : Supported
                , thai : Supported
                , tibetan : Supported
                , tradChineseFormal : Supported
                , tradChineseInformal : Supported
                , upperAlpha : Supported
                , upperArmenian : Supported
                , upperLatin : Supported
                , upperRoman : Supported
            }
        , String
        )
testListStyleType =
    [ ( none, "none" )
    , ( string "arbitrary\n\"\\", "\"arbitrary\\A \\\"\\\\\"" )
    , ( customIdent "hello-world", "hello-world" )
    , ( arabicIndic, "arabic-indic" )
    , ( armenian, "armenian" )
    , ( bengali, "bengali" )
    , ( cambodian, "cambodian" )
    , ( circle, "circle" )
    , ( cjkDecimal, "cjk-decimal" )
    , ( cjkEarthlyBranch, "cjk-earthly-branch" )
    , ( cjkHeavenlyStem, "cjk-heavenly-stem" )
    , ( cjkIdeographic, "cjk-ideographic" )
    , ( decimal, "decimal" )
    , ( decimalLeadingZero, "decimal-leading-zero" )
    , ( devanagari, "devanagari" )
    , ( disc, "disc" )
    , ( disclosureClosed, "disclosure-closed" )
    , ( disclosureOpen, "disclosure-open" )
    , ( ethiopicNumeric, "ethiopic-numeric" )
    , ( georgian, "georgian" )
    , ( gujarati, "gujarati" )
    , ( gurmukhi, "gurmukhi" )
    , ( hebrew, "hebrew" )
    , ( hiragana, "hiragana" )
    , ( hiraganaIroha, "hiragana-iroha" )
    , ( japaneseFormal, "japanese-formal" )
    , ( japaneseInformal, "japanese-informal" )
    , ( kannada, "kannada" )
    , ( katakana, "katakana" )
    , ( katakanaIroha, "katakana-iroha" )
    , ( khmer, "khmer" )
    , ( koreanHangulFormal, "korean-hangul-formal" )
    , ( koreanHanjaFormal, "korean-hanja-formal" )
    , ( koreanHanjaInformal, "korean-hanja-informal" )
    , ( lao, "lao" )
    , ( lowerAlpha, "lower-alpha" )
    , ( lowerArmenian, "lower-armenian" )
    , ( lowerGreek, "lower-greek" )
    , ( lowerLatin, "lower-latin" )
    , ( lowerRoman, "lower-roman" )
    , ( malayalam, "malayalam" )
    , ( myanmar, "myanmar" )
    , ( oriya, "oriya" )
    , ( persian, "persian" )
    , ( simpChineseFormal, "simp-chinese-formal" )
    , ( simpChineseInformal, "simp-chinese-informal" )
    , ( square, "square" )
    , ( tamil, "tamil" )
    , ( telugu, "telugu" )
    , ( thai, "thai" )
    , ( tibetan, "tibetan" )
    , ( tradChineseFormal, "trad-chinese-formal" )
    , ( tradChineseInformal, "trad-chinese-informal" )
    , ( upperAlpha, "upper-alpha" )
    , ( upperArmenian, "upper-armenian" )
    , ( upperLatin, "upper-latin" )
    , ( upperRoman, "upper-roman" )
    ]


testTime :
    List
        ( Value
            { supported
                | s : Supported
                , ms : Supported
            }
        , String
        )
testTime =
    [ ( s 1.2, "1.2s" )
    , ( ms 300, "300ms" )
    ]
