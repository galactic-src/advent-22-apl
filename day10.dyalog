input ← ⊃⎕NGET 'day10.txt' 1

cycle total totals ← 0 1 ⍬

update_cycle ← {⍵≡'noop':1 ⋄ 2}
update_totals ← {⍵≡'noop':(total) ⋄ total total} 
update_total ← {⍵≡'noop':0 ⋄ ⍎5↓⍵}
{cycle +← update_cycle ⍵ ⋄ totals ,← update_totals ⍵ ⋄ total +← update_total ⍵ }¨input

+/(totals×⍳≢totals)[20 60 100 140 180 220] ⍝ part 1
{1=⍵:'#' ⋄ '.'}¨6 40⍴1≥|totals-40|1-⍨⍳≢totals ⍝ part 2
