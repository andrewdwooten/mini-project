class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:user_create] = "You've created a new account.  Shop Around!"
      redirect_to user_path(@user)
    else
      flash[:user_exists] = "The user information you've entered is invalid"
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @user = current_user
      @robots = current_user.robots
    else
      redirect_to new_user_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
