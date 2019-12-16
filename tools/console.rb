require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

star1 = Startup.new("Iluvitar","Thalissa","www.iluvitar.com.br")
star2 = Startup.new("Moo","May","www.moo.ly")

vc1 = VentureCapitalist.new("Thainna",1000000000)
vc2 = VentureCapitalist.new("Mariana",2000000000)
vc3 = VentureCapitalist.new("Camila",1000000)

#Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.

fr1 = FundingRound.new(star1,vc1)#,"Angel",10000)
fr2 = FundingRound.new(star1,vc2)#,"Series A",10000)
fr3 = FundingRound.new(star1,vc3)#,"Series A",20000)
fr4 = FundingRound.new(star2,vc1)#,"Angel",10000)

fr1.type = "Angel"
fr2.type = "Angel"
fr3.type = "Seed" 

fr1.investiment = 1000
fr2.investiment = 2000
fr3.investiment = 3000

binding.pry
0 #leave this here to ensure binding.pry isn't the last line