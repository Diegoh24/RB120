class Person
  attr_accessor :name #only the getter method is created with attr_reader
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
p bob.name