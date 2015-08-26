class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.integer :steam_id, null: false
      t.integer :hero_id, null: false
      t.string :name, null: false
      t.string :localized_name

      t.timestamps null: false
    end
    add_index :abilities, :steam_id, unique: true
  end
end
