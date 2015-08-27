class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name,           null: false
      t.integer :leagueid,      null: false
      t.string :description,    null: false
      t.string :tournament_url, null: false
      t.integer :itemdef

      t.timestamps null: false
    end
    add_index :leagues, :leagueid, unique: true
  end
end
