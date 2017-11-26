(* rewritten from https://github.com/gigasquid/wonderland-clojure-katas *)

(*
 * This the classic logic problem of crossing a river when you have a fox, a
 * goose, and a bag of corn.  You have a boat, a fox, a goose, and a bag of
 * corn.  When you are with the animals, they will behave themselves and not eat
 * anything.  However, as soon as you leave an animal alone on one side of the
 * river, it will eat whatever it wants.
 *
 * The fox wants to eat the goose.
 * The goose wants to eat the corn.
 * The corn isn't eating anything.
 *
 * You can only carry one animal or bag of corn with you on the boat at a time.
 *
 * What sequence of ferries do you take in order to move all your animals and
 * corn across the river without losing any of them?
 *)

open OUnit
open Solutions.Foxgoosecorn

type step_result = Safe | Unsafe

let check_side side = match side with
    | (_, _, _, HasPlayer) -> Safe
    | (HasFox, HasGoose, _, NoPlayer) -> Unsafe
    | (_, HasGoose, HasCorn, NoPlayer) -> Unsafe
    | _ -> Safe

let check game = match game with
    (left, boat, right) -> match (check_side left, check_side right) with
    | (_, Unsafe) -> Unsafe
    | (Unsafe, _) -> Unsafe
    | _ -> Safe

let suite = "FoxGooseCorn">::: List.concat [
    [
        "utilities">::: [
            "fox eats goose">:: (fun c ->
                assert_equal
                Unsafe
                (check (
                    (HasFox, HasGoose, NoCorn, NoPlayer),
                    Boat (HasPlayer, Corn),
                    (NoFox, NoGoose, NoCorn, NoPlayer)
                ))
            );
            "safe state1">:: (fun c ->
                assert_equal
                Safe
                (check (
                    (HasFox, HasGoose, HasCorn, HasPlayer),
                    Boat (NoPlayer, Empty),
                    (NoFox, NoGoose, NoCorn, NoPlayer)
                ))
            );
            "safe state2">:: (fun c ->
                assert_equal
                Safe
                (check (
                    (HasFox, NoGoose, HasCorn, NoPlayer),
                    Boat (HasPlayer, Goose),
                    (NoFox, NoGoose, NoCorn, NoPlayer)
                ))
            );
        ]
    ];
    ["number has six digits">:: ( fun c ->
        assert_equal ~printer:string_of_int
        6 6
    );];
    [
        "example">:: ( fun c ->
            assert_equal
            1 1
        );
    ];
]
