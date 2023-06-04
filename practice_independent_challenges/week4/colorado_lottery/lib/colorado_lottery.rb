class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = Hash.new
    @winners = Array.new
    @current_contestants = Hash.new
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) &&
    contestant.age >= 18
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game)
  end
end