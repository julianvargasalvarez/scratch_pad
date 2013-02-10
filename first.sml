(* this is a comment. This is our first profram. *)

val x = 34;
val y = 17;
val z = (x + y) + (y + 2);
val q = z + 1;
val abs_of_z = if z < 0 then 0 - z else z;
val abs_of_z_simpler = abs z;

fun pow(x : int, y : int) =
  if y=0
  then 1
  else x * pow(x, y-1)

fun cube(x : int) =
  pow(x, 3)

val sixtyfour = cube(4)
val fortytwo = pow(2, 2 + 2) + pow(4, 2) + cube(2) + 2

fun swap (pr : int*bool) =
  (#2 pr, #1 pr)

fun sum_two_pairs (pr1 : int * int, pr2 : int * int) =
  (#1 pr1) + (#2 pr2) + (#1 pr2) + (#2 pr2)

fun div_mod (x : int, y : int) =
  (x div y, x mod y)

fun sort_pair(pr : int * int) =
  if (#1 pr) < (#2 pr)
  then pr
  else (#2 pr, #1 pr)

val x = [7, 8, 9]
5::x
6::5::x

null x
null []
hd x
tl x
hd (tl x)


3::[]
true::[]

fun sum_list (xs : int list) =
  if null xs
  then 0
  else hd xs + sum_list(tl xs)

fun list_product(xs : int list) =
  if null xs
  then 1
  else hd xs * list_product(tl xs)

fun countdown (x : int) =
  if x = 0
  then []
  else x :: countdown(x-1)

fun append (xs : int list, ys : int list) =
  if null xs
  then ys
  else (hd xs) :: append((tl xs), ys)

fun sum_pair_list (xs : (int * int) list) =
  if null xs
  then 0
  else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)


fun firsts (xs : (int * int) list) =
  if null xs
  then []
  else (#1 (hd xs)) :: firsts tl xs

fun seconds(xs : (int * int) list) =
  if null xs
  then []
  else (#2 (hd xs)) :: firsts tl xs


fun sum_pair_lists2 (xs : (int * int) list) =
  (sum_list (firsts xs)) + (sum_list (seconds xs))


fun silly1 (z : int) =
  let
    val x = if z > 0 then z else 34
    val y = x + z + 9
  in
    if x > y then x * 2 else y * y
  end

fun silly2 () =
  let
    val x = 1
  in
    (let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)

fun silly3 () =
  let
    val x = (let val x = 5 in x + 10 end);
  in
    (x, let val x=2 in x end, let val x = 10 in let val x=2 in x end end)
  end

fun count (from : int, to : int) =
  if from = to
  then to::[]
  else from :: count(from+1, to)

fun countup_from1(x : int) =
  let
    fun count (from : int) =
      if from = x
      then x::[]
      else from :: count(from+1)
  in
    count(1)
  end

fun max1 (xs : int list) =
  if null xs
  then NONE
  else
    let val tl_ans = max1(tl xs)
    in if isSome tl_ans andalso valOf tl_ans > hd xs
       then tl_ans
       else SOME (hd xs)


fun max2 (xs : int list) =
  if null xs
  then NONE
  else let
    fun max_nonempty (xs : int list) =
      if null (tl xs)
      then hd xs
      else let val tl_ans = max_nonempty(tl xs)
           in
             if hd xs > tl_ans
             then hd xs
             else tl_ans
           end
  in
    SOME (max_nonempty xs)
  end
