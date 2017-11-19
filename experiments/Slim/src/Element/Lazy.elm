module Element.Lazy exposing (lazy, lazy2)

{-| -}

import Internal.Model exposing (..)
import VirtualDom


{-| -}
lazyPassStyles : (a -> Element msg) -> a -> Element msg
lazyPassStyles fn a =
    case fn a of
        Unstyled _ ->
            Unstyled
                (VirtualDom.lazy (asHtml << fn) a)

        Styled styles _ ->
            Styled styles
                (VirtualDom.lazy (asHtml << fn) a)


{-| -}
lazy : (a -> Element msg) -> a -> Element msg
lazy fn a =
    Unstyled <| VirtualDom.lazy2 embed fn a


{-| -}
lazy2 : (a -> b -> Element msg) -> a -> b -> Element msg
lazy2 fn a b =
    Unstyled <| VirtualDom.lazy3 embed2 fn a b