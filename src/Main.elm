module Main exposing (main)

import Browser
import Html exposing (Html)
import Time


type alias Model =
    { title : String
    , latestTick : Time.Posix
    , toasts : List String
    }


type Msg
    = Tick Time.Posix


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = \model -> { title = model.title, body = view model }
        , update = update
        , subscriptions = \_ -> Time.every 1000 Tick
        }


init : () -> ( Model, Cmd Msg )
init () =
    ( { title = "Playground"
      , latestTick = Time.millisToPosix 0
      , toasts = []
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick now ->
            ( { model | latestTick = now }, Cmd.none )


view : Model -> List (Html Msg)
view model =
    [ Html.text "hello, world" ]
