class Admin::UsersController < Admin::BaseController

  def index
    @admin = current_user
    @users = User.all
  end

end
