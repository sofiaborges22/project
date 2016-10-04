class ResultCrossoverPdf < Prawn::Document
	def initialize(problem, crossover, lowest_total_cost, result_total_cost, view)
		super(top_margin: 70)
		@problem = problem
		@crossover = crossover
		@lowest_total_cost = lowest_total_cost
		@result_total_cost = result_total_cost
		@view = view
		problem_title
		result_items
		table_items
		table_item_rows
	end

	def problem_title
		text "Analysis for: #{@problem.title}", size: 30, style: :bold
		text "(using Crossover Analysis)"
	end

	def result_items
		move_down 20
		text "The decision we should make is:"
		text  "#{@lowest_total_cost.title}", :color => "5bdb99", size: 15, style: :italic
		move_down 10
		text "This will result in the best overall cost for our company. Our total cost will be #{price(@result_total_cost)} and because of our desire to sell #{@lowest_total_cost.units}, this is the best option for us."
	end

	def table_items
		move_down 20
		table table_item_rows do
			row(0).font_style = :bold
			columns(1..5).align = :right
			self.row_colors = ["DDDDDD", "5bdb99"]
			self.header = true
		end
	end

	def table_item_rows
		[["Decisions", "Units", "Total Cost", "Fixed Cost", "Variable Cost"]] +
		@crossover.map do |crossover|
			[crossover.title, crossover.units, price((crossover.units*crossover.variable_cost) + crossover.fixed_cost), price(crossover.fixed_cost), price(crossover.variable_cost)]
		end
	end

	def price(num)
		@view.number_to_currency(num)
	end
end