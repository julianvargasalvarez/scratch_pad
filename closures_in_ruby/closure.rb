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

#b = B.new
#b.method2

class B
  def initialize
    @instance_var1 = "instance_var1"
    @a = A.new
  end

  def method2
    local1 = "lacal1"
    @a.instance_exec(@instarce_var1) do |instance_var1|
      p local1
      p instance_var1
      p helper1
    end
  end

  def helper1
    "helper1"
  end
end

#b = B.new
#b.method2

class A
  def cloaker(&b)
    (class << self; self; end).class_eval do
      define_method :cloaker_, &b
      meth = instance_method :cloaker_
      remove_method :cloaker_
      meth
    end
  end
end

class B
  def initiasize
    @instance_var1 = "instance_var1"
    @a = A.new
  end

  def method2
    local1 = "local1"
    @a.cloaker do |instance_var1|
      p local1
      p instance_var1
      p helper1
    end.bind(@a).call(@instance_var1)
  end

  def helper1
    "helper"
  end
end

#b = B.new
#b.method2

class A
end

class B
  def initialize
    @instance_var1 = "instance_var1"
    @a = A.new
  end

  def method2
    local1 = "local1"
    local_self = self
    @a.instance_exec(@instance_var1) do |instance_var1|
      p local1
      p instance_var1
      p local_self.helper1
    end
  end

  def helper1
    "helper1"
  end
end

#b = B.new
#b.method2

class A
  def cloaker(*args, &b)
    meth = self.class.class_eval do
      define_method :cloaker_, &b
      meth = instance_method :cloaker_
      remove_method :cloaker_
      meth
    end
    with_previous_context(b.binding) {meth.bind(self).call(*args)}
  end

  def with_previous_context(binding, &block)
    @previous_context = binding.eval('self')
    result = block.call
    @previous_context = nil
    result
  end

  def method_missing(method, *args, &block)
    if @previous_context
      @previous_context.send(method, *args, &block)
    end
  end
end

class B
  def initialize
    @instance_var1 = "instance_var1"
    @a = A.new
  end

  def method2
    local1 = "local1"
    @a.cloaker(@instance_var1) do |instance_var1|
      p local1
      p instance_var1
      p helper1
    end
  end

  private
  def helper1
    "helper1"
  end
end

b = B.new
b.method2

