open Js_of_ocaml

let () =
  Js.export "myParseLib"
    (object%js
       method parse s =
        let lexbuf = Lexing.from_string s in
        Parser.f Lexer.f lexbuf
       val toString = Exp.to_string
       val testString = "(test a b c)"
    end);
  "(test a b c)"
  |> Lexing.from_string
  |> Parser.f Lexer.f
  |> Exp.to_string
  |> print_endline
