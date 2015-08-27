class League < ActiveRecord::Base

  validates_presence_of :name, :leagueid, :description, :tournament_url, :itemdef
  validates_uniqueness_of :leagueid

end
