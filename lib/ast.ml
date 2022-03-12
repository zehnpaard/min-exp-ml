type t =
| Int of int
| Add of t * t

let rec to_string = function
| Int n -> string_of_int n
| Add(n, m) -> "(+ " ^ to_string n ^ " " ^ to_string m ^ ")"
