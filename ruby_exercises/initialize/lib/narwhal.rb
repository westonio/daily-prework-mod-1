class Narwhal
    attr_reader :name, :weight, :cute

    def initialize(attributes)
        @name = attributes[:name]
        @weight = attributes[:weight]
        @cute = attributes[:cute]
    end

    def cute?
        @cute
    end
end