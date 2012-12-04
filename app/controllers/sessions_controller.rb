class SessionsController < ApplicationController
  
  def index
=begin
    if session[:user_id]
      redirect_to settings_path and return
    end
=end
  end

  def create
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

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end
end
