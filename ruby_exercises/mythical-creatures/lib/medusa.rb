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
            victim.become_stone
        else 
            @statues[0].become_human
            @statues.shift
            @statues.push(victim)
            victim.become_stone
        end
    end

end

class Person
    attr_reader :name, :stoned

    def initialize(name)
        @name = name
        @stoned = false
    end

    def stoned?
        @stoned
    end

    def become_stone
        @stoned = true
    end

    def become_human
        @stoned = false
    end


end