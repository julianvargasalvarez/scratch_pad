def factorial(numero)
  def helper(acc, num)
    if num == 0
      acc
    else
      helper(acc*num, num-1)
    end
  end
  
  helper(1, numero)
end
#puts factorial(500)

def increment_n_times(n, x)
  if n == 0
    x
  else
    1 + increment_n_times(n-1, x)
  end
end

def double_n_times(n, x)
  if n == 0
    x
  else
    2 * double_n_times(n-1, x)
  end
end

def nth_tail(n, list)
  if n == 0
    list
  else
    nth_tail(n-1,list)[1..-1]
  end
end

def n_times(f,n,x)
  if n==0
    x
  else
    f.call n_times(f,n-1,x)
  end
end

puts n_times(->(x){ x[1..-1]}, 3, [1,2,3,4])
puts n_times(->(x){ x + 1 }, 3, 1)
