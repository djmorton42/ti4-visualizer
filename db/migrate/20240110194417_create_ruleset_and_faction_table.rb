class CreateRulesetAndFactionTable < ActiveRecord::Migration[7.1]
  def change
    create_table :rulesets do |t|
      t.string :name, null: false
    end

    create_table :factions do |t|
      t.string :name, null: false
      t.string :short_name, null: false
      t.belongs_to :ruleset, index: false, null: false
      t.timestamps
    end
  end
end
