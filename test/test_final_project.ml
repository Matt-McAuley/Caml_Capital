open OUnit2
open Final_project

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

let _ = run_test_tt_main test_property
