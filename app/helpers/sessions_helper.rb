module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #return logged in user
  def current_user
     if session[:user_id]
       @current_user ||= User.find_by(id: session[:user_id])
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

  def current_ride_id
    if session[:user_id]
      for ride in User.find_by(id: session[:user_id]).rides do
        if ride.endstation.nil?
          @current_ride_id = ride.id
        end
      end
    end
  end

  def start_ride(rideid)
    @current_ride_id = rideid
  end

  def on_ride?
    !current_ride_id.nil?
  end

  def end_ride
    @current_ride_id = nil
  end
  

  
  
end
