class UsersController < ApplicationController
  before_filter :restrict_access, :except => [:new, :create]
  # GET /users/1/edit
  def edit
    @user = User.find(@current_user.id)
  end
  
  def new
    @user = User.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account has been successfully created"
      redirect_to login_path({:user => params[:user]}) and return
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find params[:id]
    if !(!!(params[:user][:disk_space] =~ /^[+]?[0-9]+$/)) || !(!!(params[:user][:bandwidth] =~ /^[+]?[0-9]+$/))
      @user.errors.add "Disk Space and Bandwidth", "must be positive integers"
      render 'edit'
    else if @user.update_attributes(params[:user])
      @user.update_attributes!(params[:user])
      flash[:notice] = "Settings successfully saved."
      redirect_to root_path
    else
      render 'edit'
    end
    end
  end
  
  protected
  def restrict_access
    redirect_to auth_path unless @current_user
  end
end
