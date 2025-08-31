structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

def mulPPoint [Mul α] : PPoint α → α → PPoint α| ⟨x1, y1⟩, c => ⟨c * x1, c * y1⟩

instance [Mul α] : HMul (PPoint α) α (PPoint α) where
    hMul := mulPPoint

#eval {x := 2.5, y := 3.7 : PPoint Float} * 2.0
