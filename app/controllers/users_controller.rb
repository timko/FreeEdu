class UsersController < ApplicationController
  before_filter :restrict_access
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  protected
  def restrict_access
    redirect_to auth_path and return unless @current_user
  end
end
