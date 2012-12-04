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
		passwords_match = params[:user][:password]==params[:user][:password_confirmation]
		invalid_attributes = !(!!(params[:user][:disk_space] =~ /^[+]?[0-9]+$/)) || !(!!(params[:user][:bandwidth] =~ /^[+]?[0-9]+$/))

		if invalid_attributes
			@user.errors.add "Disk Space and Bandwidth", "must be positive integers"
		end

    if !params[:user][:password].blank? || !params[:user][:password_confirmation].blank?
				if @user.authenticate(params[:old_password])
					if !(passwords_match)
						@user.errors.add "New Password", "must match New Password Confirmation"
					end
					if passwords_match && @user.errors.empty?
		    			@user.update_attributes!(params[:user])
		    			flash[:notice] = "Settings successfully saved."
		    			redirect_to settings_path and return
					else
						render 'edit'
					end
				else
					@user.errors.add "Old Password", "must match your current password"
					render 'edit'
				end
    else
			if invalid_attributes
				render 'edit'
			else
				@user.update_attributes!(params[:user])
				flash[:notice] = "Settings successfully saved."
      	redirect_to settings_path
			end
    end
  end
  
  protected
  def restrict_access
    redirect_to auth_path unless @current_user
  end
end
