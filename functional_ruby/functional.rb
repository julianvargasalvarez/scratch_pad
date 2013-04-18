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

#puts n_times(->(x){ x[1..-1]}, 3, [1,2,3,4])
#puts n_times(->(x){ x + 1 }, 3, 1)

def map(f, list)
  if list.count == 0
    []
  else
    [f.call(list[0])] + map(f, list[1..-1])
  end
end

#result = map(->(x){ x*x }, [1, 2, 3])
#p result

def _filter(f, list)
  if list.count == 0
    []
  else
    if f.call(list[0])
      [list[0]] + _filter(f, list[1..-1])
    else
      _filter(f, list[1..-1])
    end
  end
end

#p _filter(->(x){ x % 2 == 0}, [1, 2, 4, 6, 7, 9, 10])

class Monad
  attr_reader :value

  def initialize(value=nil)
    @value = value
  end

  def bind(f, *args)
    Monad.new(f.call(*args))
  end

  def method(name, f)
    b = ->(*args){
      self.bind(f, *args)
    }
    self.class.send(:define_method, name, b)
  end
end

m = Monad.new(5)
add = ->(x){
  x+1
}

m.method('sumar', add)
p m.sumar(100)
