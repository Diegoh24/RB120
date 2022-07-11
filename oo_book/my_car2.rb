module Towable
  def tow(weight)
    puts "You are towing #{weight} pounds"
  end
end


class Vehicle
  attr_accessor :speed, :year, :color, :model, :miles, :gallons
  @@vehicles = 0
  
  def initialize(c, y, m)
    self.color = c
    self.year = y
    self.model = m
    self.speed = 0
    @@vehicles += 1
  end
  
  def self.total_vehicles
    @@vehicles
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
  
  def spray_paint=(new_color)
    self.color = new_color
    puts "Your new #{color} paintjob looks nice!"
  end
  
  def to_s
    ">> Hello #{year} #{color} #{model}\n"
  end
  
  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons}"
  end


  def spray_paint=(new_color)
    self.color = new_color
    puts "Your new #{color} paintjob looks nice!"
  end
  
  def get_info
    puts "You are driving a #{color} #{year} #{model}"
    puts "You are currently going #{speed} miles per hour"
    puts "---------------------"
  end
end


class MyCar < Vehicle
  attr_accessor :model, :speed, :color, :year
  DOORS = 4
end

class MyTruck < Vehicle
  include Towable
  attr_accessor :color, :year, :model, :speed
  DOORS = 2
end
    

# car = MyCar.new("cam", "2020", "Nissan Sentra")
# car.spray_paint = "Fabulous Pink"
# car.speed_up = 80
# # car.get_info



# truck = MyTruck.new("cam2", "2019", "Toyota Tacoma")
# truck.spray_paint = "Bright Orange"
# truck.speed_up = 80

# truck.tow(5120)

# puts Vehicle.total_vehicles



puts MyCar.ancestors

p '-----------'


puts MyTruck.ancestors

p '-------'

puts Vehicle.ancestors
# truck.get_info

# truck.speed_up = 90

# p truck.get_info
# MyCar.speed_up = 20


# my_car = MyCar.new('Red', '2014', 'Nissan Versa')
# puts my_car
# # my_car.speed_up = 50
# MyCar.gas_mileage(50, 3)


# my_car.speed_up(50)
# my_car.get_info

# my_car.brake(20)
# my_car.get_info
# my_car.shut_off
# my_car.get_info

# p my_car.color

# my_car.spray_paint = 'Orange'

