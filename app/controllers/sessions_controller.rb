class SessionsController < ApplicationController
  
  def index
    if session[:user_id]
      redirect_to tasks_path and return
    end
  end

  def create
    @current_user = User.find_by_name(params[:user][:name])
    if @current_user and @current_user.authenticate(params[:user][:password]) 
      session[:user_id] = @current_user.id
      redirect_to edit_user_path(@current_user.id)
    else
      flash[:notice] = "Name/Password not found."  
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end
end
