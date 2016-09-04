require "#{File.dirname(__FILE__)}/../lib/Car.rb"
require "#{File.dirname(__FILE__)}/../lib/Playground.rb"

class Integration

	attr_reader :playground,:cars

	def initialize(playground,inputs=[])
		@cars = []
		unless inputs.empty?
			@inputs = inputs
			createPlayground #create playground
			addCarsAtOnce # add all cars and tell them their commands
		else
			@playground = playground
		end
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
		puts "\nOutput:\n\n"
		@cars.each do |car|
			car.status
		end
	end

	private

	#add all cars on initialization
	def addCarsAtOnce
		i = 0
		while i < @inputs.length

			#convert the coordinate string to array
			coordinate = @inputs[i].split(/\s*/)

			#get the commands without \n in the tail
			commands = @inputs[i+1].gsub(/\n/,"")

			#initialize a car according to the coordinate
			car = Car.new(coordinate[0].to_i,coordinate[1].to_i,coordinate[2])

			#tell the car about its commands
			car.commands = commands

			#add car to the car list of the integration 
			addCar(car)


			i += 2
		end
	end

	#create playground on initialization
	def createPlayground
		range = @inputs.shift.split(/\s*/)
		@playground = Playground.new(range[0].to_i,range[1].to_i)
	end

end