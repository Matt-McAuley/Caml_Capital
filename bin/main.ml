(** Print the interface with the following format: Position on board: <users>
    Money for each player: <users> Properties owned: <users>*)
let print_info () =
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

(** Creates random number between 1-6*)
let roll_dice () =
  let () = Random.self_init () in
  1 + Random.int 6

(** Moves player n spots dependent on what the player rolled*)
let move_player (n : int) = Printf.printf "player moved %d spots \n" n

(** Begins game by asking player to type start*)
let () =
  let () = print_string "Type \"start\" to begin the game: " in
  let the_input = read_line () in
  if the_input = "start" then begin
    print_info ();
    let roll = roll_dice () in
    move_player roll
  end
  else ()
