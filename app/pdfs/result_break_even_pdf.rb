class ResultBreakEvenPdf < Prawn::Document
	def initialize(problem, break_even, units_sold)
		super(top_margin: 70)
		@problem = problem
		@break_even = break_even
		@units_sold = units_sold.to_i
		problem_title
		result_items
	end

	def problem_title
		text "Analysis for: #{@problem.title}", size: 30, style: :bold
		text "(using Break Even Analysis)"
	end

	def result_items
		move_down 20
		text "#{@units_sold} units need to be sold to break even.", :color => "5bdb99", size: 15, style: :italic
		move_down 10
		text "The break even point (BEP) represents the amount of units that is required to cover total costs, consisting of both fixed and variable costs to your company. It allows for you to identify the minimum required goal your company needs to achieve. At the break even point, profit is still zero, however, all your costs have been 'paid' for."
		move_down 5
		text "This means that your company will break even when it sells #{@units_sold.to_i} units. Once, this amount of units sold has been reached, your company will begin to make a profit."
	end

end