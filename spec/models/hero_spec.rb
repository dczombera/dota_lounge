require 'rails_helper'

RSpec.describe Hero, type: :model do

  describe 'Model validations' do
    before { create(:hero) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :steam_id }
    it { should validate_presence_of :localized_name }
    it { should validate_uniqueness_of :steam_id }
  end
end
