require 'rails_helper'

RSpec.describe LiveLeagueMatch, type: :model do
  describe 'Model validation' do
    before { create(:live_league_match) }

    it { should validate_presence_of :players }
    it { should validate_presence_of :radiant_team }
    it { should validate_presence_of :dire_team }
    it { should validate_presence_of :lobby_id }
    it { should validate_presence_of :match_id }
    it { should validate_presence_of :league_id }
    it { should validate_presence_of :scoreboard }
    it { should validate_uniqueness_of :match_id }
  end
end