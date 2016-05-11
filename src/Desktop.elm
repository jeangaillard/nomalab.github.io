module Desktop exposing (..) --where

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)

import Model exposing (..)
import I18n exposing (..)
import Context exposing (..)
import Layout exposing (..)
import Minifiles
import Background
import Animation
import Beta
import Logo
import Footer


style = Html.Attributes.style

view : MainModel -> Html Msg
view model =
  div
    []
    [ memo <|
        draw model.context.width 2300
          ( List.concat
              [ (Background.view model.context)
              , (Minifiles.slotsView model.context)
              ]
          )
    , memo <|
        Logo.view model.logo model.i18n.slogan
    , Minifiles.view model
    , memo <|
            div
              [ style
                  [ ("width", "480px")
                  , ("margin", "309px auto 0")
                  , ("transform", "translate3d(-70px,0,0)")
                  , ("position", "relative")
                  ]
              ]
              (Beta.view model)

    , fromCenterTop -280 800
        [ Animation.frame model.scroll
        ]
    , keywordsGroup 0 600 model
          [ (keywordsTitle model.i18n.keywords.master)
          , (keyword model.i18n.keywords.masterVersion)
          , (keyword model.i18n.keywords.masterArchive)
          ]
    , keywordsGroup -410 1300 model
          [ (keywordsTitle model.i18n.keywords.labo)
          , (keyword model.i18n.keywords.laboQc)
          , (keyword  model.i18n.keywords.laboDelivery)
          ]
    , keywordsGroup -150 1800 model
          [ keywordsTitle model.i18n.keywords.diffusion
          , keywordsTitle model.i18n.keywords.diffusion2
          , keyword model.i18n.keywords.diffusionCert
          , keyword model.i18n.keywords.diffusionOnDemand
          ]
    , memo <|
        fromCenterTop -400 2200
          [ Footer.view model.i18n.contact
          ]
    ]


keywordsGroup x y model tt =
  let
    scrollStart = 
      if y > model.context.height
        then model.context.height - y
        else 0
  in
    fromCenterTop x y
      [ div
        []
        ( List.indexedMap (\i t -> t (scrollStart - i * 30) model.maxscroll) tt)
      ]


titleStyle =
  [ ("max-width", "500px")
  , ("display", "block")
  , ("overflow", "hidden")
  , ("margin-top", "-4px")
  ]

innerTitleStyle =
  [ ("padding", "4px 10px")
  , ("border", "4px solid #1B2B40")
  , ("display", "inline-block")
  , ("white-space", "nowrap")
  , ("text-transform", "uppercase")
  ]

keywordsTitle t i s =
  h2
    [ style
        ([("width", ((toString (Basics.max 0 (i + s))) ++ "px"))
        ]
        ++ titleStyle)
    ]
    [ span
        [ style
            ([("font-size", "40px")
            , ("background", "#3BAAFF")
            , ("color", "#fff")
            ]
            ++ innerTitleStyle)
        ]
        [ text t
        ]
    ]

keyword t i s =
  h3
    [ style
        ([("width", ((toString (Basics.max 0 (i + s))) ++ "px"))
        ]
        ++ titleStyle)
    ]
    [ span
        [ style
            ([("font-size", "20px")
            , ("background", "#fff")
            , ("color", "#1B2B40")
            ]
            ++ innerTitleStyle)
        ]
        [ text t
        ]
    ]

