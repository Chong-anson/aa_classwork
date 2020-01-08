class Employee 
  attr_reader :salary
  def initialize(name, title, salary, boss = nil)
    @name = name 
    @title = title 
    @salary = salary
    boss.employees << self if boss.is_a?(Manager)
    @bonus = 0
  end 
  
  def bonus(multiplier)
    @bonus = @salary * multiplier
  end 

  def inspect 
    @name 
  end 
end     
