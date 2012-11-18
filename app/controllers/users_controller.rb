class UsersController < ApplicationController
  before_filter :restrict_access, :except => [:new, :create]
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "New user #{@user.name} created."
      redirect_to edit_user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    redirect_to root_path
  end
  
  protected
  def restrict_access
    redirect_to auth_path and return unless @current_user
  end
end
