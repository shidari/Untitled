inductive EvenNum : Type
where
  | zero : EvenNum
  | succ : EvenNum -> EvenNum

instance : OfNat EvenNum 0 where
  ofNat := EvenNum.zero

instance (n : Nat) [OfNat EvenNum n] : OfNat EvenNum (n + 2) where
  ofNat := EvenNum.succ (OfNat.ofNat n)


def a : EvenNum := 0      -- OK
def b : EvenNum := 4      -- OK
def c : EvenNum := 6      -- OK
      -- def d : EvenNum := 1 -- エラー
#eval a
#eval b
#eval c
