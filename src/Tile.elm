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
   | Check
   | TurnOver
   | Tick
   | Flip Int


update: Message -> Collection -> Collection
update message tiles =
    case message of
        Flip id -> flip id tiles

        TurnOver -> turnover tiles

        Check -> check tiles

        _ -> tiles


check: Collection -> Collection
check tiles =
    let
        inspected =
            List.filter (\t -> t.inspecting) tiles

        isSame =
            same inspected

        found tile =
            if tile.inspecting then
                { tile | inspecting = False, found = True }
            else
                tile
    in
        if isSame then
            List.map found tiles
        else
            tiles


same: Collection -> Bool
same elements =
        List.length elements == 2
    && (get elements 0).id // 2 == (get elements 1).id // 2


get: Collection -> Int -> Model
get xs n =
    case List.head (List.drop n xs) of
        Just v -> v
        Nothing -> tile -1 {- should not happen -}

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
        id = "id-" ++ (toString n)
        flipped = t.inspecting || t.found
        msg = if not flipped then
                  Flip t.id
              else
                  DoNothing
    in
        div [ classList
                  [
                    ("tile", True)
                  , (id, True)
                  , ("flipped", flipped)
                  , ("found", t.found)
                  ]
            , onClick msg
            ]
        [
          figure [ class "front" ] [ ]
        , figure [ class "back"  ] [ ]
        ]
