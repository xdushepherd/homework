require "#{File.dirname(__FILE__)}/../lib/Car.rb"
require "#{File.dirname(__FILE__)}/../lib/Playground.rb"
require "#{File.dirname(__FILE__)}/test_helper.rb"


playground = Playground.new(5,5)
car1 = Car.new(1,2,"N")
car2 = Car.new(-1,2,"E")
car3 = Car.new(6,2,"S")
car4 = Car.new(1,-1,"W")
car5 = Car.new(1,6,"N")

playground.settle_car(car1)
playground.settle_car(car2)
playground.settle_car(car3)
playground.settle_car(car4)
playground.settle_car(car5)


#Test if the car is settled down corretly on the range of the playground
describe "Car settled down" do
	it "car1 should not outOfRange" do
		expect(car1.outOfRange).to eq(false)
	end

	it "car2 should be outOfRange" do
		expect(car2.outOfRange).to eq(true)
	end

	it "car3 should be outOfRange" do
		expect(car3.outOfRange).to eq(true)
	end

	it "car4 should be outOfRange" do
		expect(car4.outOfRange).to eq(true)
	end

	it "car5 should be outOfRange" do
		expect(car5.outOfRange).to eq(true)
	end
end

car6  = Car.new(0,1,"N")
car7  = Car.new(1,0,"E")
car8  = Car.new(5,2,"S")
car9  = Car.new(2,5,'W')
car10  = Car.new(5,5,"N")
car11  = Car.new(3,3,"N")


playground.settle_car(car6)
playground.settle_car(car7)
playground.settle_car(car8)
playground.settle_car(car9)
playground.settle_car(car10)
playground.settle_car(car11)

#Test if the car is on the boundary of the playground which the car was settled down
describe "Car" do
	it '6 is on boundary' do
		expect(car6.onBoundary?).to eq(true)
	end

	it '7 is on boundary' do
		expect(car7.onBoundary?).to eq(true)
	end

	it '8 is on boundary' do
		expect(car8.onBoundary?).to eq(true)
	end

	it '9 is on boundary' do
		expect(car9.onBoundary?).to eq(true)
	end

	it '10 is on boundary' do
		expect(car10.onBoundary?).to eq(true)
	end

	it "11 isn't on boundary" do
		expect(car11.onBoundary?).to eq(false)
	end
end

#Test if the car can change its orientation corretly
describe "Car change orientation:" do

	describe 'car6\'s' do
		it "orientation should be E if the command is R" do
			car6.commands= "R"
			car6.drive
			expect(car6.orientation_letter).to eq("E")
		end

		it "orientation should be S if the command is R" do
			car6.commands= "R"
			car6.drive
			expect(car6.orientation_letter).to eq("S")
		end

		it "orientation should be W if the command is R" do
			car6.commands= "R"
			car6.drive
			expect(car6.orientation_letter).to eq("W")
		end

		it "orientation should be N if the command is R" do
			car6.commands= "R"
			car6.drive
			expect(car6.orientation_letter).to eq("N")
		end

		it "orientation should be W if the command is L" do
			car6.commands= "L"
			car6.drive
			expect(car6.orientation_letter).to eq("W")
		end

		it "orientation should be S if the command is L" do
			car6.commands= "L"
			car6.drive
			expect(car6.orientation_letter).to eq("S")
		end

		it "orientation should be E if the command is L" do
			car6.commands= "L"
			car6.drive
			expect(car6.orientation_letter).to eq("E")
		end

		it "orientation should be N if the command is L" do
			car6.commands= "L"
			car6.drive
			expect(car6.orientation_letter).to eq("N")
		end
	end

end

#test the car move forward
describe "Car move:" do

	#test case when the car is on the boundary
	describe "car10" do
		it "won't move forward because it's orientation is N and on the top and right boundary" do
			move_test(car10,'M') do |a,b|
				expect(car10.x).to eq(a)
				expect(car10.y).to eq(b)
			end
		end

		it "won't move forward because it's orientation is E and on the top and right boundary" do
			move_test(car10,'RM') do |a,b|
				expect(car10.x).to eq(a)
				expect(car10.y).to eq(b)
			end
		end

		it "will move forward because it's orientation is S and not on the bottom boundary" do		
			move_test(car10,'RM') do |a,b|
				expect(car10.x).to eq(a)
				expect(car10.y).to eq(b-1)
			end
		end

		it "will move forward because it's orientation is W and not on the left boundary" do
			move_test(car10,'RM') do |a,b|
				expect(car10.x).to eq(a-1)
				expect(car10.y).to eq(b)
			end
		end
	end

	#test case when car is not on the boundary
	describe "car11" do
		it "will move forward because it's orientation is not on the boundary" do
			move_test(car11,'M') do |a,b|
				expect(car11.x).to eq(a)
				expect(car11.y).to eq(b+1)
			end
		end

		it "will move forward because it's orientation is not on the boundary" do
			move_test(car11,'RM') do |a,b|
				expect(car11.x).to eq(a+1)
				expect(car11.y).to eq(b)
			end
		end

		it "will move forward because it's orientation is not on the boundary" do
			move_test(car11,'RM') do |a,b|
				expect(car11.x).to eq(a)
				expect(car11.y).to eq(b-1)
			end
		end

		it "will move forward because it's orientation is not on the boundary" do
			move_test(car11,'RM') do |a,b|
				expect(car11.x).to eq(a-1)
				expect(car11.y).to eq(b)
			end
		end
	end
end












