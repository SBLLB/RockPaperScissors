# require_relative 'player'

class Game 

attr_accessor :player1_score, :autoplayer_score, :player1_name, :autoplayer_name, :autoplayer_pick, :player_pick, :plays, :games

	def initialize
		@player1_score = 0
		@autoplayer_score = 0
		@player1_name = nil
		@autoplayer_name = nil
		@games = 0
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
	
	def stage_win
		if player_one_beats_player_two?
			return player1_name
		elsif is_there_a_draw?
			return "Draw"
		else return autoplayer_name
		end
	end

	def player_one_beats_player_two?
		player_pick == 'rock' && autoplayer_pick == 'scissors' || player_pick == 'paper' && autoplayer_pick == 'rock' || player_pick == 'scissors' && autoplayer_pick == 'paper'
	end

	def is_there_a_draw?
		player_pick == autoplayer_pick
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
		return autoplayer_name if autoplayer_score > player1_score
		return "Draw" if player1_score == autoplayer_score
	end	

	def best_of(number)
		@games = number.to_i
	end

	def end?
		@plays > @games 
	end

end

