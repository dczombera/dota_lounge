class LiveLeagueMatch < ActiveRecord::Base

  validates_presence_of :players, :radiant_team, :dire_team, :lobby_id, :match_id, :league_id, :scoreboard
  validates_uniqueness_of :match_id
end
