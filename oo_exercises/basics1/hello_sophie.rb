
#file name should be cat.rb

class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Sophie")