class HomepageController < ApplicationController
  
  #########added#############
  #Check user's input (username and password)
  def create
    @user = User.find_by(username: params[:username])
    
    #authenticate user credentials
    if @user && @user.authenticate(params[:password])
      
      #set sessions and redirect on success
      session[:user_id] = @user.id
      redirect_to '/authorized'
      
    else
      
      #error message on fail
      message = "Fail! Make sure your username and PW are valid"
      redirect_to '/login', notice: message
      
    end
    
  end
  
  def login
  end
  
  #########added#############
  
end
