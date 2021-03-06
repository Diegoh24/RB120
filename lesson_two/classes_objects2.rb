class Person
  attr_accessor :first_name, :last_name
  
  def initialize(n)
    @first_name, @last_name = (n.split.size > 1 ? n.split : [n.split[0], ''])
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end


bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name
