(* rewritten from https://github.com/gigasquid/wonderland-clojure-katas *)

(*

This Kata comes from _Alice in Wonderland_'s author, Lewis Carroll. He came up
with this word puzzle that he named _Doublets_.

![Mad Hatter](/images/madhatter.gif)

The puzzle is to take two words of the same length and find a way of linking the
first word to the second word by only changing one letter at a time.  At the end
of the transformation, there will be a collections of words that show the
beginning word being changed into the ending word, one letter at a time.  All
the _word links_ must be in Lewis Carroll's own words:

Also the _word links_ should be words that are found in the dictionary.  No
proper nouns.

Here are some examples.

The Doublet of DOOR to LOCK is:

```
door
boor
book
look
lock
```

The Doublet of BANK to LOAN is:

```
bank
bonk
book
look
loon
loan
```

The Doublet of WHEAT into BREAD is:

```
wheat
cheat
cheap
cheep
creep
creed
breed
bread
```

There will be a sample dictionary of words provided for you.

 *)

open OUnit
open Solutions.Doublets

let identity x = x

let show_str_list xs = "[" ^ (String.concat "; " xs) ^ "]"

let assert_string_equal = assert_equal ~printer: identity
let suite = "doublets">:::
    ("utilities">::: [
        "show string">:: (fun c ->
            assert_equal
            ~printer:identity
            "[one; two]" (show_str_list ["one"; "two"])
        );
    ])
    ::
    List.concat [
        (List.map (fun (src, dst, links) ->
            let title =
                Printf.sprintf "found: %s -> %s" src dst
            in
            title >::
                (fun c -> assert_equal ~printer:show_str_list
                   links (doublets src dst)))
        [("head", "tail", ["head"; "heal"; "teal"; "tell"; "tall"; "tail"]);
         ("door", "lock", ["door"; "boor"; "book"; "look"; "lock"]);
         ("bank", "loan", ["bank"; "bonk"; "book"; "look"; "loon"; "loan"]);
         ("wheat", "bread", ["wheat"; "cheat"; "cheap"; "cheep"; "creep"; "creed"; "breed"; "bread"]);
         ("wheat", "bread", ["wheat"; "cheat"; "cheap"; "cheep"; "creep"; "creed"; "breed"; "bread"]);]);
    [
    "not found: x -> x">:: ( fun c ->
        assert_equal
        ~printer:show_str_list
        []
        (doublets "ye" "freezer")
    );
    ]]
