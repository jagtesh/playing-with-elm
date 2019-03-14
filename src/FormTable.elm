module Main exposing (Msg(..), initModel, main, update, view, viewItem)

import Browser exposing (sandbox)
import Html exposing (button, div, input, li, text, ul)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onClick, onInput)


initModel =
    { inputText = ""
    , names = []
    }


type Msg
    = Change String
    | AddName
    | RemoveName String


update msg model =
    case msg of
        Change newInputText ->
            { model | inputText = newInputText }

        AddName ->
            { model | names = model.names ++ [ model.inputText ] }

        RemoveName name ->
            { model | names = List.filter (\n -> n /= name) model.names }


view model =
    div []
        [ input [ placeholder "Name", value model.inputText, onInput Change ] []
        , button [ onClick AddName ] [ text "Add" ]
        , ul [] (List.map (\n -> viewItem n) model.names)
        ]



--viewItem : String -> List Html


viewItem n =
    li []
        [ text n
        , button [ onClick (RemoveName n) ] [ text "-" ]
        ]


main =
    sandbox { init = initModel, view = view, update = update }
