port module Home exposing (main) --where

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Illustrations


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { viewport : Viewport
  }


type alias Viewport =
  { width: Int
  , height: Int
  , x: Int
  , y: Int
  }


init : (Model, Cmd Msg)
init =
  ( Model (Viewport 1000 700 0 0)
  , Cmd.none
  )


-- UPDATE


type Msg
  = Frame Viewport


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Frame v ->
      ({ model | viewport = v }, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  viewport Frame


port viewport : (Viewport -> msg) -> Sub msg


-- VIEW


view : Model -> Html Msg
view model =
  div
    [ style
        [ ("min-height", "1200px")
        , ("border", "4px solid #1C2C3F")
        , ("width", "740px")
        , ("padding", "80px")
        , ("margin", "80px auto")
        , ("background", "white")
        ]
    ]
    [ div
        [ style
            [ ("display", "block")
            , ("position", "relative")
            , ("left", "-14px")
            , ("width", "524px")
            , ("margin", "0 auto")
            ]
        ]
        [ img [ src "images/logo.svg" ] []
        ]
    , fromCenter 120 270
        [ move 0 0
            [ Illustrations.file
            ]
        , move 0 0
            [ Illustrations.fileMask2 model.viewport.y
            ]
        ]
    , fromCenter -500 700
        [ move 0 0
            [ Illustrations.isoLogo
            ]
        ]
    , fromCenter 200 900
        [ move -100 60
            [ Illustrations.cloud
            ]
        , move 0 80
            [ Illustrations.fileslot
            ]
        , move 0 0
            [ Illustrations.minifile 10 model.viewport.y
            ]
        , move 40 100
            [ Illustrations.fileslot
            ]
        , move 40 20
            [ Illustrations.minifile 30 model.viewport.y
            ]
        , move 80 120
            [ Illustrations.fileslot
            ]
        , move 80 40
            [ Illustrations.minifile 50 model.viewport.y
            ]
        ]
    ]


move x y =
  div 
    [ style
        [ ("position", "absolute")
        , ("left", ((toString x) ++ "px"))
        , ("top", ((toString y) ++ "px"))
        ]
    ]

fromCenter x y =
  div 
    [ style
        [ ("position", "absolute")
        , ("left", "calc(50% + " ++ ((toString x) ++ "px)"))
        , ("top", ((toString y) ++ "px"))
        ]
    ]

