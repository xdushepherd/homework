require "./Car.rb"
require "./Playground.rb"
require './Controller.rb'


playground = Playground.new(5,5)
# car = Car.new(1,2,"N",playground)

# controller = Controller.new(playground,car,'LMLMLMLMM')
# controller.drive
# controller.result


car1 = Car.new(3,3,"E",playground)

controller1 = Controller.new(playground,car1,'MMRMMRMRRM')
controller1.drive
controller1.result

# car2 = Car.new(2,2,"N",playground)

# controller2 = Controller.new(playground,car2,'MM')
# controller2.drive
# controller2.result

