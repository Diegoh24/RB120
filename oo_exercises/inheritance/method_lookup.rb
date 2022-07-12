class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color


puts Cat.ancestors
=begin
lookup path:
-Class Cat > SuperClass Animal > Superclass Object > Module Kernel > Superclass BasicObject

classes checked:
Cat and Animal
=end
