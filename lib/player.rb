
class Player

attr_reader :name, :pick

	def initialize(name)
		@name = name
	end

	def play(rock_paper_scissor)
		@pick = rock_paper_scissor
	end

end