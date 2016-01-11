module Css.Transforms (..) where

import Css.Declaration as Declaration exposing (Declaration(..), CompoundSelector(..), introduceSelector, getLastProperty, updateLastProperty, extendLastSelector, addProperty, addSelector)


type alias DeclarationTransform =
  String -> List Declaration -> Result String (List Declaration)


type MixinTransformType
  = MixinTransformType


type PseudoClassTransformType
  = PseudoClassTransformType


type PseudoElementTransformType
  = PseudoElementTransformType


type BlockStyleTransformType
  = BlockStyleTransformType


type SnippetTransformType
  = SnippetTransformType


type AtRuleTransformType
  = AtRuleTransformType


makeBlockStyleFromSelector selectorFromName =
  { transformType = BlockStyleTransformType
  , transform = (\name -> introduceSelector (selectorFromName name) >> Ok)
  }


makeBlockStyle transform =
  { transformType = BlockStyleTransformType
  , transform = transform
  }
