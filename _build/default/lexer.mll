let whitespace = [' ' '\t' '\n']
let char = ['a'-'z' 'A'-'Z' '+' '-' '*' '/' '<' '>' '=' '!' '?' '_']
let variable = char+

rule f = parse
  | whitespace* { f lexbuf }
  | "(" { Parser.LPAREN }
  | ")" { Parser.RPAREN }
  | variable as s { Parser.VAR s }
  | eof { EOF }
  | _ as c { failwith (Printf.sprintf "Invalid character '%c'" c)} (* This case prevents the tab from crashing when an illegal character is input *)