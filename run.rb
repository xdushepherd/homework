require "./Car.rb"
require "./Playground.rb"


playground = Playground.new(5,5)


car2 = Car.new(1,2,"N")
playground.settle_car(car2)
car2.commands = 'LMLMLMLMM'
car2.drive
car2.status

car = Car.new(3,3,"E")
playground.settle_car(car)
car.commands = 'MMRMMRMRRM'
car.drive
car.status


