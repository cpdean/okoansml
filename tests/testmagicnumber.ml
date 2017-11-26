(* rewritten from https://github.com/gigasquid/wonderland-clojure-katas *)

(*
 * the magic number is 6 digits long, and when you multiply it by 2,3,4,5, or 6,
 * the product has the same digits as the magic number
  *)

open OUnit
open Solutions.Magicnumber

(* i have no idea how to do what is a simple oneliner in python *)
let rec char_list_of_string s =
    let open String in
    match s with
    | "" -> []
    | s -> (get s 0) :: (char_list_of_string (sub s 1 (length s - 1)))

module DigitChar = struct
    type t = char
    let compare a b = Pervasives.compare a b
end

module DigitCharSet = Set.Make(DigitChar)


let digits_of_int n = string_of_int n
    |> char_list_of_string
    |> DigitCharSet.of_list

let same_digits a b =
    let a_digits = digits_of_int a in
    let b_digits = digits_of_int b in
    DigitCharSet.equal a_digits b_digits


let rec string_of_char_list characters =
    match characters with
        | [] -> ""
        | c::chs -> (String.make 1 c) ^ (string_of_char_list chs)

let magic_number = generate_magic_number ()
let suite = "doublets">::: List.concat [
    [
        "utilities">::: [
            "get digits">:: (fun c ->
                assert_equal
                ['1'; '2']
                (DigitCharSet.elements (digits_of_int 221))
            );
            "get digits">:: (fun c ->
                assert_equal
                ['3'; '4'; '5']
                (DigitCharSet.elements (digits_of_int 543))
            );
        ]
    ];
    ["number has six digits">:: ( fun c ->
        assert_equal ~printer:string_of_int
        6
        (String.length (string_of_int magic_number))
    );];
    [
        "set of digits same with * 2">:: ( fun c ->
            assert_equal
            ~printer: (fun a -> DigitCharSet.elements a |> string_of_char_list)
            (digits_of_int (magic_number * 2))
            (digits_of_int (magic_number))
        );
        "set of digits same with * 3">:: ( fun c ->
            assert_equal
            ~printer: (fun a -> DigitCharSet.elements a |> string_of_char_list)
            (digits_of_int (magic_number * 3))
            (digits_of_int (magic_number))
        );
        "set of digits same with * 4">:: ( fun c ->
            assert_equal
            ~printer: (fun a -> DigitCharSet.elements a |> string_of_char_list)
            (digits_of_int (magic_number * 4))
            (digits_of_int (magic_number))
        );
        "set of digits same with * 5">:: ( fun c ->
            assert_equal
            ~printer: (fun a -> DigitCharSet.elements a |> string_of_char_list)
            (digits_of_int (magic_number * 5))
            (digits_of_int (magic_number))
        );
        "set of digits same with * 6">:: ( fun c ->
            assert_equal
            ~printer: (fun a -> DigitCharSet.elements a |> string_of_char_list)
            (digits_of_int (magic_number * 6))
            (digits_of_int (magic_number))
        );
    ];
]
