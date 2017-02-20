class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true
  validates :name, :email, uniqueness: true
  has_many :robots
  has_secure_password

  enum role: [:default, :admin]

  def self.purchase(robot, user)
    robot.user = user
    robot.save
    user.assigned_points -= robot.cost
    user.redeemed_points += robot.cost
    user.save
  end

end
