class CreateExtraVpTable < ActiveRecord::Migration[7.1]
  def change
    create_table :extra_vp_conditions do |t|
      t.string :title, null: false
      t.integer :victory_points, null: false
      t.timestamps
    end
  end
end

