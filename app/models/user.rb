class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true
  validates :name, :email, uniqueness: true
  has_secure_password
end
