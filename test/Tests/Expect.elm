module Tests.Expect (expect) where

import ElmTest exposing (Test, assertEqual, test)


{-| Returns an ElmTest Test with the given description, where the given
expected and actual values are expected to be equal.
-}
expect : String -> { expected : a, actual : a } -> Test
expect str { expected, actual } =
  test str (assertEqual expected actual)
