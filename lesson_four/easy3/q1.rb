class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#1
hello = Hello.new #new object from hello class instnatiated
hello.hi #instance 'hi' method called on hello object, 'then 'greet' superclass instance method called
# outputs "Hello"

# 2
hello = Hello.new
#hello.bye # attempt to call 'bye' instance method from goodbye class. caller is a 'hello' object.
#nomethod error
#

# 3
hello = Hello.new
#hello.greet #calls superclass 'greet' method with no argument
#wrong num of arg error

# 4
hello = Hello.new
hello.greet("Goodbye")
#calls superclass 'greet' method with arg 'goodbye'
#outputs 'Goodbye'

# 5
p Hello.hi
#attempt to call instance method on class, no method error.