val x = { bar=(1+2, true andalso true) , foo=3+4, baz=(false,9)}

val a_pair = (3+1, 4+2)
val a_record = {second=4+2, first=3+1}
val another_pair = {2=5, 1=6}
(* #1 a_pair + #2 another_pair *)

val x = {3="hi", 1=true}
val y = {3="hi", 1=true, 2=3+2}

datatype mytype = TwoInts of int*int | Str of string | Pizza
val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(1+2, 3+4)
val e = a

fun f x =
  case x of
       Pizza => 3
     | Str s => 8
     | TwoInts(i1, i2) => i1 + i2

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

fun max_constant e =
  case e of
       Constant i => i
     | Negate e2 => max_constant e2
     | Add(e1, e2) => Int.max(max_constant e1, max_constant e2)
     | Multiply(e1, e2) => Int.max(max_constant e1, max_constant e2)

val test_exp = Add (Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp


datatype suit = Club | Diamond | Heart | Spade
datatype rant = Jack | Queen | King | Ace | Num of int

type card = suit * rank
type name_record = { student_num : int option,
                     first       : string,
                     middle      : string option,
                     last        : string }
fun is_Queen_of_Spades (c : card) =
  #1 c = Spade andalso #2 c = Queen

val c1 : card = (Diamond, Ace)
val c2 : suit * rank = (Heart, Ace)
val c3 = (Spade, Ace)

fun is_Queen_of_Spades2 c =
  case c of
       (Spade, Queen) => true
     | _ => false

fun inc_or_zero intoption =
  case intoption of
       NONE => 0
     | SOME i => i+1

fun sum_list xs =
  case xs of
       [] => 0
     | x::xs' => x + sum_list xs'

fun append (xs, ys) =
  case xs of
       [] => ys
     | x::xs' => x :: append(xs', ys)

datatype 'a option = NONE | SOME of 'a
datatype 'a mylist = Empty | Cons of 'a *  'a mylist
datatype ('a, 'b) tree =
  Node of 'a * ('a,'b) tree * ('a,'b) tree
| Leaf of 'b

fun sum_tree tr =
  case tr of
       Leaf i => i
     | Node(i, lft, rgt) => i + sum_tree lft + sum_tree rgt

fun sum_leaves tr =
  case tr of
       Leaf i => i
     | Node(i, lft, rgt) => sum_leaves lft + sum_leaves rgt
