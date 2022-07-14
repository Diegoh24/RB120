class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end


# keeps count of the number of cat objects instantiated.
# instantiate objects, check # of object instantiated with count, access count with class method.

p (3.times { |type| Cat.new(type) } == Cat.cats_count)
