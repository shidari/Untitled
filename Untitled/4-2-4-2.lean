-- instance : Monad Option where
--   pure x := some x
--   bind opt next := match opt with
--     | none => none
--     | some x => next x
instance : Monad Option where
  pure x := some x
  bind opt next := none

def test : Option Nat := none
def test2 : Option Nat := some 3
def f (x : Nat) : Option Nat := some (x + 1)
#eval (pure 2 >>= f) -- none
#eval f 2 -- some 3
-- モナド則を満たしてない！
