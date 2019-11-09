module Record exposing ()

-- MODEL

type CpuProcess
    = { p_name : String, burst_size : Int, priority : Int }

type SimParameters
    = { algorithm : String, processes : [CpuProcess], quantum : Int }

type alias Model =
    Int
