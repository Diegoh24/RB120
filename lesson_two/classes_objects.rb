class Person
  attr_accessor :first_name, :last_name
  def initialize(name)
    parse_name(name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(name)
    parse_name(name)
  end
  
  private
  
  def parse_name(name)
    @first_name, @last_name = name.split.size > 1 ? name.split : [name.split[0], '']
  end
  
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = 'John Adams'
p bob.first_name            # => 'John'
p bob.last_name      
