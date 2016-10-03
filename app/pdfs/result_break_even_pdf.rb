class ResultBreakEvenPdf < Prawn::Document
	def initialize(problem, break_even, units_sold, business)
		super(top_margin: 70)
		@problem = problem
		@break_even = break_even
		@units_sold = units_sold
		@business = business
		problem_title
		result_items
	end

	def problem_title
		text "Analysis for: #{@problem.title}", size: 30, style: :bold
		text "(using Break Even Analysis)"
	end

	def result_items
		move_down 20
		text "#{@units_sold} units need to be sold to break even.", size: 15, style: :italic
		move_down 10
		text "Analysis"
	end

end