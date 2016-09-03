require './Controller.rb'

class Car

	attr_accessor :x, :y, :orientation, :playground, :commands, :controller
	attr_reader :x, :y, :orientation

	#orientations for all cars as Class variales
	@@orientations_hash = {"N" => 0,"E" =>1,"S" =>2, "W" => 3}
    @@orientations_arr = ['N','E','S','W']

	def initialize x,y,orientation
		# x position
		@x = x 

		# y position
		@y = y

		#convert the orietation letter to integer for the convenience of calculate
		@orientation = @@orientations_hash[orientation] 
		
		#the  initializtion of the car's controller
		@controller =  Controller.new(self)
	end

	#parse the commands to array by controller's method named commands 
	def commands=(commands)
		@controller.parse_cmd(commands)
	end

	#drive the car according the commands by controller
	def drive
		@controller.drive
	end

	#puts the postion and orientation information on the console 
	def status
		@ori = @@orientations_arr[@orientation]
		puts "#{ @x } #{ @y }  #{ @ori }"
	end
end