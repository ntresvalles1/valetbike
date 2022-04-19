class SessionsController < ApplicationController

  def new   
  end
  
  
  def create
      user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
                log_in user
                redirect_to '/logged_in_user'
            
              else
                flash[:warning] = "Account not activated. Check your email for the activation link."
                redirect_to '/login'
              end
        
# =======
#       @user = User.find_by(username: params[:session][:username].downcase)
#       if @user && @user.authenticate(params[:session][:password])
#           session[:user_id] = @user.id
#
#           #redirect_to '/logged_in_user'
#           redirect_to '/profile'
# >>>>>>> user-profile-updated

      else
          flash[:warning] = "Incorrect username and/or password" 
          redirect_to '/login'
      end
    end

  
  def logout
      session[:user_id]= nil
      #log_out if logged_in?
      redirect_to login_url
  end
  
end
