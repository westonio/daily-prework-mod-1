require './lib/employee'

class Ceo < Employee

  attr_reader :base_salary,
              :bonus

  def initialize(name, id, base_salary, bonus)
    super(name, id)
    @base_salary = base_salary
    @bonus       = bonus
  end
end