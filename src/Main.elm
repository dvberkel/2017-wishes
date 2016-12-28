import Wish exposing (Model)
import Html.App exposing (program)

model : Model
model = Wish.init 5

main : Program Never
main =
    program {
          init = (Wish.init 5, Cmd.none)
        , view = Wish.view
        , update = Wish.update
        , subscriptions = Wish.subscriptions
        }
