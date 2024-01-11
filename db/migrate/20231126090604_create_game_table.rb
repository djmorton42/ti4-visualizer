class CreateGameTable < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :code, null: false
      t.timestamps
    end
  end
end
