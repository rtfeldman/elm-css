module Css.Structure.Hash exposing (hashDeclarations)

import Css.String
import Css.Structure exposing (..)
import Css.Structure.Output as Output
import Hash exposing (initialSeed)
import Murmur3


hashDeclarations : List Declaration -> Int
hashDeclarations declarations =
    List.foldl hashDeclaration initialSeed declarations


hashDeclaration : Declaration -> Int -> Int
hashDeclaration decl hash =
    case decl of
        StyleBlockDeclaration styleBlock ->
            hashStyleBlock styleBlock hash

        MediaRule mediaQueries styleBlocks ->
            let
                queryHash =
                    List.map Output.mediaQueryToString mediaQueries
                        |> List.foldl foldHash hash

                blockHash =
                    List.foldl hashStyleBlock queryHash styleBlocks
            in
            foldHash "@media" blockHash

        SupportsRule _ _ ->
            hash

        DocumentRule _ _ _ _ _ ->
            hash

        PageRule _ _ ->
            hash

        FontFace _ ->
            hash

        Keyframes { name, declaration } ->
            List.foldl foldHash hash [ "@keyframes", name, declaration ]

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
    List.foldl foldHash hash (selectorStr :: properties)


foldHash : String -> Int -> Int
foldHash str hash =
    Murmur3.hashString hash str
