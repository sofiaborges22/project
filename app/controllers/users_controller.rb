class UsersController < ApplicationController
		# before_action :authorize_user, only: [:show]
	before_action :admin_only, only: [:index]

	def home
		@name = current_user ? @current_user.username : "User"
	end

	def index
		@users = User.all
	end

	def new
	end

	def show
		@name = current_user ? current_user.name : "User"
		@users = current_user
		@user = User.find_by(id: params[:id])
		@problems = Problem.all
	end

	#receives form and creates a user from that data
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to '/'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	end
end
