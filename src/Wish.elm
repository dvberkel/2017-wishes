module Wish exposing (Model, Message, init, view, update, subscriptions)

import Html exposing (Html, div, text, figure)
import Html.Attributes exposing (class)
import Time exposing (Time, second)
import Tile exposing (tiles)


type alias Message = Tile.Message


type State =
      Waiting
    | Inspecting
    | Checking
    | Updating


type alias Model =
    {
      size: Int
    , state: State
    , tiles: Tile.Collection
    }


init: Int -> Model
init n =
    {
      size = n
    , state = Waiting
    , tiles = tiles n
    }


view: Model -> Html Tile.Message
view model =
    div [ class "board" ] (List.map Tile.view  model.tiles)


update: Message -> Model -> (Model, Cmd Message)
update message model =
    case model.state of
        Waiting ->
            let
                tiles = Tile.update message model.tiles
                state =
                    case message of
                        Tile.Flip _ -> Inspecting
                        _ -> model.state
            in
                ({model | state = state, tiles = tiles}, Cmd.none)

        Inspecting ->
            let
                tiles = Tile.update message model.tiles
                state =
                    case message of
                        Tile.Flip _ -> Checking
                        _ -> model.state
            in
                ({model | state = state, tiles = tiles}, Cmd.none)

        Checking ->
            let
                tiles = Tile.update Tile.DoNothing model.tiles
                state =
                    case message of
                        Tile.Tick -> Updating
                        _ -> model.state
            in
                ({model | state = state, tiles = tiles}, Cmd.none)

        Updating ->
            let
                tiles = Tile.update Tile.TurnOver model.tiles
                state =
                    case message of
                        Tile.Tick -> Waiting
                        _ -> model.state
            in
                ({model | state = state, tiles = tiles}, Cmd.none)


subscriptions: Model -> Sub Message
subscriptions model =
    Sub.batch
        [
          Time.every second (\t -> Tile.Tick)
        ]
