input ← ↑{⍎¨⍵}¨⊃⎕NGET'day8.txt' 1

surroundings ← {((⍺-1)↑⍵)(⍺↓⍵)}
is_visible ← {x y←⍵ ⋄ value←input[x;y] ⋄ row←input[x;] ⋄ column←input[;y] ⋄ ∨/∧/¨value>(y surroundings row),(x surroundings column)}
interior ← +/∊is_visible¨1+⍳2-⍨⍴input
edges ← 4-⍨+/2×⍴input
interior+edges ⍝ part 1

surroundings2 ← {(⊖(⍺-1)↑⍵)(⍺↓⍵)}
trees_visible ← {(≢⍵)⌊1++/∧\⍺>⍵}
scenic ← {x y ← ⍵ ⋄ value ←  input[x;y] ⋄ row ← input[x;] ⋄ column ← input[;y] ⋄ ×/{value trees_visible ⍵}¨(y surroundings2 row),(x surroundings2 column)}
⌈/∊scenic¨1+⍳2-⍨⍴input ⍝ part 2
