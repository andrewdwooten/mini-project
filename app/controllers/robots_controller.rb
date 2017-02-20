class RobotsController < ApplicationController

  def index
    @robots = Robot.available
  end

end
