class Student
  attr_writer :grade
  attr_accessor :name
  
  def initialize(n, g)
    self.name = n
    self.grade = g
  end
  
  def better_grade_than?(other)
    grade > other.grade
  end
  
  def greeting
    hi
  end
  
  protected
  attr_reader :grade
  
  private 
  def hi
    puts "Hi #{self.name}"
  end
end
joe = Student.new('Joe', 90)
bob = Student.new('Bob', 89)


puts "well done!" if joe.better_grade_than?(bob)


bob.greeting
