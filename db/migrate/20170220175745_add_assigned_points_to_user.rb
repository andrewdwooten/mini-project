class AddAssignedPointsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :assigned_points, :integer, default: 10000
  end
end
