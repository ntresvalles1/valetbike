class ApplicationController < ActionController::Base
  
  
  
  include SessionsHelper
  
  private
  
  ##Check whether user has logged in or not
  def logged_in_user
    unless logged_in?
      redirect_to '/login'
    end
  end
  

    
end 
  

