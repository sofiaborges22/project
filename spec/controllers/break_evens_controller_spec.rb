require 'rails_helper'

RSpec.describe "BreakEvensController" do
	it "create a fixed_cost for the breakeven" do
		@problem = Problem.find_by(id: 1)
		@new_break_even = BreakEven.new(fixed_costs: 1000)
		expect(@new_break_even.fixed_costs).to eq(1000)
	end

	it "create a variable_cost for the breakeven" do
		@problem = Problem.find_by(id: 1)
		@new_break_even = BreakEven.new(selling_price: 10)
		expect(@new_break_even.selling_price).to eq(10)
	end

	it "create a variable cost for the breakeven" do
		@problem = Problem.find_by(id: 1)
		@new_break_even = BreakEven.new(variable_cost: 1000)
		expect(@new_break_even.variable_cost).to eq(1000)
	end

end
