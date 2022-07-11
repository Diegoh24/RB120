class Parent
  def say_hi
    p "Hi from Parent"
  end
end

class Child < Parent
  def say_hi
    p "Hi from Child"
  end
  
  def send
    p "OVERRIDEN BOI"
  end
end

son = Child.new
son.send :say_hi

# child = Child.new
# child.say_hi
# p Parent.superclass