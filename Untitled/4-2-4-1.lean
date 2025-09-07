inductive BinTree (α : Type) where
  | leaf : BinTree α
  | branch : BinTree α → α → BinTree α → BinTree α

def BinTree.mapM [Monad m] (f : α → m β) : BinTree α → m (BinTree β)
  | .leaf => pure .leaf
  | .branch l x r => do
    let l' ← mapM f l
    let x' ← f x
    let r' ← mapM f r
    pure (.branch l' x' r')
