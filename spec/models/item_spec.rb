require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Model validation' do
    before { create(:item) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :localized_name }
    it { should validate_presence_of :steam_id }
    it { should validate_presence_of :cost }
    it { should_not allow_value(nil).for(:secret_shop) }
    it { should_not allow_value(nil).for(:side_shop) }
    it { should_not allow_value(nil).for(:recipe) }
    it { should validate_uniqueness_of :steam_id }
  end
end
