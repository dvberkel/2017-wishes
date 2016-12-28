module Wish exposing (Model, Message, init, view, update, subscriptions)

import Html exposing (Html, div, text, figure)
import Html.Attributes exposing (class)

type Message =
    DoNothing


type alias Model =
    {
      size: Int
    , tiles: List Int
    }


init: Int -> Model
init n =
    {
      size = n
    , tiles = List.range 0 (n * n - 1)
    }


view: Model -> Html Message
view model =
    div [ class "board" ] (List.map tileView model.tiles)


tileView : Int -> Html Message
tileView n =
    let
        front = toString (2*n)
        back  = toString (2*n + 1)
    in
        div [ class "tile" ] [
              figure [ class "front" ] [ text front ]
            , figure [ class "back"  ] [ text back  ]
            ]


update: Message -> Model -> (Model, Cmd Message)
update message model =
    (model, Cmd.none)


subscriptions: Model -> Sub Message
subscriptions model =
    Sub.batch []
