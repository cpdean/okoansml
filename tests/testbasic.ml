open OUnit
open Solutions.Basic

let fib1 c = assert_equal 1 (fibonacci 0)
let fib2 c = assert_equal 1 (fibonacci 1)
let fib3 c = assert_equal 2 (fibonacci 2)
let fib4 c = assert_equal 3 (fibonacci 3)
let fib5 c = assert_equal 5 (fibonacci 4)
let fib6 c = assert_equal 8 (fibonacci 5)
let fib7 c = assert_equal 13 (fibonacci 6)
let fib8 c = assert_equal 21 (fibonacci 7)
let fib9 c = assert_equal 34 (fibonacci 8)
let fib10 c = assert_equal 55 (fibonacci 9)


(* Name the test cases and group them together *)
let basicsuite =
"tha basics">:::
    [
    "fib1">:: fib1;
    "fib2">:: fib2;
    "fib3">:: fib3;
    "fib4">:: fib4;
    "fib5">:: fib5;
    "fib6">:: fib6;
    "fib7">:: fib7;
    "fib8">:: fib8;
    "fib9">:: fib9;
    "fib10">:: fib10
]
