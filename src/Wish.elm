module Wish exposing (Model, Message, init, view, update, subscriptions)

import Html exposing (Html, div, text, figure)
import Html.Attributes exposing (class)

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
    div [ class "board" ] [
          div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        , div [ class "tile"] [ figure [ class "front"] [ text "1" ], figure [ class "back" ] [ text "2" ] ]
        ]


update: Message -> Model -> (Model, Cmd Message)
update message model =
    (model, Cmd.none)


subscriptions: Model -> Sub Message
subscriptions model =
    Sub.batch []
