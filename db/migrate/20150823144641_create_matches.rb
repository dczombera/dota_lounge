class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :match_id,                null: false
      t.integer :match_seq_num,           null: false
      t.timestamp :start_time,            null: false
      t.integer :duration,                null: false
      t.boolean :radiant_win,             null: false,  default: false
      t.integer :tower_status_radiant,    null: false
      t.integer :tower_status_dire,       null: false
      t.integer :barracks_status_radiant, null: false
      t.integer :barracks_status_dire,    null: false
      t.integer :cluster,                 null: false
      t.integer :first_blood_time,        null: false
      t.integer :lobby_type,              null: false,  index: true
      t.integer :human_players,           null: false
      t.integer :leagueid,                null: false,  index:true
      t.integer :positive_votes,          null: false
      t.integer :negative_votes,          null: false
      t.integer :game_mode,               null: false,  index: true
      t.integer :engine
      t.integer :radiant_team_id,                       index: true
      t.string :radiant_name
      t.integer :radiant_logo, limit: 8
      t.boolean :radiant_team_complete
      t.integer :dire_team_id,                          index: true
      t.string :dire_name
      t.integer :dire_logo, limit: 8
      t.boolean :dire_team_complete
      t.integer :radiant_captain
      t.integer :dire_captain
      t.jsonb :picks_bans
      t.jsonb :players,                   null: false

      t.timestamps null: false
    end

    add_index :matches, :match_id, unique: true
    add_index :matches, :players, using: :gin
  end
end
