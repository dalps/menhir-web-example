type t =
| Var of string
| Call of t list

let rec to_string = function
| Var s -> "Var(" ^ s ^ ")"
| Call xs ->
    let s = List.map to_string xs |> String.concat " " in
    "Call(" ^ s ^ ")"