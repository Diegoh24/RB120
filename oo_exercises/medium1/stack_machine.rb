class Minilang
  VALID_TOKENS = %w(push pop add sub mult div mod print pop)

  def initialize(commands)
    @register = 0
    @stack = []
    @commands = commands.split.map(&:downcase)
  end

  def eval
    commands.each do |code|
      code.to_i.to_s == code ? @register = code.to_i : execute(code)
    end
  end

  private

  attr_reader :stack, :register, :commands

  def push
    stack.unshift(register)
  end

  def add
    @register = stack.shift + register
  end

  def sub
    @register = register - stack.shift
  end

  def mult
    @register = stack.shift * register
  end

  def div
    @register = register / stack.shift
  end

  def mod
    @register = register % stack.shift
  end

  def print
    puts register
  end

  def execute(code)
    raise "Invalid Token: #{code}" if !VALID_TOKENS.include? code
    self.send(code)
  end

  def pop
    raise "Empty Stack!" if stack.empty?
    @register = stack.pop
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

