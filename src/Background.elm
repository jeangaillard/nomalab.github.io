module Background exposing (..) --where

import String

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)

import Context exposing (..)
import Layout exposing (..)

style = Html.Attributes.style


view ctx =
  [ linesForSlots lineDown thinLine [-10 , 70, 130, 210] 600  ctx
  , linesForSlots lineUp   thinLine [0   , 60, 140, 200] 600  ctx
  , linesForSlots lineDown thinLine [-50 , 30, 90 , 170] 1490 ctx
  , linesForSlots lineUp   thinLine [0   , 60, 140, 200] 1560 ctx
  , verts ctx
  , band "#1B2B40" 640 (mv (0, 860) ctx)
  ]

verts c =
  let 
    ctx = { c | height = 1200 }
  in
    g []
      [ linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 0) ctx
      , linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 140) ctx
      , linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 280) ctx
      , linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 420) ctx
      , linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 560) ctx
      , linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 700) ctx
      , linesForSlots lineVertical thinLine [0, 20, 40, 60] ((ctx.width - 960) // 2 + 32 + 840) ctx
      ]

linesForSlots ln st ls ofs ctx =
  g []
    ( List.map
      (\i ->
        ln st (ofs + i) ctx
      )
      ls
    )


-- 0 300 600 0 600 200 0 500
band c w ctx =
  let
    pts =
      [ toString (ctx.x + 0)
      , " "
      , toString (ctx.y + (ctx.width // 4))
      , " "
      , toString (ctx.x + ctx.width)
      , " "
      , toString (ctx.y - (ctx.width // 4))
      , " "
      , toString (ctx.x + ctx.width)
      , " "
      , toString (ctx.y - (ctx.width // 4) + w)
      , " "
      , toString (ctx.x + 0)
      , " "
      , toString (ctx.y + (ctx.width // 4) + w)
      ]
  in 
    polygon
      [ fill c
      , points (String.concat pts)
      ]
      []