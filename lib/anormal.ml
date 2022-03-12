module A = Ast

let n = ref (-1)

let gensym () = incr n; "g" ^ string_of_int !n

let is_value = function
| A.Int _ | A.Var _ -> true
| A.Add _ | A.Let _ -> false

let id x = x

let rec normalize m k = match m with
| A.Let(v,e1,e2) ->
  normalize e1 (fun e1' ->
    A.Let(v,e1', normalize e2 k))
| A.Add(e1,e2) ->
  normalize_name e1 (fun e1' ->
    normalize_name e2 (fun e2' ->
      k (A.Add(e1',e2'))))
| _ -> k m
and normalize_name m k =
  normalize m (fun m' ->
    if is_value(m') then k m'
    else let g = gensym () in A.Let(g,m',k (A.Var g)))

let f m = normalize m id