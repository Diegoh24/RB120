class Animal
  def speak
    "Hello!"
  end
  
  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  attr_accessor :name
  def initialize(color)
    super
    @color = color
  end
  
  # def initialize(n)
  #   self.name = n
  # end
  
  def speak 
    super + " from GoodDog class"
  end

end

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# p BadDog.new(2, "bear")
# # p bruno = GoodDog.new('brown')