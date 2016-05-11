module Context exposing (..) --where

import String


type alias Context =
  { lang : Lang
  , viewportWidth: Int
  , viewportHeight: Int
  , width: Int
  , height: Int
  , x: Int
  , y: Int
  }


type Lang
  = En
  | Fr


type alias Translation a =
  { en : a 
  , fr : a
  }


translate : Translation a -> Context -> a
translate t ctx =
  case ctx.lang of
    En -> t.en
    Fr -> t.fr


init w h l =
  { lang = if (String.startsWith "fr" l) then Fr else En
  , viewportWidth = w
  , viewportHeight = h
  , width = 1000
  , height = 2000
  , x = 0
  , y = 0
  }


update m v =
  { m
    | width = v.width
    , height = v.height
    }
