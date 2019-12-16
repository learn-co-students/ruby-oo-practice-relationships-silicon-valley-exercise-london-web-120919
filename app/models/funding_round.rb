class FundingRound
    attr_accessor :type #:investiment
    attr_reader :startup, :venture_capitalist
    
    @@all = []

    def initialize(startup,venture_capitalist) #FundingRound.new(startup,venture_capitalist)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = ""
        @investiment = 0

        @@all << self
    end

    def self.all
        @@all
    end

    def investiment=(money)
        if money > 0
            @investiment = money.to_f
        end
    end

    def investiment
        @investiment
    end
end
