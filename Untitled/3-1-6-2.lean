inductive EvenNum : Type
where
  | zero : EvenNum
  | succ : EvenNum -> EvenNum

def two : EvenNum := EvenNum.succ (EvenNum.zero)

def four: EvenNum := EvenNum.succ  two

def EvenNum.plus : EvenNum -> EvenNum -> EvenNum
| EvenNum.zero, b => b
| EvenNum.succ a, b => EvenNum.succ (EvenNum.plus a b)

class Plus (α : Type) where
  plus : α → α → α

instance : Plus EvenNum where
  plus := EvenNum.plus

instance : Add EvenNum where
  add:= EvenNum.plus

def eight: EvenNum := four + four

#eval eight

def posToString (atoTop: Bool) (e: EvenNum) : String :=
  let paren s := if atoTop then s else "(" ++ s ++ ")"
  match e with
  | EvenNum.zero => "EvenNum.zero"
  | EvenNum.succ a => paren s!"EvenNum.succ {posToString false a}"

instance : ToString EvenNum where
  toString := posToString true

#eval s!"There are {eight}"
