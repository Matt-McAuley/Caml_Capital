open OUnit2
open Final_project

let new_player = Player.create_player "Bob"
let new_player_tests = "test suite for new player" >::: 
[ "testing position" >:: (fun _ -> assert_equal Player.(get_position new_player) 0);
  "testing properties" >:: (fun _ -> assert_equal Player.(get_properties new_player) []);
  "testing money" >:: (fun _ -> assert_equal Player.(get_money new_player) 1500);
  "testing money" >:: (fun _ -> assert_equal Player.(get_money new_player) 1500);
]

let _ = run_test_tt_main new_player_tests