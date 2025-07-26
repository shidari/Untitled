structure RectangularPrism where
  height : Float
  width : Float
  depth : Float
deriving Repr


def volume (rectangularPrism: RectangularPrism): Float :=
  rectangularPrism.height * rectangularPrism.width * rectangularPrism.depth

structure Point where
  mk ::
  x : Float
  y : Float

structure Segment where
  mk ::
  p1 : Point
  p2 : Point

def length (segment: Segment): Float :=
  Float.sqrt ((segment.p2.x - segment.p1.x) ^ 2.0 + (segment.p2.y - segment.p1.x) ^ 2.0)

def p1:= Point.mk 5 6
def p2:= Point.mk 7 8
def seg:= Segment.mk p1 p2
#eval length seg
-- Which names are introduced by the declaration of RectangularPrism?
-- => height, width, depth

-- Which names are introduced by the following declarations of Hamster and Book? What are their types?

structure Hamster where
  name : String
  fluffy : Bool
structure Book where
  makeBook ::
  title : String
  author : String
  price : Float
-- => name fluffy makeBook title authro price

#check Hamster
#check Book
