module Playground exposing (User, main, welcomeMessage)

import Html


escapeEarth myVelocity mySpeed =
    if myVelocity > 11.186 then
        "Godspeed"

    else if mySpeed == 7.67 then
        "Stay in Orbit"

    else
        "Come back"


computeSpeed distance time =
    distance / time


computeTime startTime endTime =
    endTime - startTime


type alias User =
    { name : String
    , email : String
    , age : Int
    , isLoggedIn : Bool
    }


welcomeMessage : User -> String
welcomeMessage { isLoggedIn, name } =
    case isLoggedIn of
        True ->
            "Welcome " ++ name ++ "!"

        False ->
            "Please log in."


main =
    computeTime 2 3
        |> computeSpeed 7.67
        |> escapeEarth 11
        |> Html.text
