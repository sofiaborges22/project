require 'rails_helper'

RSpec.describe "CrossoversController" do
	it "create a title for the crossover" do
		@problem = Problem.find_by(id: 1)
		@new_crossover = Crossover.new(title: "Crossover Title")
		expect(@new_crossover.title).to eq("Crossover Title")
	end

	it "create a unit for the crossover" do
		@problem = Problem.find_by(id: 1)
		@new_crossover = Crossover.new(units: 1000)
		expect(@new_crossover.units).to eq(1000)
	end

	it "create a fixed cost for the crossover" do
		@problem = Problem.find_by(id: 1)
		@new_crossover = Crossover.new(fixed_cost: 1000)
		expect(@new_crossover.fixed_cost).to eq(1000)
	end

	it "create a variable_cost for the crossover" do
		@problem = Problem.find_by(id: 1)
		@new_crossover = Crossover.new(variable_cost: 1000)
		expect(@new_crossover.variable_cost).to eq(1000)
	end
end
