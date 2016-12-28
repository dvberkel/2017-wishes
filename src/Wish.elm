module Wish exposing (Model, Message, init, view, update, subscriptions)

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


update: Message -> Model -> (Model, Cmd Message)
update message model =
    (model, Cmd.none)


subscriptions: Model -> Sub Message
subscriptions model =
    Sub.batch []
