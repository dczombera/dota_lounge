class Hero < ActiveRecord::Base

  self.table_name = 'heroes'

  validates_presence_of :name, :steam_id, :localized_name
  validates_uniqueness_of :steam_id

  def update_status hero
    self.name = hero.name
    self.localized_name = hero.localized_name
    self.steam_id = hero.id
    self
  end
end
