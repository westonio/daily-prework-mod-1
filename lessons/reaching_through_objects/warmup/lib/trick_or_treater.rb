class TrickOrTreater
  attr_reader :bag

  def initialize(costume)
    @costume = costume
    @bag = Bag.new
  end

  def dressed_up_as
    @costume.style
  end

  def has_candy?
    false if @bag.empty?
  end
end