class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true
  validates :name, :email, uniqueness: true
  has_many :robots
  has_secure_password

  enum role: [:default, :admin]
end
