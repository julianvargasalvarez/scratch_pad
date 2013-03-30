a = Object.new
a.instance_eval do
  def hello
    puts "hello"
  end
end
a.hello

class A
  def method1(&block)
    block.call
  end
end

class B
  def initialize
    @instance_var1 = 'instance_var1'
    @a = A.new
  end

  def method2
    local1 = 'local1'
    @a.method1 do
      p local1
      p @instance_var1
      p helper1
    end
  end

  def helper1
    "helper1"
  end
end

class A
  def method1(&block)
    puts block.binding.eval("self").object_id
    block.call
  end
end

b = B.new
p b.object_id
b.method2

class A
end

class B
  def initialize
    @instance_var1 = "instance_var1"
    @a = A.new
  end

  def method2
    local1 = "local1"
    @a.instance_eval do
      p local1
      p @instance_var1
      p helper1
    end
  end

  def helper1
    "helper1"
  end
end

b = B.new
b.method2

