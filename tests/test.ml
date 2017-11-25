open OUnit
open Solutions

let identity x = x

let test1 test_ctxt = assert_equal "x" (identity "x")

let test2 test_ctxt = assert_equal 100 (identity 100)

(* Name the test cases and group them together *)
let suite =
"just make sure things work">:::
 ["test1">:: test1;
  "test2">:: test2;
  Testbasic.basicsuite]

let _ =
  run_test_tt_main suite
