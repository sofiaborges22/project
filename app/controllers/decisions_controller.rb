class DecisionsController < ApplicationController
	def index
		@user = User.find_by(id: params[:id])
		@decisions = Decision.all
	end

	def show
		@problem = Problem.find_by(id: params[:problem_id])
		@decision = Decision.find_by(id: params[:id])
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:problem_id])
		@new_decision = Decision.new
	end

	def create
		@user = User.find_by(id: params[:user_id])
		@problem = @user.problems.find_by(id: params[:problem_id])
		decision = @problem.decisions.new(decision_params)
		if decision.save
			redirect_to form_decision_user_problem_path(@user, @problem)
		else
			render text => "Decision not saved"
		end
	end

	def destroy
		# @user = User.find_by(id: params[:user_id])
		# @problem = Problem.find_by(id: params[:problem_id])
		decision = Decision.find_by(id: params[:id])
		decision.destroy
		redirect_to :back
	end

	private
	def decision_params 
		params.require(:decision).permit(:title, :associated_cost, :favorable_probability, :unfavorable_probability, :favorable_result, :unfavorable_result)
	end
end
