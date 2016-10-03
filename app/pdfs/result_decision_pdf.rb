class ResultDecisionPdf < Prawn::Document
	def initialize(problem, decision, decision_name, max, view)
		super(top_margin: 70)
		@problem = problem
		@decision = decision
		@decision_name = decision_name
		@max = max
		@view = view
		problem_title
		result_items
		table_items
		table_item_rows
	end

	def problem_title
		text "Analysis for: #{@problem.title}", size: 30, style: :bold
		text "(using a Decision Tree Tool)"
	end

	def result_items
		move_down 20
		text "The decision you should make is:"
		text "#{@decision_name}", :color => "5bdb99", size: 15, style: :italic
		move_down 10
		text "This decision will result in the highest possible net gain. Our net gain will be an average of #{price(@max)}. Despite how high the initial costs, by analyzing the expected value along with those costs, this would be the most efficient option."
	end

	def table_items
		move_down 20
		table table_item_rows do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD", "5bdb99"]
			self.header = true
		end
	end

	def table_item_rows
		[["Decisions", "Total Expected Value", "Net Gain"]] +
		@decision.map do |decision|
			[decision.title, price(((decision.favorable_probability.to_f/100) * decision.favorable_result.to_f) + ((decision.unfavorable_probability.to_f/100) * decision.unfavorable_result.to_f)), price((((decision.favorable_probability.to_f/100) * decision.favorable_result.to_f) + ((decision.unfavorable_probability.to_f/100) * decision.unfavorable_result.to_f)) - decision.associated_cost.to_f)]
		end
	end

	def price(num)
		@view.number_to_currency(num)
	end

end