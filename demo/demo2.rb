require "#{File.dirname(__FILE__)}/../lib/Integration.rb"


#get the inputs from the console
def inputs
	inputs = []
	i = 0

	while (input = gets) =~ /\w/
		inputs.push input
	end
	inputs
end

#initialize the integration 
integration = Integration.new(nil,inputs)

#drive all cars according to commands 
integration.execute


#print the result to the console
integration.result




