module Wish exposing (Model, Message, init, view, update, subscriptions)

import Html exposing (Html, div, text, figure)
import Html.Attributes exposing (class)
import Tile exposing (tiles)


type alias Message = Tile.Message


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


view: Model -> Html Tile.Message
view model =
    div [ class "board" ] (List.map Tile.view  model.tiles)


update: Message -> Model -> (Model, Cmd Message)
update message model =
    let
        tiles = Tile.update message model.tiles
    in
        ({model | tiles = tiles}, Cmd.none)


subscriptions: Model -> Sub Message
subscriptions model =
    Sub.batch []
