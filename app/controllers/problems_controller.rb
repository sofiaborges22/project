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
	    problem = current_user.problems.new(problem_params)
	    
	    if problem.save
	      redirect_to user_path(current_user)
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

		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:id])
		@decision = @problem.decisions.all
		
	end

	def result_decision
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:id])
		@decision = @problem.decisions

		@max = 0
		@decision_name = ""

		@decision.each do |decision|
			fav_prob = ((decision.favorable_probability.to_f)/100)
			unfav_prob = ((decision.unfavorable_probability.to_f)/100)
			@favorable = (fav_prob)*(decision.favorable_result.to_f)
			@unfavorable = (unfav_prob)*(decision.unfavorable_result.to_f)
			@totalEV = @favorable + @unfavorable
			@net_gain = @totalEV - decision.associated_cost.to_f

			if @max < @net_gain
				@max = @net_gain
				@decision_name = decision.title
			end
		end

		respond_to do |format|
			format.html
			format.pdf do
				pdf = ResultDecisionPdf.new(@problem, @decision, @decision_name, @max, view_context)
				send_data pdf.render, filename: "problem_#{@problem.title}.pdf",
				                      type: "application/pdf",
				                      disposition: "inline"
			end
		end

	end

	def form_crossover
		@user = User.find_by(id: params[:user_id])
		@problem = Problem.find_by(id: params[:id])
		@crossover = @problem.crossovers.all
	end

	private
	def problem_params #STRONG PARAMETERS: Grabs all the parameters for product that would normally go in the create action and inserts into this method, that simplifies the params code for a product
    	params.require(:problem).permit(:title, :description, :category)
    end
end
