type t =
| Int of int
| Add of t * t
| Var of string
| Let of string * t * t

let rec to_string = function
| Int n -> string_of_int n
| Add(n, m) -> "(+ " ^ to_string n ^ " " ^ to_string m ^ ")"
| Var s -> s
| Let(v,e1,e2) -> "(let [" ^ v ^ " " ^ to_string e1 ^ "] " ^ to_string e2 ^ ")"