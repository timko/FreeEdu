class UsersController < ApplicationController
  #Cannot access pages unless logged in
  before_filter :restrict_access, :except => [:new, :create]
  # GET /users/1/edit
  def edit
    @user = User.find(@current_user.id)
  end
  
  # /users/new
  def new
    @user = User.new
  end

  # POST /user
  def create
    #Create a new user and direct them as being logged in.
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Your account has been successfully created"
      redirect_to login_path({:user => params[:user]}) and return
    else
      error_report_and_redirect_to(new_users_path)
    end
  end
  
  
  def update
    #Authenticate user
    @user = User.find params[:id]
		passwords_match = params[:user][:password]==params[:user][:password_confirmation]
		invalid_attributes = !(!!(params[:user][:disk_space] =~ /^[+]?[0-9]+$/)) || !(!!(params[:user][:bandwidth] =~ /^[+]?[0-9]+$/))

    #Validity checks
		if invalid_attributes
			@user.errors[:base] <<"Disk Space and Bandwidth must be positive integers"
		end

    if !params[:user][:password].blank? || !params[:user][:password_confirmation].blank?
		  if @user.authenticate(params[:old_password])
				if !(passwords_match)
					@user.errors[:base] << "New Password must match New Password Confirmation"
				end
				#Saving changed settings
				if passwords_match && @user.errors.empty?
		    	@user.update_attributes!(params[:user])
		    	flash[:success] = "Settings successfully saved."
		    	redirect_to settings_path and return
				end
			else
				@user.errors[:base] << "Old Password must match your current password"
			end
    else
      #Saving changed settings
			if !invalid_attributes
				@user.update_attributes!(params[:user])
				flash[:success] = "Settings successfully saved."
      	redirect_to settings_path and return
    	end
		end
		error_report_and_redirect_to(settings_path)
  end

  # HELPERS
  protected
  
  #Disallow access if user is not logged in
  def restrict_access
    redirect_to auth_path unless @current_user
  end
	
	#Return correct form of 'Error' depending on number of errors
	def pluralize_errors(num)
	  return num == 1 ? "Error" : "Errors"
	end

  #Construct and error message and then redirect
	def error_report_and_redirect_to(location)
		error_msg = []
		error_msg << "#{@user.errors.count} #{pluralize_errors(@user.errors.count)}:"
		@user.errors.full_messages.each do |msg|
			error_msg << "<i class='icon-exclamation-sign' ></i> #{msg}"
		end
		error_msg = error_msg.join("<br/>").html_safe
		flash[:error] = error_msg
		redirect_to location and return
	end
end
