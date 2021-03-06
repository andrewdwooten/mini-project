class Robot < ApplicationRecord
  validates :name, :serial_no, :location, presence: true
  validates :name, :serial_no, uniqueness: true

  belongs_to :user

  def self.available
    Robot.joins(:user).where(:users => {:role => 1})
  end

  def self.admin_restock(quantity, admin)
    quantity.to_i.times do
      admin.robots.create(name: Faker::Name.name,
                   location: Faker::LordOfTheRings.location,
                   serial_no: Faker::Crypto.md5)
    end
  end

  def self.sold
    Robot.joins(:user).where(:users => {:role => 0}).count
  end

end
