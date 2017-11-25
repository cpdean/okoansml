(* rewritten from https://github.com/gigasquid/wonderland-clojure-katas *)

open OUnit
open Solutions.Alphabetcipher

(*

Lewis Carroll published a cipher known as
[The Alphabet Cipher](http://en.wikipedia.org/wiki/The_Alphabet_Cipher)

![Letter](/images/fishfrogletter.gif)

This Alphabet Cipher involves alphabet substitution using a keyword.

First you must make a substitution chart like this, where each row of
the alphabet is rotated by one as each letter goes down the chart.

```
   ABCDEFGHIJKLMNOPQRSTUVWXYZ
 A abcdefghijklmnopqrstuvwxyz
 B bcdefghijklmnopqrstuvwxyza
 C cdefghijklmnopqrstuvwxyzab
 D defghijklmnopqrstuvwxyzabc
 E efghijklmnopqrstuvwxyzabcd
 F fghijklmnopqrstuvwxyzabcde
 G ghijklmnopqrstuvwxyzabcdef
 H hijklmnopqrstuvwxyzabcdefg
 I ijklmnopqrstuvwxyzabcdefgh
 J jklmnopqrstuvwxyzabcdefghi
 K klmnopqrstuvwxyzabcdefghij
 L lmnopqrstuvwxyzabcdefghijk
 M mnopqrstuvwxyzabcdefghijkl
 N nopqrstuvwxyzabcdefghijklm
 O opqrstuvwxyzabcdefghijklmn
 P pqrstuvwxyzabcdefghijklmno
 Q qrstuvwxyzabcdefghijklmnop
 R rstuvwxyzabcdefghijklmnopq
 S stuvwxyzabcdefghijklmnopqr
 T tuvwxyzabcdefghijklmnopqrs
 U uvwxyzabcdefghijklmnopqrst
 V vwxyzabcdefghijklmnopqrstu
 W wxyzabcdefghijklmnopqrstuv
 X xyzabcdefghijklmnopqrstuvw
 Y yzabcdefghijklmnopqrstuvwx
 Z zabcdefghijklmnopqrstuvwxy
```

Both parties need to decide on a secret keyword.  This keyword is not written down anywhere, but memorized.

To encode the message, first write down the message.

```
meetmebythetree
```

Then, write the keyword, (which in this case is _scones_), repeated as many times as necessary.

```
sconessconessco
meetmebythetree
```

Now you can look up the column _S_ in the table and follow it down until it meets the _M_ row. The value at the intersection is the letter _e_.  All the letters would be thus encoded.

```
sconessconessco
meetmebythetree
egsgqwtahuiljgs
```

The encoded message is now `egsgqwtahuiljgs`

To decode, the person would use the secret keyword and do the opposite.
*)



(* Name the test cases and group them together *)
let identity x = x
let assert_string_equal = assert_equal ~printer: identity
let suite = "alphabet cipher">::: [
    (* feel free to write your own tests to help development
     * after `make test` you can run specific tests by copying
     * and pasting their test path or the beginning of a test suite's path
     * like this:
     * ./_build/default/tests/test.exe -only-test "koans:3:alphabet cipher:0:utilities"
     *)
    "utilities">::: [
        "example">:: (fun c ->
            assert_equal ~printer:string_of_int
            (* set to '1 2' to watch it fail and get a copy-pasteable
             * test path *)
            1 1
        );
    ];

    "encoding with vigilance">:: ( fun c ->
        assert_string_equal
        ~msg: "can encode given a secret keyword"
        "hmkbxebpxpmyllyrxiiqtoltfgzzv"
        (encode "vigilance" "meetmeontuesdayeveningatseven")
    );

    "encoding with scones">:: ( fun c ->
        assert_string_equal
        ~msg: "can encode given a secret keyword"
        "egsgqwtahuiljgs"
        (encode "scones" "meetmebythetree")
    );

    "decoding with vigilance">:: ( fun c ->
        assert_string_equal
        ~msg: "can decode given a secret keyword"
        "meetmeontuesdayeveningatseven"
        (decode "vigilance" "hmkbxebpxpmyllyrxiiqtoltfgzzv")
    );

    "decoding with scones">:: ( fun c ->
        assert_string_equal
        ~msg: "can decode given a secret keyword"
        "meetmebythetree"
        (decode "scones" "egsgqwtahuiljgs")
    );

    "decipher the keyword vigilance">:: ( fun c ->
        assert_string_equal
        ~msg: "can decipher the encrypted and decrypted text to find the keyword"
        "vigilance"
        (decipher "opkyfipmfmwcvqoklyhxywgeecpvhelzg" "thequickbrownfoxjumpsoveralazydog")
    );

    "decipher the keyword scones">:: ( fun c ->
        assert_string_equal
        ~msg: "can decipher the encrypted and decrypted text to find the keyword"
        "scones"
        (decipher "hcqxqqtqljmlzhwiivgbsapaiwcenmyu" "packmyboxwithfivedozenliquorjugs")
    );
]
