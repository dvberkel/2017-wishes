module Wish exposing (Model, init, view)

import Html exposing (Html,text)

type Message =
    DoNothing

type alias Model =
    {
        state: Int
    }

init: Int -> Model
init n =
    {
        state = n
    }


view: Model -> Html Message
view model =
    text (toString model.state)

