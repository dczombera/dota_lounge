class Ability < ActiveRecord::Base
  belongs_to :hero

  validates_presence_of :name, :steam_id, :hero_id
  validates_uniqueness_of :steam_id

  def update_status(ability)
    self.name = ability.name
    self.localized_name = ability.localized_name
    self.steam_id = ability.id
    self.hero_id = ability.hero_id
    self
  end
end
