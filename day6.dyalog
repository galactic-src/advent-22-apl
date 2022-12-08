⎕IO←0

input ← ⊃⎕NGET'day6.txt'
end_unique_window ← {⍺+⍺⍳⍨{≢∪⍵}¨⍺,/⍵}

4 end_unique_window input ⍝ part 1
14 end_unique_window input ⍝ part 2
