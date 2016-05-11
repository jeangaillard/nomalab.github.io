module Logo exposing (..) --where

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)

import Context exposing (..)
import Layout exposing (..)

style = Html.Attributes.style

type alias Model =
  { url : String 
  , offset : Int
  }


init ctx =
  { url = "images/logo.svg"
  , offset = -100
  }

-- 164

view model slogan =
  div
    []
    [ fromCenterTop -474 80
        [ img [ src "images/logo.svg" ] []
        ]
    , fromCenterTop -310 220
        [ div
            [ style
                [ ("width", "480px")
                , ("color", "#1C2C3F")
                , ("font-size", "20px")
                ]
            ]
            (List.map text slogan)
        ]
    ]

mobileView model slogan =
  div
    []
    [ img [ src "images/logo.svg", style [("width","100%")] ] []
    , div
      [ style
          [ ("color", "#1C2C3F")
          , ("font-size", "20px")
          , ("padding-left", "30%")
          ]
      ]
      (List.map text slogan)
    ]


slogan = translate
  { en =
      [ "The new lab services"
      , "for producers, distributors, broadcasters"
      , "and publishers of audiovisual works"
      ]
  , fr =
      [ "Les nouveaux services labo"
      , "pour producteurs, distributeurs"
      , "et diffuseurs audiovisuels"
      ]
  }

