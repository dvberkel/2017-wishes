import Wish exposing (Model, Message)
import Tile
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
        model = Wish.start 6 wish
    in
        program
        {
          init = (model, Random.generate Tile.Shuffled (shuffle model.tiles))
        , view = Wish.view
        , update = Wish.update
        , subscriptions = Wish.subscriptions
        }
