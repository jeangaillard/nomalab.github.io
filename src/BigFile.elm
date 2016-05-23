module BigFile exposing (..)

--where

import Html exposing (div)
import Html.Attributes
import Svg exposing (..)
import Svg.Attributes exposing (..)
import VirtualDom exposing (lazy, lazy2)


bigBlock active =
    let
        lightColor =
            if active then
                "#3BAAFF"
            else
                "#DCDFE2"

        darkColor =
            if active then
                "#158EEB"
            else
                "#9CA2A8"

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
            if (o - i * 20) > 720 then
                120
            else if (o - i * 20) > 600 then
                (o - i * 20) - 600
            else
                0

        basex =
            (3 - i % 3) * 80

        basey =
            ((3 - i % 3) * 40) + (i // 3 * 80)

        x =
            basex - (offset * 2)

        y =
            basey + offset
    in
        g [ transform ("translate(" ++ (toString x) ++ ", " ++ (toString y) ++ " )") ] (bigBlock (offset == 120))



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
        , g
            [ fill "none"
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
                ]
                []
            , polygon
                [ fill "#E9E9E9"
                , points "280 360 280 120 360 160 360 400"
                , stroke "#1B2B40"
                , strokeLinejoin "round"
                , strokeWidth "4"
                ]
                []
            , polygon
                [ fill "#E9E9E9"
                , points "360 160 360 80 440 120"
                , stroke "#1B2B40"
                , strokeLinejoin "round"
                , strokeWidth "4"
                ]
                []
            , polygon
                [ fill "#E9E9E9"
                , points "520 480 280 360 360 320 520 400"
                , stroke "#1B2B40"
                , strokeLinejoin "round"
                , strokeWidth "4"
                ]
                []
            , polygon
                [ fill "#FFFFFF"
                , points "360 40 440 0 640 100 560 140"
                , stroke "#1B2B40"
                , strokeLinejoin "round"
                , strokeWidth "4"
                ]
                []
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
                    (List.reverse (List.map (showBlock v) ([3..11])))
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
                    (List.reverse (List.map (showBlock v) [ 0, 1 ]))
                ]
            ]
        ]
