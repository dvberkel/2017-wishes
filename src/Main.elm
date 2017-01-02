import Wish exposing (Model, Message)
import Html exposing (program)


main : Program Never Model Message
main =
    program {
          init = (Wish.init 6, Cmd.none)
        , view = Wish.view
        , update = Wish.update
        , subscriptions = Wish.subscriptions
        }
