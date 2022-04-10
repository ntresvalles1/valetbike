module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #return logged in user
  def current_user
     if session[:user_id]
       @current_user ||= User.find_by(id: session[:user_id])
       if user && user.authenticated?(:remember, cookies[:remember_token])
         log_in user
         @current_user = user
       end   
     end
  end

  
  def current_user?(user)
    user == current_user
  end
  
  #return false if not logged in
  def logged_in?
    !current_user.nil?
  end
  
  #logout the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  

  
  
end
