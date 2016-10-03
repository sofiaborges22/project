class ResultDecisionPdf < Prawn::Document
	def initialize(problem, decision, decision_name, max)
		super(top_margin: 70)
		@problem = problem
		@decision = decision
		@decision_name = decision_name
		@max = max
		problem_title
		result_items
	end

	def problem_title
		text "Analysis for: #{@problem.title}", size: 30, style: :bold
		text "(using a Decision Tree Tool)"
	end

	def result_items
		move_down 20
		text "The decision you should make is:"
		text "#{@decision_name}", :color => "4169E1", size: 15, style: :italic
		move_down 10
		text "This decision will result in the highest possible net gain. Our net gain will be an average of $#{@max}. Despite how high the initial costs, by analyzing the expected value along with those costs, this would be the most efficient option."
	end

end