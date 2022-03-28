class SessionsController < ApplicationController

  
  
  def create
    @user = User.find_by(username: parms[:username])
    if @user && user.authenticate(params[:username])

      session[:user_id] = @user.id
      redirect_to user_path

    else
      message = "Fail"
      redirect_to login_path, notice: message

    end
  end

  

end


