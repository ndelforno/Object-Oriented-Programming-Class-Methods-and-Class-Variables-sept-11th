class BankAccount
  #class variable
    @@interest_rate = 0.05
    @@accounts =[]

  #instance methods
  def initialize
    @balance = 0
  end

  #reader methods

  def balance
    return @balance
  end

  #writer methods
  def balance=(ammount)
    return @balance += ammount
  end

  def deposit(ammount)
    @balance = @balance + ammount
  end

  def withdraw(ammount)
    @balance = @balance - ammount
  end

  #class methods
  def self.create
    account= BankAccount.new
    @@accounts << account
    return account
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |num|
      sum = sum + num.balance
    end
    return sum
  end

  def self.interest_time
    @@accounts.each do |num|
      num.balance=(num.balance * @@interest_rate)
    end
  end

end

account1 = BankAccount.create
account2 = BankAccount.create
p account1
puts"-------------"
p account2

puts"-------------"
puts account1.balance
puts"-------------"
puts BankAccount.total_funds
puts"-------------"
account1.deposit(200)
account2.deposit(1000)
puts account1.balance
puts account2.balance
puts"-------------"
puts BankAccount.total_funds
puts"-------------"
BankAccount.interest_time
puts account1.balance
puts account2.balance
puts BankAccount.total_funds
puts"-------------"
account1.withdraw(50)
puts account1.balance
puts BankAccount.total_funds
