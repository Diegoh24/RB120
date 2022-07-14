module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def initialize(km_per_liter, liters)
    @fuel_capacity = liters
    @fuel_efficiency = km_per_liter
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tiers = tire_array
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class SeaCraft
  include Moveable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    # self.fuel_capacity = liters_of_fuel_capacity
    # self.fuel_efficiency = km_traveled_per_liter
    # ... code omitted ...
  end

  def range
    super + 10
  end
end

class Catamaran < SeaCraft
end

class Motorboat < SeaCraft
  PROPELLERS = 1
  HULLS = 1

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(PROPELLERS, HULLS, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end


boat2 = Catamaran.new(4, 5, 30, 40)

puts boat2.range
