require "#{File.dirname(__FILE__)}/Controller.rb"

class Car

	attr_accessor :x, :y, :orientation, :playground, :commands, :controller, :outOfRange
	attr_reader :x, :y

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

		#set outOfRange to false
		@outOfRange = false
	end

	#parse the commands to array by controller's method named commands 
	def commands=(commands)
		unless @outOfRange
			@controller.parse_cmd(commands)
		end
	end

	#drive the car according the commands by controller
	def drive
		unless @outOfRange
			@controller.drive
		end
	end

	#judge if the next move of the will make it run across the bound
	def toBeOverFlow?
		case @orientation 
			when 0
				@y+1 > @playground.top
			when 1
				@x+1 > @playground.right
			when 2
				@y-1 < 0
			when 3
				@x-1 < 0	
			else
				true	
		end		
	end

	#judge if the car is on bound
	def onBoundary?
		@x == 0 || @x == @playground.right || @y == 0 || @y == @playground.top
	end


	def orientation_letter
		@@orientations_arr[@orientation]
	end

	#puts the postion and orientation information on the console 
	def status
		unless outOfRange
			puts "#{ @x } #{ @y }  #{orientation_letter}"
		else
			puts "The car is out of range and cannot drive ,It is still in #{ @x } #{ @y }  withorientation #{orientation_letter}"
		end
	end
end