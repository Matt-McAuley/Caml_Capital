open Final_project

(** Print the interface with the following format: Position on board: <users>
    Money for each player: <users> Properties owned: <users>*)
let print_logo () =
  let print_file filename =
    let file = open_in filename in
    try
      while true do
        let line = input_line file in
        print_endline line
      done
    with End_of_file -> close_in file
  in
  print_file "data/interface.txt"

let plist_to_str (plist : Property.t list) =
  let lst = List.map (fun x -> Property.get_name x) plist in
  "[" ^ String.concat "; " lst ^ "]"

let player_info player =
  if player = Player.empty then ""
  else
    let name = Player.get_name player in
    let position = string_of_int (Player.get_position player) in
    let money = string_of_int (Player.get_money player) in
    let properties = plist_to_str (Player.get_properties player) in
    Printf.sprintf "%-10s: Position: %-1s | Money: %-4s | Properties: %s" name
      position money properties

let print_info (p1 : Player.t) (p2 : Player.t) (p3 : Player.t) (p4 : Player.t) :
    unit =
  let p1_info = player_info p1 in
  let p2_info = player_info p2 in
  let p3_info = player_info p3 in
  let p4_info = player_info p4 in
  print_endline p1_info;
  print_endline p2_info;
  print_endline p3_info;
  print_endline p4_info

(** Makes player with name according to user input*)
let make_player () : Player.t =
  let p_name = read_line () in
  if p_name = "" then Player.empty else Player.create_player p_name

(** Creates random number between 1-6*)
let roll_dice () =
  let () = Random.self_init () in
  1 + Random.int 6

(** Moves player n spots dependent on what the player rolled*)
let move_player (name : string) (n : int) =
  Printf.printf "%s moved %d spots \n" name n

(** Begins game by asking player to type start*)
let () =
  print_logo ();
  let () = print_string "Press \"ENTER\" to begin the game: " in
  let the_input = read_line () in
  if the_input = "" then begin
    (* Create player 1*)
    let () = print_string "Player1 type your name: " in
    let p1 = make_player () in
    (* Create player 2*)
    let () = print_string "Player2 type your name: " in
    let p2 = make_player () in
    (* Create player 3*)
    let () = print_string "Player3 type your name: " in
    let p3 = make_player () in
    (* Create player 3*)
    let () = print_string "Player4 type your name: " in
    let p4 = make_player () in
    print_info p1 p2 p3 p4
  end

(* let () = let roll = roll_dice () in move_player "bob" roll *)
