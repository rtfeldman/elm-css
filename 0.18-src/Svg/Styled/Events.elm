module Svg.Styled.Events exposing
    ( onBegin, onEnd, onRepeat
    , onAbort, onError, onResize, onScroll, onLoad, onUnload, onZoom
    , onActivate, onClick, onFocusIn, onFocusOut, onMouseDown, onMouseMove, onMouseOut, onMouseOver, onMouseUp
    , on
    )

{-| Drop-in replacement for the `Svg.Events` module from the `elm-lang/svg` package.


# Animation event attributes

@docs onBegin, onEnd, onRepeat


# Document event attributes

@docs onAbort, onError, onResize, onScroll, onLoad, onUnload, onZoom


# Graphical event attributes

@docs onActivate, onClick, onFocusIn, onFocusOut, onMouseDown, onMouseMove, onMouseOut, onMouseOver, onMouseUp


# Custom Events

@docs on

-}

import Json.Decode as Json
import Svg.Styled exposing (Attribute)
import VirtualDom.Styled


{-| Create a custom event listener.

    import Json.Decode as Json

    onClick : msg -> Attribute msg
    onClick msg =
        on "click" (Json.succeed msg)

You first specify the name of the event in the same format as with JavaScript’s
`addEventListener`. Next you give a JSON decoder, which lets you pull
information out of the event object. If the decoder succeeds, it will produce
a message and route it to your `update` function.

-}
on : String -> Json.Decoder msg -> Attribute msg
on =
    VirtualDom.Styled.on


simpleOn : String -> msg -> Attribute msg
simpleOn name =
    \msg -> on name (Json.succeed msg)



-- ANIMATION


{-| -}
onBegin : msg -> Attribute msg
onBegin =
    simpleOn "begin"


{-| -}
onEnd : msg -> Attribute msg
onEnd =
    simpleOn "end"


{-| -}
onRepeat : msg -> Attribute msg
onRepeat =
    simpleOn "repeat"



-- DOCUMENT


{-| -}
onAbort : msg -> Attribute msg
onAbort =
    simpleOn "abort"


{-| -}
onError : msg -> Attribute msg
onError =
    simpleOn "error"


{-| -}
onResize : msg -> Attribute msg
onResize =
    simpleOn "resize"


{-| -}
onScroll : msg -> Attribute msg
onScroll =
    simpleOn "scroll"


{-| -}
onLoad : msg -> Attribute msg
onLoad =
    simpleOn "load"


{-| -}
onUnload : msg -> Attribute msg
onUnload =
    simpleOn "unload"


{-| -}
onZoom : msg -> Attribute msg
onZoom =
    simpleOn "zoom"



-- GRAPHICAL


{-| -}
onActivate : msg -> Attribute msg
onActivate =
    simpleOn "activate"


{-| -}
onClick : msg -> Attribute msg
onClick =
    simpleOn "click"


{-| -}
onFocusIn : msg -> Attribute msg
onFocusIn =
    simpleOn "focusin"


{-| -}
onFocusOut : msg -> Attribute msg
onFocusOut =
    simpleOn "focusout"


{-| -}
onMouseDown : msg -> Attribute msg
onMouseDown =
    simpleOn "mousedown"


{-| -}
onMouseMove : msg -> Attribute msg
onMouseMove =
    simpleOn "mousemove"


{-| -}
onMouseOut : msg -> Attribute msg
onMouseOut =
    simpleOn "mouseout"


{-| -}
onMouseOver : msg -> Attribute msg
onMouseOver =
    simpleOn "mouseover"


{-| -}
onMouseUp : msg -> Attribute msg
onMouseUp =
    simpleOn "mouseup"
