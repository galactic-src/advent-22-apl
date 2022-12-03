read_space_delimited_lines ← {'\S+'⎕S'&'¨('(\n?[^\n])+'⎕S'&')⍠'Mode' 'D'⊃⎕NGET⍵}
input ← read_space_delimited_lines'day1.txt'
sums ← {+/⍎¨⍵}¨input
⌈/sums ⍝ part 1
+/3↑sums[⍒sums] ⍝ part 2
