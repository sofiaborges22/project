class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authorize_user
  	unless current_user
  		flash[:message] = 'Please log in or register to access this page'
  		redirect_to root_path
  	end
  end

  def admin_only
  	unless current_user && current_user.role == 'admin'
  		flash[:access_denied] = "Access denied. You must be admin to see this page."
  		redirect_to root_path
  	end
  end
end
