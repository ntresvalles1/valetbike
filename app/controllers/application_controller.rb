class ApplicationController < ActionController::Base
  
  
  #logged_in_user is done first 
  #before_action :logged_in_user
  #helper method for view 
  helper_method :current_user
  helper_method :logged_in?
  
  
  include SessionsHelper  

  
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  #return false if not logged in 
  def logged_in?
    !current_user.nil?
  end
  

  def logged_in_user
      redirect_to root_path unless logged_in?
  end
    
end 
  

