class Dragon
    attr_reader :name, :color, :rider

    def initialize(name,color,rider)
        @name = name
        @color = color
        @rider = rider
        @meal_count = 0
        @hungry = hungry?
    end

    def hungry?
        @meal_count < 3
    end

    def eat
        @meal_count += 1
    end
end