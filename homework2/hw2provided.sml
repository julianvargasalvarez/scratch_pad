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

fun card_color c =
  case c of
       (Clubs, _)  => Black
     | (Spades, _) => Black
     | _ => Red

fun card_value c =
  case c of
       (_, Ace) => 11
     | _ => 10

fun remove_card (cs, c, e) =
  case cs of
       [] => raise e
     | h::t =>
         if h = c
         then t
         else h :: remove_card (t, c, e)

fun all_same_color (c : card list)  =
let fun oe (cs, r) =
  case cs of
    [] => true
  | h::t =>
      if r <> card_color (h)
      then false
      else oe (t, r)
in
  let val x::_ = c in
    oe ( c, card_color (x) )
  end
end

fun sum_cards (c : card list) =
let fun suma (c, t) =
  case c of
       [] => t
     | h::k => suma(k, t+card_value(h))
in
  suma(c, 0)
end

fun score (c : card list, goal : int) =
let val sum = sum_cards (c) in
  let val preliminary = if sum > goal
                        then 3 * (sum - goal)
                        else goal - sum
  in
    if all_same_color (c)
    then
      preliminary div 2
    else
      preliminary
  end
end

fun officiate (cs : card list, ms : move list, g : int) =
let fun da (cs, ms, g, held) =
  case ms of
       [] => score (held, g)
     | Discard c::rs => da (cs, rs, g, remove_card (held, c, IllegalMove) )
     | Draw::rs => case rs of
                    [] => score (held, g)
                      | the_rs => if sum_cards (held) > g
                                    then score (held, g)
                                    else case cs of
                                              kkk::mmm => da (mmm, the_rs, g,
                                              kkk::held)

in
  da (cs, ms, g, [])
end
