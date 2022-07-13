class Shelter
  def initialize
    @owners = Hash.new
  end
  
  def adopt(name, pet)
    @owners[name] == nil ? @owners[name] = [pet] : @owners[name] << pet
    name.pets << pet
  end
  
  def print_adoptions
    @owners.each_key do |owner|
      puts "#{owner.name} has adopted the following pets:"
      @owners[owner].each { |pet| puts "A #{pet.pet} named #{pet.name}" }
      puts "\n"
    end
  end
end

class Owner 
  attr_reader :name, :pets
  
  def initialize(owner)
    @name = owner
    @pets = []
  end
  
  def number_of_pets
    @pets.size
  end
end

class Pet
  attr_reader :pet, :name
  
  def initialize(pet, name)
    @pet = pet
    @name = name
  end
end 

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


# =begin

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
