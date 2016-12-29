module Wish exposing (Model, Message, init, view, update, subscriptions)

import Html exposing (Html, div, text, figure)
import Html.Attributes exposing (class)
import Tile exposing (tiles)


type Message =
    DoNothing


type alias Model =
    {
      size: Int
    , tiles: Tile.Collection
    }


init: Int -> Model
init n =
    {
      size = n
    , tiles = tiles n
    }


view: Model -> Html Message
view model =
    div [ class "board" ] (List.map Tile.view  model.tiles)


update: Message -> Model -> (Model, Cmd Message)
update message model =
    (model, Cmd.none)


subscriptions: Model -> Sub Message
subscriptions model =
    Sub.batch []
