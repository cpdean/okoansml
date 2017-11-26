(* rewritten from https://github.com/gigasquid/wonderland-clojure-katas *)

(*

This puzzle comes from Lewis Carroll.  The magic part is when the
values on a square are arranged so that adding them up in any direction results in
a constant sum.

You have the following values:

```
1.0
1.5
2.0
2.5
3.0
3.5
4.0
4.5
5.0
```

You need to arrange them in a 3 x 3 matrix so that:

1. The sums of numbers in each row = magic number
2. The sums of numbers in each column = magic number
3. The sums of numbers in each diagonal = magic number

*)

open OUnit
open Solutions.Sumgrid

let solution = generate_solution ()
(* can't come up with a cleaner way right now... *)
(* as tedious as this looks, it wasn't so bad in vim *)
let column1 = match solution with
   |(
       x, _, _,
       y, _, _,
       z, _, _
    ) -> x +. y +. z

let column2 = match solution with
   |(
       _, x, _,
       _, y, _,
       _, z, _
    ) -> x +. y +. z

let column3 = match solution with
   |(
       _, _, x,
       _, _, y,
       _, _, z
    ) -> x +. y +. z

let row1 = match solution with
   |(
       x, y, z,
       _, _, _,
       _, _, _
    ) -> x +. y +. z

let row2 = match solution with
   |(
       _, _, _,
       x, y, z,
       _, _, _
    ) -> x +. y +. z

let row3 = match solution with
   |(
       _, _, _,
       _, _, _,
       x, y, z
    ) -> x +. y +. z

let diagonal1 = match solution with
   |(
       x, _, _,
       _, y, _,
       _, _, z
    ) -> x +. y +. z

let diagonal2 = match solution with
   |(
       _, _, z,
       _, y, _,
       x, _, _
    ) -> x +. y +. z

let suite = "Sumgrid">::: List.concat [
    [
        "utilities">::: [
            "example">:: (fun c ->
                assert_equal
                1 1
            );
        ]
    ];
    List.map (fun (label, s) ->
        let title =
            Printf.sprintf "check: %s" label
            in
            title >::
                (fun c -> assert_equal ~printer:string_of_float
                (* could be any sum. picking arbitrarily *)
                s column1)
        )[
            ("column1", column1);
            ("column2", column2);
            ("column3", column3);
            ("row1", row1);
            ("row2", row2);
            ("row3", row3);
            ("diagonal1", diagonal1);
            ("diagonal2", diagonal2);
        ]
]
