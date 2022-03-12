module L = Langlib

let f s =
  Lexing.from_string s
  |> L.Parser.f L.Lexer.f
  |> L.Ast.to_string
  |> print_endline

let () =
  read_line ()
  |> f