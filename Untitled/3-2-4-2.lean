inductive EvenNum : Type
where
  | zero : EvenNum
  | succ : EvenNum -> EvenNum

instance : OfNat EvenNum 0 where
  ofNat := EvenNum.zero

instance (n : Nat) [OfNat EvenNum n] : OfNat EvenNum (n + 2) where
  ofNat := EvenNum.succ (OfNat.ofNat n)


def a : EvenNum := 254      -- OK
-- def b : EvenNum := 256      -- Error limit exceeded
