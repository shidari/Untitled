structure Pos where
  succ ::
  pred : Nat

class Plus (α : Type) where
  plus : α → α → α

instance : Add Pos where
  add p1 p2 :=
    Pos.succ ((p1.pred + 1) +  (p2.pred + 1) - 1)

instance : Mul Pos where
  mul p1 p2 :=
    Pos.succ ((p1.pred + 1) * (p2.pred + 1) - 1)

instance : Plus Pos where
  plus p1 p2 :=
    Pos.succ (p1.pred + 1 + p2.pred + 1 - 1)


instance : ToString Pos where
  toString p :=
    toString (p.pred + 1)

def seven : Pos := Pos.succ 6
open Plus (plus)

def fourteen : Pos := plus seven seven
#eval fourteen

def twentyone : Pos := seven + seven + seven
#eval twentyone

def fourtynine : Pos := seven * seven
#eval fourtynine

instance : ToString Pos where
  toString p :=
    toString (p.pred + 1)
#eval s!"There are {seven}"

instance:  OfNat Pos n where
  ofNat := Pos.succ (n - 1)

#eval (1 : Pos)
