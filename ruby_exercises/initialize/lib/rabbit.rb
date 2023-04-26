class Rabbit
    attr_reader :name, :num_syllables

    def initialize(attributes)
        @num_syllables = attributes[:num_syllables]
        @name = if @num_syllables == 2
                    attributes[:name] + " Rabbit"
                else
                    attributes[:name]
                end
        
    end


end