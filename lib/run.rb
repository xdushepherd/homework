require "#{File.dirname(__FILE__)}/Car.rb"
require "#{File.dirname(__FILE__)}/Playground.rb"
require "#{File.dirname(__FILE__)}/Integration.rb"


playground = Playground.new(5,5)
integration = Integration.new(playground)

car1 = Car.new(1,2,"N")
car1.commands = 'LMLMLMLMM'
car2 = Car.new(3,3,"E")
car2.commands = 'MMRMMRMRRM'

integration.addCar car1
integration.addCar car2


integration.execute
integration.result



