class Admin::UsersController < Admin::BaseController

  def index
    @admin = current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password])
    if user.save
      flash[:new_user] = 'User generated'
      redirect_to admin_users_path
    else
      flash[:new_user_error] = 'User creation failed'
      redirect_to new_admin_user_path
    end
  end

  def adjust_points
    user = User.find(params[:user])
    User.adjust_points(user, params[:points_adjustment])
    redirect_to admin_users_path
  end

end
