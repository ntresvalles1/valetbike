class UsersController < ApplicationController
  
  def index
      @users = User.all
  end
  
  def show
    if !session[:user_id]
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
      @rides = @user.rides
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.account_activation(@user).deliver_now     
      flash[:warning] = "Please check your email to activate your account."
      redirect_to root_url

    else
      render 'new'
    end
    
  end
  

  # To edit user info: 
  def editProfile
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'editProfile'
    end
    
  end


  
  private 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :birthYear, :birthMonth, :birthDay)
  end
  
  def logged_in
  end
  
  def profile
    @users = User.all
  end

  
  
  
end
