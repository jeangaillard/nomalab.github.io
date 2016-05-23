module Beta exposing (..) 

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)
import I18n exposing (..)
import Context exposing (..)
import Layout exposing (..)


text =
    Html.text


view model =
    [ Html.form
        [ action "//us13.list-manage.com/subscribe/post?u=2288100013624e8e27b820a6c&id=1f74f9f58b"
        , class "validate"
        , method "post"
        , name "mc-embedded-subscribe-form"
        , attribute "novalidate" ""
        , target "_blank"
        , style
            [ ( "color", "#1B2B40" )
            , ( "border", "4px solid #1B2B40" )
            , ( "background", "white" )
            , ( "padding", "20px" )
            , ( "text-align", "center" )
            ]
        ]
        [ text model.i18n.beta.join
        , div
            [ style
                [ ( "width", "300px" )
                , ( "font", "inherit" )
                , ( "margin", "20px auto" )
                , ( "padding", "0 10px" )
                , ( "background", "#3BAAFF" )
                , ( "color", "white" )
                ]
            ]
            [ input
                [ name "EMAIL"
                , type' "email"
                , value ""
                , placeholder model.i18n.beta.email
                , style
                    [ ( "width", "264px" )
                    , ( "font", "inherit" )
                    , ( "padding", "8px 0px" )
                    ]
                ]
                []
            , input
                [ name "subscribe"
                , type' "image"
                , src "images/email.svg"
                , value "Subscribe"
                ]
                []
            , div
                [ attribute "aria-hidden" "true"
                , style [ ( "position", "absolute" ), ( "left", "-5000px" ) ]
                ]
                [ input
                    [ name "b_2288100013624e8e27b820a6c_1f74f9f58b"
                    , tabindex -1
                    , type' "text"
                    , value ""
                    ]
                    []
                ]
            ]
        ]
    ]
