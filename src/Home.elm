module Home where

import Html exposing (..)
import Html.Attributes exposing (..)

main =
  div
    [ class "main" ]
    [ h1
        []
        [ text "nomalab" ]
    , p
        []
        [ a
            [ href "mailto:contact@nomalab.com" ]
            [ text "contact" ]
        ]
    ]