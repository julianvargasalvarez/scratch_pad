fun double x = 2 * x
fun incr x = x + 1
val a_tuple = (double, incr, double(incr 7))
val eighteen = (#1 a_tuple) 9


fun increment_n_times_lame (n, x) =
  if n=0
  then x
  else 1 + increment_n_times_lame(n-1, x)

fun double_n_times_lame(n, x) =
  if n=0
  then x
  else 2 * double_n_times_lame(n-1, x)

fun nth_tail_lame(n, xs) =
  if n=0
  then xs
  else tl (nth_tail_lame(n-1, xs))

fun n_times(f,n,x) =
  if n=0
  then x
  else f (n_times(f,n-1, x))

fun increment x = x+1
fun double x = x+x

val x1 = n_times(double,4,7)
val x2 = n_times(increment,4,7)
val x3 = n_times(tl,2,[4,8,12,16])

fun addition(n,x) = n_times(increment, n, x)
fun double_n_times(n,x) = n_times(double,n,x)
fun nth_tail(n,x) = n_times(tl,n,x)

fun triple x = 3 * x
fun triple_n_times(n,x) = n_times(triple, n, x)

fun temes_until_zero(f, x) =
  if x=0 then 0 else 1 + times_until_zero(f, f x)

fun len xs =
  case xs of
       [] => 0
     | x::xs' => 1 + len xs'

fun triple_n_times(n, x) =
  n_times((fn x => 3*x), n, x)

fun map(f, xs) =
  case xs of
       [] => []
     | x::xs' => (f x)::map(f,xs')

val x1 = map((fn x => x + 1), [4,8,12816])
val x2 = map(hd, [[1,2],[3,4],[5,6,7]])

fun filter(f, xs) =
  case xs of
       [] => []
     | x::xs' => if f x
                then x::(filter (f, xs'))
                else finter(f, xs')
fun is_even v =
  (v mod 2 = 0)

fun all_even xs = filter(is_even, xs)

fun all_even_snd xs = filter((fn (_,v) => is_even v), xs)

fun double_or_triple f =
  if f 7
  then fn x => 2*x
  else fn x => 3*x

val double = double_or_triple (fn x => x - 3 = 4)
val nine = (double_or_triple (fn x => x = 42)) 3

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

fun true_of_all_constants(f,e) =
  case e of
       Constant i => f i
     | Negate e1 => true_of_all_constants(f, e1)
     | Add(e1,e2) => true_of_all_constants(f, e1)
                    andalso true_of_all_constants(f, e2)
     | Multiply(e1,e2) => true_of_all_constants(f,e1)
                    andalso true_of_all_constants(f,e2)

fun all_even e = true_of_all_constants((fn x => x mod 2 = 0), e)
