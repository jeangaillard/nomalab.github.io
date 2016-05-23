module Footer exposing (..) 

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2, lazy3)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Context exposing (..)
import Layout exposing (..)


text =
    Html.text


view i18n =
    footer []
        [ Html.a [ href "//twitter.com/nomachinelab", footerLinkStyle ]
            [ twitterIcon
            , span [ footerLabelStyle ] [ text (i18n.twitter) ]
            , span [ footerTitleStyle ] [ text ("@nomachinelab") ]
            ]
        , Html.a [ href "mailto:contact@nomalab.com", footerLinkStyle ]
            [ mailIcon
            , span [ footerLabelStyle ] [ text (i18n.email) ]
            , span [ footerTitleStyle ] [ text ("contact@nomalab.com") ]
            ]
        , Html.a [ href "mailto:jobs@nomalab.com", footerLinkStyle ]
            [ mailIcon
            , span [ footerLabelStyle ] [ text (i18n.job) ]
            , span [ footerTitleStyle ] [ text ("jobs@nomalab.com") ]
            ]
        ]


footerLinkStyle =
    Html.Attributes.style
        [ ( "display", "inline-block" )
        , ( "text-align", "left" )
        , ( "white-space", "nowrap" )
        , ( "padding", "10px 50px 10px 20px" )
        ]


footerLabelStyle =
    Html.Attributes.style
        [ ( "display", "block" )
        , ( "font-size", "12px" )
        , ( "text-transform", "uppercase" )
        ]


footerTitleStyle =
    Html.Attributes.style
        [ ( "display", "block" )
        , ( "font-size", "16px" )
        , ( "color", "#1C2C3F" )
        ]


twitterIcon =
    Svg.svg
        [ Svg.Attributes.height "30px"
        , version "1.1"
        , viewBox "0 4 30 30"
        , Svg.Attributes.width "30px"
        , Html.Attributes.style
            [ ( "float", "left" )
            , ( "margin", "5px 10px " )
            ]
        ]
        [ g [ transform "translate(0.000000, 4.000000)" ]
            [ Svg.path [ d "M4,15 L4,15 C4,21.0762495 8.9241635,26 15,26 C21.0762495,26 26,21.0758365 26,15 C26,8.92375047 21.0758365,4 15,4 C8.92375047,4 4,8.9241635 4,15 L4,15 Z M0,15 C0,6.71572875 6.71390727,0 15,0 C23.2842712,0 30,6.71390727 30,15 C30,23.2842712 23.2860927,30 15,30 C6.71572875,30 0,23.2860927 0,15 L0,15 Z", fill "#3BAAFF" ]
                []
            , Svg.path [ d "M21.5,11.778 C21.059,11.974 20.584,12.106 20.086,12.166 C20.595,11.861 20.984,11.379 21.169,10.804 C20.693,11.086 20.166,11.291 19.605,11.401 C19.157,10.922 18.516,10.623 17.809,10.623 C16.219,10.623 15.051,12.106 15.41,13.646 C13.365,13.543 11.55,12.563 10.336,11.074 C9.691,12.18 10.002,13.628 11.098,14.361 C10.695,14.348 10.316,14.237 9.984,14.053 C9.957,15.193 10.775,16.26 11.959,16.498 C11.613,16.592 11.233,16.614 10.847,16.54 C11.16,17.518 12.071,18.229 13.147,18.249 C12.11,19.061 10.807,19.424 9.5,19.27 C10.59,19.969 11.883,20.376 13.273,20.376 C17.845,20.376 20.427,16.515 20.271,13.052 C20.753,12.706 21.17,12.272 21.5,11.778 L21.5,11.778 Z", fill "#3BAAFF" ]
                []
            ]
        ]


mailIcon =
    Svg.svg
        [ Svg.Attributes.height "30px"
        , version "1.1"
        , viewBox "0 4 30 30"
        , Svg.Attributes.width "30px"
        , Html.Attributes.style
            [ ( "float", "left" )
            , ( "margin", "5px 10px " )
            ]
        ]
        [ g [ transform "translate(0.000000, 4.000000)" ]
            [ Svg.path [ d "M4,15 L4,15 C4,21.0762495 8.9241635,26 15,26 C21.0762495,26 26,21.0758365 26,15 C26,8.92375047 21.0758365,4 15,4 C8.92375047,4 4,8.9241635 4,15 L4,15 Z M0,15 C0,6.71572875 6.71390727,0 15,0 C23.2842712,0 30,6.71390727 30,15 C30,23.2842712 23.2860927,30 15,30 C6.71572875,30 0,23.2860927 0,15 L0,15 Z", fill "#3BAAFF" ]
                []
            , Svg.path [ d "M15,15.8565 L9.0075,11 L20.9925,11 L15,15.8565 L15,15.8565 Z M15,17.1435 L9,12.281 L9,20 L21,20 L21,12.281 L15,17.1435 L15,17.1435 Z", fill "#3BAAFF" ]
                []
            ]
        ]
