class Hero < ActiveRecord::Base

  self.table_name = 'heroes'

  validates_presence_of :name, :steam_id, :localized_name
  validates_uniqueness_of :steam_id
end
