class CreateObjectiveTable < ActiveRecord::Migration[7.1]
  def change
    create_table :objectives do |t|
      t.string :title, null: false
      t.string :phase, null: false
      t.string :category, null: false
      t.string :text, null: false
      t.integer :victory_points, null: false
      t.references :ruleset, index: false, null: false, foreign_key: true
      t.timestamps
    end
  end
end

