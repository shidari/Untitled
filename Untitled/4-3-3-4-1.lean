import Std -- StateM が入っている

open Std

-- m, k, h の型をすべて Int に統一
-- def m : StateM Int Int := do
--   let s ← get
--   set (s + 1)
--   pure (s + 10)

-- def k (x : Int) : StateM Int Int := do
--   let s ← get
--   set (s * 2)
--   pure (x + s)

-- def h (y : Int) : StateM Int Bool := do
--   let s ← get
--   pure (y % 2 == s % 2)

-- -- 左辺: ((m >>= k) >>= h)
-- def lhs : StateM Int Bool := do
--   let x ← m
--   let y ← k x
--   h y

-- -- 右辺: (m >>= (λx => k x >>= h))
-- def rhs : StateM Int Bool := do
--   let x ← m
--   k x >>= h

-- -- eval で確認
-- #eval lhs.run 5
-- #eval rhs.run 5

def m : Except String Nat := Except.ok 10
def k (x : Nat) : Except String Nat := if x > 5 then Except.ok (x+1) else Except.error "small"
def h (y : Nat) : Except String String := if y % 2 == 0 then Except.ok "even" else Except.error "odd"

def lhs := do
  let x ← m
  let y ← k x
  h y

def rhs := do
  let x ← m
  k x >>= h

#eval lhs
#eval rhs
