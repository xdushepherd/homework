require "#{File.dirname(__FILE__)}/../lib/Car.rb"
require "#{File.dirname(__FILE__)}/../lib/Playground.rb"
require "#{File.dirname(__FILE__)}/../lib/Integration.rb"


playground = Playground.new(5,5)
integration = Integration.new(playground)

car1 = Car.new(1,2,"N")
car1.commands = 'LMLMLMLMM'
car2 = Car.new(3,3,"E")
car2.commands = 'MMRMMRMRRM'
car3 = Car.new(4,4,"N")
car3.commands = 'LLMLMLLMLMM'
car4 = Car.new(2,2,"E")
car4.commands = 'MLMRMRMM'
car5 = Car.new(1,4,"N")
car5.commands = 'LMMRMLMM'
car6 = Car.new(3,1,"E")
car6.commands = 'MRRMMRRM'
car7 = Car.new(4,5,"N")
car7.commands = 'LMRRMMMMLMM'
car8 = Car.new(5,2,"E")
car8.commands = 'MLLLMMRRMRRM'

integration.addCar car1
integration.addCar car2
integration.addCar car3
integration.addCar car4
integration.addCar car5
integration.addCar car6
integration.addCar car7
integration.addCar car8


integration.execute
integration.result




