def joinStringsWith (first: String) (second: String) (third: String): String :=
  String.append second (String.append first third)
#eval joinStringsWith ", " "one" "and another"
#check  joinStringsWith ": "
def volume (height: Nat) (width: Nat) (depth: Nat): Nat :=
  height * width * depth
#eval volume 5 6 7
