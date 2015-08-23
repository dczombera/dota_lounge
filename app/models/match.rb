class Match < ActiveRecord::Base

  validates_presence_of   :match_id, :match_seq_num, :start_time, :duration, :tower_status_radiant,
                          :tower_status_dire, :barracks_status_radiant, :barracks_status_dire, :cluster,
                          :first_blood_time, :lobby_type, :human_players, :leagueid, :positive_votes, :negative_votes,
                          :game_mode, :players
  validates_inclusion_of  :radiant_win, in: [true, false], allow_nil: false
  validates_uniqueness_of :match_id
end
