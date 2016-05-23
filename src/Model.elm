module Model exposing (..) 

import I18n
import Context
import Logo


-- MODEL


type alias MainModel =
    { context : Context.Context
    , scroll : Int
    , maxscroll : Int
    , logo : Logo.Model
    , i18n : I18n.Model
    }


type alias Flags =
    { width : Int
    , height : Int
    , lang : String
    }


type alias Viewport =
    { width : Int
    , height : Int
    , scroll : Int
    }


type Msg
    = Frame Viewport
