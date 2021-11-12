module Css.Structure.Hash exposing (hashDeclarations)

import Css.String
import Css.Structure exposing (..)
import Css.Structure.Output as Output
import FNV1a
import String


hashDeclarations : List Declaration -> Int
hashDeclarations declarations =
    List.foldl hashDeclaration FNV1a.initialSeed declarations


hashDeclaration : Declaration -> Int -> Int
hashDeclaration decl hash =
    case decl of
        StyleBlockDeclaration styleBlock ->
            hashStyleBlock styleBlock hash

        MediaRule mediaQueries styleBlocks ->
            let
                queryHash =
                    List.map Output.mediaQueryToString mediaQueries
                        |> List.foldl FNV1a.hashWithSeed hash

                blockHash =
                    List.foldl hashStyleBlock queryHash styleBlocks
            in
            FNV1a.hashWithSeed "@media" blockHash

        SupportsRule _ _ ->
            hash

        DocumentRule _ _ _ _ _ ->
            hash

        PageRule _ _ ->
            hash

        FontFace _ ->
            hash

        Keyframes { name, declaration } ->
            List.foldl FNV1a.hashWithSeed hash [ "@keyframes", name, declaration ]

        Viewport _ ->
            hash

        CounterStyle _ ->
            hash

        FontFeatureValues _ ->
            hash


hashStyleBlock : StyleBlock -> Int -> Int
hashStyleBlock (StyleBlock firstSelector otherSelectors properties) hash =
    let
        selectorStr =
            (firstSelector :: otherSelectors)
                |> Css.String.mapJoin Output.selectorToString ", "
    in
    List.foldl FNV1a.hashWithSeed hash (selectorStr :: properties)
