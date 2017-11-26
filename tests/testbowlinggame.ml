(* taken from
 * http://blog.moertel.com/posts/2006-04-05-the-bowling-game-kata-in-haskell.html *)


(*
 Write a scoring function for a list of balls thrown during a bowling game

 Bowling works like this: you throw a ball at 10 pins. you knock all or some of
 them down.

 You have two throws a frame, ten frames in a game

 However, if you knock everything down in the first throw of your frame, that
 frame is over and you get a new full set of pins.

 If you don't knock everything over in one frame, the pins are re-set.

 So if you manage to not knock everything over, or otherwise get spares, you'll
 throw 20 balls.
 If you throw a strike every time, you'll have 9 balls by the tenth frame (and
 then 3 balls during that 10th frame).

 When you throw a strike during a frame, the score of that frame is 10 + the sum
 of the next two balls.  So if you throw many strikes, each frame will be worth
 30 if the next two frames are also strikes

 A spare is when you manage to knock over all 10 pins in a frame.  When you
 throw a spare, the score of that frame is 10 + just the next ball thrown.
 Similar to the Strike, but you're limited to a max of just scoring 20 for a
 frame with a spare.

 The final frame has additional balls afforded to it only to satisfy the bonus
 conditions of a Strike or Spare.  If you throw a Strike in the 10th frame, you
 get to throw two more balls.  If you throw a Spare, you only get to throw one
 mroe ball.

 for example:
     let game = [
         10; (* strike , frame 1. 10 plus the next two balls*) (* 10 + 9 + 1, 20 *)

         9; (* only nine *)
         1; (* spare, frame 2. 10 plus just the next ball *) (* 10 + 10, 40 *)

         10; (* strike , frame 3*) (* 10 + 10 + 3, 53 *)

         10; (* strike , frame 4*) (* 10 + 3 + 5, 71 *)

         3; (* - *)
         5; (* open frame. frame 5 *) (* 8, 79 *)

         9;
         1; (* spare. frame 6 *) (* 10 + 10, 99 *)

         10; (* strike, frame 7 *) (* 10 + 3 + 4, 126 *)

         3;
         4; (* open. frame 8 *) (* 7, 133 *)

         2;
         8; (* spare. frame 9 *) (* 10 + 10, 153 *)

         10; (* strike. unlock next two balls *) (* 10 + 10 + 10, 183 *)
         10;
         10; (* frame 10 finished *)

     ]
    let myscore = score game
    (* val myscore : int = 183 *)
*)


open OUnit
open Solutions.Bowlinggame

let suite = "Bowlinggame">::: List.concat [
    [
        "utilities">::: [
            "example">:: (fun c ->
                assert_equal
                1 1
            );
        ]
    ];
    [
        "score example game">:: (fun c ->
            assert_equal
            183
            (score_game
             [
                 10;  (* 10 + 9 + 1, 20 *)

                 9; 
                 1;  (* 10 + 10, 40 *)

                 10;  (* 10 + 10 + 3, 53 *)

                 10;  (* 10 + 3 + 5, 71 *)

                 3; 
                 5;  (* 8, 79 *)

                 9;
                 1;  (* 10 + 10, 99 *)

                 10;  (* 10 + 3 + 4, 126 *)

                 3;
                 4;  (* 7, 133 *)

                 2;
                 8;  (* 10 + 10, 153 *)

                 10;  (* 10 + 10 + 10, 183 *)
                 10;
                 10; (* frame 10 finished *)

            ]
            )
        );
        "perfect game">:: (fun c ->
            assert_equal
            300
            (score_game
             [
                 10;  (* frame1 *)
                 10;  (* frame2 *)
                 10;  (* frame3 *)
                 10;  (* frame4 *)
                 10;  (* frame5 *)
                 10;  (* frame6 *)
                 10;  (* frame7 *)
                 10;  (* frame8 *)
                 10;  (* frame9 *)
                 10;  (* frame10 *)
                 10;
                 10; (* frame 10 finished *)

            ]
            )
        );
        "strongly mediocre">:: (fun c ->
            assert_equal
            90
            (score_game
             [
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
                 8;
                 1;  (* open frame *)
            ]
            )
        );
    ];
]
