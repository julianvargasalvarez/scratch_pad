# Axioms
# unit(value).bind(f)   == f(value)
# monad.bind(f).bind(g) == monad.bind(->(value){ f(value).bind(g)})


class Monad
  def unit(value)
    @value = value
  end

  def bind(f)
    m = Monad.new
    m.unit f.call(@value)
  end

  def meth(name, f)
    self.instance_eval do
      define_method name, &f
    end
  end
end

print = ->(value){
  puts value
  value
}

log = ->(value) {
  puts value.inspect
}
message = "Hello world"

monad = Monad.new
monad.unit(message)
monad.bind(print)
