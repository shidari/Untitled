structure NonEmptyList (α : Type) : Type where
  head : α
  tail : List α

def appendListNonEmptyList  : NonEmptyList α → List α → NonEmptyList α
| ⟨x, xs⟩, ys => ⟨x, xs ++ ys⟩

instance : HAppend (NonEmptyList α) (List α) (NonEmptyList α) where
  hAppend := appendListNonEmptyList

def a: NonEmptyList Nat := { head := 1, tail := [2, 3] }
def b: List Nat := [4, 5, 6]

-- #eval a ++ b  -- { head := 1, tail := [2, 3, 4, 5, 6] }

inductive BinaryTree (α : Type) : Type
| empty
| node (value : α) (left right : BinaryTree α)

def binaryTreeFunctorMap {α β : Type} (f : α → β) : BinaryTree α → BinaryTree β
| BinaryTree.empty => BinaryTree.empty
| BinaryTree.node value left right =>
    BinaryTree.node (f value) (binaryTreeFunctorMap f left) (binaryTreeFunctorMap f right)


instance : Functor BinaryTree where
  map := binaryTreeFunctorMap

-- 例の木を作る
def sampleTree : BinaryTree Nat :=
  BinaryTree.node 1
    (BinaryTree.node 2 BinaryTree.empty BinaryTree.empty)
    (BinaryTree.node 3
      (BinaryTree.node 4 BinaryTree.empty BinaryTree.empty)
      BinaryTree.empty)

-- Functor の map で値を変換
#eval (Functor.map (· * 10) sampleTree)
-- 結果のイメージ：
-- node 10
--   node 20 empty empty
--   node 30
--     node 40 empty empty
--     empty
