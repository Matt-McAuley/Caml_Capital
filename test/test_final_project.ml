open OUnit2
open Final_project

let new_player = Player.create_player "Bob"
let new_player_tests = "test suite for new player" >::: 
[ "testing position" >:: (fun _ -> assert_equal Player.(get_position new_player) 0);
  "testing properties" >:: (fun _ -> assert_equal Player.(get_properties new_player) []);
  "testing money" >:: (fun _ -> assert_equal Player.(get_money new_player) 1500);
  "testing name" >:: (fun _ -> assert_equal Player.(get_name new_player) "Bob");
]

let property_to_add = Property.create_property "prop" 1 1 1
let changed_player = Player.(add_money (add_property (set_position new_player 15) property_to_add) 50000)
let modified_player_tests = "test suite for new player" >::: 
[ "testing position" >:: (fun _ -> assert_equal Player.(get_position changed_player) 15);
  "testing properties" >:: (fun _ -> assert_equal (List.is_empty (Player.(get_properties changed_player))) false);
  "testing money" >:: (fun _ -> assert_equal Player.(get_money changed_player) 1500);
  "testing name" >:: (fun _ -> assert_equal Player.(get_name changed_player) "Bob");
]

let _ = run_test_tt_main new_player_tests