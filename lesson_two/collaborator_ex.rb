
class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end



class Dog < Pet
  def swim
    'swimming!'
  end
  
  def speak
    'bark!'
  end
  
  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow'
  end
end


class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Person
  attr_accessor :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")
kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty << bud

p bob.pets

bob.pets.each do |pet|
  puts pet.jump
end
# pete = Pet.new
# kitty = Cat.new
# dave = Dog.new
# bud = Bulldog.new
