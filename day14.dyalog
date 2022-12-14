input ← ⊃⎕NGET'day14.txt'1
vertices←{⍎'(',⍵,')'}¨(' -> '⎕R')(')input

unpack_coords ← {,(1-⍨⍺⌊⍵)∘+¨⍳1+|⍺-⍵}
rock_coords ← ⊃,/⊃,/{2{⍺ unpack_coords ⍵}/⍵}¨vertices

max_x max_y ← ⊃⌈/rock_coords
min_x min_y ← ⊃⌊/rock_coords
rock_coords_2 ← {⍵-(min_x-1) 0}¨rock_coords
height width ← 2+⊃⌈/rock_coords_2
grid ← (width height)⍴'.'
{grid[1+⊃⍵[2];1+⊃⍵[1]]←'#'}¨rock_coords_2 ⍝ write rocks to grid
sand_x sand_y ← (500-(min_x-2)) 1 ⍝ translate sand origin
grid[sand_y;sand_x] ← '+'         ⍝ highlight sand origin on the grid

fall_step ← {x y ← ⍵ ⋄ y=2+max_y:⍵ ⋄ '.'=⊃grid[y+1;x]: x (y+1) ⋄ '.'=⊃grid[y+1;x-1]: (x-1) (y+1) ⋄ '.'=⊃grid[y+1;x+1]: (x+1) (y+1) ⋄ ⍵}
fall ← {next ← fall_step ⍵ ⋄ ⍵≡next: next ⋄ ∇next}
add_sand ← {new_x new_y ← fall sand_x sand_y ⋄ grid[new_y;new_x] ← 'o' ⋄ new_y=(2+max_y):⍵ ⋄ ∇⍵+1}
add_sand 0 ⍝ part1


⍝ #### PART 2 ####

v_x_max v_y_max ← ⊃⌈/⊃,/vertices

⍝ add floor - at least max_y width available either side of the sand, plus a little buffer
floor_x_min ← 496 - v_y_max
floor_x_max ← 504 + v_y_max
floor_y ← 2+v_y_max
extended_vertices ← vertices
extended_vertices ,← ⊂(floor_x_min floor_y)(floor_x_max floor_y)

extended_rock_coords ← ⊃,/⊃,/{2{⍺ unpack_coords ⍵}/⍵}¨extended_vertices

max_x max_y ← ⊃⌈/extended_rock_coords
min_x min_y ← ⊃⌊/extended_rock_coords
extended_rock_coords_2 ← {⍵-(min_x-1) 0}¨extended_rock_coords
height width ← 2+⊃⌈/extended_rock_coords_2
grid ← (width height)⍴'.'
{grid[1+⊃⍵[2];1+⊃⍵[1]]←'#'}¨extended_rock_coords_2 ⍝ write rocks to grid
sand_x sand_y ← (500-(min_x-2)) 1 ⍝ translate sand origin
grid[sand_y;sand_x] ← '+'         ⍝ highlight sand origin on the grid

fall_step ← {x y ← ⍵ ⋄ '.'=⊃grid[y+1;x]: x (y+1) ⋄ '.'=⊃grid[y+1;x-1]: (x-1) (y+1) ⋄ '.'=⊃grid[y+1;x+1]: (x+1) (y+1) ⋄ ⍵}
fall ← {next ← fall_step ⍵ ⋄ ⍵≡next: next ⋄ ∇next}
add_sand ← {new_x new_y ← fall sand_x sand_y ⋄ grid[new_y;new_x] ← 'o' ⋄ sand_y=new_y:⍵+1 ⋄ ∇⍵+1}
add_sand 0 ⍝ part 2
