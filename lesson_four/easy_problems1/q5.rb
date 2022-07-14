class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new('chees')

p hot_pizza.instance_variables
=begin
The pizza class, prepended by an @, instance variables are prepended by @.
=end