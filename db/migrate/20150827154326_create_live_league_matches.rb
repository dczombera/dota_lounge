class CreateLiveLeagueMatches < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :live_league_matches do |t|
      t.hstore :players,              null: false, array: true
      t.hstore :radiant_team,         null: false
      t.hstore :dire_team,            null: false
      t.integer :lobby_id, limit: 8,  null: false
      t.integer :match_id,            null: false
      t.integer :spectators
      t.integer :league_id,           null: false
      t.integer :stream_delay_s
      t.integer :radiant_series_wins
      t.integer :dire_series_wins
      t.integer :series_type
      t.integer :league_series_id
      t.integer :league_game_id
      t.integer :league_tier
      t.hstore :scoreboard,           null: false

      t.timestamps                    null: false
    end
    add_index :live_league_matches, :match_id, unique: true
  end
end
