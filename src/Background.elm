module Background exposing (..)

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


view ctx =
    [ linesForSlots lineDown thinLine [ -10, 70, 130, 210 ] 600 ctx
    , linesForSlots lineUp thinLine [ 0, 60, 140, 200 ] 600 ctx
    , linesForSlots lineDown thinLine [ -50, 30, 90, 170 ] 1490 ctx
    , linesForSlots lineUp thinLine [ 0, 60, 140, 200 ] 1560 ctx
    , verts ctx
    , band "#1B2B40" 640 (mv ( 0, 860 ) ctx)
    ]


verts ctx =
    let
        ctx' =
            { ctx | height = 1200 }
    in
        g []
            [ linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 0) ctx
            , linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 140) ctx
            , linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 280) ctx
            , linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 420) ctx
            , linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 560) ctx
            , linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 700) ctx
            , linesForSlots lineVertical thinLine [ 0, 20, 40, 60 ] ((ctx'.width - 960) // 2 + 32 + 840) ctx
            ]


linesForSlots line style list offset ctx =
    g []
        (List.map
            (\i ->
                line style (offset + i) ctx
            )
            list
        )


band color width ctx =
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
            , toString (ctx.y - (ctx.width // 4) + width)
            , " "
            , toString (ctx.x + 0)
            , " "
            , toString (ctx.y + (ctx.width // 4) + width)
            ]
    in
        polygon
            [ fill color
            , points (String.concat pts)
            ]
            []
