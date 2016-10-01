class CrossoversController < ApplicationController
	def index
		@user = User.find_by(id: params[:id])
		@crossover = Crossover.all
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:problem_id])
		@new_crossover = Crossover.new
	end

	def show 
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:problem_id])
		@crossover = @problem.crossovers.all

		@lowest_total_cost = @crossover.min_by do |crossover|
			(crossover.units * crossover.variable_cost)+crossover.fixed_cost
		end
	end

	def create
		@user = User.find_by(id: params[:user_id])
		@problem = @user.problems.find_by(id: params[:problem_id])
		@crossover = @problem.crossovers.new(crossover_params)
		if @crossover.save
			redirect_to form_crossover_user_problem_path(@user, @problem, @crossover)
		else
			render text => "Crossover Analysis not saved"
		end
	end

	def destroy
		# @user = User.find_by(id: params[:user_id])
		# @problem = Problem.find_by(id: params[:problem_id])
		# @crossover = @problem.crossovers.find_by(id: params[:id])
		crossover = Crossover.find_by(id: params[:id])
		crossover.destroy
		
		redirect_to :back
	end

	private
	def crossover_params
		params.require(:crossover).permit(:title, :units, :fixed_cost, :variable_cost, :user_id)
	end
end
