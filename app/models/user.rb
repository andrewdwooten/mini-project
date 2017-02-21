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

  def self.adjust_points(user, amount)
    user.assigned_points += amount.to_i
    user.save
  end

  def self.robot_avg
  end

  def self.redemption_avg
    average(:redeemed_points).to_i
  end

  def self.assigned_avg
    average(:assigned_points).to_i
  end

  def self.not_admin_count
    where(role: 0).count
  end


end
