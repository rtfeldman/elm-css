module Css.String exposing (mapJoin)


mapJoin : (a -> String) -> String -> List a -> String
mapJoin map sep strs =
    mapJoinHelp map sep strs ""


mapJoinHelp : (a -> String) -> String -> List a -> String -> String
mapJoinHelp map sep strs result =
    case strs of
        [] ->
            result

        first :: [] ->
            result ++ map first ++ ""

        first :: rest ->
            mapJoinHelp map sep rest (result ++ map first ++ sep ++ "")
