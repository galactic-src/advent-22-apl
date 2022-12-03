split_pairs ← {⍵⊂⍨∊2/⊂1↑⍨(÷2)×≢⍵}¨input
intersections ← {∪(⊃⍵[1])∩⊃⍵[2]}¨split_pairs
priority ← {'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'⍳⍵}
+/priority¨intersections

triples ← {⍵⊂⍨1=3|⍳≢⍵}input
+/{priority ∪⊃∩/⍵}¨triples ⍝ part 2
