class SessionsController < ApplicationController
  def new
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    # if user can login, meaning user already as an account with us
    if (User.exists_from_omniauth(auth))
      @user = User.sign_in_from_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Signed In'
    else
    #  user has no account with us yet
    #  redirect to signup page with
    #   @user = User.create_new_from_omniauth(auth)
      redirect_to (new_user_path)
    end
  end

  def create
    @new_user = User.create_user_from_omniauth(session[:omniauth],params[:user][:user_name],params[:user][:password])
    redirect_to root_path, notice: 'User Created'
  end

  def destroy
    session[:user_id] = nil
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed Out'
  end

  def psuedo_destroy
    session[:user_id] = nil
    session[:user_id] = nil
    view_context.link_to('auth/facebook')
  end
end
