module SharedStyles (..) where

import Html.CssHelpers exposing (namespace)


type CssClasses
  = NavLink


type CssIds
  = ReactiveLogo
  | BuyTickets


homepageNamespace =
  namespace "homepage"
