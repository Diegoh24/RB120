module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable
  
  attr_reader :title, :name
  
  def walk 
    "#{title} #{name} #{gait} forward"
  end
  
  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def walk
    "#{title} " + super
  end
  # def to_s
  #   "#{title} #{@name}"
  # end
  
  private
  
  def gait
    "struts"
  end
end




byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"


p byron.name
# => "Byron"
p byron.title
# => "Lord"