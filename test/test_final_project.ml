open OUnit2
open Final_project
open ANSITerminal

let new_player = Player.create_player "Bob"

let new_player_tests =
  "test suite for new player"
  >::: [
         ( "testing position" >:: fun _ ->
           assert_equal Player.(get_position new_player) 0 );
         ( "testing properties" >:: fun _ ->
           assert_equal Player.(get_properties new_player) [] );
         ( "testing money" >:: fun _ ->
           assert_equal Player.(get_money new_player) 1500 );
         ( "testing name" >:: fun _ ->
           assert_equal Player.(get_name new_player) "Bob" );
       ]

let property_to_add = Property.create_property "prop" 1 1 1 [ default ]

let changed_player =
  Player.(
    add_money (add_property (set_position new_player 15) property_to_add) 50000)

let modified_player_tests =
  "test suite for modified player"
  >::: [
         ( "testing position" >:: fun _ ->
           assert_equal Player.(get_position changed_player) 15 );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (List.is_empty Player.(get_properties changed_player))
             false );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (Property.get_name
                (List.nth Player.(get_properties changed_player) 0))
             "prop" );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (Property.get_pos
                (List.nth Player.(get_properties changed_player) 0))
             1 );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (Property.get_cost
                (List.nth Player.(get_properties changed_player) 0))
             1 );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (Property.get_rent
                (List.nth Player.(get_properties changed_player) 0))
             1 );
         ( "testing money" >:: fun _ ->
           assert_equal Player.(get_money changed_player) 51500 );
         ( "testing name" >:: fun _ ->
           assert_equal Player.(get_name changed_player) "Bob" );
       ]

let changed_player_2 =
  Player.(
    remove_money
      (remove_property (set_position changed_player ~-20) property_to_add)
      52000)

let modified_player_tests_2 =
  "test suite for modified player 2"
  >::: [
         ( "testing position" >:: fun _ ->
           assert_equal Player.(get_position changed_player_2) ~-20 );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (List.is_empty Player.(get_properties changed_player_2))
             true );
         ( "testing money" >:: fun _ ->
           assert_equal Player.(get_money changed_player_2) ~-500 );
         ( "testing name" >:: fun _ ->
           assert_equal Player.(get_name changed_player_2) "Bob" );
       ]

let empty_player = Player.empty

let empty_player_tests =
  "test suite for empty player"
  >::: [
         ( "testing position" >:: fun _ ->
           assert_equal Player.(get_position empty_player) ~-1 );
         ( "testing properties" >:: fun _ ->
           assert_equal
             (List.is_empty Player.(get_properties empty_player))
             true );
         ( "testing money" >:: fun _ ->
           assert_equal Player.(get_money empty_player) ~-1 );
         ( "testing name" >:: fun _ ->
           assert_equal Player.(get_name empty_player) "" );
       ]

let prop1 = Property.create_property "Prop 1" 1 100 20 [ cyan ]
let prop2 = Property.create_property "Prop 2" 1 100 20 [ green ]

let prop_extr =
  Property.create_property "RRRRRRRR" 99999999999 0 9999 [ default ]

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
         ( "get_color" >:: fun _ ->
           assert_equal [ cyan ] (Property.get_color prop1) );
         ("( = )" >:: fun _ -> assert_equal false Property.(prop1 = prop2));
         ("( = )" >:: fun _ -> assert_equal true Property.(prop1 = prop1));
       ]

let _ = run_test_tt_main new_player_tests
let _ = run_test_tt_main modified_player_tests
let _ = run_test_tt_main modified_player_tests_2
let _ = run_test_tt_main empty_player_tests
let _ = run_test_tt_main test_property
