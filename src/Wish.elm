module Wish exposing (Model, Message, start, view, update, subscriptions)

import Html exposing (Html, div, text, figure)
import Html.Attributes exposing (class, classList)
import Time exposing (Time, second)
import Random exposing (Seed, initialSeed)
import Markdown exposing (toHtml)
import Tile exposing (tiles, isSolved)


type alias Message = Tile.Message


type State =
      Waiting
    | Inspecting
    | Checking
    | Updating


type alias Model =
    {
      size: Int
    , seed: Seed
    , state: State
    , tiles: Tile.Collection
    , wish: String
    }


start: Int -> String -> Model
start n wish =
    init (tiles n) wish


init: Tile.Collection -> String -> Model
init ts wish =
    {
      size = List.length ts
    , seed = initialSeed 0
    , state = Waiting
    , tiles = ts
    , wish = wish
    }


view: Model -> Html Tile.Message
view model =
    let
        solved = isSolved model.tiles
    in
        div []
            [
              div [ class "board" ] (List.map Tile.view  model.tiles)
            ,  toHtml [ classList
                            [
                              ("wish", True)
                            , ("solved", solved)
                            ]
                      ] model.wish
            ]


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
                tiles = Tile.update Tile.Check model.tiles
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
