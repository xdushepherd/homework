class Integration

	attr_reader :playground,:cars

	def initialize(playground)
		@playground = playground
		@cars = []
	end


	#add a car to the car list
	def addCar car
		@playground.settle_car(car)
		@cars.push(car)
	end

	#drive the car
	def execute
		@cars.each do |car|
			car.drive
		end
	end

	#print the result
	def result
		@cars.each do |car|
			car.status
		end
	end

end