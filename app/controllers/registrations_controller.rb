class RegistrationsController < Devise::RegistrationsController
 		# before_action :authenticate_user!


  def new
    super
  end

  def create
    @user = User.new(user_params)
		if @user.save
      sign_in(:user, @user)
			redirect_to user_path(@user)
		else
			redirect_to '/'
		end
  end

  def update
    super
  end

  private

  def user_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	end

end 