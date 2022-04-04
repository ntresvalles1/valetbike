class UsersController < ApplicationController

  # for the sign up page
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      
    else
      render :new
    end
  end
  
  
  def show
    @users = User.all.order(identifier: :asc)
    #@users = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end
