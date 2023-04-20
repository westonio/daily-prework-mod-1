class Wizard
    attr_reader :name, :bearded, :rested, :cast_spell_count
    
    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @rested = rested
        @cast_spell_count = 0
    end

    def bearded?
        @bearded
    end

    def incantation(word)
        "sudo #{word}"
    end

    def rested?
        @cast_spell_count < 3
    end

    def cast
        @cast_spell_count += 1
        "MAGIC MISSILE!"
    end

end
