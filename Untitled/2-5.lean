theorem p1 : 2 + 3 = 5 := rfl
theorem p2: 15 - 8 = 7 := rfl
theorem p3: "Hello, ".append "world" = "Hello, world" := rfl
-- theorem p4: 5 < 18 := rfl　反射性を満たしていない、< は反射的ではない(ex. 3 < 3 はfalse
theorem p5:  2 + 3 = 5 := by decide
theorem p6: 15 - 8 = 7 := by decide
theorem p7: "Hello, ".append "world" = "Hello, world" := by decide
theorem p8: 5 < 18 := by decide

def woodlandCritters : List String :=
  ["hedgehog", "deer", "snail", "squirrel", "fox", "bear"]
def fifth (xs : List α) (ok : xs.length > 4) : α := xs[4]
#eval fifth woodlandCritters (by decide)
