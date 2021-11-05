module Css.String exposing
    ( filterJoin
    , mapJoin
    )


filterJoin : (String -> Bool) -> String -> List String -> String
filterJoin pred sep strs =
    filterJoinHelp pred sep strs ""


filterJoinHelp : (String -> Bool) -> String -> List String -> String -> String
filterJoinHelp pred sep strs result =
    case strs of
        [] ->
            result

        first :: [] ->
            if pred first then
                -- The final empty string append makes the Elm compiler generate more specialized code
                result ++ first ++ ""

            else
                result

        first :: rest ->
            if pred first then
                filterJoinHelp pred sep rest (result ++ first ++ sep ++ "")

            else
                filterJoinHelp pred sep rest result


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
