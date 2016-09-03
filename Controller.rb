class Controller

	attr_reader :commands, :car	

	def initialize car
		@car = car
	end

	#parse the commands string to array
	def parse_cmd commands
		@commands = commands.split(//)
	end

	#drive the car by the commands array
	def drive
		@commands.each do |cmd|
			unless cmd == 'M'
				veer(cmd)
			else
				move();
			end
		end
	end

	#change the orientation of the car if the command is "L" or "R"
	def veer cmd
		case cmd
			when 'L'  
				@car.orientation = @car.orientation-1<0 ? 3 : @car.orientation-1
			when 'R' 
				@car.orientation = (@car.orientation+1)%4			
		end
	end

	#move forword if the command is "M" 
	def move
		case @car.orientation
			when 0 
				if @car.y+1 <= @car.playground.top
					@car.y += 1
				end
			when 2
				if @car.y-1 >= 0
					@car.y -= 1
				end
			when 1
				if @car.x+1 <= @car.playground.left
					@car.x += 1
				end
			when 3
				if @car.x+1 >= 0
					@car.x -= 1
				end
		end
	end

end