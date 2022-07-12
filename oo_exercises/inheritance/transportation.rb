module Transportation
  class Vehicle
    
  end
  
  class Truck < Vehicle
  end
  
  class Car < Vehicle
  end
end

=begin
this is an example of namespacing:
where similar classes are grouped within a module
-makes it easier to recognize the purpose of the contained classes
-helps avoid collision with classes of the same name

To instantiate a class that's contained in a module:
#=> ModuleName::ClassName.new
=end