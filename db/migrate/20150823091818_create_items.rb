class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :steam_id, null: false, unique: true, index: true
      t.string :name, null: false
      t.integer :cost, null: false
      t.boolean :secret_shop, null: false, default: false
      t.boolean :side_shop, null: false, default: false
      t.boolean :recipe, null: false, default: false

      t.timestamps null: false
    end
  end
end
