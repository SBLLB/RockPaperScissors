
require 'player'

describe Player do 

let(:player) {Player.new('Rachel')}

		it 'should create a player with a name' do 
			expect(player.name).to eq("Rachel")
		end 

		it 'should let a player pick an object' do 
			expect{player.play('rock')}.to change{player.pick}.to('rock')
		end
	

end