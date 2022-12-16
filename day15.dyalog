input ← ⊃⎕NGET'day15.txt'1

data ← ⍎¨('-'⎕R'¯')(': closest beacon is at x='⎕R' ')(', y='⎕R' ')('Sensor at x='⎕R'')input

sensor_x sensor_y beacon_x beacon_y ← ↓⍉↑data
sensors ← ↓⍉↑sensor_x sensor_y
beacons ← ↓⍉↑beacon_x beacon_y

manhattans ← +/¨|sensors-beacons
remainders ← manhattans-|2000000-sensor_y
interesting_remainders ← (0≤remainders)/remainders
interesting_x ← (0≤remainders)/sensor_x

coords ← ∪⊃,/1-⍨interesting_remainders-⍨interesting_x+⍳¨1+2×interesting_remainders
beacons_in_row ← +/{2000000=⊃⍵[2]}¨∪beacons
beacons_in_row-⍨≢∪⊃,/1-⍨interesting_remainders-⍨interesting_x+⍳¨1+2×interesting_remainders ⍝ part 1
