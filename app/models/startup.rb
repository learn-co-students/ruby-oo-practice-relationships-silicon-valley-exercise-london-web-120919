class Startup
    
    attr_reader :domain, :founder, :name

    @@all = []

    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(new_domain,new_name)
        @name = new_name
        @domain = new_domain
        self
    end

    def self.find_by_founder(founder_name)
       @@all.find {|startups| startups.founder == founder_name}.name
    end

    def self.domains
        @@all.map {|startups| startups.domain}
    end

    def sign_contract(v_capitalist,type_invest,amount_invest)
        new_contract = FundingRound.new(self,v_capitalist)
        new_contract.investiment = amount_invest
        new_contract.type = type_invest
        new_contract
    end

    def my_fundings
        FundingRound.all.select {|fundings| fundings.startup == self }
    end

    def num_funding_rounds
        my_fundings.count
    end
    def total_funds
        my_fundings.map {|fundings| fundings.investiment}.reduce(:+)
    end

    def investors
        my_fundings.map {|fundings| fundings.venture_capitalist}.uniq
    end

    def big_investors
       my_funds = my_fundings.map{|each| each.venture_capitalist}
       commas_club = VentureCapitalist.tres_commas_club
       big_invest = my_funds & commas_club #creating a new array made of array & array, will return with everything they have in common
    end
end
