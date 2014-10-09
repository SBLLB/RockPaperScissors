require_relative 'player'

class Game 

attr_accessor :player1_score, :autoplayer_score, :player1_name, :autoplayer_name, :autoplayer_pick, :player_pick, :plays, :games

	def initialize
		@player1_score = 0
		@autoplayer_score = 0
		@player1_name = nil
		@autoplayer_name = nil
		@games = 1
		@plays = 1 
	end

	def add_player(player)
		@player1_name = player	
	end
	
	def add_autoplayer(player)
		@autoplayer_name = player	
	end

	def autoplayer_select 
		@autoplayer_pick = ['rock', 'paper', 'scissors'].shuffle.pop
	end

	def play(player_pick)
		@player_pick = player_pick
		@autoplayer_pick = self.autoplayer_select
		@plays += 1
		self.score
	end
	
	def score
		if player_pick == 'rock' && autoplayer_pick == 'scissors' || player_pick == 'paper' && autoplayer_pick == 'rock' || player_pick == 'scissors' && autoplayer_pick == 'paper'
			@player1_score += 1
		elsif player_pick == autoplayer_pick
			@player1_score += 1
			@autoplayer_score += 1
		else @autoplayer_score += 1 
		end
	end

	def winner	
		return player1_name if player1_score > autoplayer_score
		return "You lost. Better luck next time." if autoplayer_score > player1_score
		return "It's a draw" if player1_score == autoplayer_score
	end	



end

