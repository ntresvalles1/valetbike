class ApplicationController < ActionController::Base
  
  
  #ADDED PT 2
  include SessionsHelper
  
  private
  
  ##Check whether user has logged in or not
  def logged_in_user
    unless logged_in?
      redirect_to '/login'
    end
  end
  
    # before_action :authorized
    # helper_method :current_user
    # helper_method :logged_in?
    #
    # def current_user
    #     User.find_by(id: session[:user_id])
    # end
    #
    # def logged_in?
    #     !current_user.nil?
    # end
    #
    # def authorized
    #   #FIXXXX
    #   redirect_to root_path unless logged_in?
    # end
    
end 
  

