val x = { bar=(1+2, true andalso true) , foo=3+4, baz=(false,9)}
#bar x
#foo x
#baz x

val a_pair = (3+1, 4+2)
val a_record = {second=4+2, first=3+1}
val another_pair = {2=5, 1=6}
#1 a_pair + #2 another_pair

val x = {3="hi", 1=true}
val y = {3="hi", 1=true, 2=3+2}

