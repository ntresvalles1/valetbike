class SessionsController < ApplicationController


  #https://stackoverflow.com/questions/36882672/skip-before-action-for-a-few-controllers-in-rails
  #skip_before_action :authorized, only: [:new, :create]
  
  def new   
  end
  
  
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password' 
      render 'new'
    end


  end

    
  def destroy
      log_out if logged_in?
      redirect_to root_url  
  end
  
end


