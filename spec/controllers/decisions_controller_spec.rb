require "rails_helper"

RSpec.describe DecisionsController, :type => :controller do 
			it "create a title for the decision" do
				@problem = Problem.find_by(id: 1)
				@new_decision = Decision.new(title: "Decision Title")
				expect(@new_decision.title).to eq("Decision Title")
			end

			it "create an associated cost for the decision" do
				@problem = Problem.find_by(id: 1)
				@new_decision = Decision.new(associated_cost: 200000)
				expect(@new_decision.associated_cost).to eq(200000)
			end

			it "create a favorable probability for the decision" do
				@problem = Problem.find_by(id: 1)
				@new_decision = Decision.new(favorable_probability: 80)
				expect(@new_decision.favorable_probability).to eq(80)
			end

			it "create a favorable probability for the decision" do
				@problem = Problem.find_by(id: 1)
				@new_decision = Decision.new(unfavorable_probability: 80)
				expect(@new_decision.unfavorable_probability).to eq(80)
			end

			it "create a favorable probability for the decision" do
				@problem = Problem.find_by(id: 1)
				@new_decision = Decision.new(favorable_result: 400000)
				expect(@new_decision.favorable_result).to eq(400000)
			end

			it "create a favorable probability for the decision" do
				@problem = Problem.find_by(id: 1)
				@new_decision = Decision.new(unfavorable_result: 250000)
				expect(@new_decision.unfavorable_result).to eq(250000)
			end
		end