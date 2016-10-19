class ApplicationController < ActionController::Base
	before_action :configure_devise_params, if: :devise_controller?

  protected

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :username, :email, :password, :password_confirmation)
    end
  end

end
