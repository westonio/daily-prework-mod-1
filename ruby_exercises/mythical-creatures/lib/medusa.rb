class Medusa
    attr_reader :name, :statues, :victim_count

    def initialize(name)
        @name = name
        @statues = []
        @victim_count = 0
    end

    def stare(victim)
        if @victim_count < 3
            @victim_count += 1
            @statues.push(victim)
            victim.stoned = true
        else 
            @statues[0].stoned = false
            @statues.shift
            @statues.push(victim)
            victim.stoned = true
        end
    end

end

class Person
    attr_reader :name
    attr_accessor :stoned

    def initialize(name)
        @name = name
        @stoned = false
    end

    def stoned?
        @stoned
    end

end