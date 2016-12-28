import Wish exposing (Model, Message)
import Html exposing (program)

model : Model
model = Wish.init 5

main : Program Never Model Message
main =
    program {
          init = (Wish.init 5, Cmd.none)
        , view = Wish.view
        , update = Wish.update
        , subscriptions = Wish.subscriptions
        }
