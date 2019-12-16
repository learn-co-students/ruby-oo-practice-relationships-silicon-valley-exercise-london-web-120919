class VentureCapitalist

    attr_accessor :name,:total_worth

    @@all = []

    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|capitalists| capitalists.total_worth >= 1000000000}
    end

    def offer_contract(startup,type,amount)
        new_contract = FundingRound.new(startup,self)
        new_contract.investiment = amount
        new_contract.type = type
        new_contract
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist ==  self}
    end

    def portfolio
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by {|fr| fr.investiment}
    end

    def invested(look_domain)
        funding_rounds.find {|fr| fr.startup.domain == look_domain}.investiment
    end
end
