open Final_project
open Temp_properties
open ANSITerminal

(** [print_logo] is the interface with the following format: Position on board:
    <users> Money for each player: <users> Properties owned: <users> printed to
    the console.*)
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

(** [print_help] is the help menu that is printed when the user types "HELP"*)
let print_help () =
  let print_file filename =
    let file = open_in filename in
    try
      while true do
        let line = input_line file in
        print_endline line
      done
    with End_of_file -> close_in file
  in
  print_file "data/help.txt"

(** [plist_to_str plist] converts the property list [plist] to a string. *)
let plist_to_str (plist : Property.t list) =
  let lst = List.map (fun x -> Property.get_name x) plist in
  "(" ^ String.concat ", " lst ^ ")"

(** [player_info player] is the information of a [player] printed to the
    console. *)
let player_info player =
  if player = Player.empty then ""
  else
    let name = Player.get_name player in
    let position = string_of_int (Player.get_position player) in
    let money = string_of_int (Player.get_money player) in
    let properties = plist_to_str (Player.get_properties player) in
    let base_info =
      Printf.sprintf "%-10s: Position: %-2s | Money: %-5s | Properties: " name
        position money
    in
    let max_line_width = 80 in
    (* or any width you prefer *)
    if String.length base_info + String.length properties <= max_line_width then
      base_info ^ properties
    else
      let rec split_and_format str =
        if String.length str <= max_line_width then [ str ]
        else
          let part = String.sub str 0 max_line_width in
          let rest =
            String.sub str max_line_width (String.length str - max_line_width)
          in
          part :: split_and_format rest
      in
      let property_lines = split_and_format properties in
      let formatted_properties =
        String.concat
          ("\n" ^ String.make (String.length base_info) ' ')
          property_lines
      in
      base_info ^ formatted_properties

(** Print info about each player. If the player is empty, print an empty string *)
let print_info (p1 : Player.t) (p2 : Player.t) (p3 : Player.t) (p4 : Player.t) :
    unit =
  let p1_info = player_info p1 in
  let p2_info = player_info p2 in
  let p3_info = player_info p3 in
  let p4_info = player_info p4 in
  print_endline "";
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

(** [move_player_random player] is a [player] with position updated according to
    a random roll of two dice with values over 22 being truncated to fit on the
    board. *)
let move_player_random (player : Player.t) =
  let dice_roll = roll_dice () in
  Printf.printf "%s moved %d spots \n%!" (Player.get_name player) dice_roll;
  Player.(set_position player ((get_position player + dice_roll) mod 22))

(** [query_player player] queries the respective player to roll the dice *)
let query_player (player : Player.t) =
  Printf.printf "%s, Roll the dice by pressing \"ENTER\": %!"
    (Player.get_name player);
  let the_input = read_line () in
  the_input = ""

(** [check_game_continue p1 p2 p3 p4] returns whether more than 1 players are
    left with money in their account.*)
let check_players_left p1 p2 p3 p4 =
  let player_left_increment player =
    if Player.get_money player <= 0 then 0 else 1
  in
  player_left_increment p1 + player_left_increment p2 + player_left_increment p3
  + player_left_increment p4
  > 1

(** [get_property_owner prop p1 p2 p3 p4] is an option of the owner if someone
    owns the property or None otherwise. *)
let get_property_owner prop p1 p2 p3 p4 =
  if List.mem prop (Player.get_properties p1) then Some p1
  else if List.mem prop (Player.get_properties p2) then Some p2
  else if List.mem prop (Player.get_properties p3) then Some p3
  else if List.mem prop (Player.get_properties p4) then Some p4
  else None

let check_property_at_pos pos = List.nth property_list pos

let owns_property prop player =
  if List.mem prop (Player.get_properties player) then true else false

(** [buy_property player property] allows the player to purchase the property
    they landed on if they choose to do so. If [player] does not have sufficient
    funds to purchase [property] they are told so*)
let buy_property (player : Player.t) (property : Property.t) =
  let prop_name = Property.get_name property in
  let prop_color = Property.get_color property in
  let prop_cost = string_of_int (Property.get_cost property) in
  ANSITerminal.(printf [] "Type \"b\" if you want to purchase ");
  ANSITerminal.(printf prop_color "%s" prop_name);
  ANSITerminal.(printf [] " for %s: " prop_cost);
  let the_input = read_line () in
  if the_input = "b" then begin
    if Player.get_money player > Property.get_cost property then
      Player.add_property
        (Player.remove_money player (Property.get_cost property))
        property
    else begin
      Printf.printf "Insufficient funds to purchase %s" prop_name;
      player
    end
  end
  else player

(** [pay_rent player owner property] is the tuple of [(player, owner)] where
    their respective bank accounts have been adjusted according to the rent.
    [player] pays [owner] the price of rent of [property] if they have
    sufficient funds. If [player] does not have enough money to cover rent, they
    pay their remaining money to [owner] and [player] is now bankrupt*)
let pay_rent (player : Player.t) (owner : Player.t) (property : Property.t) =
  Printf.printf "%s landed on %s and owes %d to %s. %!" (Player.get_name player)
    (Property.get_name property)
    (Property.get_rent property)
    (Player.get_name owner);
  print_string [] "Press \"ENTER\" to continue: ";
  let _ = read_line () in
  let balance = Player.get_money player in
  let color = Property.get_color property in
  (* rent is doubled if player owns a set of the properties color*)
  let rent =
    if Player.has_set owner color then 2 * Property.get_rent property
    else Property.get_rent property
  in
  let price = if balance < rent then balance else rent in
  let new_player = Player.remove_money player price in
  let new_owner = Player.add_money owner price in
  let new_player =
    if Player.get_money new_player <= 0 then Player.empty else new_player
  in
  (new_player, new_owner)

let land_on_prop property player p1 p2 p3 p4 =
  let property_owner = get_property_owner property p1 p2 p3 p4 in
  match property_owner with
  | Some x ->
      if x = player then
        let () =
          Printf.printf "You landed on your own property, %s, fhew!\n"
            (Property.get_name property)
        in
        let () = Printf.printf "Press \"ENTER\" to continue: %!" in
        let _ = read_line () in
        (player, x)
      else pay_rent player x property
  | None -> (buy_property player property, player)

let p1_turn p1 p2 p3 p4 turn game_loop =
  if p1 = Player.empty then game_loop p1 p2 p3 p4 (turn + 1)
  else if not (query_player p1) then game_loop p1 p2 p3 p4 (turn + 1)
  else
    let p1 = move_player_random p1 in
    let property = check_property_at_pos (Player.get_position p1) in
    let result = land_on_prop property p1 p1 p2 p3 p4 in
    let p1 = fst result in
    if owns_property property p1 then game_loop p1 p2 p3 p4 (turn + 1)
    else if owns_property property p2 then
      game_loop p1 (snd result) p3 p4 (turn + 1)
    else if owns_property property p3 then
      game_loop p1 p2 (snd result) p4 (turn + 1)
    else if owns_property property p4 then
      game_loop p1 p2 p3 (snd result) (turn + 1)
    else game_loop p1 p2 p3 p4 (turn + 1)

let p2_turn p1 p2 p3 p4 turn game_loop =
  if p2 = Player.empty then game_loop p1 p2 p3 p4 (turn + 1)
  else if not (query_player p2) then game_loop p1 p2 p3 p4 (turn + 1)
  else
    let p2 = move_player_random p2 in
    let property = check_property_at_pos (Player.get_position p2) in
    let result = land_on_prop property p2 p1 p2 p3 p4 in
    let p2 = fst result in
    if owns_property property p2 then game_loop p1 p2 p3 p4 (turn + 1)
    else if owns_property property p1 then
      game_loop (snd result) p2 p3 p4 (turn + 1)
    else if owns_property property p3 then
      game_loop p1 p2 (snd result) p4 (turn + 1)
    else if owns_property property p4 then
      game_loop p1 p2 p3 (snd result) (turn + 1)
    else game_loop p1 p2 p3 p4 (turn + 1)

let p3_turn p1 p2 p3 p4 turn game_loop =
  if p3 = Player.empty then game_loop p1 p2 p3 p4 (turn + 1)
  else if not (query_player p3) then game_loop p1 p2 p3 p4 (turn + 1)
  else
    let p3 = move_player_random p3 in
    let property = check_property_at_pos (Player.get_position p3) in
    let result = land_on_prop property p3 p1 p2 p3 p4 in
    let p3 = fst result in
    if owns_property property p3 then game_loop p1 p2 p3 p4 (turn + 1)
    else if owns_property property p1 then
      game_loop (snd result) p2 p3 p4 (turn + 1)
    else if owns_property property p2 then
      game_loop p1 (snd result) p3 p4 (turn + 1)
    else if owns_property property p4 then
      game_loop p1 p2 p3 (snd result) (turn + 1)
    else game_loop p1 p2 p3 p4 (turn + 1)

let p4_turn p1 p2 p3 p4 turn game_loop =
  if p4 = Player.empty then game_loop p1 p2 p3 p4 (turn + 1)
  else if not (query_player p4) then game_loop p1 p2 p3 p4 (turn + 1)
  else
    let p4 = move_player_random p4 in
    let property = check_property_at_pos (Player.get_position p4) in
    let result = land_on_prop property p4 p1 p2 p3 p4 in
    let p4 = fst result in
    if owns_property property p4 then game_loop p1 p2 p3 p4 (turn + 1)
    else if owns_property property p1 then
      game_loop (snd result) p2 p3 p4 (turn + 1)
    else if owns_property property p2 then
      game_loop p1 (snd result) p3 p4 (turn + 1)
    else if owns_property property p3 then
      game_loop p1 p2 (snd result) p4 (turn + 1)
    else game_loop p1 p2 p3 p4 (turn + 1)

let rec game_loop (p1 : Player.t) (p2 : Player.t) (p3 : Player.t)
    (p4 : Player.t) turn =
  if not (check_players_left p1 p2 p3 p4) then ()
  else
    let _ = Sys.command "clear" in
    print_info p1 p2 p3 p4;
    if turn mod 4 = 1 then p1_turn p1 p2 p3 p4 turn game_loop
    else if turn mod 4 = 2 then p2_turn p1 p2 p3 p4 turn game_loop
    else if turn mod 4 = 3 then p3_turn p1 p2 p3 p4 turn game_loop
    else p4_turn p1 p2 p3 p4 turn game_loop

let run_game p1 p2 p3 p4 = game_loop p1 p2 p3 p4 1

(** Begins game by asking player to type start*)
let () =
  (* Terminal.setup_term (); Terminal.input_non_canonique_restart_unblocked
     ~when_unblocked:handle_key stdin; Terminal.restore_term () *)
  print_logo ();
  let () = print_string [] "Press \"ENTER\" to begin the game: " in
  let the_input = read_line () in
  if the_input = "" then begin
    (* Create player 1*)
    let () = print_string [] "Player1 type your name: " in
    let p1 = make_player () in
    (* Create player 2*)
    let () = print_string [] "Player2 type your name: " in
    let p2 = make_player () in
    (* Create player 3*)
    let () = print_string [] "Player3 type your name: " in
    let p3 = make_player () in
    (* Create player 3*)
    let () = print_string [] "Player4 type your name: " in
    let p4 = make_player () in
    let () = run_game p1 p2 p3 p4 in
    print_endline "Gameover"
  end
  else if the_input = "HELP" then begin
    let _ = Sys.command "clear" in
    print_help ()
  end
