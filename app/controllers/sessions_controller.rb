class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      flash[:login_welcome] = "Welcome.  Shop for some Robots!"
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      flash[:invalid_login] = "Your login credentials were invalid.  Please try again."
      render :new
    end
  end
end
