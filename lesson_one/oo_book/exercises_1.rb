# class MyClass

# end

# new_obj = MyClass.new

#exercise 2
=begin
A module is a collection of behaviors that can be inserted to a class,
allowing the class to inherit the methods defined in the module.
A module is inserted via mixings, using the 'include' method invocation


module MyModule
  def output(string)
    puts ">> #{string}"
  end
end

class MyClass
  include MyModule
end

new_obj = MyClass.new

new_obj.output('This is a working module method mixed in to a class')

=end

