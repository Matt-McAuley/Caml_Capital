open OUnit2

let player_tests = "test suite for reduce" >::: [
  "testing filter_int" >:: (fun _ -> assert_equal (table_to_string_list filter_int_table) [["ints";"3";"4";"5";"6"]; ["floats";"3.";"4.";"5.";"6."]; ["strings";"flat";"matt";"chicken";"ham"]]);
  "testing filter_float" >:: (fun _ -> assert_equal (table_to_string_list filter_float_table) [["ints";"1";"2";"3"]; ["floats";"1.";"2.";"3."]; ["strings";"cat";"bat";"flat"]]);
  "testing filter_string" >:: (fun _ -> assert_equal (table_to_string_list filter_string_table) [["ints";"1";"2";"3";"4";"6"]; ["floats";"1.";"2.";"3.";"4.";"6."]; ["strings";"cat";"bat";"flat";"matt";"ham"]]);
]


let _ = run_test_tt_main player_tests