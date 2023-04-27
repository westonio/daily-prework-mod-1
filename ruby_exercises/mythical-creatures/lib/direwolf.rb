class Direwolf
    attr_reader :name, :home, :size, :starks_to_protect

    def initialize(name, home = 'Beyond the Wall', size = 'Massive')
        @name = name
        @home = home
        @size = size
        @starks_to_protect = []
        @protected_count = 0
        @hunts_white_walkers = true
    end

    def protects(stark)
        if stark.get_location == @home && @protected_count < 2
            @starks_to_protect.push(stark)
            @protected_count += 1
            stark.become_safe
            @hunts_white_walkers = false
        end
    end

    def hunts_white_walkers?
        @hunts_white_walkers
    end

    def leaves(stark)
        @starks_to_protect.delete(stark)
        @protected_count -= 1
        stark.become_unsafe
        name = stark
    end
end

class Stark
    attr_reader :name, :location

    def initialize(name,location = 'Winterfell')
        @name = name
        @location = location
        @safe = false
    end

    def get_location
        @location
    end

    def safe?
        @safe
    end

    def become_safe
        @safe = true
    end

    def become_unsafe
        @safe = false
    end

    def house_words
        'Winter is Coming'
    end
end