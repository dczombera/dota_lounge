class League < ActiveRecord::Base

  validates_presence_of :name, :leagueid, :description, :tournament_url, :itemdef
  validates_uniqueness_of :leagueid

  def update_status league
    self.name = league.name
    self.leagueid = league.leagueid
    self.description = league.description
    self.tournament_url = league.tournament_url
    self.itemdef = league.itemdef
    self
  end

end
