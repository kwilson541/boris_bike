class Bike

attr_reader :condition

	def initialize(condition = true)
		@condition = condition
  	end

	def working?
		true
	end

end
