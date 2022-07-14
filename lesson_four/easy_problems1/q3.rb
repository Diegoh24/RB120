module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end


Car.new.go_fast

=begin
The self method call refernces the object it is called on,
so self.class is <car_object_id>.class, the #class will return the name of the
class, which is Car. and string interpolation automatically calls #to_s on the 'Car'.
=end