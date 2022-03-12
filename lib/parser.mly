%{
open Ast
%}

%token LPAREN
%token RPAREN
%token LBRACK
%token RBRACK
%token <string> VAR
%token EOF
%token <int> INT
%token PLUS
%token LET

%start <Ast.t> f

%%

f:
  | expr EOF { $1 }

expr:
  | INT { Int $1 }
  | VAR { Var $1 }
  | LPAREN PLUS expr expr RPAREN { Add ($3, $4) }
  | LPAREN LET LBRACK VAR expr RBRACK expr RPAREN { Let($4, $5, $7)}
