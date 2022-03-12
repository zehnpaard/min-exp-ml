%{
open Ast
%}

%token LPAREN
%token RPAREN
%token EOF
%token <int> INT
%token PLUS

%left PLUS

%start <Ast.t> f

%%

f:
  | expr EOF { $1 }

expr:
  | INT { Int $1 }
  | LPAREN PLUS expr expr RPAREN { Add ($3, $4) }
