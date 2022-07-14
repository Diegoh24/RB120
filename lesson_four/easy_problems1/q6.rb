
class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end

rubix = Cube.new(20)
puts rubix.volume
#add gett

#can also access with #instance_variable_get(instance_variable name surrounded by double quotes)
