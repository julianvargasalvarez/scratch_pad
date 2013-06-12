#!/bin/bash
function isDivisibleBy {
  return $(($1%$2))
}

function fizzOrBuzz {
    output=""
    if isDivisibleBy $1 3; then
        output="Fizz"
    fi
    if isDivisibleBy $1 5; then
        output="${output}Buzz"
    fi
    if [ -z $output ]; then
        echo $1
    else
        echo $output
    fi
}

for number in {1..100}; do
    var=$(fizzOrBuzz $number)
    echo $var
done
