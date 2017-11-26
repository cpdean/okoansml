(* rewritten from https://github.com/gigasquid/wonderland-clojure-katas *)


(*
This is a tiny maze solver.

A maze is represented by a matrix of arrays

[|
    [|S; O; X;|]
    [|X; O; X;|]
    [|X; O; E;|]
|]

- X : This is a wall that you cannot pass through
- O : A free space that you can move through.
- S : start of the maze
- E : end of the maze

The goal is the get to the end of the maze.  A solved maze will have a
P in the start, the path, and the end of the maze, like this.

[|
    [|P; P; X;|]
    [|X; P; X;|]
    [|X; P; P;|]
|]
*)


open OUnit
open Solutions.Mazesolver

let suite = "Mazesolver">::: List.concat [
    [
        "utilities">::: [
            "example">:: (fun c ->
                assert_equal
                1 1
            );
        ]
    ];
    [
        "solve a maze">:: (fun c ->
            assert_equal
            [|
                [|P; P; X;|];
                [|X; P; X;|];
                [|X; P; P;|];
            |]
            (solve_the_maze
                [|
                    [|S; O; X;|];
                    [|X; O; X;|];
                    [|X; O; E;|];
                |]
            )
        );
    ];
]
