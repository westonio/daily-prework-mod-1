class Contestant
  attr_reader :game_interests

  def initialize(info)
    @info = info
    @out_of_state = false
    @game_interests = []
  end

  def full_name
    "#{@info[:first_name]} #{@info[:last_name]}"
  end

  def age
    @info[:age]
  end

  def state_of_residence
    @info[:state_of_residence]
  end

  def spending_money
    @info[:spending_money]
  end

  def out_of_state?
    @out_of_state
  end

  def add_game_interest(interest)
    @game_interests << interest
  end
end