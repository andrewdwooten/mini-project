class Robot < ApplicationRecord
  validates :name, :serial_no, :location, presence: true
  validates :name, :serial_no, uniqueness: true

  belongs_to :user

  def self.available
    self.where(user_id: 1)
  end
end
