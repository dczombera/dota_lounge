class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name, null: false
      t.integer :steam_id, null: false, index: true, unique: true
      t.string :localized_name, null: false

      t.timestamps null: false
    end
  end
end
