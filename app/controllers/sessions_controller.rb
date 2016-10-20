class SessionsController < Devise::SessionsController
	def new
		@user = current_user
	end

	def show
	end

	def create
		user = User.find_by(username: params[:username])
		if user.valid_password?(params[:password])
			# if params[:remember_me]
		 #      cookies.permanent[:auth_token] = user.auth_token
		 #    else
		 #      cookies[:auth_token] = user.auth_token
		 #    end
		 	sign_in(:user, user)
			redirect_to user_path(user), :notice => "Logged in!"
		else 
			flash.now.alert = "Invalid email or password"
			redirect_to root_url
		end
	end

	def destroy
		user = User.find_by(username: params[:username])
		sign_out :user
		redirect_to root_url, :notice => "Logged out!"
	end
end
