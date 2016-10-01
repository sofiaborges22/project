class ProblemsController < ApplicationController
	def index
		problems = Problem.all
		render json: problems
	end

	def show
		@user = User.find_by(id: params[:user_id])
		@problem = @user.problems.find_by(id: params[:id])
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@new_problem = Problem.new
	end

	def create
	    user = User.find_by(id: session[:user_id])
	    problem = user.problems.new(problem_params)
	    
	    if problem.save
	      redirect_to user_path(user)
	    else 
	      render text => "Problem could not be saved"
	    end
	end

	def destroy
		problem = Problem.find_by(id: params[:id])
		problem.destroy
		redirect_to user_path
	end

	def form_decision
		@user = User.find_by(id: session[:user_id])
		@problem = Problem.find_by(id: params[:id])
		@decision = @problem.decisions.all
	end

	def result_decision
		@problem = Problem.find_by(id: params[:id])
		@decision = @problem.decisions.all
	end

	def form_crossover
		@user = User.find_by(id: session[:user_id])
		@problem = Problem.find_by(id: params[:id])
		@crossover = @problem.crossovers.all
	end

	private
	def problem_params #STRONG PARAMETERS: Grabs all the parameters for product that would normally go in the create action and inserts into this method, that simplifies the params code for a product
    	params.require(:problem).permit(:title, :description, :category)
    end
end
