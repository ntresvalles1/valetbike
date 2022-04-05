class UsersController < ApplicationController

  #before_action :logged_in_user, only:[:index,]
  #before_filter :logged_in_user, except: [:new, :create]
  #skip_before_action :logged_in_user!, only: [:new, :create]
  #skip_before_action :logged_in_user, :except=>[:index, :show, :new, :create]
  
  def index
      @users = User.all
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      log_in @user
      redirect_to user
    else
      render 'new'
    end
  end
  
  
  #private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def logged_in
  end
  
  def profile
    @users = User.all
  end
  
end
