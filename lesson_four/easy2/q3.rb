module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

#look at the lookupchain, call the #ancestors method

puts HotSauce.ancestors

#ancestors is a class method, does not work on an instance of a class.