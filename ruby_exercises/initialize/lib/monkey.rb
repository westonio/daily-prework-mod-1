class Monkey
    attr_reader :name,:type,:food

    def initialize(attributes)
        @name = attributes[0]
        @type = attributes[1]
        @food = attributes[2]
    end

    def favorite_food
        @food
    end
end