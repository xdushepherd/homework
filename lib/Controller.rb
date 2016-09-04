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
				veer cmd
			else
				unless @car.toBeOverFlow?
					move
				end
			end
		end
	end

	#change the orientation of the car if the command is "L" or "R"
	def veer cmd
		@car.orientation =  case cmd
							when 'L' then @car.orientation-1<0 ? 3 : @car.orientation-1
							when 'R' then (@car.orientation+1)%4			
							end
	end

	#move forword if the command is "M" 
	def move
		case @car.orientation
			when 0 
				@car.y += 1
			when 2
				@car.y -= 1
			when 1
				@car.x += 1
			when 3
				@car.x -= 1
		end
	end

end