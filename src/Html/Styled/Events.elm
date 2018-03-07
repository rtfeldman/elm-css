module Html.Styled.Events
    exposing
        ( custom
        , keyCode
        , on
        , onBlur
        , onCheck
        , onClick
        , onDoubleClick
        , onFocus
        , onInput
        , onMouseDown
        , onMouseEnter
        , onMouseLeave
        , onMouseOut
        , onMouseOver
        , onMouseUp
        , onSubmit
        , preventDefaultOn
        , stopPropagationOn
        , targetChecked
        , targetValue
        )

{-| It is often helpful to create an [Union Type] so you can have many different kinds
of events as seen in the [TodoMVC] example.

[Union Type]: http://elm-lang.org/learn/Union-Types.elm
[TodoMVC]: https://github.com/evancz/elm-todomvc/blob/master/Todo.elm


# Mouse Helpers

@docs onClick, onDoubleClick, onMouseDown, onMouseUp, onMouseEnter, onMouseLeave, onMouseOver, onMouseOut


# Form Helpers

@docs onInput, onCheck, onSubmit


# Focus Helpers

@docs onBlur, onFocus


# Custom Event Handlers

@docs on, stopPropagationOn, preventDefaultOn, custom


# Custom Decoders

@docs targetValue, targetChecked, keyCode

-}

import Html.Styled as Html exposing (Attribute)
import Json.Decode as Json
import VirtualDom
import VirtualDom.Styled



-- MOUSE EVENTS


{-| -}
onClick : msg -> Attribute msg
onClick msg =
    on "click" (Json.succeed msg)


{-| -}
onDoubleClick : msg -> Attribute msg
onDoubleClick msg =
    on "dblclick" (Json.succeed msg)


{-| -}
onMouseDown : msg -> Attribute msg
onMouseDown msg =
    on "mousedown" (Json.succeed msg)


{-| -}
onMouseUp : msg -> Attribute msg
onMouseUp msg =
    on "mouseup" (Json.succeed msg)


{-| -}
onMouseEnter : msg -> Attribute msg
onMouseEnter msg =
    on "mouseenter" (Json.succeed msg)


{-| -}
onMouseLeave : msg -> Attribute msg
onMouseLeave msg =
    on "mouseleave" (Json.succeed msg)


{-| -}
onMouseOver : msg -> Attribute msg
onMouseOver msg =
    on "mouseover" (Json.succeed msg)


{-| -}
onMouseOut : msg -> Attribute msg
onMouseOut msg =
    on "mouseout" (Json.succeed msg)



-- FORM EVENTS


{-| Detect [input](https://developer.mozilla.org/en-US/docs/Web/Events/input)
events for things like text fields or text areas.

It grabs the **string** value at `event.target.value`, so it will not work if
you need some other type of information. For example, if you want to track
inputs on a range slider, make a custom handler with [`on`](#on).

For more details on how `onInput` works, check out [`targetValue`](#targetValue).

-}
onInput : (String -> msg) -> Attribute msg
onInput tagger =
    on "input" (Json.map tagger targetValue)


{-| Detect [change](https://developer.mozilla.org/en-US/docs/Web/Events/change)
events on checkboxes. It will grab the boolean value from `event.target.checked`
on any input event.

Check out [`targetChecked`](#targetChecked) for more details on how this works.

-}
onCheck : (Bool -> msg) -> Attribute msg
onCheck tagger =
    on "change" (Json.map tagger targetChecked)


{-| Detect a [submit](https://developer.mozilla.org/en-US/docs/Web/Events/submit)
event with [`preventDefault`](https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault)
in order to prevent the form from changing the page’s location. If you need
different behavior, create a custom event handler.
-}
onSubmit : msg -> Attribute msg
onSubmit msg =
    preventDefaultOn "submit" (Json.map alwaysPreventDefault (Json.succeed msg))


alwaysPreventDefault : msg -> ( msg, Bool )
alwaysPreventDefault msg =
    ( msg, True )



-- FOCUS EVENTS


{-| -}
onBlur : msg -> Attribute msg
onBlur msg =
    on "blur" (Json.succeed msg)


{-| -}
onFocus : msg -> Attribute msg
onFocus msg =
    on "focus" (Json.succeed msg)



-- CUSTOM EVENTS


{-| Create a custom event listener. Normally this will not be necessary, but
you have the power! Here is how `onClick` is defined for example:

    import Json.Decode as Decode

    onClick : msg -> Attribute msg
    onClick message =
        on "click" (Decode.succeed message)

The first argument is the event name in the same format as with JavaScript's
[`addEventListener`][aEL] function.

The second argument is a JSON decoder. Read more about these [here][decoder].
When an event occurs, the decoder tries to turn the event object into an Elm
value. If successful, the value is routed to your `update` function. In the
case of `onClick` we always just succeed with the given `message`.

If this is confusing, work through the [Elm Architecture Tutorial][tutorial].
It really helps!

[aEL]: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
[decoder]: http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
[tutorial]: https://github.com/evancz/elm-architecture-tutorial/

**Note:** This creates a [passive] event listener, enabling optimizations for
touch, scroll, and wheel events in some browsers.

[passive]: https://github.com/WICG/EventListenerOptions/blob/gh-pages/explainer.md

-}
on : String -> Json.Decoder msg -> Attribute msg
on event decoder =
    VirtualDom.Styled.on event (VirtualDom.Normal (Json.map VirtualDom.Sync decoder))


{-| Create an event listener that may [`stopPropagation`][stop]. Your decoder
must produce a message and a `Bool` that decides if `stopPropagation` should
be called.

[stop]: https://developer.mozilla.org/en-US/docs/Web/API/Event/stopPropagation

**Note:** This creates a [passive] event listener, enabling optimizations for
touch, scroll, and wheel events in some browsers.

[passive]: https://github.com/WICG/EventListenerOptions/blob/gh-pages/explainer.md

-}
stopPropagationOn : String -> Json.Decoder ( msg, Bool ) -> Attribute msg
stopPropagationOn event decoder =
    VirtualDom.Styled.on event (VirtualDom.MayStopPropagation (Json.map syncTuple decoder))


{-| Create an event listener that may [`preventDefault`][prevent]. Your decoder
must produce a message and a `Bool` that decides if `preventDefault` should
be called.

For example, the `onSubmit` function in this library _always_ prevents the
default behavior:

[prevent]: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault

    onSubmit : msg -> Attribute msg
    onSubmit msg =
        preventDefaultOn "submit" (Json.map alwaysPreventDefault (Json.succeed msg))

    alwaysPreventDefault : msg -> ( msg, Bool )
    alwaysPreventDefault msg =
        ( msg, True )

-}
preventDefaultOn : String -> Json.Decoder ( msg, Bool ) -> Attribute msg
preventDefaultOn event decoder =
    VirtualDom.Styled.on event (VirtualDom.MayPreventDefault (Json.map syncTuple decoder))


{-| Create an event listener that may [`stopPropagation`][stop] or
[`preventDefault`][prevent].

[stop]: https://developer.mozilla.org/en-US/docs/Web/API/Event/stopPropagation
[prevent]: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault

**Note:** If you need something even more custom (like capture phase) check
out the lower-level event API in `elm-lang/virtual-dom`.

-}
custom : String -> Json.Decoder { message : msg, stopPropagation : Bool, preventDefault : Bool } -> Attribute msg
custom event decoder =
    VirtualDom.Styled.on event (VirtualDom.Custom (Json.map syncRecord decoder))



-- SYNC HELPERS


syncTuple : ( msg, Bool ) -> ( VirtualDom.Timed msg, Bool )
syncTuple ( msg, bool ) =
    ( VirtualDom.Sync msg, bool )


syncRecord : { message : msg, stopPropagation : Bool, preventDefault : Bool } -> { message : VirtualDom.Timed msg, stopPropagation : Bool, preventDefault : Bool }
syncRecord { message, stopPropagation, preventDefault } =
    { message = VirtualDom.Sync message
    , stopPropagation = stopPropagation
    , preventDefault = preventDefault
    }



-- COMMON DECODERS


{-| A `Json.Decoder` for grabbing `event.target.value`. We use this to define
`onInput` as follows:

    import Json.Decode as Json

    onInput : (String -> msg) -> Attribute msg
    onInput tagger =
        on "input" (Json.map tagger targetValue)

You probably will never need this, but hopefully it gives some insights into
how to make custom event handlers.

-}
targetValue : Json.Decoder String
targetValue =
    Json.at [ "target", "value" ] Json.string


{-| A `Json.Decoder` for grabbing `event.target.checked`. We use this to define
`onCheck` as follows:

    import Json.Decode as Json

    onCheck : (Bool -> msg) -> Attribute msg
    onCheck tagger =
        on "input" (Json.map tagger targetChecked)

-}
targetChecked : Json.Decoder Bool
targetChecked =
    Json.at [ "target", "checked" ] Json.bool


{-| A `Json.Decoder` for grabbing `event.keyCode`. This helps you define
keyboard listeners like this:

    import Json.Decode as Json

    onKeyUp : (Int -> msg) -> Attribute msg
    onKeyUp tagger =
        on "keyup" (Json.map tagger keyCode)

**Note:** It looks like the spec is moving away from `event.keyCode` and
towards `event.key`. Once this is supported in more browsers, we may add
helpers here for `onKeyUp`, `onKeyDown`, `onKeyPress`, etc.

-}
keyCode : Json.Decoder Int
keyCode =
    Json.field "keyCode" Json.int
