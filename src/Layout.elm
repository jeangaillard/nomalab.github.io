module Layout exposing (..) --where

import String

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)

import Context exposing (..)

style = Html.Attributes.style

mv (x,y) ctx =
  { ctx
      | x = x + ctx.x
      , y = y + ctx.y
      }


center w ctx =
  { ctx
    | x = ctx.x + (ctx.width - w) // 2
    , width = w
    }


left w ctx =
  { ctx
    | width = w
    }


right w ctx =
  { ctx
    | position = ctx.x + (ctx.width - w)
    , width = w
    }


diagonale (x,y) (x',y') attrs =
  let
    pos =
      [ "M"
      , toString x
      , ","
      , toString y
      , " "
      , "L"
      , toString x'
      , ","
      , toString y'
      ]
  in
    Svg.path
      ( attrs
      ++ [ d (String.concat pos) ]
      ) []


type Direction
  = Down  -- R2D1
  | Up    -- R2U1
  | Horizontal
  | Vertical

px s = (toString s) ++ "px"


draw : Int -> Int -> List (VirtualDom.Node a) -> VirtualDom.Node a
draw w h c =
  Svg.svg
    [ Svg.Attributes.height (px h)
    , Svg.Attributes.width (px w)
    , viewBox ("0 0 " ++ (toString w) ++ " " ++ (toString h))
    , version "1.1"
    , style
        [ ("position", "absolute")
        , ("top", "0")
        , ("left", "0")
        , ("transform", "translate3d(0,0,0)")
        ]
    ]
    c


line direction attrs top ctx =
  case direction of
    Down ->
      diagonale
        ( 0
        , top - ctx.width  // 4
        )
        ( ctx.width
        , top + ctx.width  // 4
        )
        attrs

    Up ->
      diagonale
        ( 0
        , top + ctx.width  // 4
        )
        ( ctx.width
        , top - ctx.width  // 4
        )
        attrs

    Horizontal ->
      diagonale
        ( 0
        , top
        )
        ( ctx.width
        , top
        )
        attrs

    Vertical ->
      diagonale
        ( top -- it's actually left, in this context
        , 0
        )
        ( top -- is left
        , ctx.height
        )
        attrs


lineDown = line Down


lineUp = line Up


lineHorizontal = line Horizontal


lineVertical = line Vertical


thinLine =
  [ strokeWidth "1"
  , stroke "#8A9198"
  , strokeOpacity "0.15"
  ]

fatLine =
  [ stroke "#1C2C3F"
  , strokeWidth "4"
  ]


move x y =
  div
    [ style
      [ ("position", "absolute")
      , ("transform", "translate3d(0,0,0)")
      , ("left", ((toString x) ++ "px"))
      , ("top", ((toString y) ++ "px"))
      ]
    ]

fromCenterTop x y =
  div
    [ style
      [ ("position", "absolute")
      , ("left", "calc(50% + " ++ ((toString x) ++ "px)"))
      , ("top", ((toString y) ++ "px"))
      ]
    ]

memo z = 
  lazy (always z) ()
