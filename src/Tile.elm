module Tile exposing (Collection, tiles, view)

import Html exposing (Html, div, figure, text)
import Html.Attributes exposing (class, classList)

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

view : Model -> Html a
view t =
    let
        n = t.id
        flipped = t.inspecting || t.found
        front = toString (2*n)
        back  = toString (2*n + 1)
    in
        div [ classList
                  [
                    ("tile", True)
                  , ("flipped", flipped)
                  ]
            ]
        [
          figure [ class "front" ] [ text front ]
        , figure [ class "back"  ] [ text back  ]
        ]
