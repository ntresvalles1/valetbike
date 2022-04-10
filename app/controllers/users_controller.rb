class UsersController < ApplicationController

  #before_action :logged_in_user, only:[:index,]
  #before_filter :logged_in_user, except: [:new, :create]
  #skip_before_action :logged_in_user!, only: [:new, :create]
  #skip_before_action :logged_in_user, :except=>[:index, :show, :new, :create]
  
  def index
      @users = User.all
  end
  
  def show
    @user = User.find(params[:id]) ####
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
