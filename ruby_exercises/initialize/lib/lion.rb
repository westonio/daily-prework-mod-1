class Lion
    attr_reader :name, :sound

    def initialize (attributes) # since the input is a single hash, this input for the class would also just be the single variable
        @name = attributes[:name] # this accesses the name attribute (key)from the hash and returns the paired value
        @sound = attributes[:sound] # this accesses the sound attribute (key) from the hash and returns the paired value 
    end
end