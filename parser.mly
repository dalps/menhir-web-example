%token <string> VAR
%token LPAREN
%token RPAREN
%token EOF

%start <Exp.t> f

%%

f : e = expr; EOF { e }

expr :
| s = VAR; { Exp.Var s }
| LPAREN; es = list (expr); RPAREN { Exp.Call es }