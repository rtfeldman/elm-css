module Html.Helpers where

import Html.Attributes as Attr

class str = Attr.class (toString str)
id str = Attr.id (toString str)
style = Attr.style
