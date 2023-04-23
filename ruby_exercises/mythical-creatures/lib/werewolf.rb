class Werewolf
    attr_reader :name, :location, :human, :wolf, :hungry

    def initialize(name,location = "Taipei")
        @name = name
        @location = location
        @human = true
        @wolf = false
        @hungry = false
    end

    def human?
        @human
    end

    def wolf?
        @wolf
    end 

    def change!
        @human = !@human
        @wolf = !@wolf
        @hungry = @human ? false : true
    end

    def can_consume?
        @wolf ? true : false
    end

    def consume(victim)
        @hungry = false if @wolf
        victim.status = :dead 
    end
end