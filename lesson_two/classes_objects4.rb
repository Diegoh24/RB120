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

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name
