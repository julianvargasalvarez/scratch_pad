x, y = [1, 2]
x # => 1

def min_max(array)
  [array.min, array.max]
end

min, max = min_max([3, 5, 2])
min # => 2
max # => 5

def min_max(*values)
 [values.min, values.max]
end

min, max = min_max(3, 5, 2)
min # => 2
max # => 5

def divide(numerator, denominator)
 numerator / denominator
end
divide(*[4, 2])

x, y = [1, 2, 3]
x # => 1
y # => 2

first, *rest = [1, 2, 3]
x # => 1
rest # => [2, 3]

triples = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
triples.each { |(first, second, third)| puts second }
# 2
# 5
# 8

triples.map { |(first, *rest)| rest.join(' ') } # => ["2 3", "5 6", "8 9"]

hash = {a: 1, b: 2, c: 3}
a, b = hash.values_at(:a, :b)
a # => 1
b # => 2

hash = {a: 1, b: 2}
hash.inject({}) { |new_hash, (key, value)| new_hash.merge(value => key) }
# => {1 => :a, 2 => :b}

hash = {a: [1, 2, 3], b: [4, 5, 6]}
hash.inject({}) { |new_hash, (key, (first, second, third))| new_hash.merge(second => key) }
# => {2 => :a, 5 => :b}

hash = {a: [1, 2, 3], b: [4, 5, 6]}
hash.inject({}) { |new_hash, (key, (first, *rest))| new_hash.merge(rest => key) }
# {[2, 3] => :a, [5, 6] => :b}

class Object
  def values_at(*attributes)
    attributes.map { |attribute| send(attribute) }
  end
end

class Dog
  attr_reader :color, :breed, :weight

  def initialize(color, breed, weight)
    @color, @breed, @weight = color, breed, weight
  end

  def to_ary
    [color, breed, weight]
  end
end

dog = Dog.new("black", "lab", "heavy")
color, breed = dog.values_at(:color, :breed)
color # => "black"
breed # => "lab"

color, breed, weight = dog
p color, breed, weight
