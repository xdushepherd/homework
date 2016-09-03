class Playground

	attr_reader :top, :left
	def initialize(top,left)
		@top = top
		@left = left
	end


	#settle a car down on the playground
	#TODO jude whether the car's position is in palyground
	def settle_car(car)
		car.playground = self
	end

end