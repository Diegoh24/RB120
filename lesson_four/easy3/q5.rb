class Television
  def self.manufacturer
    # method logic
    puts 'class method works on class'
  end

  def model
    # method logic
    puts 'instance method works on instance'
  end
end

tv = Television.new # instantiates new Television obj, assigns to 'tv'
#tv.manufacturer #no method error, trying to call class method on instance
tv.model #calls #model instnace method on instance

Television.manufacturer #executes class method manufacturer
#Television.model #no method error, trying to call instance method on class

