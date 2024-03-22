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

let prop1 = Property.create_property "Prop 1" 1 100 20
let prop2 = Property.create_property "Prop 2" 1 100 20
let prop_extr = Property.create_property "RRRRRRRR" 99999999999 0 9999

let test_property =
  "test suite for property"
  >::: [
         ( "get_name" >:: fun _ ->
           assert_equal "Prop 1" (Property.get_name prop1) );
         ("get_pos" >:: fun _ -> assert_equal 1 (Property.get_pos prop1));
         ( "get_pos extr" >:: fun _ ->
           assert_equal 99999999999 (Property.get_pos prop_extr) );
         ("get_cost" >:: fun _ -> assert_equal 100 (Property.get_cost prop1));
         ( "get_cost extr" >:: fun _ ->
           assert_equal 0 (Property.get_cost prop_extr) );
         ("get_rent" >:: fun _ -> assert_equal 20 (Property.get_rent prop1));
         ( "get_rent extr" >:: fun _ ->
           assert_equal 9999 (Property.get_rent prop_extr) );
         ("( = )" >:: fun _ -> assert_equal false Property.(prop1 = prop2));
         ("( = )" >:: fun _ -> assert_equal true Property.(prop1 = prop1));
       ]

let _ = run_test_tt_main new_player_tests
let _ = run_test_tt_main test_property
