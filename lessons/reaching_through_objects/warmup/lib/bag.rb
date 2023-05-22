class Bag
  attr_reader :count, :candies

  def initialize
    @empty = true
    @count = 0
    @candies = []
  end

  def empty?
    @empty
  end

  def add_candy(candy)
    @empty = false
    @count += 1
    @candies << candy
  end

  def contains?(type)
    @candies.any? do |candy|
      candy.type == type
    end
  end
end