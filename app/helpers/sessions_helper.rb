module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
    session[:current_ride_id] = current_ride_id
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
    session.delete(:current_ride_id)
    @current_user = nil
  end

  def current_ride_id
    if session[:user_id]
      #session[:current_ride_id] = nil
      #for ride in User.find_by(id: session[:user_id]).rides do
        #if ride.endstation.nil?
      @current_ride = Ride.find_by(endstation: nil, rider_user_id: session[:user_id])
        #if ride.endstation != nil
          #session[:current_ride_id] = ride.id
        #end

      if @current_ride.present?
        session[:current_ride_id] = @current_ride.id
      end

    end
  end

  def start_ride(rideid)
    session[:current_ride_id] = rideid
  end

  def on_ride?
    !session[:current_ride_id].nil?
  end

  def end_ride
    session[:current_ride_id] = nil
  end
  

  
  
end
