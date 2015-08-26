class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name, null: false
      t.integer :steam_id, null: false
      t.string :localized_name

      t.timestamps null: false
    end
    add_index :heroes, :steam_id, unique: true
  end
end
