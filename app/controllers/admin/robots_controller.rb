class Admin::RobotsController < Admin::BaseController

  def new
  end

  def create
    Robot.admin_restock(params[:quantity], current_user)
    redirect_to admin_robots_path
  end

  def index
    @robots = Robot.all
  end

end
