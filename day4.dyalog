input ← ⊃⎕NGET 'day4.txt' 1
lo1 hi1 lo2 hi2 ← ↓⍉⎕CSV('-'⎕R','¨input)''4

+/((lo1≥lo2) ∧ (hi1≤hi2)) ∨ ((lo1≤lo2) ∧ (hi1≥hi2)) ⍝ part 1
+/((lo1≤hi2) ∧ (hi1≥lo2)) ⍝ part 2
