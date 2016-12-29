module Tile exposing (Collection, Message (..), tiles, view, update)

import Html exposing (Html, div, figure, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)


type alias Model =
    {
      id: Int
    , inspecting: Bool
    , found: Bool
    }


type alias Collection =
    List Model


tile: Int -> Model
tile n =
    {
      id = n
    , inspecting = False
    , found = False
    }


tiles: Int -> Collection
tiles n =
    let
        ids = List.range 0 (n * n - 1)
    in
        List.map tile ids


type Message =
     DoNothing
   | TurnOver
   | Tick
   | Flip Int


update: Message -> Collection -> Collection
update message tiles =
    case message of
        Flip id -> flip id tiles

        TurnOver -> turnover tiles

        _ -> tiles


turnover: Collection -> Collection
turnover tiles =
    let
        turnover tile =
            { tile | inspecting = False }
    in
        List.map turnover tiles


flip: Int -> Collection -> Collection
flip id tiles =
    let
        flip id tile =
            if tile.id == id then
                { tile | inspecting = not tile.inspecting }
            else
                tile
    in
        List.map (flip id) tiles


view : Model -> Html Message
view t =
    let
        n = t.id
        flipped = t.inspecting || t.found
        front = toString (2*n)
        back  = toString (2*n + 1)
        msg = if not flipped then
                  Flip t.id
              else
                  DoNothing
    in
        div [ classList
                  [
                    ("tile", True)
                  , ("flipped", flipped)
                  ]
            , onClick msg
            ]
        [
          figure [ class "front" ] [ text front ]
        , figure [ class "back"  ] [ text back  ]
        ]
