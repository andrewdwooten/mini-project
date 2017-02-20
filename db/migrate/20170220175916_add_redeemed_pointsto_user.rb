class AddRedeemedPointstoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :redeemed_points, :integer, default: 0

  end
end
