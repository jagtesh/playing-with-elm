module Main exposing (..)

import Browser exposing (sandbox)
import Html exposing (button, div, text)
import Html.Events exposing (onClick)

initModel =
  { total = 0 
  , lastTotal = 0 }

type Msg = Increment | Decrement | Clear

update msg model =
  case msg of
    Clear ->
      { model | total = model.lastTotal, lastTotal = 0 }
    Increment ->
      { model | total = model.total + 1, lastTotal = model.total }
    Decrement ->
      { model | total = model.total - 1, lastTotal = model.total }

view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model.total) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Clear ] [ text "Undo -> Clear" ]
    ]

main = sandbox { init = initModel, view = view, update = update }
