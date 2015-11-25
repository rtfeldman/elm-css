module HomepageStylesheet (..) where

import Stylesheets exposing (..)
import SharedStyles exposing (..)


port css : String
port css =
    Stylesheets.prettyPrint 4
        <| stylesheet
        |.| HeaderLinks
        |.| Footer
        |#| FootnotesDebug
        |%| header
        />/ stuff
        |-| backgroundColor (rgb 90 90 90)
        |-| boxSizing borderBox
        |-| padding 12 px
        |%| nav
        |-| display inlineBlock
        |-| paddingBottom 12 px
        |.| NavLink
        |-| margin 12 px
        |-| color (rgb 255 255 255)
        |#| ReactiveLogo
        |-| display inlineBlock
        |-| marginLeft 150 px
        |-| marginRight 80 px
        |-| verticalAlign middle
        |#| BuyTickets
        |-| padding 16 px
        |-| paddingLeft 24 px
        |-| paddingRight 24 px
        |-| marginLeft 50 px
        |-| color (rgb 255 255 255)
        |-| backgroundColor (rgb 27 217 130)
        |-| verticalAlign middle
