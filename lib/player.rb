require 'pry'

# Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie.
class Player
	attr_accessor :name, :sign

	def initialize(player_sign)
		@name = player_name
    @sign = player_sign
  end

  def player_name
    
    print " >"
    return gets.chomp
	end

end

