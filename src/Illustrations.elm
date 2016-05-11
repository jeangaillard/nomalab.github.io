module Illustrations exposing (..) --where

import Svg exposing (..)
import Svg.Attributes exposing (..)


file =
  svg
    [ width "367px"
    , height "434px"
    , viewBox "-2 -170 367 434"
    , version "1.1"
    ]
    [ g
        [ transform "translate(0, -170)"
        , strokeLinejoin "round"
        ]
        [ polygon 
            [ stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#DCDFE2"
            , points "160 430 0 350 0 310 160 390"
            ]
            []
        , polygon 
            [ stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#DCDFE2"
            , points "160 430 160 390 360 290 360 330"
            ]
            []
        , Svg.path
            [ d "M0,310 L0,230 L120,170 L360,290 L160,390 L0,310 L0,310 Z M40,310 L120,270 L40,230 L120,190 L320,290 L160,370 L40,310 L40,310 Z"
            , stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#FFFFFF"
            ]
            []
        , polygon 
            [ stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#DCDFE2"
            , points "80 330 40 310 120 270 120 310"
            ]
            []
        , polygon 
            [ stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#DCDFE2"
            , points "80 250 40 230 120 190 120 230"
            ]
            []
        , polygon 
            [ stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#DCDFE2"
            , points "280 310 320 290 120 190 120 230"
            ]
            []
        ]
    ]



{-}
<svg width "367px" height "226px" viewBox "-2 -3 367 226" version "1.1" xmlns "http://www.w3.org/2000/svg" xmlns:xlink "http://www.w3.org/1999/xlink">
    <!-- Generator: Sketch 3.7.1 (28215) - http://www.bohemiancoding.com/sketch -->
    <desc>Created with Sketch.</desc>
    <defs></defs>
    <path d "M2.22044605e-16,140 L2.22044605e-16,60 L120,0 L360,119 L160,220 L2.22044605e-16,140 Z M42,138 L118,99 L40,60 L120,20 L320,119 L162,198 L42,138 Z" id "Combined-Shape" stroke "#1C2C3F" stroke-width "4" fill "#FFFFFF" fill-rule "evenodd"></path>
</svg>
-}

fileMask =
  svg
    [ width "277px"
    , height "199px"
    , viewBox "638 0 277 199"
    , version "1.1"
    ]
    [ defs
        []
        [ polygon
            [ id "path-1"
            , points "0 139 76 100 0 62 0 0 277 0 277 120 120 199"
            ]
            []
        , rect
            [ id "path-3"
            , x "0"
            , y "0"
            , width "277"
            , height "200"
            ]
            []
        , Svg.mask
            [ id "mask-4"
            , maskContentUnits "userSpaceOnUse"
            , maskUnits "objectBoundingBox"
            , x "0"
            , y "0"
            , width "277"
            , height "200"
            , fill "white"
            ]
            [ use
                [ xlinkHref "#path-3" ]
                []
            ]
        ]
    , g 
        [ id "mask"
        , stroke "none"
        , strokeWidth "1"
        , fill "none"
        , fillRule "evenodd"
        , transform "translate(640, 0)"
        ]
        [ Svg.mask
            [ id "mask-2"
            , fill "white"
            ]
            [ use 
                [ xlinkHref "#path-1"
                ]
                []
            ]
        , g 
            [ id "Path-113"
            ]
            []
        , g
            [ id "Group"
            , Svg.Attributes.mask "url(#mask-2)"
            , fill "#D8D8D8"
            ]
            [ use
              [ id "Rectangle-1"
              , Svg.Attributes.mask "url(#mask-4)"
              , xlinkHref "#path-3"
              ]
              []
            ]
        ]
    ]




fileMask2 scroll =
  svg
    [ width "367px"
    , height "434px"
    , viewBox "-2 -170 367 434"
    , version "1.1"
    ]
    [ defs
        []
        [ Svg.clipPath
            [ id "mask"
            ]
            [ polygon
              [ id "maskShape"
              , points "118 270 38 230 36 0 322 0 322 290 160 372 38 310"
              ]
              []
            ]
        , Svg.clipPath
            [ id "mask2"
            ]
            [ polygon
              [ id "maskShape2"
              , points "38 230 36 0 322 0 322 290 160 372 38 310"
              ]
              []
            ]
        ]
    , g 
        [ id "mask"
        , fillRule "evenodd"
        , transform "translate(0, -170)"
        , Svg.Attributes.clipPath "url(#mask)"
        ]
        [ g 
            [ transform "translate(80, 190)"
            ]
            (List.map (bloc 2 scroll) [0..3])
        ]
    , g 
        [ id "mask2"
        , fillRule "evenodd"
        , transform "translate(0, -170)"
        , Svg.Attributes.clipPath "url(#mask2)"
        ]
        [ g 
            [ transform "translate(80, 190)"
            ]
            (List.map (bloc 4 scroll) [8..19])
        ]
    ]


bloc s o i =
  let
    delay =
      if (o - i*5) > 140 then 140
      else if i*5 < o then (o - i*5)
      else 0
    posX = 
      ((i // s) * 40) - ((i % s) * 40)
    posY = 
      ((i // s) * 20) + ((i % s) * 20) - delay
    lightColor =
      if delay >= 140
        then "#3BAAFF"
        else "#DCDFE2"
    darkColor =
      if delay >= 140
        then "#158EEB"
        else "#9CA2A8"
  in
    g
      [ fillRule "evenodd"
      , strokeLinejoin "round"
      , transform ("translate(" ++ (toString posX) ++ ", " ++ (toString posY) ++ ")")
      ]
      [ polygon
          [ class "right"
          , stroke "#1C2C3F"
          , strokeWidth "4"
          , fill darkColor
          , points "40 70 40 40 80 20 80 50"
          ]
          []
      , polygon
          [ class "left"
          , stroke "#1C2C3F"
          , strokeWidth "4"
          , fill darkColor
          , points "40 70 0 50 0 20 40 40"
          ]
          []
      , polygon
          [ class "top"
          , stroke "#1C2C3F"
          , strokeWidth "4"
          , fill lightColor
          , points "40 40 0 20 40 0 80 20"
          ]
          []
      ]

{-
<svg width "277px" height "199px" viewBox "638 0 277 199" version "1.1" xmlns "http://www.w3.org/2000/svg" xmlns:xlink "http://www.w3.org/1999/xlink">
    <!-- Generator: Sketch 3.7.1 (28215) - http://www.bohemiancoding.com/sketch -->
    <desc>Created with Sketch.</desc>
    <defs>
        <polygon id "path-1" points "0 139 76 100 0 62 0 0 277 0 277 120 120 199"></polygon>
        <rect id "path-3" x "0" y "0" width "277" height "200"></rect>
        <mask id "mask-4" maskContentUnits "userSpaceOnUse" maskUnits "objectBoundingBox" x "0" y "0" width "277" height "200" fill "white">
            <use xlink:href "#path-3"></use>
        </mask>
    </defs>
    <g id "mask" stroke "none" stroke-width "1" fill "none" fill-rule "evenodd" transform "translate(638.000000, 0.000000)">
        <mask id "mask-2" fill "white">
            <use xlink:href "#path-1"></use>
        </mask>
        <g id "Path-113"></g>
        <g id "Group" mask "url(#mask-2)" stroke "#979797" stroke-width "2" fill "#D8D8D8">
            <use id "Rectangle-1" mask "url(#mask-4)" xlink:href "#path-3"></use>
        </g>
    </g>
</svg>




<svg width "84px" height "75px" viewBox "-2 -3 84 75" version "1.1" xmlns "http://www.w3.org/2000/svg" xmlns:xlink "http://www.w3.org/1999/xlink">
    <!-- Generator: Sketch 3.7.1 (28215) - http://www.bohemiancoding.com/sketch -->
    <desc>Created with Sketch.</desc>
    <defs></defs>
    <g id "Group-3-Copy-5" stroke "none" stroke-width "1" fill "none" fill-rule "evenodd" stroke-linejoin "round">
        <polygon id "Path-5364-Copy" stroke "#1C2C3F" stroke-width "4" fill "#DCDFE2" points "40 69 40 40 80 20 80 49"></polygon>
        <polygon id "Path-5364-Copy-2" stroke "#1C2C3F" stroke-width "4" fill "#9CA2A8" points "40 69 0 49 0 20 40 40"></polygon>
        <polygon id "Combined-Shape" stroke "#1C2C3F" stroke-width "4" fill "#DCDFE2" points "40 40 0 20 40 0 80 20"></polygon>
    </g>
</svg>
-}



minifile o s =
  let
    offset = 
      if 0 - (500 - s + o) > 50
        then  50
      else if s > 500 + o
        then 0 - (500 - s + o)
      else 0
    lightColor =
      if offset == 50
        then "#3BAAFF"
        else "#DCDFE2"
    darkColor =
      if offset == 50
        then "#158EEB"
        else "#9CA2A8"
  in
    svg
      [ width "85px"
      , height "122px"
      , viewBox "-1 -21 85 122"
      , version "1.1"
      ]
      [ defs
          []
          [ Svg.clipPath
              [ id "mask"
              ]
              [ polygon
                [ id "maskShape"
                , points "0 0 83 0 83 93 30 120 0 105"
                ]
                []
              ]
          ]
      , g 
          [ id "mask"
          , fillRule "evenodd"
          , transform ("translate(0, -20)")
          , Svg.Attributes.clipPath "url(#mask)"
          , strokeLinejoin "round"
          ]
          [ g 
              [ id "mask"
              , fillRule "evenodd"
              , transform ("translate(0, " ++ (toString offset) ++ ")")
              , Svg.Attributes.clipPath "url(#mask)"
              , strokeLinejoin "round"
              ]
              [ polygon
                  [ id "face"
                  , stroke "#1C2C3F"
                  , strokeWidth "4"
                  , fill lightColor
                  , points "30 97 30 48 70 28 70 77"
                  ]
                  []
              , polygon
                  [ id "left"
                  , stroke "#1C2C3F"
                  , strokeWidth "4"
                  , fill darkColor
                  , points "30 97 14 89 14 50 30 58"
                  ]
                  []
              , polygon
                  [ id "top"
                  , stroke "#1C2C3F"
                  , strokeWidth "4"
                  , fill lightColor
                  , points "40 43 24 35 54 20 70 28"
                  ]
                  []
              , polygon
                  [ id "corner"
                  , stroke "#1C2C3F"
                  , strokeWidth "4"
                  , fill lightColor
                  , points "30 57 14 49 24 35 40 43"
                  ]
                  []
              ]
          ]
      ]

fileslot =
  svg
    [ width "88px"
    , height "46px"
    , viewBox "-2 58 88 46"
    , version "1.1"
    ]
    [ polygon
        [ id "slot"
        , stroke "#1C2C3F"
        , strokeWidth "4"
        , strokeLinejoin "round"
        , fill "#9CA2A8"
        , fillRule "evenodd"
        , points "0 87 52 60 82 75 30 102"
        ]
        []
    ]


cloud =
  svg
    [ width "388px"
    , height "225px"
    , viewBox "-2 -2 388 225"
    , version "1.1"
    ]
    [ g
        [ fillRule "evenodd"
        , strokeLinejoin "round"
        ]
        [ Svg.path 
            [ d "M147.209272,207.833331 C113.827248,224.549328 59.7042914,224.549328 26.3222665,207.833331 C10.3802655,199.850399 2.05156529,189.498777 1.33616576,179.04086 C0.553542241,167.600243 0.927878438,137.675217 0.927878438,137.675217 L29.9208064,113.371536 L49.7165106,98.4034327 C49.7165106,98.4034327 49.7588817,66.3667455 49.7165098,65.754633 C48.5506813,48.9128266 60.8047001,31.8814255 86.4785663,19.0252771 C135.319146,-5.43156721 214.334375,-5.56938083 263.515022,18.6118362 C265.990155,16.6900315 268.907881,14.8696548 272.268201,13.18698 C297.7809,0.411535888 339.145157,0.411535888 364.657855,13.18698 C377.11426,19.4245053 383.488909,27.5542182 383.7818,35.7284229 C383.787599,35.890267 383.791014,76.4081152 383.792045,76.5699799 C383.845584,84.9770695 377.46752,93.3925224 364.657855,99.8069421 C347.389694,108.453947 169.401808,196.720453 147.209272,207.833331 Z"
            , stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#DCDFE2"
            ]
            []
        , Svg.path 
            [ d "M147.209272,167.477344 C113.827248,184.193341 59.7042914,184.193341 26.3222665,167.477344 C-7.05975847,150.761347 -7.05975847,123.659361 26.3222665,106.943364 C37.961138,101.115218 52.1213102,97.3190941 67.0446456,95.5549939 C38.561521,71.4036566 45.0394946,39.7758276 86.4785663,19.0252771 C135.319146,-5.43156721 214.334375,-5.56938083 263.515022,18.6118362 C265.990155,16.6900315 268.907881,14.8696548 272.268201,13.18698 C297.7809,0.411535888 339.145157,0.411535888 364.657855,13.18698 C390.170554,25.9624241 390.170554,46.6755115 364.657855,59.4509555 C347.389694,68.0979604 169.401808,156.364467 147.209272,167.477344 Z"
            , stroke "#1C2C3F"
            , strokeWidth "4"
            , fill "#FFFFFF"
            ]
            []
        ]
    ]


isoLogo =
  svg 
    [ width "386px"
    , height "226px"
    , viewBox "-3 -3 386 226"
    , version "1.1"
    ]
    [ g []
        [ polygon [ fill "#3BAAFF", points "293.655119 150.837458 360 100 330.600953 62.9859184 220 70 185.743712 34.0879383 80 40 20 79.0664062 80 120 20 153.519531 80 200 162.611001 207.638928 220 150"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#DCDFE2", points "260 170 320 160 380 70 380 50 230 55 240 40 240 20 80 19 0 59 0 80 60 110 0 140 0 160 120 220 180 210 220 150"] []
        , g [ transform "translate(60.000000, 20.000000)"
            , stroke "#1C2C3F"
            , strokeWidth "4"
            , strokeLinejoin "round"
            ]
            [ Svg.path [ d "M60,180 L60,200"   , fill "#DCDFE2" ] []
            , Svg.path [ d "M120,170 L120,190" , fill "#DCDFE2" ] []
            , Svg.path [ d "M160,110 L160,130" , fill "#DCDFE2" ] []
            , Svg.path [ d "M200,130 L200,150" , fill "#DCDFE2" ] []
            , Svg.path [ d "M260,120 L260,140" , fill "#DCDFE2" ] []
            , Svg.path [ d "M260,40 L260,60"   , fill "#DCDFE2" ] []
            , Svg.path [ d "M200,50 L200,70"   , fill "#DCDFE2" ] []
            , Svg.path [ d "M160,30 L160,50"   , fill "#DCDFE2" ] []
            , Svg.path [ d "M120,10 L120,30"   , fill "#DCDFE2" ] []
            , Svg.path [ d "M60,20 L60,40"     , fill "#DCDFE2" ] []
            , Svg.path [ d "M20,0 L20,20"      , fill "#DCDFE2" ] []
            , polyline 
                [ fill "#3BAAFF"
                , points "40 50 40 70 32 82 135.064058 83.9422982 160 110 137.055143 118.527572 120 110 60 120 20 100 0 130 40 130 40 150 32.2945667 161.55815 82.721247 167.599555 160 110 229.436569 108.186104 284.883847 72.4419235 260 60 200 70 160 50 140 80 130 70 140 40 120 30 60 40 20 20 10 35"
                ]
                []
            , Svg.path [ d "M40,50 L40,70"     , fill "#DCDFE2"] []
            , Svg.path [ d "M20,80 L20,100"    , fill "#DCDFE2"] []
            , Svg.path [ d "M60,100 L60,120"   , fill "#DCDFE2"] []
            , Svg.path [ d "M120,90 L120,110"  , fill "#DCDFE2"] []
            , Svg.path [ d "M40,130 L40,150"   , fill "#DCDFE2"] []
            ]
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", points "80 180 0 140 20 110 80 100 60 130 100 150"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", points "80 180 120 200 180 190 220 130 160 140 140 170"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", points "220 130 260 150 320 140 360 80 300 90 280 120"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", points "80 100 0 60 20 30 80 20 60 50 100 70"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", transform "translate(160.000000, 25.000000) scale(-1, -1) translate(-160.000000, -25.000000) ", points "240 30 120 50 80 30 100 0 140 20 200 10"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", transform "translate(300.000000, 55.000000) scale(-1, -1) translate(-300.000000, -55.000000) ", points "380 60 260 80 220 60 240 30 280 50 340 40"] []
        , polygon [ stroke "#1C2C3F", strokeWidth "4", strokeLinejoin "round", fill "#FFFFFF", transform "translate(160.000000, 90.000000) scale(-1, -1) translate(-160.000000, -90.000000) ", points "240 80 180.021594 89.996401 160 120 100 130 120 100 80 80 100 50 140 70 200 60"] []
        ]
    ]

--        , g id="Group-9-Copy" transform="translate(60.000000, 0.000000)" stroke="#1C2C3F" stroke-width="4" stroke-linejoin="round">
--            <polygon id="Path-6913-Copy-13" fill="#0B75C6" points="160 50 100.021594 59.996401 80 90 20 100 20 80 30 65 0 50 0 30 60 40 160 30"></polygon>
--            <polygon id="Path-6913-Copy-15" fill="#3BAAFF" points="160 30 100.021594 39.996401 80 70 20 80 40 50 0 30 20 0 60 20 120 10"></polygon>
--            <path d="M81,70 L81,90" id="Line" stroke-linecap="square"></path>
--            <path d="M101,40 L101,60" id="Line-Copy-259" stroke-linecap="square"></path>
--        </g>
--        <g id="Group-9-Copy-3" transform="translate(200.000000, 30.000000)" stroke="#1C2C3F" stroke-width="4" stroke-linejoin="round">
--            <polygon id="Path-6913-Copy-13" fill="#0B75C6" points="160 50 100.021594 59.996401 80 90 20 100 20 80 30 65 0 50 0 30 60 40 160 30"></polygon>
--            <polygon id="Path-6913-Copy-15" fill="#3BAAFF" points="160 30 100.021594 39.996401 80 70 20 80 40 50 0 30 20 0 60 20 120 10"></polygon>
--            <path d="M81,70 L81,90" id="Line" stroke-linecap="square"></path>
--            <path d="M101,40 L101,60" id="Line-Copy-259" stroke-linecap="square"></path>
--        </g>
--        <g id="Group-9-Copy-4" transform="translate(60.000000, 80.000000)" stroke="#1C2C3F" stroke-width="4" stroke-linejoin="round">
--            <polygon id="Path-6913-Copy-13" fill="#0B75C6" points="160 50 100.021594 59.996401 80 90 20 100 20 80 30 65 0 50 0 30 60 40 160 30"></polygon>
--            <polygon id="Path-6913-Copy-15" fill="#3BAAFF" points="160 30 100.021594 39.996401 80 70 20 80 40 50 0 30 20 0 60 20 120 10"></polygon>
--            <path d="M81,70 L81,90" id="Line" stroke-linecap="square"></path>
--            <path d="M101,40 L101,60" id="Line-Copy-259" stroke-linecap="square"></path>
--        </g>
--    </g>
--</svg>






--<svg width="160px" height="100px" viewBox="60 0 160 100" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
--    <!-- Generator: Sketch 3.7.2 (28276) - http://www.bohemiancoding.com/sketch -->
--    <desc>Created with Sketch.</desc>
--    <defs></defs>
--    <polygon id="Path-6913-Copy-15" stroke="none" fill-opacity="0.397758152" fill="#FF0000" fill-rule="evenodd" points="220 50 160.021594 59.996401 140 90 80 100 80 70 60 50 60 0 220 0"></polygon>
--</svg>





