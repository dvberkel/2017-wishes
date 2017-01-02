import Wish exposing (Model, Message)
import Html exposing (program)
import Random exposing (step)
import Random.List exposing (shuffle)


wish: String
wish = """
# Gelukkig Nieuwjaar
Wij willen jullie een heel warm, fijn en gelukkig nieuwjaar wensen.

Hopelijk wordt het een jaar waarin wij veel van elkaar mogen genieten.

Liefs
Daan, Marlies, Sophie, Robin & Hannah
"""


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
