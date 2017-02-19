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

  def edit
    @admin = current_user
    @robot = Robot.find(params[:id])
  end

  def update
    @robot = Robot.find(params[:id])
    @robot.update_attributes(name: params[:name],
                             location: params[:location],
                             serial_no: params[:serial_no])

    redirect_to admin_robots_path
  end

  def destroy
    @robot = Robot.find(params[:id])
    @robot.destroy
    redirect_to admin_robots_path
  end
end
