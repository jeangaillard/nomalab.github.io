module Animation exposing (..) --where

import Html exposing (div)
import Html.Attributes
import Svg exposing (..)
import Svg.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2)




bigBlock active =
  let
    lightColor =
      if active
        then "#3BAAFF"
        else "#DCDFE2"
    darkColor =
      if active
        then "#158EEB"
        else "#9CA2A8"
    css =
      Svg.Attributes.style "transition: fill 300ms linear"
  in
    [ polygon [ fill lightColor, points "320 40 400 0 480 40 400 80" ] []
    , polygon [ fill lightColor, points "320 120 320 40 400 80 400 160" ] []
    , polygon [ fill darkColor, points "400 80 480 40 480 120 400 160" ] []
    ]


showBlock o i =
  let
    offset =
      if (o - i * 20) > 720
        then 120
      else if (o - i * 20) > 600
        then (o - i * 20) - 600
      else 0
    basex = (3 - i % 3) * 80
    basey = ((3 - i % 3) * 40) + (i // 3 * 80)
    x = basex - (offset * 2)
    y = basey + offset
  in
    g [ transform ("translate(" ++ (toString x) ++ ", " ++ (toString y) ++ " )") ] (bigBlock (offset == 120))


-- This is pretty much everything that's fixed on the page.
background v =
  svg
    [ height "2500px"
    , version "1.1"
    , viewBox "41 -403 2012 2500"
    , width "2012px"
    , Svg.Attributes.style "transform: translate3d(0,0,0)"
    ]
    [ g [ fill "none"
        , fillRule "evenodd"
        , stroke "none"
        , strokeWidth "1"
        , transform "translate(42, -402)"
        ]
        [ g [ transform "translate(260, 396)"
            ]
            -- slots, files in
            [ slot 700 420
            , slot 560 350
            , slot 840 350
            , slot 700 280
            , slot 980 280
            , slot 840 210
            , slot 1120 210
            , slot 980 140
            , slot 1260 140
            , slot 1120 70
            , slot 1260 0
            , slot 560 490
            , slot 420 420
            , slot 420 560
            , slot 280 490
            , slot 140 560
            , slot 280 630
            , slot 0 630
            , slot 140 700
            , slot 0 770
            , slot 140 560
            , slot 0 630
            , slot 140 700
            , slot 0 770
            ]
        , g [ transform "translate(260, 1316)"
            ]
            -- slots, files out
            [ slotReverse 700 420
            , slotReverse 560 350
            , slotReverse 840 350
            , slotReverse 700 280
            , slotReverse 980 280
            , slotReverse 840 210
            , slotReverse 1120 210
            , slotReverse 980 140
            , slotReverse 1260 140
            , slotReverse 1120 70
            , slotReverse 1260 0
            , slotReverse 560 490
            , slotReverse 420 420
            , slotReverse 420 560
            , slotReverse 280 490
            , slotReverse 140 560
            , slotReverse 280 630
            , slotReverse 0 630
            , slotReverse 140 700
            , slotReverse 0 770
            , slotReverse 140 560
            , slotReverse 0 630
            , slotReverse 140 700
            , slotReverse 0 770
            ]
          , g [ id "vertical"
              , stroke "#8A9198"
              , strokeOpacity "0.150588768"
              , transform "translate(578, 0)"
              ]
              [ Svg.path [ d "M141.5,0.5 L141.5,2500" ] []
              , Svg.path [ d "M161.5,0.5 L161.5,2500" ] []
              , Svg.path [ d "M281.5,0.5 L281.5,2500" ] []
              , Svg.path [ d "M301.5,0.5 L301.5,2500" ] []
              , Svg.path [ d "M181.5,0.5 L181.5,2500" ] []
              , Svg.path [ d "M321.5,0.5 L321.5,2500" ] []
              , Svg.path [ d "M201.5,0.5 L201.5,2500" ] []
              , Svg.path [ d "M341.5,0.5 L341.5,2500" ] []
              , Svg.path [ d "M441.5,0.5 L441.5,2500" ] []
              , Svg.path [ d "M421.5,0.5 L421.5,2500" ] []
              , Svg.path [ d "M461.5,0.5 L461.5,2500" ] []
              , Svg.path [ d "M481.5,0.5 L481.5,2500" ] []
              , Svg.path [ d "M581.5,0.5 L581.5,2500" ] []
              , Svg.path [ d "M561.5,0.5 L561.5,2500" ] []
              , Svg.path [ d "M601.5,0.5 L601.5,2500" ] []
              , Svg.path [ d "M621.5,0.5 L621.5,2500" ] []
              , Svg.path [ d "M721.5,0.5 L721.5,2500" ] []
              , Svg.path [ d "M701.5,0.5 L701.5,2500" ] []
              , Svg.path [ d "M741.5,0.5 L741.5,2500" ] []
              , Svg.path [ d "M761.5,0.5 L761.5,2500" ] []
              , Svg.path [ d "M1.5,0.5 L1.5,2500" ] []
              , Svg.path [ d "M41.5,0.5 L41.5,2500" ] []
              , Svg.path [ d "M61.5,0.5 L61.5,2500" ] []
              , Svg.path [ d "M21.5,0.5 L21.5,2500" ] []
              ]
          , polygon [ fill "#1B2B40", points "330 1273 1611 631 1611 1271 329 1913" ] []
          , g [ stroke "#8A9198"
              , strokeLinecap "square"
              , strokeOpacity "0.150588768"
              , transform "translate(0, 161)"
              ]
              [ Svg.path [ d "M10,0 L2010,1000" ] []
              , Svg.path [ d "M10,80 L2010,1080" ] []
              , Svg.path [ d "M0,136 L2000,1136" ] []
              , Svg.path [ d "M0,216 L2000,1216" ] []
              ]
          , g [ stroke "#8A9198"
              , strokeLinecap "square"
              , strokeOpacity "0.150588768"
              , transform "translate(1000, 1127) scale(-1, 1) translate(-1000, -1127) translate(0, 197)"
              ]
              [ Svg.path [ d "M0,260 L2000,1260" ] []
              , Svg.path [ d "M0,300 L2000,1300" ] []
              , Svg.path [ d "M0,460 L2000,1460" ] []
              , Svg.path [ d "M0,540 L2000,1540" ] []
              , Svg.path [ d "M0,780 L2000,1780" ] []
              , Svg.path [ d "M0,860 L2000,1860" ] []
              , Svg.path [ d "M0,380 L2000,1380" ] []
              , Svg.path [ d "M0,0 L2000,1000" ] []
              , Svg.path [ d "M0,60 L2000,1060" ] []
              , Svg.path [ d "M0,140 L2000,1140" ] []
              , Svg.path [ d "M0,200 L2000,1200" ] []
              ]
          ]
    ]


-- Slot file in
slot x y =
  g [ transform ("translate(" ++ (toString x) ++ ", " ++ (toString y) ++ ")") ]
    [ polygon [ fill "#324865", points "80 60 140 30 80 0" ] []
    , polygon [ fill "#1B2B40", points "80 0 0 40 60 70 80 60" ] []
    ]


-- Slot file out
slotReverse x y =
  g [ transform ("translate(" ++ (toString x) ++ ", " ++ (toString y) ++ ")") ]
    [ polygon [ fill "#1B2B40", points "60 10 0 40 60 70" ] []
    , polygon [ fill "#324865", points "60 10 60 70 140 30 80 0" ] []
    ]


-- This is the big frame, file shape that "host" the blocs
frame v =
  svg
    [ height "745px"
    , version "1.1"
    , viewBox "0 -3 642 745"
    , width "642px"
    ]
    [ defs []
      [ Svg.clipPath
          [ id "mask"
          ]
          [ polygon [ points "0 384 0 140 280 0 442 81 442 163" ] []
          ]
      , Svg.clipPath
          [ id "mask2"
          ]
          [ polygon [ points "0 624 0 140 280 0 522 121 522 363" ] []
          ]
      ]
    , g [ fill "none"
        , fillRule "evenodd"
        , id "frame"
        , stroke "none"
        , strokeWidth "1"
        ]
        [ polygon
            [ fill "#E9E9E9"
            , points "560 140 640 100 640 500 560 540"
            , stroke "#1B2B40"
            , strokeLinejoin "round"
            , strokeWidth "4"
            ]
            []
        , Svg.path
            [ d "M240,380 L240,100 L360,40 L560,140 L560,540 L240,380 Z M280,360 L280,120 L360,160 L360,80 L520,160 L520,480 L280,360 Z"
            , fill "#FFFFFF"
            , stroke "#1B2B40"
            , strokeLinejoin "round"
            , strokeWidth "4"
            ] []
        , polygon
            [ fill "#E9E9E9"
            , points "280 360 280 120 360 160 360 400"
            , stroke "#1B2B40"
            , strokeLinejoin "round"
            , strokeWidth "4"
            ] []
        , polygon
            [ fill "#E9E9E9"
            , points "360 160 360 80 440 120"
            , stroke "#1B2B40"
            , strokeLinejoin "round"
            , strokeWidth "4"
            ] []
        , polygon
            [ fill "#E9E9E9"
            , points "520 480 280 360 360 320 520 400"
            , stroke "#1B2B40"
            , strokeLinejoin "round"
            , strokeWidth "4"
            ] []
        , polygon
            [ fill "#FFFFFF"
            , points "360 40 440 0 640 100 560 140"
            , stroke "#1B2B40"
            , strokeLinejoin "round"
            , strokeWidth "4"
            ] []
        , g 
            [ id "mask2"
            , fillRule "evenodd"
            , transform "translate(0, 120)"
            , Svg.Attributes.clipPath "url(#mask2)"
            ]
            [ g 
                [ stroke "#1B2B40"
                , strokeLinejoin "round"
                , strokeWidth "4"
                , transform "translate(-120, -160)"
                ]
                (List.reverse ( List.map (showBlock v) ([3..11]) ))
            ]
        , g 
            [ id "mask"
            , fillRule "evenodd"
            , transform "translate(80, 80)"
            , Svg.Attributes.clipPath "url(#mask)"
            ]
            [ g 
                [ stroke "#1B2B40"
                , strokeLinejoin "round"
                , strokeWidth "4"
                , transform "translate(-200, -120)"
                ]
                (List.reverse ( List.map (showBlock v) [0,1] ))

            ]
        ]
    ]

