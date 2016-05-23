port module Home exposing (main) --where

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)

import Model exposing (..)
import I18n exposing (..)
import Context exposing (..)
import Logo

import Desktop
import Mobile


main : Program Flags
main =
  Html.programWithFlags
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- UPDATE

update : Msg -> MainModel -> (MainModel, Cmd Msg)
update msg model =
  case msg of
    Frame v ->
      ({ model
          | context = Context.update model.context v
          , scroll = v.scroll
          , maxscroll = 
              if v.scroll == 0
                then 0
                else Basics.max model.maxscroll v.scroll
          }
      , Cmd.none
      )


init : Flags -> (MainModel, Cmd Msg)
init flags =
  let
    ctx = Context.init flags.width flags.height flags.lang
  in
    ( MainModel
        (ctx)
        0
        0
        (Logo.init ctx)
        (I18n.init ctx)

    , Cmd.none
    )


-- SUBSCRIPTIONS


subscriptions : MainModel -> Sub Msg
subscriptions model =
  viewport Frame


port viewport : (Viewport -> msg) -> Sub msg


-- VIEW


view : MainModel -> Html Msg
view model =
  -- Wow! Such responsive !
  if model.context.width > 999
    then Desktop.view model
    else Mobile.view model
