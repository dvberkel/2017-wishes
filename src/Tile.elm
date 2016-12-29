module Tile exposing (Collection, tiles, view)

import Html exposing (Html, div, figure, text)
import Html.Attributes exposing (class)

type alias Model =
    {
      id: Int
    }


type alias Collection =
    List Model


tile: Int -> Model
tile n =
    {
      id = n
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
        front = toString (2*n)
        back  = toString (2*n + 1)
    in
        div [ class "tile" ] [
              figure [ class "front" ] [ text front ]
            , figure [ class "back"  ] [ text back  ]
            ]
