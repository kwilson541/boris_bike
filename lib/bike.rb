class Bike

attr_reader :condition

	def initialize(condition = true)
		@condition = condition
  	end

	def working?
		@condition
	end

	def report_broken
		@condition = false
	end

end
