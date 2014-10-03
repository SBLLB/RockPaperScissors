require 'player'

class Game 

attr_accessor :player1_score, :autoplay_score, :player1, :auto_player

	def initialize
		@player1_score = 0
		@autoplay_score = 0
		# Alternative score in an array - [0, 0] index 0 human, index 1 computer.	end
		@player1 = nil
		@auto_player = nil
	end

	def add_player(player)
		@player1 = player	
	end
	
	def add_autoplay(player)
		@auto_player = player	
	end


	# def play(player_pick, auto_pick)
	# # 	#Loop x number of times
	# if player_pick == auto_pick 
	# 	#add 1 to both scores?
	# elsif (player_pick == 'rock') && (auto_pick == paper
	 	 
	# # 	if player_1 pick

	# 	end			


	#When player makes move, 
	#simultaneously make move for comp

#Continuous play. New Game
#Best of 3/5? in which case need winner? method


end

