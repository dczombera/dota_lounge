class Item < ActiveRecord::Base

  validates_presence_of :steam_id, :name, :cost
  validates_inclusion_of :secret_shop, in: [true, false], allow_nil: false
  validates_inclusion_of :side_shop, in: [true, false], allow_nil: false
  validates_inclusion_of :recipe, in: [true, false], allow_nil: false
  validates_uniqueness_of :steam_id

  def update_status item
    self.name = item.name
    self.steam_id = item.id
    self.cost = item.cost
    self.secret_shop = item.secret_shop
    self.side_shop = item.side_shop
    self.recipe = item.recipe
    self
  end
end
