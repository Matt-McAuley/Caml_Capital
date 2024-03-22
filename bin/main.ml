open Final_project

(** [print_logo] is the interface with the following format: Position on board: <users>
    Money for each player: <users> Properties owned: <users> printed to the console.*)
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

(** [plist_to_str plist] converts the property list [plist] to a string. *)
let plist_to_str (plist : Property.t list) =
  let lst = List.map (fun x -> Property.get_name x) plist in
  "[" ^ String.concat "; " lst ^ "]"

(** [player_info player] is the information of a [player] printed to the console. *)
let player_info player =
  if player = Player.empty then ""
  else
    let name = Player.get_name player in
    let position = string_of_int (Player.get_position player) in
    let money = string_of_int (Player.get_money player) in
    let properties = plist_to_str (Player.get_properties player) in
    Printf.sprintf "%-10s: Position: %-1s | Money: %-4s | Properties: %s" name
      position money properties

(** [print_info p1 p2 p3 p4] prints the information of players 1-4 to the console. *)
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

(** [make_player] makes a player with name according to user input. *)
let make_player () : Player.t =
  let p_name = read_line () in
  if p_name = "" then Player.empty else Player.create_player p_name

(** [roll_dice] is a random number between 2-12 as two dice rolls would be.*)
let roll_dice () =
  let () = Random.self_init () in
  2 + Random.int 10

(** [move_player_random player] is a [player] with position updated according to a 
  random roll of two dice with values over 40 being truncated to fit on the board. *)
let move_player_random (player : Player.t) =
  let dice_roll = roll_dice () in
  Printf.printf "%s moved %d spots \n" (Player.get_name player) dice_roll;
  Player.(set_position player (((get_position player) + dice_roll) mod 40))

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

(** [clear_terminal] clears all text from the terminal *)
let clear_terminal () = Sys.command "clear"

(** [check_game_continue p1 p2 p3 p4] returns whether more than 1 players are left
with money in their account.*)
let check_players_left p1 p2 p3 p4 =
  let player_left_increment player =
    if Player.get_money player <= 0 then 0 else 1 in
  (player_left_increment p1 + player_left_increment p2 
  + player_left_increment p3 + player_left_increment p4) > 1

(** [get_property_owner prop p1 p2 p3 p4] is an option of the owner if someone
    owns the property or None otherwise. *)
let get_property_owner prop p1 p2 p3 p4 =
  if List.mem prop (Player.get_properties p1) then Some p1 else
  if List.mem prop (Player.get_properties p2) then Some p2 else
  if List.mem prop (Player.get_properties p3) then Some p3 else
  if List.mem prop (Player.get_properties p4) then Some p4 else
  None