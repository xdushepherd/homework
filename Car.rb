class Car

	attr_reader :x, :y, :orientation
	@@orientations = {"N" => 0,"E" =>1,"S" =>2, "W" => 3}
	@@i = 0;

	def initialize(x,y,orientation,playground)
		@x = x
		@y = y
		@orientation = @@orientations[orientation]
		@playground = playground
	end

	def change_orientation(cmd)
		case cmd
			when 'L'  
				if @orientation-1<0
					@orientation = 3
				else
					@orientation -= 1
				end
				puts @orientation
			when 'R' 
				@orientation = (@orientation+1)%4
				puts @orientation
			
		end
	end

	def move()
		case @orientation
			when 0 
				if @y+1 <= @playground.top
					@y += 1
				end
			when 2
				if @y-1 >= 0
					@y -= 1
				end
			when 1
				if @x+1 <= @playground.left
					@x += 1
				end
			when 3
				if @x+1 >= 0
					@x -= 1
				end
			else
				puts 'Nothing done!!'		
		end
	end
end