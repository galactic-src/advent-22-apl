abc xyz←↓⍉⎕CSV(' '⎕R','⊃⎕NGET'day2.txt' 1)''4

rps_score ← {'XYZ'⍳⍵}
ldw_score ← {3×3|('XYZ'⍳⍵)-2+'ABC'⍳⍺}
round_score ← {(rps_score ⍵) + ⍺ ldw_score ⍵ }
abc+.round_score xyz ⍝ part 1

rps_score_2 ← {1+3|('XYZ'⍳⍵)+'ABC'⍳⍺}
ldw_score_2 ← {3×1-⍨'XYZ'⍳⍵}
round_score_2 ← {(ldw_score_2 ⍵) + ⍺ rps_score_2 ⍵} 
abc+.round_score_2 xyz ⍝ part 2
