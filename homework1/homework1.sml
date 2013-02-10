fun is_older (x : int * int * int, y : int * int * int) =
  ((#1 x) + ((#2 x) * 30) + (#3 x)) < ((#1 y) + ((#2 y) * 30) + (#3 y))

fun number_in_month (x : (int*int*int) list, y : int) =
  if null x
  then 0
  else let val z = number_in_month (tl x, y)
       in
          if (#2 (hd x)) = y
          then 1 + z
          else 0 + z
       end

fun number_in_months (x : (int*int*int) list, y : int list) =
  if null y
  then 0
  else number_in_month (x, hd y) + number_in_months(x, tl y)

fun dates_in_month (x : (int*int*int) list, y : int) =
  if null x
  then []
  else let val the_tail = dates_in_month (tl x, y) in
       let val the_head = hd x in
         if (#2 the_head) = y
         then the_head :: the_tail
         else the_tail
       end
     end

fun dates_in_months (x : (int*int*int) list, y : int list) =
  if null y
  then []
  else dates_in_month (x, hd y) @ dates_in_months (x, tl y)

fun get_nth (x : string list, n : int) =
  if n = 1
  then hd x
  else get_nth (tl x, n - 1)

fun date_to_string (x : (int*int*int)) =
  let val months = ["January ", "February ", "March ", "April ", "May ", "June ",
  "July ", "August ", "September ", "October ", "November ", "December "]
  in
    let val m = get_nth(months, (#2 x)) in
      m ^ Int.toString(#3 x) ^ ", " ^ Int.toString(#1 x)
    end
  end

fun number_before_reaching_sum (sum : int, y : int list) =
let val the_sum = sum - (hd y) in
  if the_sum <= 0
  then 0
  else 1 + number_before_reaching_sum (the_sum, tl y)
end

fun what_month (x : int) =
let val m = [31,59,90,120,151,181,212,243,273,304,334,365] in
  number_before_reaching_sum (x, m) + 1
end

fun month_range (day1 : int, day2 : int) =
  if day1 > day2
  then []
  else
    what_month (day1) :: month_range (day1 + 1, day2)

fun oldest (dates : (int*int*int) list) =
  if null dates
  then NONE
  else
    let val tl_dates = oldest (tl dates) in
      if isSome tl_dates andalso is_older((hd dates), valOf tl_dates)
      then tl_dates
      else SOME (hd dates)
    end
