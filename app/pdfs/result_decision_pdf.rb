class ResultDecisionPdf < Prawn::Document
	def initialize(problem, decision)
		super(top_margin: 70)
		@problem = problem
		@decision = decision
		problem_title
		result_items
	end

	def problem_title
		text "Analysis for #{@problem.title}", size: 30, style: :bold
		text "(using a Decision Tree Tool)"
	end

	def result_items
		move_down 20
		text "Decision here"
	end
end