class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :steam_id, null: false
      t.string :name, null: false
      t.string :localized_name, null: false
      t.integer :cost, null: false
      t.boolean :secret_shop, null: false, default: false
      t.boolean :side_shop, null: false, default: false
      t.boolean :recipe, null: false, default: false

      t.timestamps null: false
    end
    add_index :items, :steam_id, unique: true
  end
end
