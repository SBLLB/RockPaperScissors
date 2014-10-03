
require 'game'

describe Game do 

let(:game) {Game.new}

	it 'should initialize with the human player score zeroed' do 
		expect(game.player1_score).to eq(0)
	end

	it 'should initialize with the auto player score zeroed' do 
		expect(game.autoplay_score).to eq(0)
	end

	it 'should add a player to the game' do 
		expect{game.add_player('Rachel')}.to change{game.player1}.from(nil).to('Rachel')
	end 

	it 'should add an auto player to the game' do 
		expect{game.add_autoplay('Comp')}.to change{game.auto_player}.from(nil).to('Comp')
	end 

end