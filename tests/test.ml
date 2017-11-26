open OUnit
open Solutions

let suite =
"koans">:::
 [
(*
  Testbasic.basicsuite;
  Testalphabetcipher.suite;
  Testdoublets.suite;
  Testmagicnumber.suite;
  Testfoxgoosecorn.suite;
  Testsumgrid.suite;
*)
  Testcardgamewar.suite;
 ]

let _ =
  run_test_tt_main suite
