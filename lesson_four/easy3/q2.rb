class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    new.greet("hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


Hello.hi
#chain a #new class method on Hello to instantiate a new obj and then call the instance method #hi on the obj
#or add class method #obj