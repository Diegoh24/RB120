class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end


#ben is right, the positive balance method calls the getter method 'balance' defined by attr_reader