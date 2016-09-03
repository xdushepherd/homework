class Playground

	attr_reader :top, :right
	def initialize(top,right)
		@top = top
		@right = right
	end


	#settle a car down on the playground
	#TODO jude whether the car's position is in palyground
	def settle_car(car)
		car.outOfRange = true if(car.x<0 || car.x>@right || car.y < 0 || car.y > @top)
		car.playground = self
	end

end