
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | RPAREN
  | LPAREN
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val f: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Exp.t)
