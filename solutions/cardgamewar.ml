type suit = Club | Heart | Spade | Diamond
type value = 
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine
    | Ten
    | Jack
    | Queen
    | King
    | Ace
type card = Card of value * suit

let deck = List.concat @@ List.map (fun _suit ->
    List.map (fun _value ->
        Card (_value, _suit)
    ) [
        Two;
        Three;
        Four;
        Five;
        Six;
        Seven;
        Eight;
        Nine;
        Ten;
        Jack;
        Queen;
        King;
        Ace;
    ])
[Club; Heart; Spade; Diamond;]

let value_of c = match c with
    | Card (Two, _) -> 2
    | Card (Three, _) -> 3
    | Card (Four, _) -> 4
    | Card (Five, _) -> 5
    | Card (Six, _) -> 6
    | Card (Seven, _) -> 7
    | Card (Eight, _) -> 8
    | Card (Nine, _) -> 9
    | Card (Ten, _) -> 10
    | Card (Jack, _) -> 11
    | Card (Queen, _) -> 12
    | Card (King, _) -> 13
    | Card (Ace, _) -> 14

let compare_cards a b = compare (value_of a) (value_of b)
