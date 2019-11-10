module Architecture exposing (Model)

import Html exposing (..)
import Html.Attributes exposing (..)



-- MODEL


type alias CpuProcess =
    { p_name : String
    , burst_size : Int
    , priority : Int
    }


type alias SimParameters =
    { algorithm : String
    , processes : List CpuProcess
    , quantum : Int
    }


type alias ProcessTimeDatum =
    { p_name : String
    , wait_time : Int
    , turnaround_time : Int
    }


type alias GanttDatum =
    { p_name : String
    , start_time : Int
    , stop_time : Int
    }


type alias SimOutput =
    { process_times : List ProcessTimeDatum
    , gantt_data : List GanttDatum
    , average_wait_time : Float
    , average_turnaround_time : Float
    }


type alias Randomizer =
    { number_of_processes : Int
    , lowest_burst_size : Int
    , highest_burst_size : Int
    }


type alias Model =
    { sim_parameter_record : SimParameters
    , sim_output_record : SimOutput
    , randomizer_record : Randomizer
    }


initial_model : Model
initial_model =
    { sim_parameter_record =
        { algorithm = "FCFS"
        , processes = []
        , quantum = 0
        }
    , sim_output_record =
        { process_times = []
        , gantt_data = []
        , average_wait_time = 0
        , average_turnaround_time = 0
        }
    , randomizer_record =
        { number_of_processes = 0
        , lowest_burst_size = 0
        , highest_burst_size = 0
        }
    }



-- VIEW


view : Model -> Html msg
view model =
    div []
        [ h1 [] [ text "CPU Scheduler" ]
        , randomizer model
        ]


randomizer : Model -> Html msg
randomizer model =
    div []
        [ Html.form []
            [ div []
                [ text "Give me"
                , input [ id "number_of_processes_for_randomizer", type_ "text" ] []
                ]
            , div []
                [ text "processes with burst sizes between"
                , input [ id "randomizer_burst_size_one", type_ "text" ] []
                ]
            , div []
                [ text "and"
                , input [ id "randomizer_burst_size_two", type_ "text" ] []
                ]
            , div []
                [ button [type_ "submit" ]
                      [ text "GO!" ]
                ]
            ]
        ]


main : Html msg
main =
    view initial_model



-- UPDATE
