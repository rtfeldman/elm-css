module Css.Structure.Hash exposing (hashDeclarations)

import Css.Structure exposing (..)
import Css.Structure.Output as Output
import Hash exposing (hash)
import String


hashDeclarations : List Declaration -> Int
hashDeclarations declarations =
    List.foldl hashDeclaration Hash.initialSeed declarations


hashDeclaration : Declaration -> Int -> Int
hashDeclaration decl hash =
    case decl of
        StyleBlockDeclaration styleBlock ->
            hashStyleBlock styleBlock hash

        MediaRule mediaQueries styleBlocks ->
            let
                queryHash =
                    List.map Output.mediaQueryToString mediaQueries
                        |> List.foldl Hash.hash hash

                blockHash =
                    List.foldl hashStyleBlock queryHash styleBlocks
            in
            Hash.hash "@media" blockHash

        SupportsRule _ _ ->
            hash

        DocumentRule _ _ _ _ _ ->
            hash

        PageRule _ _ ->
            hash

        FontFace _ ->
            hash

        Keyframes { name, declaration } ->
            List.foldl Hash.hash hash [ "@keyframes", name, declaration ]

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
                |> List.map Output.selectorToString
                |> String.join ", "
    in
    List.foldl Hash.hash hash (selectorStr :: properties)
