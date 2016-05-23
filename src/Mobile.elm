module Mobile exposing (..) 

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
import Logo
import Beta
import Footer


style =
    Html.Attributes.style


view : MainModel -> Html Msg
view model =
    let
        keywords =
            [ ( model.i18n.keywords.master
              , [ model.i18n.keywords.masterVersion
                , model.i18n.keywords.masterArchive
                ]
              )
            , ( model.i18n.keywords.labo
              , [ model.i18n.keywords.laboQc
                , model.i18n.keywords.laboDelivery
                ]
              )
            , ( model.i18n.keywords.diffusion
              , [ model.i18n.keywords.diffusionCert
                , model.i18n.keywords.diffusionOnDemand
                ]
              )
            ]
    in
        div [ style [ ( "padding", "20px 10px" ) ] ]
            [ Logo.mobileView model.logo model.i18n.slogan
            , div
                [ style
                    [ ( "padding", "20px 10px" )
                    ]
                ]
                (Beta.view model)
            , div []
                (List.map
                    (\( title, keys ) ->
                        div
                            [ style
                                [ ( "padding", "20px 10px" )
                                ]
                            ]
                            ((h2
                                [ style []
                                ]
                                [ span
                                    [ style
                                        [ ( "padding", "5px 10px" )
                                        , ( "border", "4px solid #1B2B40" )
                                        , ( "margin-top", "-4px" )
                                        , ( "display", "inline-block" )
                                        , ( "text-transform", "uppercase" )
                                        , ( "font-size", "30px" )
                                        , ( "background", "#3BAAFF" )
                                        , ( "color", "#fff" )
                                        ]
                                    ]
                                    [ text title ]
                                ]
                             )
                                :: (List.map
                                        (\t ->
                                            h3
                                                [ style []
                                                ]
                                                [ span
                                                    [ style
                                                        [ ( "padding", "5px 10px" )
                                                        , ( "border", "4px solid #1B2B40" )
                                                        , ( "margin-top", "-4px" )
                                                        , ( "display", "inline-block" )
                                                        , ( "text-transform", "uppercase" )
                                                        , ( "font-size", "20px" )
                                                        , ( "background", "#fff" )
                                                        , ( "color", "#1B2B40" )
                                                        ]
                                                    ]
                                                    [ text t ]
                                                ]
                                        )
                                        keys
                                   )
                            )
                    )
                    keywords
                )
            , Footer.view model.i18n.contact
            ]
