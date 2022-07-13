class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

# sponges and corals don't have a separate move method bc they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]

animals.each { |animal| puts animal.move }


  
