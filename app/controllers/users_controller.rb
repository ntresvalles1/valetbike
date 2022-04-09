class UsersController < ApplicationController
  
  def index
      @users = User.all
  end
  
  def show
    if !session[:user_id]
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Bikea"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  
  #private 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name)
  end
  
  def logged_in
  end
  
  def profile
    @users = User.all
  end

  # To edit user info: 
  def editProfile
    @user = User.find(session[:user_id])

  end
  
end
