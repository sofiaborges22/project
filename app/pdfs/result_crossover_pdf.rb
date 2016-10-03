class ResultCrossoverPdf < Prawn::Document
	def initialize(problem, crossover, lowest_total_cost, result_total_cost)
		super(top_margin: 70)
		@problem = problem
		@crossover = crossover
		@lowest_total_cost = lowest_total_cost
		@result_total_cost = result_total_cost
		problem_title
		result_items
	end

	def problem_title
		text "Analysis for: #{@problem.title}", size: 30, style: :bold
		text "(using Crossover Analysis)"
	end

	def result_items
		move_down 20
		text "The decision we should make is:"
		text  "#{@lowest_total_cost.title}", :color => "4169E1", size: 15, style: :italic
		move_down 10
		text "This will result in the best overall cost for our company. Our total cost will be $#{@result_total_cost} and because of oour desire to sell #{@lowest_total_cost.units}, this is the best option for us."
	end

end