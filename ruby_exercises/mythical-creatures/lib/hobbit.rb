class Hobbit
    attr_reader :name, :disposition, :age

    def initialize(name,disposition = "homebody")
        @name = name
        @age = 0
        @disposition = disposition
    end

    def celebrate_birthday
        @age += 1
    end

    def adult?
        @age >= 33
    end

    def old?
        @age >= 101
    end

    def has_ring?
        @name == "Frodo"
    end

    def is_short?
        true
    end
end