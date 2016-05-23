module Minifiles exposing (..) --where

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)

import Context exposing (..)
import Layout exposing (..)
import Animation exposing (..)

style = Html.Attributes.style
id = Svg.Attributes.id
width = Svg.Attributes.width
height = Svg.Attributes.height
svg = Svg.svg

view model =
  div
    []
    [ fromCenterTop -200 164
        [ minifile 0 0 True (93 - model.scroll // 2) -- -13
        , minifile 0 1 True ( 93 - model.scroll // 3) -- 93
        , minifile 0 2 False ( -13 - model.scroll // 2) -- 33
        , minifile 0 3 False ( -93 - model.scroll // 4) -- 13
        , minifile 0 4 True ( -73 - model.scroll // 3) -- 73
        , minifile 0 5 False (-33 - model.scroll // 4) -- -33
        , minifile 0 6 False (-113 - model.scroll // 4) -- -33
        ]
    , fromCenterTop -233 1441
        [ minifileAlt 0 0 True  (313 - model.scroll // 4) -- -13
        , minifileAlt 0 1 True  (393 - model.scroll // 3) -- 93
        , minifileAlt 0 2 False (333 - model.scroll // 3) -- 33
        , minifileAlt 0 3 False (313 - model.scroll // 4) -- 13
        , minifileAlt 0 4 True  (373 - model.scroll // 3) -- 73
        , minifileAlt 0 5 False (300 - model.scroll // 4) -- -33
        , minifileAlt 0 6 False (253 - model.scroll // 4) -- -33
        ]
    ]


minifile v i alt top =
  svg
    [ height "370px"
    , width "100px"
    , viewBox "0 0 100 370"
    , version "1.1"
    , Html.Attributes.style
        [ ("position", "absolute")
        , ("top", (toString (340 - i * 70 + (if alt then 140 else 0)) ++ "px"))
        , ("left", ((toString (-268 + i * 140)) ++ "px"))
        ]
    ]
    [ defs
        []
        [ Svg.clipPath
            [ id ("miniclip-" ++ (toString i))
            ]
            [ polygon [ id "maskShape" , points "40 369 0 349 0 0 100 0 100 339" ] []
            ]
        ]
    , g [ Svg.Attributes.clipPath ("url(#miniclip-" ++ (toString i) ++ ")")
        , fill "none"
        , fillRule "evenodd"
        , stroke "#1C2C3F"
        , strokeWidth "4"
        ]
        [ g [ transform ("translate(20, " ++ (toString (100 - top)) ++ ")")
            ]
            [ polygon [ fill "#DCDFE2", points "20 90 20 41 32 24 60 10 60 70", strokeLinejoin "round" ] []
            , polyline [ points "35 23 35 38 20 45" ] []
            , polygon [ fill "#FFFFFF", points "20 90 0 80 0 31 20 41", strokeLinejoin "round" ] []
            , polygon [ fill "#FFFFFF", points "20 41 0 31 12 14 32 24", strokeLinejoin "round" ] []
            , polygon [ fill "#FFFFFF", points "32 24 12 14 40 0 60 10", strokeLinejoin "round" ] []
            ]
        ]
    ]


minifileAlt v i alt top =
  svg
    [ height "400px"
    , width "100px"
    , viewBox "0 0 100 400"
    , version "1.1"
    , Html.Attributes.style
        [ ("position", "absolute")
        , ("top", (toString (340 - i * 70 + (if alt then 140 else 0)) ++ "px"))
        , ("left", ((toString (-268 + i * 140)) ++ "px"))
        ]
    ]
    [ defs
        []
        [ Svg.clipPath
            [ id ("miniclipalt-" ++ (toString i))
            ]
            [ polygon [ id "maskShape" , points "0 1200 0 30 60 0 100 20 100 1200" ] []
            --[ polygon [ id "maskShape" , points "0 665 0 30 60 0 100 20 100 665" ] []
            ]
        ]
    , g [ Svg.Attributes.clipPath ("url(#miniclipalt-" ++ (toString i) ++ ")")
        , fill "none"
        , fillRule "evenodd"
        , stroke "#1C2C3F"
        , strokeWidth "4"
        ]
        [ g [ transform ("translate(0, " ++ (toString (-50 - top)) ++ ")")
            ]
            [ polygon [ fill "#DCDFE2", points "80 65 60 55 60 0 80 10", strokeLinejoin "round" ] []
            , polygon [ fill "#DCDFE2", points "60 55 80 65 40 85 20 75", strokeLinejoin "round" ] []
            , polygon [ fill "#FFFFFF", points "20 75 20 26 30 15 60 0 60 55", strokeLinejoin "round" ] []
            , polyline [ points "33 12 33 23 21 29" ] []
            --, polygon [ fill "#f00" , points "0 295 0 30 60 0 100 20 100 295" ] []
            ]
        ]
    ]


slotsView ctx =
  List.concat
    [ (slots (mv (0, 630) ctx) 0 [])
    , (slots (mv (0, 770) ctx) 0 [])
    , (slotsAlt (mv (40, 1500) ctx) 0 [])
    , (slotsAlt (mv (40, 1640) ctx) 0 [])
    ]


slots ctx i list =
  if (i-1 <= ctx.width // 280)
    then
      slots ctx (i + 1)
        (  (slotsInner (ctx.width // 2 + 140 * i + ctx.x) (0 - 70 * i + ctx.y))
        :: (slotsInner (ctx.width // 2 - 140 * i + ctx.x) (0 + 70 * i + ctx.y))
        :: list
        )
    else 
      list

slotsAlt ctx i list =
  if (i-1 <= ctx.width // 280)
    then
      slotsAlt ctx (i + 1)
        (  (slotsInnerAlt (ctx.width // 2 + 140 * i + ctx.x) (0 - 70 * i + ctx.y))
        :: (slotsInnerAlt (ctx.width // 2 - 140 * i + ctx.x) (0 + 70 * i + ctx.y))
        :: list
        )
    else 
      list

slotsInner x y =
  g [ transform ("translate(" ++ (toString (x - 70)) ++ ", " ++ (toString (y - 35)) ++ ")") ]
    [ polygon [ fill "#324865", points "80 60 140 30 80 0" ] []
    , polygon [ fill "#1B2B40", points "80 0 0 40 60 70 80 60" ] []
    ]

slotsInnerAlt x y =
  g [ transform ("translate(" ++ (toString x) ++ ", " ++ (toString y) ++ ")") ]
    [ polygon [ fill "#1B2B40", points "60 10 0 40 60 70" ] []
    , polygon [ fill "#324865", points "60 10 60 70 140 30 80 0" ] []
    ]
