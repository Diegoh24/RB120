
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end




name = "buffy"
fluffy = Pet.new(name)
puts fluffy.name
name.upcase!
puts fluffy.name

=begin
further exploration:
also note: to_s called on a string object returns 'self'

the @name instance variable (state) of the Pet object assigned to the variable fluffy references
the same object that the local variable 'name ' references.


when the object is instantiated, the #to_s method is called on the integer object.
The integer object passed in as an argument is not from the Integer class at that point, not the 
"Pet class",
so fluffy's, instance var @name is assigned to the string representation of name, = '42'
when name is incremented on line 16, the result however is not reflected? or is it???
it might just be... na. when it's converted to a string, the str obj returned is a new obj

On line 3, 'name' is reassigned w/ shorthand to its current int value incremented by 1
line 4 : #=> 42
line 5 : object_id?
line 6: 42
line 7: 43



=end