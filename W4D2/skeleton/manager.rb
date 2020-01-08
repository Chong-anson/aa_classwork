require_relative "employee"

class Manager < Employee 
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super 
    @employees = [] 
  end 
  
  def bonus(multiplier)
    @bonus = total_employees_salary * multiplier
  end

  def total_employees_salary
    total = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        total += employee.total_employees_salary
      end
        total += employee.salary
    end
    total
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)


