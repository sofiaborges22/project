class BreakEvensController < ApplicationController
	def index
		@user = User.find_by(id: params[:id])
		@break_even = BreakEven.all
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:problem_id])
		@new_break_even = BreakEven.new
	end

	def show
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:problem_id])
		@break_even = @problem.break_evens.all
	end

	def create
		@user = User.find_by(id: params[:user_id])
		@problem = @user.problems.find_by(id: params[:problem_id])
		@break_even = @problem.break_evens.new(breakeven_params)
		if @break_even.save
			redirect_to user_problem_break_even_path(@user, @problem, @break_even)
		else
			render text => "Break Even Analysis not saved"
		end
	end

	def form_break_even
		@user = User.find_by(id: session[:user_id])
		@problem = Problem.find_by(id: params[:id])
		@break_even = @problem.break_evens.all
	end

	def destroy
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:problem_id])
		break_even = @problem.break_evens.find_by(id: params[:id])
		break_even.destroy
		redirect_to form_break_even_user_problem_path(@user, @problem)
	end

	private
	def breakeven_params
		params.require(:break_even).permit(:fixed_costs, :selling_price, :variable_cost)
	end

end
