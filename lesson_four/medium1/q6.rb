class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
# this code references the instance var @template directly to access it

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# this code uses the getter and setter methods created by attr_accessor to access and set the instance var 'template'
