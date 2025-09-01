structure NonEmptyList (α : Type) : Type where
  head : α
  tail : List α

def appendListNonEmptyList  : NonEmptyList α → List α → NonEmptyList α
| ⟨x, xs⟩, ys => ⟨x, xs ++ ys⟩

instance : HAppend (NonEmptyList α) (List α) (NonEmptyList α) where
  hAppend := appendListNonEmptyList

def a: NonEmptyList Nat := { head := 1, tail := [2, 3] }
def b: List Nat := [4, 5, 6]

#eval a ++ b  -- { head := 1, tail := [2, 3, 4, 5, 6] }
