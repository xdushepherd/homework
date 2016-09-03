

def move_test(car,cmd)
	x = car.x
	y = car.y
	car.commands = cmd
	car.drive 
	yield(x,y)
end