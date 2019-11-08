module Counter exposing(Model)

import Html exposing (..)
import Html.Events exposing (..)
import Browser

-- MODEL

type alias Model =
    Int

initialModel : Model
initialModel =
    0

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ button [onClick Decrement] [text "-"]
        , text (String.fromInt model)
        , button [onClick Increment] [text "+"]
        ]

-- UPDATE

type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
