class AddCostToRobots < ActiveRecord::Migration[5.0]
  def change
    add_column :robots, :cost, :integer, default: 1000
  end
end
