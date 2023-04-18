class Pirate
    attr_reader :name, :job, :cursed

    def initialize(name, job = "Scallywag")
        @name = name
        @job = job
        @heinous_act_count = 0
        @cursed = cursed?
    end

    def commit_heinous_act
        @heinous_act_count += 1
    end

    def cursed?
        @heinous_act_count >= 3
    end
end