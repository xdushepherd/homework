class Controller

	attr_reader :playground, :commands, :car	

	def initialize(playground,car,cmd)
		@playground = playground
		@car = car
		@commands = parse_command(cmd)
	    @orientations = ['N','E','S','W']
	end

	def parse_command(cmd_str)
		cmd_str.split(//)
	end

	def drive()
		@commands.each do |cmd|
			unless cmd == 'M'
				car.change_orientation(cmd)
			else
				car.move();
			end
		end
	end

	def result
		@orientation = @orientations[@car.orientation]
		puts "#{ @car.x } #{ @car.y }  #{ @orientation }"
	end
end