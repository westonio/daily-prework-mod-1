class Activity
  attr_reader :name, 
              :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, cost)
    participants[name] = cost
  end

  def total_cost
    participants.values.sum
  end

  def split
    total_cost / participants.count.to_f.round(2)
  end

  def owed
    total_split = split
    participants.each do |name, cost|
      participants[name] = (total_split - cost)
    end
  end
end