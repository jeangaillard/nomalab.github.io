module Navigation exposing (..)

-- Data --

import Signal
import Json.Decode as Json


-- Html --

import Html as T exposing (Html, text, Attribute)
import Html.Attributes as A
import Html.Events as E


type alias Route =
    { list : List Anchor
    , current : Maybe Anchor
    }


type alias Router =
    Url -> Route -> Result String Route


type alias Anchor =
    { url : Url
    , title : String
    , router : Router
    }


type alias Url =
    String



-- Data --


commands =
    Signal.mailbox home


events =
    Signal.mailbox "/"


home =
    { url = "/"
    , title = "Home"
    }



-- Views --


link : Anchor -> Html
link a =
    T.a
        [ A.href a.url
        , click a.url
        ]
        [ text a.title
        ]


button : Anchor -> Html
button a =
    T.button
        [ click a.url
        ]
        [ text a.title
        ]


click : Url -> Attribute
click url =
    E.onWithOptions "click"
        { stopPropagation = True, preventDefault = True }
        Json.value
        (\_ -> Signal.message events.address url)
