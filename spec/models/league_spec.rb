require 'rails_helper'

RSpec.describe League, type: :model do
  describe 'Model validation' do
    before { create(:league) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :leagueid }
    it { should validate_presence_of :description }
    it { should validate_presence_of :tournament_url }
  end
end
