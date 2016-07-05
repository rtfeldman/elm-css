module Properties exposing (all)

import Test exposing (..)
import Expect
import TestUtil exposing (prettyPrint)
import Css exposing (..)
import Css.Elements exposing (p)
import Css.Namespace exposing (namespace)


all : Test
all =
    describe "properties"
        [ testProperty "box-sizing"
            [ ( boxSizing initial, "initial" )
            , ( boxSizing unset, "unset" )
            , ( boxSizing inherit, "inherit" )
            , ( boxSizing contentBox, "content-box" )
            , ( boxSizing borderBox, "border-box" )
            ]
        , testProperty "width"
            [ ( width initial, "initial" )
            , ( width unset, "unset" )
            , ( width inherit, "inherit" )
            , ( width auto, "auto" )
            , ( width (pct 90), "90%" )
            ]
        , testProperty "min-width"
            [ ( minWidth initial, "initial" )
            , ( minWidth unset, "unset" )
            , ( minWidth inherit, "inherit" )
            , ( minWidth maxContent, "max-content" )
            , ( minWidth minContent, "min-content" )
            , ( minWidth fitContent, "fit-content" )
            , ( minWidth fillAvailable, "fill-available" )
            , ( minWidth (pc 9), "9pc" )
            ]
        , testProperty "max-width"
            [ ( maxWidth initial, "initial" )
            , ( maxWidth unset, "unset" )
            , ( maxWidth inherit, "inherit" )
            , ( maxWidth none, "none" )
            , ( maxWidth maxContent, "max-content" )
            , ( maxWidth minContent, "min-content" )
            , ( maxWidth fitContent, "fit-content" )
            , ( maxWidth fillAvailable, "fill-available" )
            , ( maxWidth (cm 17), "17cm" )
            ]
        , testProperty "height"
            [ ( height initial, "initial" )
            , ( height unset, "unset" )
            , ( height inherit, "inherit" )
            , ( height auto, "auto" )
            , ( height (mm 8), "8mm" )
            ]
        , testProperty "min-height"
            [ ( minHeight initial, "initial" )
            , ( minHeight unset, "unset" )
            , ( minHeight inherit, "inherit" )
            , ( minHeight maxContent, "max-content" )
            , ( minHeight minContent, "min-content" )
            , ( minHeight fitContent, "fit-content" )
            , ( minHeight fillAvailable, "fill-available" )
            , ( minHeight (pc 9), "9pc" )
            ]
        , testProperty "max-height"
            [ ( maxHeight initial, "initial" )
            , ( maxHeight unset, "unset" )
            , ( maxHeight inherit, "inherit" )
            , ( maxHeight none, "none" )
            , ( maxHeight maxContent, "max-content" )
            , ( maxHeight minContent, "min-content" )
            , ( maxHeight fitContent, "fit-content" )
            , ( maxHeight fillAvailable, "fill-available" )
            , ( maxHeight (cm 17), "17cm" )
            ]
        , testProperty "text-indent"
            [ ( textIndent initial, "initial" )
            , ( textIndent unset, "unset" )
            , ( textIndent inherit, "inherit" )
            , ( textIndent (px 5), "5px" )
            , ( textIndent2 initial initial, "initial initial" )
            , ( textIndent2 unset unset, "unset unset" )
            , ( textIndent2 inherit inherit, "inherit inherit" )
            , ( textIndent2 (em 3) hanging, "3em hanging" )
            , ( textIndent2 (pc 2) eachLine, "2pc each-line" )
            ]
        , testProperty "text-decoration"
            [ ( textDecoration initial, "initial" )
            , ( textDecoration unset, "unset" )
            , ( textDecoration inherit, "inherit" )
            , ( textDecoration none, "none" )
            , ( textDecoration underline, "underline" )
            , ( textDecoration overline, "overline" )
            , ( textDecoration lineThrough, "line-through" )
            , ( textDecoration2 initial wavy, "initial wavy" )
            , ( textDecoration2 unset dotted, "unset dotted" )
            , ( textDecoration2 inherit dashed, "inherit dashed" )
            , ( textDecoration2 none solid, "none solid" )
            , ( textDecoration2 underline double, "underline double" )
            , ( textDecoration2 overline initial, "overline initial" )
            , ( textDecoration2 lineThrough unset, "line-through unset" )
            , ( textDecoration2 lineThrough inherit, "line-through inherit" )
            , ( textDecoration3 initial wavy (rgb 11 12 13), "initial wavy rgb(11, 12, 13)" )
            , ( textDecoration3 unset dotted (rgb 11 12 13), "unset dotted rgb(11, 12, 13)" )
            , ( textDecoration3 inherit dashed (rgb 11 12 13), "inherit dashed rgb(11, 12, 13)" )
            , ( textDecoration3 none solid (rgb 11 12 13), "none solid rgb(11, 12, 13)" )
            , ( textDecoration3 underline double (rgb 11 12 13), "underline double rgb(11, 12, 13)" )
            , ( textDecoration3 overline initial (rgb 11 12 13), "overline initial rgb(11, 12, 13)" )
            , ( textDecoration3 lineThrough unset (rgb 11 12 13), "line-through unset rgb(11, 12, 13)" )
            , ( textDecoration3 lineThrough inherit (rgb 11 12 13), "line-through inherit rgb(11, 12, 13)" )
            , ( textDecorations [], "none" )
            , ( textDecorations [ initial ], "initial" )
            , ( textDecorations [ unset, inherit ], "unset inherit" )
            , ( textDecorations [ none ], "none" )
            , ( textDecorations [ underline, overline, lineThrough ], "underline overline line-through" )
            , ( textDecorations2 [] double, "none double" )
            , ( textDecorations2 [ initial ] solid, "initial solid" )
            , ( textDecorations2 [ unset, inherit ] dashed, "unset inherit dashed" )
            , ( textDecorations2 [ none ] dotted, "none dotted" )
            , ( textDecorations2 [ underline, overline, lineThrough ] wavy, "underline overline line-through wavy" )
            , ( textDecorations2 [ underline, overline, lineThrough ] initial, "underline overline line-through initial" )
            , ( textDecorations2 [ underline, overline, lineThrough ] unset, "underline overline line-through unset" )
            , ( textDecorations2 [ underline, overline, lineThrough ] inherit, "underline overline line-through inherit" )
            , ( textDecorations3 [] double (rgb 11 12 13), "none double rgb(11, 12, 13)" )
            , ( textDecorations3 [ initial ] solid (rgb 11 12 13), "initial solid rgb(11, 12, 13)" )
            , ( textDecorations3 [ unset, inherit ] dashed (rgb 11 12 13), "unset inherit dashed rgb(11, 12, 13)" )
            , ( textDecorations3 [ none ] dotted (rgb 11 12 13), "none dotted rgb(11, 12, 13)" )
            , ( textDecorations3 [ underline, overline, lineThrough ] wavy (rgb 11 12 13), "underline overline line-through wavy rgb(11, 12, 13)" )
            , ( textDecorations3 [ underline, overline, lineThrough ] initial (rgb 11 12 13), "underline overline line-through initial rgb(11, 12, 13)" )
            , ( textDecorations3 [ underline, overline, lineThrough ] unset (rgb 11 12 13), "underline overline line-through unset rgb(11, 12, 13)" )
            , ( textDecorations3 [ underline, overline, lineThrough ] inherit (rgb 11 12 13), "underline overline line-through inherit rgb(11, 12, 13)" )
            ]
        , testProperty "text-decoration-line"
            [ ( textDecorationLine initial, "initial" )
            , ( textDecorationLine unset, "unset" )
            , ( textDecorationLine inherit, "inherit" )
            , ( textDecorationLine none, "none" )
            , ( textDecorationLine underline, "underline" )
            , ( textDecorationLine overline, "overline" )
            , ( textDecorationLine lineThrough, "line-through" )
            , ( textDecorationLines [], "none" )
            , ( textDecorationLines [ initial ], "initial" )
            , ( textDecorationLines [ unset, inherit ], "unset inherit" )
            , ( textDecorationLines [ none ], "none" )
            , ( textDecorationLines [ underline, overline, lineThrough ], "underline overline line-through" )
            ]
        , testProperty "overflow-x"
            [ ( overflowX initial, "initial" )
            , ( overflowX unset, "unset" )
            , ( overflowX inherit, "inherit" )
            , ( overflowX auto, "auto" )
            , ( overflowX visible, "visible" )
            , ( overflowX hidden, "hidden" )
            , ( overflowX scroll, "scroll" )
            ]
        , testProperty "overflow-y"
            [ ( overflowY initial, "initial" )
            , ( overflowY unset, "unset" )
            , ( overflowY inherit, "inherit" )
            , ( overflowY auto, "auto" )
            , ( overflowY visible, "visible" )
            , ( overflowY hidden, "hidden" )
            , ( overflowY scroll, "scroll" )
            ]
        , testProperty "overflow"
            [ ( overflow initial, "initial" )
            , ( overflow unset, "unset" )
            , ( overflow inherit, "inherit" )
            , ( overflow auto, "auto" )
            , ( overflow visible, "visible" )
            , ( overflow hidden, "hidden" )
            , ( overflow scroll, "scroll" )
            ]
        , testProperty "text-rendering"
            [ ( textRendering initial, "initial" )
            , ( textRendering unset, "unset" )
            , ( textRendering inherit, "inherit" )
            , ( textRendering auto, "auto" )
            , ( textRendering optimizeSpeed, "optimizeSpeed" )
            , ( textRendering optimizeLegibility, "optimizeLegibility" )
            , ( textRendering geometricPrecision, "geometricPrecision" )
            ]
        , testProperty "display"
            [ ( display initial, "initial" )
            , ( display unset, "unset" )
            , ( display inherit, "inherit" )
            , ( display none, "none" )
            , ( display inline, "inline" )
            , ( display block, "block" )
            , ( display inlineBlock, "inline-block" )
            , ( displayFlex, "flex" )
              -- TODO display: contents;
              -- TODO display: list-item;
              -- TODO display: inline-list-item;
              -- TODO display: table;
              -- TODO display: inline-table;
              -- TODO display: table-cell;
              -- TODO display: table-column;
              -- TODO display: table-column-group;
              -- TODO display: table-footer-group;
              -- TODO display: table-header-group;
              -- TODO display: table-row;
              -- TODO display: table-row-group;
              -- TODO display: flex;
              -- TODO display: inline-flex;
              -- TODO display: grid;
              -- TODO display: inline-grid;
              -- TODO display: ruby;
              -- TODO display: ruby-base;
              -- TODO display: ruby-text;
              -- TODO display: ruby-base-container;
              -- TODO display: ruby-text-container ;
              -- TODO display: run-in;
            ]
        , testProperty "flex"
            [ ( flex initial, "initial" )
            , ( flex unset, "unset" )
            , ( flex inherit, "inherit" )
            , ( flex auto, "auto" )
            , ( flex content, "content" )
            , ( flex none, "none" )
            , ( flex (int 2), "2" )
            , ( flex (mm 8), "8mm" )
            , ( flex2 (int 1) (int 2), "1 2" )
            , ( flex2 (int 1) (px 30), "1 30px" )
            , ( flex3 (int 1) (int 2) (px 20), "1 2 20px" )
            ]
        , testProperty "flex-basis"
            [ ( flexBasis initial, "initial" )
            , ( flexBasis unset, "unset" )
            , ( flexBasis inherit, "inherit" )
            , ( flexBasis auto, "auto" )
            , ( flexBasis content, "content" )
            , ( flexBasis (px 10), "10px" )
            , ( flexBasis (mm 8), "8mm" )
            ]
        , testProperty "flex-wrap"
            [ ( flexWrap initial, "initial" )
            , ( flexWrap unset, "unset" )
            , ( flexWrap inherit, "inherit" )
            , ( flexWrap wrap, "wrap" )
            , ( flexWrap noWrap, "nowrap" )
            , ( flexWrap wrapReverse, "wrap-reverse" )
            ]
        , testProperty "flex-grow"
            [ ( flexGrow (int 1), "1" )
            , ( flexGrow (float 0.2), "0.2" )
            ]
        , testProperty "flex-shrink"
            [ ( flexShrink (int 1), "1" )
            , ( flexShrink (float 0.2), "0.2" )
            ]
        , testProperty "flex-direction"
            [ ( flexDirection initial, "initial" )
            , ( flexDirection unset, "unset" )
            , ( flexDirection inherit, "inherit" )
            , ( flexDirection row, "row" )
            , ( flexDirection rowReverse, "row-reverse" )
            , ( flexDirection column, "column" )
            , ( flexDirection columnReverse, "column-reverse" )
            ]
        , testProperty "flex-flow"
            [ ( flexFlow1 initial, "initial" )
            , ( flexFlow1 unset, "unset" )
            , ( flexFlow1 inherit, "inherit" )
            , ( flexFlow1 row, "row" )
            , ( flexFlow1 rowReverse, "row-reverse" )
            , ( flexFlow1 column, "column" )
            , ( flexFlow1 columnReverse, "column-reverse" )
            , ( flexFlow1 noWrap, "nowrap" )
            , ( flexFlow1 wrap, "wrap" )
            , ( flexFlow1 wrapReverse, "wrap-reverse" )
            , ( flexFlow2 row wrap, "row wrap" )
            , ( flexFlow2 row noWrap, "row nowrap" )
            , ( flexFlow2 row wrapReverse, "row wrap-reverse" )
            , ( flexFlow2 rowReverse wrap, "row-reverse wrap" )
            , ( flexFlow2 rowReverse noWrap, "row-reverse nowrap" )
            , ( flexFlow2 rowReverse wrapReverse, "row-reverse wrap-reverse" )
            , ( flexFlow2 column wrap, "column wrap" )
            , ( flexFlow2 column noWrap, "column nowrap" )
            , ( flexFlow2 column wrapReverse, "column wrap-reverse" )
            , ( flexFlow2 columnReverse wrap, "column-reverse wrap" )
            , ( flexFlow2 columnReverse noWrap, "column-reverse nowrap" )
            , ( flexFlow2 columnReverse wrapReverse, "column-reverse wrap-reverse" )
            ]
        , testProperty "order"
            [ ( order (int 1), "1" ) ]
        , testProperty "font-weight"
            [ ( fontWeight bold, "bold" )
            , ( fontWeight (int 100), "100" )
            , ( fontWeight (int 200), "200" )
            , ( fontWeight (int 300), "300" )
            , ( fontWeight (int 400), "400" )
            , ( fontWeight (int 500), "500" )
            , ( fontWeight (int 600), "600" )
            , ( fontWeight (int 700), "700" )
            , ( fontWeight (int 800), "800" )
            , ( fontWeight (int 900), "900" )
            ]
        , testProperty "font-feature-settings"
            [ ( fontFeatureSettings (featureTag "smcp"), "\"smcp\" 1" )
            , ( fontFeatureSettings (featureTag2 "liga" 0), "\"liga\" 0" )
            , ( fontFeatureSettingsList [ featureTag2 "liga" 0, featureTag2 "swsh" 2 ], "\"liga\" 0, \"swsh\" 2" )
            , ( fontFeatureSettings normal, "normal" )
            ]
        , testProperty "align-items"
            [ ( alignItems flexStart, "flex-start" )
            , ( alignItems flexEnd, "flex-end" )
            , ( alignItems center, "center" )
            , ( alignItems baseline, "baseline" )
            , ( alignItems stretch, "stretch" )
            ]
        , testProperty "align-self"
            [ ( alignSelf flexStart, "flex-start" )
            , ( alignSelf flexEnd, "flex-end" )
            , ( alignSelf center, "center" )
            , ( alignSelf baseline, "baseline" )
            , ( alignSelf stretch, "stretch" )
            ]
        , testProperty "opacity"
            [ ( opacity inherit, "inherit" )
            , ( opacity (int 1), "1" )
            ]
        , testProperty "color"
            [ ( color (hsl 120 0.5 0.5), "hsl(120, 50%, 50%)" )
            , ( color (hsla 120 0.5 0.5 0.5), "hsla(120, 50%, 50%, 0.5)" )
            ]
        ]


testProperty : String -> List ( Mixin, String ) -> Test
testProperty propertyName modifierPairs =
    describe (propertyName ++ " property")
        (List.map (expectPropertyWorks propertyName) modifierPairs)


expectPropertyWorks : String -> ( Mixin, String ) -> Test
expectPropertyWorks propertyName ( mixin, expectedStr ) =
    describe "works properly"
        [ (test "pretty prints the expected output") <|
            \() ->
                prettyPrint ((stylesheet << namespace "test") [ p [ mixin ] ])
                    |> Expect.equal ("p {\n    " ++ propertyName ++ ": " ++ expectedStr ++ ";\n}")
        , (test "can be converted to a key-value pair") <|
            \() ->
                [ ( propertyName, expectedStr ) ]
                    |> Expect.equal (asPairs [ mixin ])
        ]
