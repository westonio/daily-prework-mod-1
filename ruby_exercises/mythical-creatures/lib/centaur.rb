class Centaur 
    attr_reader :name, :breed, :cranky, :standing, :activity_count, :laying

    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = false
        @standing = true
        @laying = false
        @activity_count = 0
    end

    def shoot
        if @activity_count == 3 || @laying
            "NO!"
        elsif @activity_count < 3
            @activity_count += 1
            "Twang!!!"
        end
    end

    def run
        if @standing
            @activity_count += 1
            "Clop clop clop clop!"
        else
            "NO!"
        end
    end

    def cranky?
        if @activity_count >= 3  
            @cranky = true 
        else 
          @cranky
        end
    end

    def standing?
        @standing
    end

    def sleep
        if !@laying
            "NO!"
        else
            @activity_count = 0
            @cranky = false
            "ZzzzZzzzZzz"
        end
    end

    def lay_down
        @standing = false
        @laying = true
    end

    def laying?
        @laying
    end

    def stand_up
        @standing = true
        @laying = false
    end

    def drink_potion
        if @standing && @cranky == true
            @activity_count = 0
            @cranky = false
        elsif @standing && @cranky == false
            "Help! I'm Stuck!"
        else
            "NO!"
        end
    end

end