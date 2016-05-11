module Data where

-- Data
import List
import Maybe exposing (Maybe (..))

import Json.Decode exposing ((:=))
import Json.Encode
import Json.Decode.Extra exposing ((|:))

-- Misc
import Core.Infix exposing (..)


type alias Data a =
  { decoder :  Decoder a
  , encoder :  Encoder a
  , zero :     a
  , validate : (a -> Result String a)
  }


type0 : String -> a -> String -> Decoder a
type0 n fn s =
  if n == s
    then succeed fn
    else fail ("Unknown type: " ++ n ++ " in " ++ s )

type1 : (String, Decoder a) -> String -> Decoder a
type1 (n, dec) s =
  if n == s
    then dec
    else fail ("Unknown type: " ++ n ++ " in " ++ s )


{-| This code produce an easier to Debug error message
-}
decodeType : String -> List (String, Decoder a) -> Decoder a
decodeType typeName choices =
  (typeName := string) `andThen` (\typeValue ->
    let
      findType : List (String, Decoder a) -> Decoder a
      findType list = 
        case list of
          (t,d) :: rest ->
            if t == typeValue
              then d
              else findType rest
          [] ->
            fail ("Unknown type `" ++ typeValue ++ "` in `" ++ typeName ++ "`.")
    in
      findType choices
  )


-- Export all JSON and EXTRA
    
(=:) = (:=)
(:|) = (|:)

type alias Value = Json.Encode.Value
any = Json.Encode.null

type alias Decoder a = Json.Decode.Decoder a
decodeString =
  Json.Decode.decodeString

decodeValue =
  Json.Decode.decodeValue

-- Literals --

string =
  Data
    Json.Decode.string
    Json.Encode.string
    ""
    Result.succeed

int =
  Data
    Json.Decode.int
    Json.Encode.int
    0
    Result.succeed

float =
  Data
    Json.Decode.float
    Json.Encode.float
    0
    Result.succeed

bool =
  Data
    Json.Decode.bool
    Json.Encode.bool
    False
    Result.succeed

null =
  Data
    Json.Decode.null
    Json.Encode.null
    any
    Result.succeed

list =
  Data
    Json.Decode.list
    Json.Encode.list
    []
    Result.succeed

array =
  Data
    Json.Decode.array
    Json.Encode.array
    Array.empty
    Result.succeed

tuple1 =
  Data
    Json.Decode.tuple1
    Json.Encode.tuple1
    tuple1
    Result.succeed

tuple2 =
  Data
    Json.Decode.tuple2
    Json.Encode.tuple2
    tuple2
    Result.succeed

tuple3 =
  Data
    Json.Decode.tuple3
    Json.Encode.tuple3
    tuple3
    Result.succeed

tuple4 =
  Data
    Json.Decode.tuple4
    Json.Encode.tuple4
    tuple4
    Result.succeed

tuple5 =
  Data
    Json.Decode.tuple5
    Json.Encode.tuple5
    tuple5
    Result.succeed

tuple6 =
  Data
    Json.Decode.tuple6
    Json.Encode.tuple6
    tuple6
    Result.succeed

tuple7 =
  Data
    Json.Decode.tuple7
    Json.Encode.tuple7
    tuple7
    Result.succeed

tuple8 =
  Data
    Json.Decode.tuple8
    Json.Encode.tuple8
    tuple8
    Result.succeed

at =
  Data
    Json.Decode.at
    Json.Encode.at
    at
    Result.succeed

object1 =
  Data
    Json.Decode.object1
    Json.Encode.object1
    object1
    Result.succeed

object2 =
  Data
    Json.Decode.object2
    Json.Encode.object2
    object2
    Result.succeed

object3 =
  Data
    Json.Decode.object3
    Json.Encode.object3
    object3
    Result.succeed

object4 =
  Data
    Json.Decode.object4
    Json.Encode.object4
    object4
    Result.succeed

object5 =
  Data
    Json.Decode.object5
    Json.Encode.object5
    object5
    Result.succeed

object6 =
  Data
    Json.Decode.object6
    Json.Encode.object6
    object6
    Result.succeed

object7 =
  Data
    Json.Decode.object7
    Json.Encode.object7
    object7
    Result.succeed

object8 =
  Data
    Json.Decode.object8
    Json.Encode.object8
    object8
    Result.succeed

keyValuePairs =
  Data
    Json.Decode.keyValuePairs
    Json.Encode.keyValuePairs
    keyValuePairs
    Result.succeed

dict =
  Data
    Json.Decode.dict
    Json.Encode.dict
    dict
    Result.succeed

maybe =
  Data
    Json.Decode.maybe
    Json.Encode.maybe
    maybe
    Result.succeed

oneOf =
  Data
    Json.Decode.oneOf
    Json.Encode.oneOf
    oneOf
    Result.succeed

map =
  Data
    Json.Decode.map
    Json.Encode.map
    map
    Result.succeed

fail =
  Data
    Json.Decode.fail
    Json.Encode.fail
    fail
    Result.succeed

succeed =
  Data
    Json.Decode.succeed
    Json.Encode.succeed
    succeed
    Result.succeed

andThen =
  Data
    Json.Decode.andThen
    Json.Encode.andThen
    andThen
    Result.succeed

value =
  Data
    Json.Decode.value
    Json.Encode.value
    value
    Result.succeed

customDecoder =
  Data
    Json.Decode.customDecoder
    Json.Encode.customDecoder
    customDecoder
    Result.succeed


date = Json.Decode.Extra.date
apply = Json.Decode.Extra.apply
set = Json.Decode.Extra.set
dict2 = Json.Decode.Extra.dict2
withDefault = Json.Decode.Extra.withDefault
maybeNull = Json.Decode.Extra.maybeNull
lazy = Json.Decode.Extra.lazy