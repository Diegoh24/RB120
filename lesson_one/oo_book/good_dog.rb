# module Speak
#   def speak(sound)
#     puts sound
#   end
# end

# class GoodDog
#   include Speak
# end

# class HumanBeing
#   include Speak
# end


# puts "----GoodDog ancestors----"
# puts GoodDog.ancestors

# puts "----HumanBeing ancestors----"
# puts HumanBeing.ancestors


class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def some_method
    self.info
  end

  @@number_of_dogs = 0

  # def initialize
  #   @@number_of_dogs += 1
  # end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def what_is_self
    self
  end

  puts self
end

sparky = GoodDog.new('Sparky', '52 inches', '12 stone')
p sparky.what_is_self

# p GoodDog.total_number_of_dogs

# dog1, dog2 = GoodDog.new, GoodDog.new

# puts GoodDog.total_number_of_dogs


# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info



# fido = GoodDog.new('Fido')
# puts fido.speak

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a * DOG_YEARS
#   end

#   def to_s
#     "this dog's name is #{name} and it is #{age} in dog years."
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky


