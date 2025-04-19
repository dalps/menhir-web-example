
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR of (
# 1 "parser.mly"
       (string)
# 15 "parser.ml"
  )
    | RPAREN
    | LPAREN
    | EOF
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_f) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: f. *)

  | MenhirState02 : (('s, _menhir_box_f) _menhir_cell1_LPAREN, _menhir_box_f) _menhir_state
    (** State 02.
        Stack shape : LPAREN.
        Start symbol: f. *)

  | MenhirState05 : (('s, _menhir_box_f) _menhir_cell1_expr, _menhir_box_f) _menhir_state
    (** State 05.
        Stack shape : expr.
        Start symbol: f. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Exp.t)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_f = 
  | MenhirBox_f of (Exp.t) [@@unboxed]

let _menhir_action_1 =
  fun s ->
    (
# 13 "parser.mly"
           ( Exp.Var s )
# 56 "parser.ml"
     : (Exp.t))

let _menhir_action_2 =
  fun es ->
    (
# 14 "parser.mly"
                                   ( Exp.Call es )
# 64 "parser.ml"
     : (Exp.t))

let _menhir_action_3 =
  fun e ->
    (
# 10 "parser.mly"
                  ( e )
# 72 "parser.ml"
     : (Exp.t))

let _menhir_action_4 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 80 "parser.ml"
     : (Exp.t list))

let _menhir_action_5 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 88 "parser.ml"
     : (Exp.t list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | LPAREN ->
        "LPAREN"
    | RPAREN ->
        "RPAREN"
    | VAR _ ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let e = _v in
          let _v = _menhir_action_3 e in
          MenhirBox_f _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let s = _v in
      let _v = _menhir_action_1 s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_08 _menhir_stack _v _tok
      | MenhirState05 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState05
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | RPAREN ->
          let _v_1 = _menhir_action_4 () in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | RPAREN ->
          let _v = _menhir_action_4 () in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let es = _v in
      let _v = _menhir_action_2 es in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_f) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_5 x xs in
      _menhir_goto_list_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_expr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_f) _menhir_state -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState02 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_f =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let f =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_f v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
