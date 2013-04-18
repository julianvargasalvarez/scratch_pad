class Monad
  def initialize(value=nil)
    @value = value
  end

  def identity
    @value
  end

  def bind(f, *args)
    ar = [identity] + args
    Monad.new f.call(*ar)
  end

  def method(name, f)
    b = ->(*args){
      bind(f,*args)
    }
    self.class.send(:define_method, name, b)
  end
end

a = ->(x){ 
  puts "hala"
  r = x.map{|m| m+1}
  puts "oeu"
  r
}
b = ->(x){ x.map{|m| m*m} }

m = Monad.new
m.method('suma', a)
m.method('cuadrado', b)
p m.suma(5).cuadrado(4)
