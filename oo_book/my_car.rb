class MyCar
  attr_accessor :model, :speed, :color
  attr_reader :year

  def initialize(c, y, m)
    @color = c
    @year = y
    self.model = m
    @speed = 0
  end

  def speed_up=(speed)
    self.speed += speed
    puts "Go! You sped up #{speed} miles per hour"
  end

  def brake=(speed)
    self.speed -= speed
    puts "Braking! You are slowed down #{speed} miles per hour"
  end

  def shut_off
    self.speed = 0
    puts "You shutt off your vehicle."
  end

  def get_info
    puts "You are driving a #{color} #{year} #{model}"
    puts "You are currently going #{speed} miles per hour"
    puts "---------------------"
  end

  def spray_paint=(new_color)
    self.color = new_color
    puts "Your new #{color} paintjob looks nice!"
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons}"
  end

  def to_s
    ">> Hello #{year} #{color} #{model}\n"
  end
end


my_car = MyCar.new('Red', '2014', 'Nissan Versa')
puts my_car
# my_car.speed_up = 50
MyCar.gas_mileage(50, 3)


# my_car.speed_up(50)
# my_car.get_info

# my_car.brake(20)
# my_car.get_info
# my_car.shut_off
# my_car.get_info

# p my_car.color

# my_car.spray_paint = 'Orange'

