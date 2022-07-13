
class Banner
  def initialize(message, length)
    @message = message
    @length = length - 4
  end
  
  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end
  
  private
  
  MAX_WIDTH = 76
  
  attr_reader :message, :length
  def horizontal_rule
    "+ #{'-' * length} +"
  end
  
  def empty_line
    "| #{' ' * length} |"
  end
  
  def message_line
    "| #{@message} |"
  end
  
  
end

banner = Banner.new('To boldly go where no one has gone before.', 30)
puts banner
