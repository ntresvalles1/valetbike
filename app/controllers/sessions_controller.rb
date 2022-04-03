class SessionsController < ApplicationController

  #before_action :logged_in_user, :except=>[:new, :create, :destroy]
  
  
  def new   
  end
  
  
  def create
      @user = User.find_by(username: params[:session][:username].downcase)
      if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id

          redirect_to '/logged_in_user'

      else
          flash[:notice] = "Incorrect username and/or password" # Send error when redirected
          redirect_to '/login'
      end

    end

  
  #def destroy
  def logout
      session[:user_id]= nil
      #log_out if logged_in?
      redirect_to login_url
  end
  
end


