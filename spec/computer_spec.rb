require 'computer'

describe Computer do 

let(:auto_opponent) {Computer.new}

		it 'should create an auto opponent with a default name, Computer' do 
			expect(auto_opponent.name).to eq('Computer')
		end 

		it 'should let a player set the auto opponents name' do 
			bespoke_opponent = Computer.new('Hugo')
			expect(bespoke_opponent.name).to eq('Hugo')
		end

		it 'should generate a random item to play' do 
			expect{auto_opponent.play}.to change{auto_opponent.pick}.from(nil) 
		end
	

end