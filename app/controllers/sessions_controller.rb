class SessionsController < ApplicationController
  
  #/auth
  def index
  end

  #/login
  def create
    #Authentication (done by built-in has_secure_password)
    @user = User.find_by_name(params[:user][:name])
    if @user and @user.authenticate(params[:user][:password])
      flash[:notice] = "You have successfully logged in"
      session[:user_id] = @user.id
      redirect_to courses_path
    else
      flash[:error] = "Your name and/or password is incorrect"  
      redirect_to auth_path
    end
  end

  #/logout
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end
end
