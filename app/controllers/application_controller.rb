class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #On every webpage, attempt to find the current user
  before_filter :set_current_user
  def set_current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
end
