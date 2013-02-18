(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (s : string, x : string list) =
    let fun the_thing (foo : string, foo_list : string list) =
      case foo_list of
           [] => []
         | h::t => let val the_tail = the_thing(foo, t) in
                    if same_string(foo, h)
                    then the_tail
                    else [h] @ the_tail
                   end
    in
      let val y = the_thing (s, x) in
        if y = x
        then NONE
        else SOME y
      end
    end

fun get_substitutions1 (x, s) =
  case x of
       [] => []
     | m::n => let val the_rest = get_substitutions1 (n, s) in
                    case all_except_option (s, m) of
                        NONE => the_rest
                      | SOME y => y @ the_rest
               end


fun get_substitutions2 (x : (string list) list, s : string) =
let fun acc (x : (string list) list, s : string, y : string list) =
  case x of
       [] => y
     | m::n => case all_except_option (s, m) of
                    NONE => acc(n, s, y)
                  | SOME r => acc(n, s, r @ y)
in
  acc(x, s, [])
end

fun similar_names (x : (string list) list, y : {first:string,middle:string,last:string}) =
let fun euo (a : string list) =
  case a of
       [] => []
     | b::c => let val {first=_, middle=m, last=l} = y in
                  {first=b, middle=m, last=l} :: euo(c)
               end
in
  let val {first=f, middle=_, last=_} = y in
      y :: euo ( get_substitutions2 (x, f) )
  end
end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
