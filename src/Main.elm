import Wish exposing (Model, Message)
import Html exposing (program)
import Random exposing (step)
import Random.List exposing (shuffle)


wish: String
wish = "Hello, World"


main : Program Never Model Message
main =
    let
        model = mix (Wish.start 6 wish)
    in
        program
        {
          init = (model, Cmd.none)
        , view = Wish.view
        , update = Wish.update
        , subscriptions = Wish.subscriptions
        }

mix : Model -> Model
mix model =
    let
       (tiles, seed) = step (shuffle model.tiles) model.seed
    in
        { model | seed = seed, tiles = tiles }
