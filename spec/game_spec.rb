
require 'game'

describe Game do 

let(:game) {Game.new}

	it 'should initialize with the human player score zeroed' do 
		expect(game.player1_score).to eq(0)
	end

	it 'should initialize with the auto player score zeroed' do 
		expect(game.autoplayer_score).to eq(0)
	end

	context 'adding players' do

		it 'should add a player to the game' do 
			expect{game.add_player('Rachel')}.to change{game.player1_name}.from(nil).to('Rachel')
		end 

		it 'should add an auto player to the game' do 
			expect{game.add_autoplayer('Comp')}.to change{game.autoplayer_name}.from(nil).to('Comp')
		end 

	end	

	context 'computer opponent' do 

		it 'should let a player set the auto opponents name' do 
			expect{game.add_autoplayer('Hugo')}.to change{game.autoplayer_name}.to('Hugo')
		end

		it 'should generate a random item to play' do 
			expect{game.autoplayer_select}.to change{game.autoplayer_pick}.from(nil) 
		end

	end

	context 'scoring' do 

		it 'should give a point to player1 when a draw' do 
			game.player_pick = 'rock'
			game.autoplayer_pick = 'rock'
			expect{game.score}.to change{game.player1_score}.by(1)  
		end

		it 'should give a point to autoplayer too when a draw' do 
			game.player_pick = 'rock'
			game.autoplayer_pick = 'rock'
			expect{game.score}.to change{game.autoplayer_score}.by(1)  
		end
		it 'should give a point to player1 if they win the game' do 
			game.player_pick = 'rock'
			game.autoplayer_pick = 'scissors'
			expect{game.score}.to change{game.player1_score}.by(1)
		end
		# 	it 'should give a point to the computer if it wins a game' do 
		# 	game.player_pick = 'rock'
		# 	game.autoplayer_pick = 'paper'
		# 	expect{game.score}.to change{game.player1_score}.by(1)
		# end

		it 'should know who has won the game' do
			game.player1_score = 2
			game.autoplayer_score = 3
			game.add_autoplayer("Bob")
			expect(game.winner).to eq("Bob")
		end
# Know's when there's two players.
	end

end