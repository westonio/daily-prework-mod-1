require './lib/employee'

class Intern < Employee
  attr_reader :base_salary
  
  def initialize(name, id, base_salary)
    super(name, id)
    @base_salary = base_salary
  end

  def get_coffee
    "Who got the latte?"
  end

  def benefits
    super.push(:gets_to_get_me_coffee)
  end

end