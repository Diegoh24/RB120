class FixedArray
  attr_reader :arr

  def initialize(size)
    @arr = []
    size.times { @arr << nil }
  end

  def to_a
    arr
  end

  def []=(idx, new_element)
    if idx < arr.size || (idx < 0 && idx >= arr.size * -1)
      arr[idx] = new_element
    else
      raise IndexError
    end
  end

  def [](idx)
    if idx < arr.size || (idx < 0 && idx >= arr.size * -1)
      arr[idx]
    else
      raise IndexError
    end
  end

  def to_s
    arr.to_s
  end
end

def FixedArray
  def initialize(max_size)
    @array = Array.new(max_size)
  end

  def [](index)
    @array.fetch(index)
  end

  def []=(index, value)
    self[index]
    @array[index] = value
  end

  def to_a
    @array.clone
  end

  def to_s
    to_a.to_s
  end
end



fixed_array = FixedArray.new(5)
p fixed_array
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

# p fixed_array[6]
begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
