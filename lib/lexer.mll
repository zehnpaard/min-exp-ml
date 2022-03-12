{
open Parser
}

let digit = ['0'-'9']
let number = '-'? digit digit*
let whitespace = ['\t' ' ' '\n']

let alpha = ['a'-'z''A'-'Z']
let var = alpha (alpha|digit)*

rule f = parse
  | whitespace+ { f lexbuf }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "[" { LBRACK }
  | "]" { RBRACK }
  | "+" { PLUS }
  | number as n { INT (int_of_string n ) }
  | var as s { VAR s }
  | eof { EOF }
