class CreateRobots < ActiveRecord::Migration[5.0]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :location
      t.string :serial_no
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
