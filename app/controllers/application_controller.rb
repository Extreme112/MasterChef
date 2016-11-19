class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # Sets the variable @current_user to a user model based on the session[:user_id]
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
  end
  helper_method :current_user

  # Sets the variable @is_admin to t/f based on the session[:user_id]
  def is_admin
  	@is_admin = false
  	if current_user
    	@is_admin = (@current_user.privileges == 1)
    end
  end
  helper_method :is_admin
end
