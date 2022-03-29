class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by(username: parms[:username])
    if @user && user.authenticate(params[:username])

      session[:user_id] = @user.id
      redirect_to user_path
      #redirect_to '/authorized'

    else
      message = "Fail"
      redirect_to login_path, notice: message

    end
  end

  def login
  end
  

end


