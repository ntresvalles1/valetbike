class UsersController < ApplicationController
  
  def index
      @users = User.all
  end
  
  def show
# <<<<<<< HEAD
#     @user = User.find(params[:id])
# =======
    if !session[:user_id]
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
    end
# >>>>>>> user-profile-updated
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
# <<<<<<< HEAD

    if @user.save
      UserMailer.account_activation(@user).deliver_now     
      flash[:warning] = "Please check your email to activate your account."
      redirect_to root_url
# =======
#     if @user.valid?
#       @user.save
#       log_in @user
#       flash[:success] = "Welcome to Bikea"
#       redirect_to @user
# >>>>>>> user-profile-updated
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
    # if @user.update(params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name))
    #   flash[:success] = "User information successfully updated"
    #   redirect_to  @user #todo_url(@user)
    # else
    #   flash.now[:error] = "User information update failed"
    #   render :editProfile
    # end
  end


  
  #private 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :birthYear, :birthMonth, :birthDay)
  end
  
  def logged_in
  end
  
  def profile
    @users = User.all
  end

  
  
  
  
end
