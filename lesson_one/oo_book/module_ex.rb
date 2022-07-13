module Swimmable
  def swim
    "I'm Swimming"
  end
end


class Animal; end
  
class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end


sparky = Dog.new
paws = Cat.new
diego = Fish.new

p sparky.swim
p diego.swim
p paws.swim
